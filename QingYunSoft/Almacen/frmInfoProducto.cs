using QingYunSoft.VentasWS;
using System;
using System.Drawing;
using System.IO;
using System.Windows.Forms;

namespace QingYunSoft.Almacen
{
    public partial class frmInfoProducto : Form
    {
        private Estado _estado;
        private VentasWS.VentasWSClient daoVentasWS;
        private System.Windows.Forms.OpenFileDialog ofdFoto;
        private String _rutaFoto;
        private VentasWS.almacen almacenSeleccionado;

        VentasWS.producto _producto = new VentasWS.producto();
        VentasWS.stock _stock = new VentasWS.stock();
        VentasWS.almacen _almacen = new VentasWS.almacen();
        public frmInfoProducto(Estado estado, VentasWS.almacen almacen)
        {
            //nuevo producto
            InitializeComponent();
            _estado = estado;
            daoVentasWS = new VentasWSClient();
            this.cbAlmacen.DataSource = almacen;
            this.cbAlmacen.DisplayMember = "nombre";
            this.cbAlmacen.ValueMember = "idAlmacen";
            this.almacenSeleccionado = new almacen();
            this.almacenSeleccionado = almacen;
            establecerEstadoComponentes();
            this.CenterToScreen();
        }

        public frmInfoProducto(VentasWS.stock stock, Estado estado, VentasWS.almacen almacen, VentasWS.almacen[] almacenes)
        {
            //editar producto
            InitializeComponent();
            _estado = estado;
            this._almacen = almacen;
            this._stock = stock;
            daoVentasWS = new VentasWSClient();
            this.cbAlmacen.DataSource = almacenes;
            this.cbAlmacen.DisplayMember = "nombre";
            this.cbAlmacen.ValueMember = "idAlmacen";
            establecerEstadoComponentes();
            this.cbAlmacen.SelectedValue = almacen.idAlmacen;
            this.txtID.Text = stock.producto.idProducto.ToString();
            this.txtNombre.Text = stock.producto.nombre;
            this.txtCosto.Text = stock.producto.costo.ToString();
            this.txtPrecio.Text = stock.producto.precio.ToString();
            this.txtStock.Text = stock.cantidad.ToString();
            this.cbxDevuelto.Checked = stock.producto.devuelto;
            this.dtpFechaIngreso.Value = stock.producto.fechaDeIngreso;
            if (stock.producto.foto != null)
            {
                MemoryStream ms = new MemoryStream(stock.producto.foto);
                pbFoto.Image = new Bitmap(ms);
            }
            this.almacenSeleccionado = new almacen();
            this.almacenSeleccionado = almacen;
            this.CenterToScreen();
        }

        private void btEditarGuardar_Click(object sender, EventArgs e)
        {
            daoVentasWS = new VentasWSClient();
            if (this._estado == Estado.Resultado)
            {
                this._estado = Estado.Modificar;
                cbAlmacen.DataSource = daoVentasWS.listarAlmacen();
                cbAlmacen.DisplayMember = "nombre";
                cbAlmacen.ValueMember = "idAlmacen";
                cbAlmacen.SelectedValue = this.almacenSeleccionado;
                establecerEstadoComponentes();
            }
            else
            {
                if (this.cbAlmacen.SelectedItem == null || this.txtCosto.Text.Trim().Equals("") ||
                    this.txtNombre.Text.Trim().Equals("") || this.txtPrecio.Text.Trim().Equals("") ||
                    this.txtStock.Text.Trim().Equals(""))
                {
                    MessageBox.Show("Debe llenar todos los campos", "Mensaje de Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                this._stock.producto.nombre = txtNombre.Text;
                if (!double.TryParse(txtPrecio.Text, out double precio))
                {
                    MessageBox.Show("Precio debe ser un numero", "Mensaje de Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
                this._stock.producto.precio = precio;

                if (!double.TryParse(txtCosto.Text, out double costo))
                {
                    MessageBox.Show("Costo debe ser un numero", "Mensaje de Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
                this._stock.producto.costo = costo;
                this._stock.producto.fechaDeIngreso = dtpFechaIngreso.Value;
                this._stock.producto.devuelto = cbxDevuelto.Checked;

                if (this._rutaFoto != null)
                {
                    FileStream fs = new FileStream(_rutaFoto, FileMode.Open, FileAccess.Read);
                    BinaryReader br = new BinaryReader(fs);
                    this._stock.producto.foto = br.ReadBytes((int)fs.Length);
                    fs.Close();
                }

                this._stock.producto.activo = true;
                this._stock.producto.activoSpecified = true;
                this._stock.producto.devueltoSpecified = true;
                this._stock.producto.fechaDeIngresoSpecified = true;

                if (!Int32.TryParse(txtStock.Text, out Int32 stock))
                {
                    MessageBox.Show("stock debe ser un numero", "Mensaje de Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                _stock.cantidad = stock;
                _stock.activo = true;
                _stock.activoSpecified = true;


                _almacen = (almacen)cbAlmacen.SelectedItem;
                if (this._estado == Estado.Nuevo)
                {
                    int resultado = 0;
                    resultado = daoVentasWS.insertarProducto(_stock.producto);
                    if (resultado != 0)
                    {
                        daoVentasWS = new VentasWSClient();
                        int resultado2 = daoVentasWS.insertarStock(_stock, this._almacen.idAlmacen);
                        if (resultado2 != 0)
                        {
                            MessageBox.Show("Se ha insertado correctamente");
                            txtID.Text = resultado.ToString();
                            this._producto.idProducto = resultado;
                            this._estado = Estado.Resultado;
                            establecerEstadoComponentes();
                        }
                    }
                    else
                    {
                        MessageBox.Show("Ha ocurrido un error", "Mensaje de Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }
                else
                {
                    int resultado = 0;
                    resultado = daoVentasWS.modificarProducto(_stock.producto);
                    if (resultado != 0)
                    {
                        resultado = daoVentasWS.modificarStock(_stock, this._almacen.idAlmacen);
                        if (resultado != 0)
                        {
                            MessageBox.Show("Se ha modificado correctamente");
                            txtID.Text = resultado.ToString();
                            this._estado = Estado.Resultado;
                            establecerEstadoComponentes();
                        }
                    }
                    else
                    {
                        MessageBox.Show("Ha ocurrido un error", "Mensaje de Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }

                }
            }

        }

        private void btEliminar_Click(object sender, EventArgs e)
        {
            daoVentasWS = new VentasWSClient();
            if (MessageBox.Show("¿Esta seguro que desea eliminar este producto?", "Mensaje de confirmación", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.Yes)
            {

                int result = 0;
                result = daoVentasWS.eliminarStock(this._stock.producto.idProducto, this._almacen.idAlmacen);
                if (result == 1)
                    MessageBox.Show("Se ha eliminado exitosamente el producto", "Mensaje de Confirmación", MessageBoxButtons.OK, MessageBoxIcon.Information);
                else
                    MessageBox.Show("Ha ocurrido un error al momento de eliminar el producto", "Mensaje de Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            this.Close();
        }

        private void btSubirFoto_Click(object sender, EventArgs e)
        {
            this.ofdFoto = new System.Windows.Forms.OpenFileDialog();
            this.ofdFoto.FileName = "openFileDialog1";
            try
            {
                if (ofdFoto.ShowDialog() == DialogResult.OK)
                {
                    this._rutaFoto = ofdFoto.FileName;
                    pbFoto.Image = Image.FromFile(this._rutaFoto);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("El archivo seleccionado no es un tipo de imagen válido");
            }
        }

        private void limpiarCampos()
        {
            this.txtID.Text = "";
            this.txtNombre.Text = "";
            this.txtCosto.Text = "";
            this.txtPrecio.Text = "";
            this.txtStock.Text = "";
            this.cbxDevuelto.Checked = false;
            this.cbAlmacen.SelectedIndex = -1;
            this.dtpFechaIngreso.Value = DateTime.Now;
        }

        private void establecerEstadoComponentes()
        {
            switch (this._estado)
            {
                case Estado.Nuevo:
                    this.btEditarGuardar.Text = "Guardar";
                    this.btEliminar.Enabled = false;
                    this.btSubirFoto.Enabled = true;
                    this.txtID.Enabled = false;
                    this.txtNombre.Enabled = true;
                    this.txtCosto.Enabled = true;
                    this.txtPrecio.Enabled = true;
                    this.txtStock.Enabled = true;
                    this.cbxDevuelto.Enabled = true;
                    this.cbAlmacen.Enabled = true;
                    this.dtpFechaIngreso.Enabled = true;
                    this.btSubirFoto.Enabled = true;
                    this.limpiarCampos();
                    break;
                case Estado.Modificar:
                    this.btEditarGuardar.Text = "Guardar";
                    this.btEliminar.Enabled = true;
                    this.btSubirFoto.Enabled = true;
                    this.txtID.Enabled = false;
                    this.txtNombre.Enabled = true;
                    this.txtCosto.Enabled = true;
                    this.txtPrecio.Enabled = true;
                    this.txtStock.Enabled = true;
                    this.cbxDevuelto.Enabled = true;
                    this.cbAlmacen.Enabled = false;
                    this.dtpFechaIngreso.Enabled = true;
                    this.btSubirFoto.Enabled = true;
                    break;
                case Estado.Resultado:
                    this.btEditarGuardar.Text = "Editar";
                    this.btEliminar.Enabled = true;
                    this.btSubirFoto.Enabled = true;
                    this.txtID.Enabled = false;
                    this.txtNombre.Enabled = false;
                    this.txtCosto.Enabled = false;
                    this.txtPrecio.Enabled = false;
                    this.txtStock.Enabled = false;
                    this.cbxDevuelto.Enabled = false;
                    this.cbAlmacen.Enabled = false;
                    this.dtpFechaIngreso.Enabled = false;
                    this.btSubirFoto.Enabled = true;
                    break;
            }
        }
    }
}
