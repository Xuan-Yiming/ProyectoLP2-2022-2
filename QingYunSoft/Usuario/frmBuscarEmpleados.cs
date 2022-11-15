using System;
using System.Runtime.InteropServices;
using System.Windows.Forms;

namespace QingYunSoft.Usuario
{
    public partial class frmBuscarEmpleados : Form
    {
        //objetos
        private RRHHWS.usuario usuarioSeleccionado;

        //dao
        private RRHHWS.RRHHWSClient daoRRHH;

        public frmBuscarEmpleados()
        {
            InitializeComponent();
            this.CenterToParent();
            daoRRHH = new RRHHWS.RRHHWSClient();
            dgvUsuarios.AutoGenerateColumns = false;
            dgvUsuarios.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            //round form border
            this.FormBorderStyle = FormBorderStyle.None;
            this.Region = System.Drawing.Region.FromHrgn(CreateRoundRectRgn(0, 0, this.Width, this.Height, 15, 15));
        }

        public RRHHWS.usuario UsuarioSeleccionado { get => usuarioSeleccionado; set => usuarioSeleccionado = value; }
        private void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                dgvUsuarios.DataSource = daoRRHH.listarUsuarioPorDocumentoNombre(txtDNINombre.Text);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void dgvUsuarios_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            RRHHWS.usuario empleado = (RRHHWS.usuario)dgvUsuarios.Rows[e.RowIndex].DataBoundItem;
            dgvUsuarios.Rows[e.RowIndex].Cells["nombre"].Value = empleado.nombre + " " + empleado.apellido;
            dgvUsuarios.Rows[e.RowIndex].Cells["tipoDocumento"].Value = empleado.tipoDeDocumento.ToString();
            dgvUsuarios.Rows[e.RowIndex].Cells["nmrDocumento"].Value = empleado.numDeDocumento;
            dgvUsuarios.Rows[e.RowIndex].Cells["fechaIngreso"].Value = empleado.fechaIngreso;
            if (empleado is RRHHWS.administrador)
            {
                dgvUsuarios.Rows[e.RowIndex].Cells["cargo"].Value = "Administrador";
            }
            else if (empleado is RRHHWS.vendedor)
            {
                dgvUsuarios.Rows[e.RowIndex].Cells["cargo"].Value = "Vendedor";
            }
            else if (empleado is RRHHWS.supervisorDeAlmacen)
            {
                dgvUsuarios.Rows[e.RowIndex].Cells["cargo"].Value = "Sup. Almacen";
            }
        }

        private void btSeleccionar_Click(object sender, EventArgs e)
        {
            if (dgvUsuarios.CurrentRow != null)
            {
                usuarioSeleccionado = (RRHHWS.usuario)dgvUsuarios.CurrentRow.DataBoundItem;
                this.DialogResult = DialogResult.OK;
            }
            else
            {
                MessageBox.Show("Debe seleccionar un usuario", "Mensaje de advertencia", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        //otros

        //round border
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

        //out drop shadow
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

        private void btCancelar_Click(object sender, EventArgs e)
        {
            this.DialogResult = DialogResult.Cancel;
        }
        //out drop shadow done
    }
}
