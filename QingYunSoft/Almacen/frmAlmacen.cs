using System;
using System.Windows.Forms;

namespace QingYunSoft.Almacen
{
    public partial class frmAlmacen : Form
    {
        private frmPrincipal _frmPrincipal;
        private VentasWS.VentasWSClient daoVentasWS;
        private VentasWS.almacen[] almacenes;
        
        public frmAlmacen(frmPrincipal _frmPrincipal)
        {
            InitializeComponent();            
            this._frmPrincipal = _frmPrincipal;
            
            //instanciar dao
            daoVentasWS = new VentasWS.VentasWSClient();
            
            //configurar datagrid view
            dgvAlmacenes.AutoGenerateColumns = false;
            dgvAlmacenes.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            //cargar datos
            almacenes = daoVentasWS.listarAlmacen();
            dgvAlmacenes.DataSource = almacenes;
            
        }
        private void btNuevoAlmacen_Click(object sender, EventArgs e)
        {
            _frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmInfoAlmacen(_frmPrincipal, Estado.Nuevo, almacenes));
        }        
        private void btBuscar_Click(object sender, EventArgs e)
        {
            frmBuscarAlmacen _frmBuscarAlmacen = new frmBuscarAlmacen();
            if (_frmBuscarAlmacen.ShowDialog() == DialogResult.OK)
            {
                _frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmInfoAlmacen(_frmPrincipal, Estado.Resultado, _frmBuscarAlmacen.AlmacenSeleccionado, almacenes));
            }
        }
        private void dgvAlmacenes_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            _frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmInfoAlmacen(_frmPrincipal, Estado.Resultado, (VentasWS.almacen)dgvAlmacenes.CurrentRow.DataBoundItem, almacenes));
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
    }
}
