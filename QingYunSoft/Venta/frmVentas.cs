using QingYunSoft.Venta;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QingYunSoft
{
    public partial class frmVentas : Form
    {

        //Objetos
        private frmPrincipal _frmPrincipal;
        private VentasWS.VentasWSClient daoVentas;
        
        //Constructores
        public frmVentas()
        {
            InitializeComponent();
            this.CenterToScreen();
        }
        
        public frmVentas(frmPrincipal _frmPrincipal)
        {
            InitializeComponent();
            this._frmPrincipal = _frmPrincipal;

            //inicializar ventas
            dgvVentas.AutoGenerateColumns = false;
            daoVentas = new VentasWS.VentasWSClient();
            dgvVentas.DataSource = daoVentas.listarOrdenesDeCompraUltimas50();
            dgvVentas.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
        }

        private void btNuevaVenta_Click(object sender, EventArgs e)
        {
            //_frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmInfoVenta(_frmPrincipal,Estado.Nuevo));
        }

        private void btBuscar_Click(object sender, EventArgs e)
        {
            frmBuscarVenta _frmBuscarVenta = new frmBuscarVenta();
            if (_frmBuscarVenta.ShowDialog() == DialogResult.OK)
            {
                //_frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmInfoVenta(_frmPrincipal, Estado.Resultado, _frmBuscarVenta.OrdenDeCompraSeleccionado));
            }
        }

        private void dgvVentas_CellContentDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            VentasWS.ordenDeCompra ventSeleccionado = (VentasWS.ordenDeCompra)dgvVentas.CurrentRow.DataBoundItem;
            //_frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmInfoVenta(_frmPrincipal, Estado.Resultado, ventSeleccionado));
        }

        private void dgvVentas_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            VentasWS.ordenDeCompra venta = (VentasWS.ordenDeCompra)dgvVentas.Rows[e.RowIndex].DataBoundItem;
            dgvVentas.Rows[e.RowIndex].Cells["ID"].Value = venta.id;
            dgvVentas.Rows[e.RowIndex].Cells["idCliente"].Value = venta.idCliente;
            dgvVentas.Rows[e.RowIndex].Cells["fechaVenta"].Value = venta.fechaDeCompra;
            dgvVentas.Rows[e.RowIndex].Cells["moneda"].Value = ((VentasWS.moneda)venta.moneda).abreviatura;
            dgvVentas.Rows[e.RowIndex].Cells["monto"].Value = (double)venta.monto;
        }
    }
}
