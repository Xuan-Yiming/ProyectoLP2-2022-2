using System;
using System.Runtime.InteropServices;
using System.Windows.Forms;

namespace QingYunSoft.Almacen
{
    public partial class frmBuscarProducto : Form
    {
        private VentasWS.VentasWSClient daoVentasWS;
        private VentasWS.VentasWSClient daoProductosWS;
        private VentasWS.stock stockSeleccionado;
        public frmBuscarProducto(VentasWS.almacen[] almacenes)
        {
            InitializeComponent();
            CenterToScreen();
            //round form border
            FormBorderStyle = FormBorderStyle.None;
            Region = System.Drawing.Region.FromHrgn(CreateRoundRectRgn(0, 0, this.Width, this.Height, 15, 15));

            //inicialzar dao
            daoVentasWS = new VentasWS.VentasWSClient();
            daoProductosWS = new VentasWS.VentasWSClient();

            //configurar dataridview
            dgvProductos.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dgvProductos.AutoGenerateColumns = false;

            //configurar combobox
            cbAlmacen.DataSource = almacenes;
            cbAlmacen.DisplayMember = "nombre";
            cbAlmacen.ValueMember = "idAlmacen";
        }

        public VentasWS.stock StockSeleccionado { get => stockSeleccionado; set => stockSeleccionado = value; }

        private void btSeleccionar_Click(object sender, EventArgs e)
        {
            if (dgvProductos.CurrentRow != null)
            {
                StockSeleccionado = (VentasWS.stock)dgvProductos.CurrentRow.DataBoundItem;
                DialogResult = DialogResult.OK;
            }
            else
            {
                MessageBox.Show("Debe seleccionar un producto", "Mensaje de advertencia", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }
        private void btBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                dgvProductos.DataSource = daoVentasWS.listarStockPorIdAlmacenYNombre(((VentasWS.almacen)cbAlmacen.SelectedItem).idAlmacen, txtNombreCodigo.Text);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }
        private void btCancelar_Click(object sender, EventArgs e)
        {
            this.DialogResult = DialogResult.Cancel;
        }
        private void dgvProductos_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            VentasWS.stock stock = (VentasWS.stock)dgvProductos.Rows[e.RowIndex].DataBoundItem;
            dgvProductos.Rows[e.RowIndex].Cells["ID"].Value = stock.producto.idProducto;
            dgvProductos.Rows[e.RowIndex].Cells["nombre"].Value = stock.producto.nombre;
            dgvProductos.Rows[e.RowIndex].Cells["precio"].Value = stock.producto.precio;
            dgvProductos.Rows[e.RowIndex].Cells["cantidad"].Value = stock.cantidad;
            dgvProductos.Rows[e.RowIndex].Cells["devuelto"].Value = stock.producto.devuelto ? "Si" : "No";
            dgvProductos.Rows[e.RowIndex].Cells["fechaIngreso"].Value = stock.producto.fechaDeIngreso;
        }




        //otros        
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
        //mover el formulario
        private void frmBuscarProducto_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0xA1, 0x2, 0);
        }
    }
}
