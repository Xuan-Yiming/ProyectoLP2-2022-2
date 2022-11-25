using QingYunSoft.VentasWS;
using System;
using System.Linq;
using System.Windows.Forms;

namespace QingYunSoft.Almacen
{
    public partial class frmInfoAlmacen : Form
    {
        private frmPrincipal _frmPrincipal;
        private Estado _estado;

        private VentasWS.VentasWSClient daoVentasWS;
        private VentasWS.almacen _almacen;
        private VentasWS.almacen[] _almacenes;
        public frmInfoAlmacen(Form from, Estado estado, VentasWS.almacen almacen, VentasWS.almacen[] almacenes)
        {
            //almacen seleccionado
            InitializeComponent();

            _frmPrincipal = (frmPrincipal)from;
            _estado = estado;
            _almacen = almacen;
            _almacenes = almacenes;
            //instanciar dao
            daoVentasWS = new VentasWS.VentasWSClient();
            //configurar combobox
            cbSupervisores.DataSource = daoVentasWS.listarSupervisores();
            cbSupervisores.DisplayMember = "nombre";
            cbSupervisores.ValueMember = "idUsuario";

            //configurar datagridview
            dgvStocks.AutoGenerateColumns = false;
            dgvStocks.SelectionMode = DataGridViewSelectionMode.FullRowSelect;

            //establecer los campos
            txtID.Text = almacen.idAlmacen.ToString();
            txtNombre.Text = almacen.nombre;
            txtDireccion.Text = almacen.direccion;
            cbSupervisores.SelectedValue = almacen.supervisor.idUsuario;
            dgvStocks.DataSource = daoVentasWS.listarStockPorIdAlmacen(almacen.idAlmacen);

            establecarComponentes();
        }
        public frmInfoAlmacen(Form from, Estado estado, VentasWS.almacen[] almacenes)
        {
            //crear almacen nuevo
            InitializeComponent();

            _frmPrincipal = (frmPrincipal)from;
            _estado = estado;
            _almacenes = almacenes;
            _almacen = new almacen();
            //instanciar dao
            daoVentasWS = new VentasWS.VentasWSClient();
            //configurar combobox
            cbSupervisores.DataSource = daoVentasWS.listarSupervisores();
            cbSupervisores.DisplayMember = "nombre";
            cbSupervisores.ValueMember = "idUsuario";
            //configurar datagridview
            dgvStocks.AutoGenerateColumns = false;
            dgvStocks.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            establecarComponentes();
            limpiarComponentes();
        }
        private void btRegresar_Click(object sender, EventArgs e)
        {
            if (this._estado != Estado.Modificar)
                if (!(MessageBox.Show("¿Está seguro que desea salir sin guardar el cambio?", "Saliendo", MessageBoxButtons.YesNo) == DialogResult.Yes))
                {
                    return;
                }
            _frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmAlmacen(_frmPrincipal));
        }
        private void btCancelar_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("¿Esta seguro que desea borrar los datos ingresados?", "Mensaje de confirmación", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.Yes)
            {
                this._estado = Estado.Nuevo;
                establecarComponentes();
                limpiarComponentes();
            }
        }
        private void btAnular_Click(object sender, EventArgs e)
        {

            if (MessageBox.Show("¿Esta seguro que desea eliminar este almacen?", "Mensaje de confirmación", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.Yes)
            {
                int result = daoVentasWS.eliminarAlmacen(_almacen);
                if (result == 1)
                    MessageBox.Show("Se ha eliminado exitosamente el almacen", "Mensaje de Confirmación", MessageBoxButtons.OK, MessageBoxIcon.Information);
                else
                    MessageBox.Show("Ha ocurrido un error al momento de eliminar el almacen", "Mensaje de Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            _frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmAlmacen(_frmPrincipal));
        }
        private void btAgregar_Click(object sender, EventArgs e)
        {
            VentasWS.almacen[] alamcenes = { this._almacen };
            frmInfoProducto _frmInfoProducto = new frmInfoProducto(Estado.Nuevo, alamcenes);
            _frmInfoProducto.ShowDialog();
            dgvStocks.DataSource = daoVentasWS.listarStockPorIdAlmacen(_almacen.idAlmacen);
        }

        private void btModificar_Click(object sender, EventArgs e)
        {
            if (this.dgvStocks.CurrentRow == null) return;
            frmInfoProducto _frmInfoProducto = new frmInfoProducto((VentasWS.stock)dgvStocks.CurrentRow.DataBoundItem,
                                                    Estado.Resultado, _almacen, _almacenes);
            _frmInfoProducto.ShowDialog();
            dgvStocks.DataSource = daoVentasWS.listarStockPorIdAlmacen(_almacen.idAlmacen);
        }

        private void btEditarGuardar_Click(object sender, EventArgs e)
        {
            if (this._estado == Estado.Resultado)
            {
                this._estado = Estado.Modificar;
                establecarComponentes();

            }
            else
            {
                if (this.txtNombre.Text.Trim().Equals("") || this.txtDireccion.Text.Trim().Equals("") || this.cbSupervisores.SelectedItem == null)
                {
                    MessageBox.Show("Debe llenar todos los campos", "Mensaje de Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                _almacen.nombre = txtNombre.Text;
                _almacen.direccion = txtDireccion.Text;
                _almacen.supervisor = (VentasWS.supervisorDeAlmacen)cbSupervisores.SelectedItem;
                if (_estado == Estado.Nuevo)
                {
                    int result = daoVentasWS.insertarAlmacen(_almacen);
                    if (result != 0)
                    {
                        MessageBox.Show("Se ha insertado exitosamente el almacen", "Mensaje de Confirmación", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        _estado = Estado.Resultado;
                        _almacen.idAlmacen = result;
                        txtID.Text = result.ToString();
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
            VentasWS.stock stock = (VentasWS.stock)dgvStocks.Rows[e.RowIndex].DataBoundItem;
            dgvStocks.Rows[e.RowIndex].Cells["ID"].Value = stock.producto.idProducto;
            dgvStocks.Rows[e.RowIndex].Cells["nombre"].Value = stock.producto.nombre;
            dgvStocks.Rows[e.RowIndex].Cells["precio"].Value = stock.producto.precio;
            dgvStocks.Rows[e.RowIndex].Cells["cantidad"].Value = stock.cantidad;
            dgvStocks.Rows[e.RowIndex].Cells["devuelto"].Value = stock.producto.devuelto ? "Si" : "No";
            dgvStocks.Rows[e.RowIndex].Cells["fechaIngreso"].Value = stock.producto.fechaDeIngreso.ToString("dd/MM/yyyy");
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
                    btModificar.Enabled = false;
                    btAgregar.Enabled = false;
                    btEditarGuardar.Enabled = true;
                    btCancelar.Enabled = true;
                    btRegresar.Enabled = true;
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
                    btRegresar.Enabled = true;
                    btAnular.Enabled = true;
                    break;
                case Estado.Resultado:
                    btEditarGuardar.Text = "Editar";
                    txtID.Enabled = false;
                    txtNombre.Enabled = false;
                    txtDireccion.Enabled = false;
                    cbSupervisores.Enabled = false;
                    btModificar.Enabled = true;
                    btAgregar.Enabled = true;
                    btEditarGuardar.Enabled = true;
                    btCancelar.Enabled = false;
                    btRegresar.Enabled = true;
                    btAnular.Enabled = false;
                    break;
                default:
                    break;
            }
        }
        private void limpiarComponentes()
        {
            txtID.Text = "";
            txtNombre.Text = "";
            txtDireccion.Text = "";
            cbSupervisores.SelectedIndex = -1;
            dgvStocks.DataSource = null;
        }


    }
}
