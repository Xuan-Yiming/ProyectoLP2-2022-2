using QingYunSoft.Venta;
using System;
using System.Windows.Forms;

namespace QingYunSoft
{
    public partial class frmVentas : Form
    {

        //Objetos
        private frmPrincipal _frmPrincipal;
        private VentasWS.VentasWSClient daoVentas;
        private RRHHWS.usuario _usuario;
        private ReportesWS.ReporteWSClient daoReportes;
        
        //Constructores
        public frmVentas()
        {
            InitializeComponent();
            this.CenterToScreen();
            
        }

        public frmVentas(frmPrincipal _frmPrincipal, RRHHWS.usuario usuario)
        {
            InitializeComponent();
            this._frmPrincipal = _frmPrincipal;
            this._usuario = usuario;
            //inicializar ventas
            dgvVentas.AutoGenerateColumns = false;
            daoVentas = new VentasWS.VentasWSClient();
            dgvVentas.DataSource = daoVentas.listarOrdenesDeCompraUltimas50();
            dgvVentas.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            if (this._usuario is RRHHWS.vendedor)
            {
                btNuevaVenta.Enabled = true;
            }
            else
            {                
                btNuevaVenta.Enabled = false;
            }
        }

        private void btNuevaVenta_Click(object sender, EventArgs e)
        {
            _frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmInfoVenta(_frmPrincipal, Estado.Nuevo, this._usuario));
        }

        private void btBuscar_Click(object sender, EventArgs e)
        {
            frmBuscarVenta _frmBuscarVenta = new frmBuscarVenta();
            if (_frmBuscarVenta.ShowDialog() == DialogResult.OK)
            {
                _frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmInfoVenta(_frmPrincipal, Estado.Resultado, _frmBuscarVenta.OrdenDeCompraSeleccionado, this._usuario));
            }
        }
        private void dgvVentas_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            VentasWS.ordenDeCompra venta = (VentasWS.ordenDeCompra)dgvVentas.Rows[e.RowIndex].DataBoundItem;
            dgvVentas.Rows[e.RowIndex].Cells["ID"].Value = venta.idOrdenDeCompra;
            dgvVentas.Rows[e.RowIndex].Cells["vendedor"].Value = venta.vendedor.nombre + " " + venta.vendedor.apellido;
            if (venta.cliente is VentasWS.personaNatural)
            {
                dgvVentas.Rows[e.RowIndex].Cells["cliente"].Value = ((VentasWS.personaNatural)venta.cliente).nombre
                    + " " + ((VentasWS.personaNatural)venta.cliente).apellido;
            }
            else
            {
                dgvVentas.Rows[e.RowIndex].Cells["cliente"].Value = ((VentasWS.empresa)venta.cliente).razonSocial;
            }
            dgvVentas.Rows[e.RowIndex].Cells["fechaVenta"].Value = venta.fechaDeCompra.ToString("dd/MM/yyyy");
            dgvVentas.Rows[e.RowIndex].Cells["moneda"].Value = ((VentasWS.moneda)venta.moneda).nombre;
            dgvVentas.Rows[e.RowIndex].Cells["monto"].Value = (double)venta.monto;
        }

        private void btReporteVEntasPorPeriodo_Click(object sender, EventArgs e)
        {
            frmElegirFecha _frmElegirFecha = new frmElegirFecha();
            _frmElegirFecha.Show();
        }

        private void btReporteReclamos_Click(object sender, EventArgs e)
        {
            daoReportes = new ReportesWS.ReporteWSClient();
            frmReporteViewer _frmReporteViewer = new frmReporteViewer(null);
            _frmReporteViewer.Show();
        }

        private void dgvVentas_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            VentasWS.ordenDeCompra ventSeleccionado = (VentasWS.ordenDeCompra)dgvVentas.CurrentRow.DataBoundItem;
            _frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmInfoVenta(_frmPrincipal, Estado.Resultado, ventSeleccionado, this._usuario));
        }
    }
}
