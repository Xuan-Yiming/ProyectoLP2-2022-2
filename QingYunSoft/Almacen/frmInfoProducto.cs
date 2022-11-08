using QingYunSoft.VentasWS;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QingYunSoft.Almacen
{
    public partial class frmInfoProducto : Form
    {
        private Estado _estado;
        private VentasWS.VentasWSClient daoVentasWS;
        private System.Windows.Forms.OpenFileDialog ofdFoto;
        private String _rutaFoto;
        VentasWS.producto _producto = new VentasWS.producto();
        VentasWS.stock _stock = new VentasWS.stock();
        VentasWS.almacen _almacen = new VentasWS.almacen();
        public frmInfoProducto(Estado estado, VentasWS.almacen almacen)
        {
            InitializeComponent();
            _estado = estado;
            this._almacen = almacen;
            daoVentasWS = new VentasWSClient();
            this.cbAlmacen.DataSource = daoVentasWS.listarAlmacen();
            this.cbAlmacen.DisplayMember = "nombre";
            establecerEstadoComponentes();
            this.CenterToScreen();
        }
        
        public frmInfoProducto(VentasWS.stock stock, Estado estado, VentasWS.almacen almacen)
        {
            InitializeComponent();
            _estado = estado;
            this._almacen = almacen;
            daoVentasWS = new VentasWSClient();
            this.cbAlmacen.DataSource = daoVentasWS.listarAlmacen();
            this.cbAlmacen.DisplayMember = "nombre";
            establecerEstadoComponentes();
            this.txtID.Text = stock.producto.idProducto.ToString();
            this.cbAlmacen.SelectedItem = almacen;
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
            this.CenterToScreen();
        }
    
        private void btEditarGuardar_Click(object sender, EventArgs e)
        {
            daoVentasWS = new VentasWSClient();

            _producto.nombre = txtNombre.Text;
            _producto.precio = double.Parse(txtPrecio.Text);
            _producto.costo = double.Parse(txtCosto.Text);
            _producto.fechaDeIngreso = dtpFechaIngreso.Value;
            _producto.devuelto = cbxDevuelto.Checked;

            FileStream fs = new FileStream(_rutaFoto, FileMode.Open, FileAccess.Read);
            BinaryReader br = new BinaryReader(fs);
            _producto.foto = br.ReadBytes((int)fs.Length);
            fs.Close();

            _producto.activoSpecified = true;
            _producto.devueltoSpecified = true;
            _producto.fechaDeIngresoSpecified = true;

            _stock.producto = this._producto;
            _stock.cantidad = Int32.Parse(txtStock.Text);
            _almacen = (almacen)cbAlmacen.SelectedItem;
            if (this._estado == Estado.Nuevo)
            {              
                int resultado = 0;
                resultado = daoVentasWS.insertarProducto(_producto);
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
                this._stock.producto = _producto;
                this._stock.cantidad = Int32.Parse(txtStock.Text);

                int resultado = 0;
                resultado = daoVentasWS.modificarProducto(_producto);
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

        private void btEliminar_Click(object sender, EventArgs e)
        {

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
            switch (this._estado){
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
                    this.cbAlmacen.Enabled = true;
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
