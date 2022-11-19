using QingYunSoft.GestClientesWS;
using System;
using System.Runtime.InteropServices;
using System.Windows.Forms;

namespace QingYunSoft.Cliente
{
    public partial class frmBuscarCliente : Form
    {
        //objetos
        private GestClientesWS.cliente clienteSeleccionado;
        private GestClientesWS.GestClientesWSClient daoCliente;
        //constructor
        public frmBuscarCliente()
        {
            InitializeComponent();
            this.CenterToParent();
            dgvClientes.AutoGenerateColumns = false;
            dgvClientes.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
        }
        //metodos
        public cliente ClienteSeleccionado { get => clienteSeleccionado; set => clienteSeleccionado = value; }
        private void btSeleccionar_Click(object sender, EventArgs e)
        {
            if (dgvClientes.CurrentRow != null)
            {
                clienteSeleccionado = (GestClientesWS.cliente)dgvClientes.CurrentRow.DataBoundItem;
                this.DialogResult = DialogResult.OK;
            }
            else
            {
                MessageBox.Show("Debe seleccionar un cliente", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btBuscarCliente_Click(object sender, EventArgs e)
        {
            daoCliente = new GestClientesWS.GestClientesWSClient();
            dgvClientes.DataSource = daoCliente.listarClientePorDocumentoNombre(txtNombreDNI.Text);

        }

        private void dgvClientes_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            GestClientesWS.cliente clienteI = (GestClientesWS.cliente)dgvClientes.Rows[e.RowIndex].DataBoundItem;
            if (clienteI is GestClientesWS.empresa)
            {
                dgvClientes.Rows[e.RowIndex].Cells["nombreCliente"].Value = ((GestClientesWS.empresa)clienteI).razonSocial;
                dgvClientes.Rows[e.RowIndex].Cells["tipoCliente"].Value = "Empresa";
                dgvClientes.Rows[e.RowIndex].Cells["tipoDocumento"].Value = "RUC";
                dgvClientes.Rows[e.RowIndex].Cells["nmrDocumento"].Value = ((GestClientesWS.empresa)clienteI).RUC;
                dgvClientes.Rows[e.RowIndex].Cells["categoria"].Value = ((GestClientesWS.empresa)clienteI).categoria;

            }
            else
            {
                dgvClientes.Rows[e.RowIndex].Cells["nombreCliente"].Value = ((GestClientesWS.personaNatural)clienteI).nombre + " " + ((GestClientesWS.personaNatural)clienteI).apellido;
                dgvClientes.Rows[e.RowIndex].Cells["tipoCliente"].Value = "Persona Natural";
                dgvClientes.Rows[e.RowIndex].Cells["tipoDocumento"].Value = ((GestClientesWS.personaNatural)clienteI).tipoDeDocumento.ToString();
                dgvClientes.Rows[e.RowIndex].Cells["nmrDocumento"].Value = ((GestClientesWS.personaNatural)clienteI).numDeDocumento;
                dgvClientes.Rows[e.RowIndex].Cells["categoria"].Value = ((GestClientesWS.personaNatural)clienteI).categoria;

            }
        }
        private void btCancelar_Click(object sender, EventArgs e)
        {
            this.DialogResult = DialogResult.Cancel;
        }
        
        //otros
        //mover la ventada
        private void frmCBuscarCliente_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0xA1, 0x2, 0);
        }
        //dropshadow
        [DllImport("Gdi32.dll", EntryPoint = "CreateRoundRectRgn")]
        private static extern IntPtr CreateRoundRectRgn
        (
            int nLeftRect, // x-coordinate of upper-left corner
            int nTopRect, // y-coordinate of upper-left corner
            int nRightRect, // x-coordinate of lower-right corner
            int nBottomRect, // y-coordinate of lower-right corner
            int nWidthEllipse, // height of ellipse
            int nHeightEllipse // width of ellipse
        );

        [DllImport("user32.dll", EntryPoint = "ReleaseCapture")]
        private extern static void ReleaseCapture();
        [DllImport("user32.dll", EntryPoint = "SendMessage")]
        private static extern void SendMessage(IntPtr hWnd, int wMsg, int wParam, int lParam);

        [DllImport("dwmapi.dll")]
        public static extern int DwmExtendFrameIntoClientArea(IntPtr hWnd, ref MARGINS pMarInset);

        [DllImport("dwmapi.dll")]
        public static extern int DwmSetWindowAttribute(IntPtr hwnd, int attr, ref int attrValue, int attrSize);

        [DllImport("dwmapi.dll")]
        public static extern int DwmIsCompositionEnabled(ref int pfEnabled);

        private bool m_aeroEnabled;                     // variables for box shadow
        private const int CS_DROPSHADOW = 0x00020000;
        private const int WM_NCPAINT = 0x0085;
        private const int WM_ACTIVATEAPP = 0x001C;

        public struct MARGINS                           // struct for box shadow
        {
            public int leftWidth;
            public int rightWidth;
            public int topHeight;
            public int bottomHeight;
        }

        private const int WM_NCHITTEST = 0x84;          // variables for dragging the form
        private const int HTCLIENT = 0x1;
        private const int HTCAPTION = 0x2;

        protected override CreateParams CreateParams
        {
            get
            {
                m_aeroEnabled = CheckAeroEnabled();

                CreateParams cp = base.CreateParams;
                if (!m_aeroEnabled)
                    cp.ClassStyle |= CS_DROPSHADOW;

                return cp;
            }
        }


        private bool CheckAeroEnabled()
        {
            if (Environment.OSVersion.Version.Major >= 6)
            {
                int enabled = 0;
                DwmIsCompositionEnabled(ref enabled);
                return (enabled == 1) ? true : false;
            }
            return false;
        }

        protected override void WndProc(ref Message m)
        {
            switch (m.Msg)
            {
                case WM_NCPAINT:                        // box shadow
                    if (m_aeroEnabled)
                    {
                        var v = 2;
                        DwmSetWindowAttribute(this.Handle, 2, ref v, 4);
                        MARGINS margins = new MARGINS()
                        {
                            bottomHeight = 1,
                            leftWidth = 1,
                            rightWidth = 1,
                            topHeight = 1
                        };
                        DwmExtendFrameIntoClientArea(this.Handle, ref margins);

                    }
                    break;
                default:
                    break;
            }
            base.WndProc(ref m);

            if (m.Msg == WM_NCHITTEST && (int)m.Result == HTCLIENT)     // drag the form
                m.Result = (IntPtr)HTCAPTION;

        }


    }
}
