using QingYunSoft.Cliente;
using System;
using System.Runtime.InteropServices;
using System.Windows.Forms;

namespace QingYunSoft.Venta
{
    public partial class frmBuscarVenta : Form
    {
        //objetos
        private VentasWS.ordenDeCompra ordenDeCompraSeleccionado;
        public VentasWS.ordenDeCompra OrdenDeCompraSeleccionado { get => ordenDeCompraSeleccionado; set => ordenDeCompraSeleccionado = value; }
        private GestClientesWS.cliente clienteSeleccionado;
        private GestClientesWS.cliente _cliente;
        public frmBuscarVenta()
        {
            InitializeComponent();
            this.CenterToParent();
            //round form border
            this.FormBorderStyle = FormBorderStyle.None;
            this.dgvVentas.AutoGenerateColumns = false;
            this.dgvVentas.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            this.Region = System.Drawing.Region.FromHrgn(CreateRoundRectRgn(0, 0, this.Width, this.Height, 15, 15));
        }

        private void frmBuscarVenta_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0xA1, 0x2, 0);
        }

        private void btSeleccionar_Click(object sender, EventArgs e)
        {
            if (dgvVentas.CurrentRow != null)
            {
                OrdenDeCompraSeleccionado = (VentasWS.ordenDeCompra)dgvVentas.CurrentRow.DataBoundItem;
                this.DialogResult = DialogResult.OK;
            }
            else
            {
                MessageBox.Show("Debe seleccionar una venta", "Mensaje de advertencia", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void dgvVentas_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            VentasWS.ordenDeCompra venta = (VentasWS.ordenDeCompra)dgvVentas.Rows[e.RowIndex].DataBoundItem;
            dgvVentas.Rows[e.RowIndex].Cells["ID"].Value = venta.idOrdenDeCompra;
            if (venta.cliente is VentasWS.empresa)
            dgvVentas.Rows[e.RowIndex].Cells["nombreCliente"].Value = ((VentasWS.empresa)venta.cliente).razonSocial;
            else
                dgvVentas.Rows[e.RowIndex].Cells["nombreCliente"].Value = ((VentasWS.personaNatural)venta.cliente).nombre + " " + ((VentasWS.personaNatural)venta.cliente).apellido;
            dgvVentas.Rows[e.RowIndex].Cells["fechaVenta"].Value = venta.fechaDeCompra.ToString("dd/MM/yyyy");
            dgvVentas.Rows[e.RowIndex].Cells["moneda"].Value = ((VentasWS.moneda)venta.moneda).nombre;
            dgvVentas.Rows[e.RowIndex].Cells["monto"].Value = (double)venta.monto;
        }

        private void btBuscarPorCliente_Click(object sender, EventArgs e)
        {
            if (this._cliente == null)
            {
                MessageBox.Show("Debe seleccionar un cliente", "Mensaje de advertencia", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            dgvVentas.DataSource = new VentasWS.VentasWSClient().listarOrdenesDeCompraPorCliente(this._cliente.idCliente);
        }

        private void btBuscarPorFecha_Click(object sender, EventArgs e)
        {
            dgvVentas.DataSource = new VentasWS.VentasWSClient().listarOrdenesDeCompraPorFecha(dtpFecha.Value);       
        }

        private void btBuscarCliente_Click(object sender, EventArgs e)
        {
            frmBuscarCliente _frmBuscarCliente = new frmBuscarCliente();
            if (_frmBuscarCliente.ShowDialog() == DialogResult.OK)
            {
                this._cliente = _frmBuscarCliente.ClienteSeleccionado;
                if (_cliente is GestClientesWS.personaNatural)
                {
                    txtCliente.Text = ((GestClientesWS.personaNatural)_cliente).nombre + ", " + ((GestClientesWS.personaNatural)_cliente).apellido;
                }
                else if (_cliente is GestClientesWS.empresa)
                {
                    txtCliente.Text = ((GestClientesWS.empresa)_cliente).razonSocial;
                }

            }
            //frmBuscarCliente _frmBuscarCliente = new frmBuscarCliente();
            //if (_frmBuscarCliente.ShowDialog() == DialogResult.OK)
            //{
            //    this.clienteSeleccionado = _frmBuscarCliente.ClienteSeleccionado;
            //    if (clienteSeleccionado is GestClientesWS.personaNatural)
            //    {
            //        txtCliente.Text = ((GestClientesWS.personaNatural)clienteSeleccionado).nombre + ", " + ((GestClientesWS.personaNatural)clienteSeleccionado).apellido;
            //    }else if(clienteSeleccionado is GestClientesWS.empresa)
            //    {
            //        txtCliente.Text = ((GestClientesWS.empresa)clienteSeleccionado).razonSocial;
            //    }                
            //}
        }

        //otros
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

        private void btCancelar_Click(object sender, EventArgs e)
        {
            this.DialogResult = DialogResult.Cancel;
        }
    }
}
