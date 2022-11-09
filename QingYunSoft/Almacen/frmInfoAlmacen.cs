using QingYunSoft.Cliente;
using QingYunSoft.Usuario;
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
    public partial class frmInfoAlmacen : Form
    {
        private frmPrincipal _frmPrincipal;
        private VentasWS.VentasWSClient daoVentasWS = new VentasWS.VentasWSClient();
        private Estado _estado;
        private VentasWS.almacen _almacen = new VentasWS.almacen();
        private RRHHWS.RRHHWSClient daoRRHHWS;
        public frmInfoAlmacen(Form from, Estado estado, VentasWS.almacen almacen)
        {
            InitializeComponent();
            this.cbSupervisores.DataSource = daoVentasWS.listarSupervisores();
            this.cbSupervisores.DisplayMember = "nombre";
            
            
            this._frmPrincipal = (frmPrincipal)from;
            this._estado = estado;
            this._almacen = almacen;

            txtID.Text = almacen.idAlmacen.ToString();
            txtNombre.Text = almacen.nombre;
            txtDireccion.Text = almacen.direccion;
            this.cbSupervisores.SelectedItem = almacen.supervisor;

            dgvStocks.AutoGenerateColumns = false;
            dgvStocks.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dgvStocks.DataSource = daoVentasWS.listarStockPorIdAlmacen(almacen.idAlmacen);

            establecarComponentes();
        }

        public frmInfoAlmacen(Form from, Estado estado)
        {
            InitializeComponent();
            this.cbSupervisores.DataSource = daoVentasWS.listarSupervisores();
            this.cbSupervisores.DisplayMember = "nombre";
            this._frmPrincipal = (frmPrincipal)from;
            this._estado = estado;
            dgvStocks.AutoGenerateColumns = false;
            dgvStocks.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            establecarComponentes();
        }

        private void btRegresar_Click(object sender, EventArgs e)
        {
            _frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmAlmacen(_frmPrincipal));
        }



        private void btAnular_Click(object sender, EventArgs e)
        {
            
            if (MessageBox.Show("¿Esta seguro que desea eliminar este almacen?", "Mensaje de confirmación", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.Yes)
            {

                int result = daoVentasWS.eliminarAlmacen(this._almacen);

                if (result == 1)
                    MessageBox.Show("Se ha eliminado exitosamente el almacen", "Mensaje de Confirmación", MessageBoxButtons.OK, MessageBoxIcon.Information);
                else
                    MessageBox.Show("Ha ocurrido un error al momento de eliminar el almacen", "Mensaje de Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            _frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmAlmacen(_frmPrincipal));
        }

        private void establecarComponentes()
        {
            switch (this._estado)
            {
                case Estado.Nuevo:
                    btEditarGuardar.Text = "Guardar";
                    txtID.Enabled = false;
                    txtNombre.Enabled = true;
                    txtDireccion.Enabled = true;
                    cbSupervisores.Enabled = true;
                    btModificar.Enabled = true;
                    btAgregar.Enabled = true;
                    btEditarGuardar.Enabled = true;
                    btCancelar.Enabled = true;
                    btRegresar.Enabled = false;
                    btAnular.Enabled = false;
                    break;
                case Estado.Modificar:
                    btEditarGuardar.Text = "Guardar";
                    txtID.Enabled = false;
                    txtNombre.Enabled = true;
                    txtDireccion.Enabled = true;
                    cbSupervisores.Enabled = true;
                    btModificar.Enabled = true;
                    btAgregar.Enabled = true;
                    btEditarGuardar.Enabled = true;
                    btCancelar.Enabled = true;
                    btRegresar.Enabled = false;
                    btAnular.Enabled = true;
                    break;
                case Estado.Resultado:
                    btEditarGuardar.Text = "Editar";
                    txtID.Enabled = false;
                    txtNombre.Enabled = false;
                    txtDireccion.Enabled = false;
                    cbSupervisores.Enabled = false;
                    btModificar.Enabled = false;
                    btAgregar.Enabled = false;
                    btEditarGuardar.Enabled = true;
                    btCancelar.Enabled = false;
                    btRegresar.Enabled = true;
                    btAnular.Enabled = false;
                    break;
                default:
                    break;
            }
        }

        private void btAgregar_Click(object sender, EventArgs e)
        {
            frmInfoProducto _frmInfoProducto =
                    new frmInfoProducto(Estado.Nuevo, this._almacen);
            _frmInfoProducto.ShowDialog();
            dgvStocks.DataSource = daoVentasWS.listarStockPorIdAlmacen(this._almacen.idAlmacen);
        }

        private void btModificar_Click(object sender, EventArgs e)
        {
            frmInfoProducto _frmInfoProducto =
                    new frmInfoProducto((VentasWS.stock)dgvStocks.CurrentRow.DataBoundItem,Estado.Resultado, this._almacen);
            _frmInfoProducto.ShowDialog();
            dgvStocks.DataSource = daoVentasWS.listarStockPorIdAlmacen(this._almacen.idAlmacen);
            //if (_frmInfoProducto.ShowDialog() == DialogResult.Cancel)
            //{
            //    dgvProductos.DataSource = daoVentasWS.listarStockPorIdAlmacen(this._almacen.idAlmacen);
            //}
        }

        private void btEditarGuardar_Click(object sender, EventArgs e)
        {
            if(this._estado == Estado.Resultado)
            {
                this._estado = Estado.Modificar;
                establecarComponentes();
                
            }
            else          
            {
                this._almacen.nombre = txtNombre.Text;
                this._almacen.direccion = txtDireccion.Text;
                this._almacen.supervisor = (VentasWS.supervisorDeAlmacen)cbSupervisores.SelectedItem;
                if (this._estado == Estado.Nuevo)
                {
                    int result = daoVentasWS.insertarAlmacen(this._almacen);
                    if (result != 0){
                        MessageBox.Show("Se ha insertado exitosamente el almacen", "Mensaje de Confirmación", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        this._estado = Estado.Resultado;
                        this._almacen.idAlmacen = result;
                        this.txtID.Text = result.ToString();
                        establecarComponentes();
                    }
                    else
                        MessageBox.Show("Ha ocurrido un error al momento de insertar el almacen", "Mensaje de Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    this._estado = Estado.Resultado;
                    establecarComponentes();
                }
                else
                {
                    int result = daoVentasWS.modificarAlmacen(this._almacen);
                    if (result != 0)
                    {
                        MessageBox.Show("Se ha modificado exitosamente el almacen", "Mensaje de Confirmación", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        this._estado = Estado.Resultado;
                        establecarComponentes();
                    }
                    else
                        MessageBox.Show("Ha ocurrido un error al momento de modificar el almacen", "Mensaje de Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    this._estado = Estado.Resultado;
                    establecarComponentes();
                }
            }
        }

        private void dgvStocks_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            VentasWS.stock stock = (VentasWS.stock)dgvStocks.CurrentRow.DataBoundItem;
            dgvStocks.Rows[e.RowIndex].Cells["ID"].Value = stock.producto.idProducto;
            dgvStocks.Rows[e.RowIndex].Cells["nombre"].Value = stock.producto.nombre;
            dgvStocks.Rows[e.RowIndex].Cells["precio"].Value = stock.producto.precio;
            dgvStocks.Rows[e.RowIndex].Cells["cantidad"].Value = stock.cantidad;
            dgvStocks.Rows[e.RowIndex].Cells["devuelto"].Value = stock.producto.devuelto;
            dgvStocks.Rows[e.RowIndex].Cells["fechaIngreso"].Value = stock.producto.fechaDeIngreso;
        }
    }
}
