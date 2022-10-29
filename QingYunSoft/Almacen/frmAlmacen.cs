using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QingYunSoft.Almacen
{
    public partial class frmAlmacen : Form
    {
        private frmPrincipal _frmPrincipal;
        private VentasWS.VentasWSClient daoVentasWS;
        private RRHHWS.RRHHWSClient daoRRHHWS;
        public frmAlmacen(frmPrincipal _frmPrincipal)
        {
            InitializeComponent();
            this._frmPrincipal = _frmPrincipal;
            
            dgvAlmacenes.AutoGenerateColumns = false;
            daoVentasWS = new VentasWS.VentasWSClient();
            daoRRHHWS = new RRHHWS.RRHHWSClient();
            dgvAlmacenes.DataSource = daoVentasWS.listarAlmacen();
            dgvAlmacenes.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
        }

        private void dgvProductos_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            VentasWS.almacen almacen = (VentasWS.almacen)dgvAlmacenes.CurrentRow.DataBoundItem;
            dgvAlmacenes.Rows[e.RowIndex].Cells["id"].Value = almacen.id;
            dgvAlmacenes.Rows[e.RowIndex].Cells["nombre"].Value = almacen.nombre;
            //dgvProductos.Rows[e.RowIndex].Cells["supervisor"].Value = daoRRHHWS.lisar;
            dgvAlmacenes.Rows[e.RowIndex].Cells["direccion"].Value = almacen.direccion;
        }

        private void dgvProductos_CellContentDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            //_frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmInfoAlmacen(_frmPrincipal, Estado.Resultado, (VentasWS.almacen)dgvAlmacenes.CurrentRow.DataBoundItem));
        }

        private void btRegistrarProducto_Click(object sender, EventArgs e)
        {
           // _frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmInfoProducto(_frmPrincipal, Estado.Nuevo));
        }

        private void btNuevoAlmacen_Click(object sender, EventArgs e)
        {
            //_frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmInfoAlmacen(_frmPrincipal, Estado.Nuevo));
        }

        private void btBuscar_Click(object sender, EventArgs e)
        {
            frmBuscarAlmacen _frmBuscarAlmacen = new frmBuscarAlmacen();
            if (_frmBuscarAlmacen.ShowDialog() == DialogResult.OK)
            {
                //_frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmInfoAlmacen(_frmPrincipal, Estado.Resultado, _frmBuscarAlmacen.AlmacenSeleccionado));
            }
        }
    }
}
