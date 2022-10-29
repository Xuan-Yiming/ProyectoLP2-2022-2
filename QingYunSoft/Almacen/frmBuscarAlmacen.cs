using QingYunSoft.VentasWS;
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
    public partial class frmBuscarAlmacen : Form
    {
        VentasWS.almacen almacenSeleccionado;
        public frmBuscarAlmacen()
        {
            InitializeComponent();
            dgvAlmacenes.AutoGenerateColumns = false;
            dgvAlmacenes.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
        }

        public almacen Almacen { get => almacenSeleccionado; set => almacenSeleccionado = value; }

        private void btSeleccionar_Click(object sender, EventArgs e)
        {
            if (dgvAlmacenes.CurrentRow != null)
            {
                OrdenDeCompraSeleccionado = (VentasWS.ordenDeCompra)dgvVentas.CurrentRow.DataBoundItem;
                this.DialogResult = DialogResult.OK;
            }
            else
            {
                MessageBox.Show("Debe seleccionar una venta", "Mensaje de advertencia", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void dgvAlmacenes_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            VentasWS.almacen almacen = (VentasWS.almacen)dgvAlmacenes.CurrentRow.DataBoundItem;
            dgvAlmacenes.Rows[e.RowIndex].Cells["id"].Value = almacen.id;
            dgvAlmacenes.Rows[e.RowIndex].Cells["nombre"].Value = almacen.nombre;
            //dgvProductos.Rows[e.RowIndex].Cells["supervisor"].Value = almacenSeleccionado.idSupervisor;
            dgvAlmacenes.Rows[e.RowIndex].Cells["direccion"].Value = almacen.direccion;
        }
    }
}
