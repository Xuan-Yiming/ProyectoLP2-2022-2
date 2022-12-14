using QingYunSoft.VentasWS;
using System;
using System.ComponentModel;
using System.Drawing;
using System.Linq;
using System.Windows.Forms;

namespace QingYunSoft.Venta
{
    public partial class frmReclamo : Form
    {
        //
        private Estado _estado;
        private int _idVenta;
        private VentasWS.reclamo _reclamo;
        private BindingList<VentasWS.devolucion> _devoluciones;
        private bool[] _devueltos;
        private VentasWS.VentasWSClient daoVentasWS;

        public reclamo Reclamo { get => _reclamo; set => _reclamo = value; }

        public frmReclamo(Estado estado, int idOrdenDeCompra, BindingList<VentasWS.pedido> pedidos)
        {
            //nuevo
            InitializeComponent();
            daoVentasWS = new VentasWS.VentasWSClient();

            dgvProductos.AutoGenerateColumns = false;
            dgvProductos.DataSource = pedidos;
            this._idVenta = idOrdenDeCompra;
            this._estado = estado;
            this._reclamo = new VentasWS.reclamo();
            this._reclamo.ordenDeCompra = new ordenDeCompra();
            this._reclamo.ordenDeCompra.idOrdenDeCompra = idOrdenDeCompra;

            this.
            _devueltos = new bool[pedidos.Count];
            this._devoluciones = new BindingList<devolucion>();
            establecerComponentes();
            CenterToScreen();

        }

        public frmReclamo(Estado estado, int idOrdenDeCompra)
        {
            //Resultado
            InitializeComponent();
            this._estado = estado;
            daoVentasWS = new VentasWS.VentasWSClient();
            this._reclamo = daoVentasWS.listarReclamoxOrden(idOrdenDeCompra)[0];
            dtpFecha.Value = _reclamo.fecha;
            txtDescripcion.Text = _reclamo.justificacion;
            txtID.Text = _reclamo.idReclamo.ToString();
            dgvProductos.AutoGenerateColumns = false;
            dgvProductos.DataSource = daoVentasWS.listarDevolucionXReclamo(this._reclamo.idReclamo);
            
            establecerComponentes();
            CenterToScreen();
        }

        public frmReclamo(Estado estado, reclamo reclamo)
        {
            //Modificar
            InitializeComponent();
            daoVentasWS = new VentasWS.VentasWSClient();
            this._reclamo = reclamo;
            this._estado = estado;
            dtpFecha.Value = _reclamo.fecha;
            txtDescripcion.Text = _reclamo.justificacion;
            txtID.Text = _reclamo.idReclamo.ToString();
            btAnular.Enabled = !reclamo.atendido;
            dgvProductos.AutoGenerateColumns = false;
            dgvProductos.DataSource = daoVentasWS.listarDevolucionXReclamo(this._reclamo.idReclamo);
            establecerComponentes();
            CenterToScreen();
        }
        private void btEditarGuardar_Click(object sender, EventArgs e)
        {
            if (txtDescripcion.Text == "")
            {
                MessageBox.Show("Debe colocar la justificacion", "Mensaje de Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            
            this._reclamo.fecha = dtpFecha.Value;
            this._reclamo.fechaSpecified = true;
            this._reclamo.activo = true;
            this._reclamo.activoSpecified = true;
            this._reclamo.justificacion = txtDescripcion.Text;

            //check each row in dgvProductoos if the colum Devolver is true, then add the DataBoundItem to the array devolucion
            for (int i = 0; i < dgvProductos.RowCount; i++)
            {
                if ((bool)dgvProductos.Rows[i].Cells[4].Value == false) continue;
                VentasWS.pedido pedido = (VentasWS.pedido)dgvProductos.Rows[i].DataBoundItem;
                VentasWS.devolucion devolucion = new devolucion();
                devolucion.cantidad = pedido.cantidad;
                devolucion.producto = pedido.producto;
                devolucion.activo = true;
                devolucion.activoSpecified = true;
                _devoluciones.Add(devolucion);
            }

            if (this._devoluciones != null)
                this._reclamo.devoluciones = this._devoluciones.ToArray();
            this._reclamo.devoluciones = new devolucion[] { };
            int resultado = 0;
            resultado = daoVentasWS.insertarReclamo(this._reclamo);
            if (resultado != 0)
            {                
                txtID.Text = resultado.ToString();
                this._reclamo.idReclamo = resultado;

                //insertar devoluciones
                if (this._devoluciones != null)
                {
                    foreach (devolucion devolucion in this._devoluciones)
                    {
                        devolucion.activoSpecified = true;
                        devolucion.fid_reclamo = this.Reclamo.idReclamo;
                        int res2 = 
                        daoVentasWS.insertarDevolucion(devolucion);
                        if (res2 == 0)
                        {
                            MessageBox.Show("Error al insertar devolucion", "Mensaje de Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                            return;
                        }
                    }
                }

                this.Reclamo.devoluciones = this._devoluciones.ToArray();

                MessageBox.Show("Se ha insertado correctamente");
                dtpFecha.Enabled = false;
                txtDescripcion.Enabled = false;
                txtID.Enabled = false;
                dgvProductos.Enabled = false;
                btEditarGuardar.Enabled = false;
                btEditarGuardar.BackColor = Color.Gray;

                if (this._reclamo.atendido == false)
                {
                    btAtender.Enabled = true;
                    btAnular.Enabled = true;
                }
                else
                {
                    btAtender.Enabled = false;
                    btAtender.Text = "Atendido";
                    btAnular.Enabled = false;
                }
                establecerComponentes();
            }
            else
            {
                MessageBox.Show("Ha ocurrido un error", "Mensaje de Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        private void btAnular_Click(object sender, EventArgs e)
        {
            daoVentasWS = new VentasWSClient();
            if (MessageBox.Show("¿Esta seguro que desea eliminar este reclamo?", "Mensaje de confirmación", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.Yes)
            {

                int result = 0;
                result = daoVentasWS.eliminarReclamo(this._reclamo.idReclamo);
                if (result == 1)
                    MessageBox.Show("Se ha eliminado exitosamente el reclamo", "Mensaje de Confirmación", MessageBoxButtons.OK, MessageBoxIcon.Information);
                else
                    MessageBox.Show("Ha ocurrido un error al momento de eliminar el reclamo", "Mensaje de Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            this.Close();
        }

        private void btAtender_Click(object sender, EventArgs e)
        {
            daoVentasWS = new VentasWSClient();
            if (MessageBox.Show("¿Esta seguro que desea marcar este reclamo como atendido?", "Mensaje de confirmación", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.Yes)
            {
                this._reclamo.atendido = true;
                this._reclamo.activoSpecified = true;
                this._reclamo.fechaSpecified = true;
                
                int result = 0;
                result = daoVentasWS.modificarReclamo(this._reclamo);
                if (result == 1)
                    MessageBox.Show("Reclamo Atendido", "Mensaje de Confirmación", MessageBoxButtons.OK, MessageBoxIcon.Information);
                else
                    MessageBox.Show("Ha ocurrido un error al momento de atender el reclamo", "Mensaje de Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            this.Close();
        }

        private void establecerComponentes()
        {
            switch (this._estado)
            {
                case Estado.Nuevo:
                    dtpFecha.Enabled = false;
                    txtDescripcion.Enabled = true;
                    btAtender.Enabled = true;
                    btAnular.Enabled = false;
                    dgvProductos.Enabled = true;
                    btEditarGuardar.Enabled = true;
                    txtID.Enabled = false;
                    break;
                case Estado.Resultado:
                    dtpFecha.Enabled = false;
                    txtDescripcion.Enabled = false;
                    txtID.Enabled = false;
                    dgvProductos.Enabled = false;
                    btEditarGuardar.Enabled = false;
                    btEditarGuardar.BackColor = Color.Gray;

                    if (this._reclamo.atendido == false)
                    {
                        btAtender.Enabled = true;
                        btAnular.Enabled = true;
                    }
                    else
                    {
                        btAtender.Enabled = false;
                        btAtender.Text = "Atendido";
                        btAnular.Enabled = false;
                    }

                    break;
            }
        }

        private void dgvProductos_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            if (dgvProductos.Rows[e.RowIndex].DataBoundItem is VentasWS.pedido)
            {
                VentasWS.pedido pedido = (VentasWS.pedido)dgvProductos.Rows[e.RowIndex].DataBoundItem;
                dgvProductos.Rows[e.RowIndex].Cells[0].Value = pedido.producto.idProducto;
                dgvProductos.Rows[e.RowIndex].Cells[1].Value = pedido.producto.nombre;
                dgvProductos.Rows[e.RowIndex].Cells[2].Value = pedido.cantidad;
                dgvProductos.Rows[e.RowIndex].Cells[3].Value = pedido.cantidad * pedido.producto.precio * (1 - pedido.descuento / 100);
                dgvProductos.Rows[e.RowIndex].Cells[4].Value = this._devueltos[e.RowIndex];
            }
            else
            {
                VentasWS.devolucion devolucion = (VentasWS.devolucion)dgvProductos.Rows[e.RowIndex].DataBoundItem;
                dgvProductos.Rows[e.RowIndex].Cells[0].Value = devolucion.producto.idProducto;
                dgvProductos.Rows[e.RowIndex].Cells[1].Value = devolucion.producto.nombre;
                dgvProductos.Rows[e.RowIndex].Cells[2].Value = devolucion.cantidad;
                dgvProductos.Rows[e.RowIndex].Cells[3].Value = "-";
                dgvProductos.Rows[e.RowIndex].Cells[4].Value = true;
            }

        }

        private void dgvProductos_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == 4 && this._estado == Estado.Nuevo)
            {

                this._devueltos[e.RowIndex] = !this._devueltos[e.RowIndex];
                dgvProductos.Refresh();
            }
        }
    }
}
