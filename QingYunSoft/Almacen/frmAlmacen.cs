using QingYunSoft.VentasWS;
using System;
using System.Windows.Forms;

namespace QingYunSoft.Almacen
{
    public partial class frmAlmacen : Form
    {
        private frmPrincipal _frmPrincipal;
        private VentasWS.VentasWSClient daoVentasWS;
        private RRHHWS.RRHHWSClient daoRRHHWS;
        private VentasWS.almacen[] almacenes;
        public frmAlmacen(frmPrincipal _frmPrincipal)
        {
            InitializeComponent();
            this._frmPrincipal = _frmPrincipal;

            dgvAlmacenes.AutoGenerateColumns = false;
            daoVentasWS = new VentasWS.VentasWSClient();
            this.almacenes = daoVentasWS.listarAlmacen();
            dgvAlmacenes.DataSource = this.almacenes;
            dgvAlmacenes.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
        }

        private void dgvProductos_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            VentasWS.almacen almacen = (VentasWS.almacen)dgvAlmacenes.Rows[e.RowIndex].DataBoundItem;
            dgvAlmacenes.Rows[e.RowIndex].Cells["id"].Value = almacen.idAlmacen;
            dgvAlmacenes.Rows[e.RowIndex].Cells["nombre"].Value = almacen.nombre;
            dgvAlmacenes.Rows[e.RowIndex].Cells["supervisor"].Value = ((VentasWS.supervisorDeAlmacen)almacen.supervisor).nombre
                                                                        + " " + ((VentasWS.supervisorDeAlmacen)almacen.supervisor).apellido;
            dgvAlmacenes.Rows[e.RowIndex].Cells["direccion"].Value = almacen.direccion;
        }

        private void dgvProductos_CellContentDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            _frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmInfoAlmacen(_frmPrincipal, Estado.Resultado, (VentasWS.almacen)dgvAlmacenes.CurrentRow.DataBoundItem));
        }

        private void btRegistrarProducto_Click(object sender, EventArgs e)
        {
            frmInfoProducto _frmInfoProducto = new frmInfoProducto(Estado.Nuevo, this.almacenes);
            _frmInfoProducto.ShowDialog();
            //_frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmInfoProducto(/*_frmPrincipal, Estado.Nuevo*/));
        }

        private void btNuevoAlmacen_Click(object sender, EventArgs e)
        {
            _frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmInfoAlmacen(_frmPrincipal, Estado.Nuevo));
        }

        private void btBuscar_Click(object sender, EventArgs e)
        {
            frmBuscarAlmacen _frmBuscarAlmacen = new frmBuscarAlmacen();
            if (_frmBuscarAlmacen.ShowDialog() == DialogResult.OK)
            {
                _frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmInfoAlmacen(_frmPrincipal, Estado.Resultado, _frmBuscarAlmacen.AlmacenSeleccionado));
            }
        }

        private void dgvAlmacenes_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            _frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmInfoAlmacen(_frmPrincipal, Estado.Resultado, (VentasWS.almacen)dgvAlmacenes.CurrentRow.DataBoundItem));
        }
    }
}
