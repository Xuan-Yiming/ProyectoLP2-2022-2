using QingYunSoft.Almacen;
using QingYunSoft.Cliente;
using QingYunSoft.GestClientesWS;
using QingYunSoft.RRHHWS;
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

namespace QingYunSoft
{
    public partial class frmInfoVenta : Form
    {
        //objetos
        private Estado _estado;
        private frmPrincipal _frmPrincipal;
        //private VentasWS.ordenDeCompra _venta;
        private GestClientesWS.cliente _cliente;
        //private VentasWS.producto _producto;
        private VentasWS.stock _stock;
        private VentasWS.terminoDePago _terminoDePago;
        //private VentasWS.terminoDePago _terminoDePago;
        //private VentasWS.pedido _pedidos;
        private RRHHWS.usuario _usuario;
        private VentasWS.VentasWSClient daoVentasWS;
        private VentasWS.pedido _pedido;
        private BindingList<VentasWS.pedido> _pedidos;
        private VentasWS.ordenDeCompra _ordenCompra;
        //private BindingList<VentasWS.producto> _productos;
        private BindingList<VentasWS.stock> _stocks;
        
        //constructores
        public frmInfoVenta()
        {
            InitializeComponent();

        }
        public frmInfoVenta(frmPrincipal _frmPrincipal, Estado estado, RRHHWS.usuario _usuario)
        {
            InitializeComponent();
            this._estado = estado;
            this._frmPrincipal = _frmPrincipal;
            this._usuario = _usuario;

            dgvProductos.AutoGenerateColumns = false;

            daoVentasWS = new VentasWSClient();
            cbMoneda.DataSource = daoVentasWS.listarMonedas();
            cbMoneda.DisplayMember = "nombre";
            cbMoneda.ValueMember = "idMoneda";

            //_productos = new BindingList<VentasWS.producto>();
            //dgvProductos.DataSource = _productos;

            _stocks = new BindingList<VentasWS.stock>();
            //_pedidos = new BindingList<VentasWS.pedido>();
            //dgvProductos.DataSource = _pedidos;
            
            limpiarComponentes();
            establecerEstadoComponentes();
        }

        public frmInfoVenta(frmPrincipal _frmPrincipal, Estado estado, VentasWS.ordenDeCompra ordenDeCompra, RRHHWS.usuario _usuario)
        {
            InitializeComponent();
            this._estado = estado;
            this._frmPrincipal = _frmPrincipal;
            this._ordenCompra = ordenDeCompra;
            this._usuario = _usuario;
            establecerEstadoComponentes();
        }

        //metodos
        public void limpiarComponentes()
        {
            txtNombreCliente.Text = "";
            txtNumDocCliente.Text = "";
            txtCantidad.Text = "";
            txtNombreProducto.Text = "";
            txtCodigoProducto.Text = "";
            txtPrecio.Text = "";
            txtCantidad.Text = "";
            txtDescuento.Text = "";
            txtCuotas.Text = "";
            txtMontoCuota.Text = "";

            dtpFechaCompra.Value = DateTime.Now;
            dtpFechaLimite.Value = DateTime.Now;
            dtpFechaEntrega.Value = DateTime.Now;

            this._ordenCompra = new VentasWS.ordenDeCompra();
            this._pedidos = new BindingList<VentasWS.pedido>();
            this._stock = new VentasWS.stock();
            dgvProductos.DataSource = this._pedidos;
        }
        private void establecerEstadoComponentes()
        {
            switch (this._estado)
            {
                case Estado.Nuevo:
                    this.btReclamo.Enabled = false;
                    this.btPago.Enabled = false;
                    this.btAnular.Enabled = false;
                    this.btEditarGuardar.Text = "Guardar";
                    this.btEditarGuardar.Enabled = true;

                    this.txtNombreCliente.Enabled = false;
                    this.txtNumDocCliente.Enabled = false;
                    this.btBuscarCliente.Enabled = true;

                    this.dtpFechaEntrega.Enabled = true;

                    this.txtCodigoProducto.Enabled = false;
                    this.txtNombreProducto.Enabled = false;
                    this.txtPrecio.Enabled = false;
                    this.txtCantidad.Enabled = true;
                    this.txtDescuento.Enabled = true;
                    this.btEliminarProducto.Enabled = true;

                    this.cbMoneda.Enabled = true;
                    this.txtTipoDeCambio.Enabled = false;

                    this.txtCuotas.Enabled = true;
                    this.dtpFechaLimite.Enabled = true;
                    this.txtMontoCuota.Enabled = true;

                    this.txtMontoTotal.Enabled = false;
                    this.txtSaldo.Enabled = false;
                    this.dtpFechaCompra.Enabled = true;
                    break;
                case Estado.Resultado:
                    this.btReclamo.Enabled = true;
                    this.btPago.Enabled = true;
                    this.btAnular.Enabled = false;
                    this.btEditarGuardar.Text = "Editar";
                    this.btEditarGuardar.Enabled = true;

                    this.txtNombreCliente.Enabled = false;
                    this.txtNumDocCliente.Enabled = false;
                    this.btBuscarCliente.Enabled = false;

                    this.dtpFechaEntrega.Enabled = false;

                    this.txtCodigoProducto.Enabled = false;
                    this.txtNombreProducto.Enabled = false;
                    this.txtPrecio.Enabled = false;
                    this.txtCantidad.Enabled = false;
                    this.txtDescuento.Enabled = false;
                    this.btEliminarProducto.Enabled = true;

                    this.cbMoneda.Enabled = true;
                    this.txtTipoDeCambio.Enabled = true;

                    this.txtCuotas.Enabled = true;
                    this.dtpFechaLimite.Enabled = false;
                    this.txtMontoCuota.Enabled = false;

                    this.txtMontoTotal.Enabled = false;
                    this.txtSaldo.Enabled = false;
                    this.dtpFechaCompra.Enabled = false;
                    break;
                case Estado.Modificar:
                    this.btReclamo.Enabled = true;
                    this.btPago.Enabled = true;
                    this.btAnular.Enabled = true;
                    this.btEditarGuardar.Text = "Guardar";
                    this.btEditarGuardar.Enabled = true;

                    this.txtNombreCliente.Enabled = false;
                    this.txtNumDocCliente.Enabled = false;
                    this.btBuscarCliente.Enabled = true;

                    this.dtpFechaEntrega.Enabled = true;

                    this.txtCodigoProducto.Enabled = false;
                    this.txtNombreProducto.Enabled = false;
                    this.txtPrecio.Enabled = false;
                    this.txtCantidad.Enabled = true;
                    this.txtDescuento.Enabled = true;
                    this.btEliminarProducto.Enabled = true;

                    this.cbMoneda.Enabled = true;
                    this.txtTipoDeCambio.Enabled = false;

                    this.txtCuotas.Enabled = true;
                    this.dtpFechaLimite.Enabled = true;
                    this.txtMontoCuota.Enabled = true;

                    this.txtMontoTotal.Enabled = false;
                    this.txtSaldo.Enabled = false;
                    this.dtpFechaCompra.Enabled = true;
                    break;
                default:
                    break;
            }
        }
        private void btRegresar_Click(object sender, EventArgs e)
        {
            if ((MessageBox.Show("¿Está seguro que desea salir sin guardar el cambio?", "Saliendo", MessageBoxButtons.YesNo) == DialogResult.Yes))
            {
                _frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmVentas(_frmPrincipal, this._usuario));
            }

        }


        private void btCancelar_Click(object sender, EventArgs e)
        {
            if ((MessageBox.Show("¿Está seguro que desea salir sin guardar el cambio?", "Saliendo", MessageBoxButtons.YesNo) == DialogResult.Yes))
            {
                _frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmVentas(_frmPrincipal, this._usuario));
            }
        }

        private void btEditarGuardar_Click(object sender, EventArgs e)
        {

            if (this._estado == Estado.Resultado)
            {
                this._estado = Estado.Modificar;
                establecerEstadoComponentes();
            }

            _terminoDePago = new VentasWS.terminoDePago();
            _terminoDePago.montoCuota = calcularMontoCuota();
            //_terminoDePago.montoCuota = double.Parse(txtMontoCuota.Text);
            _terminoDePago.numeroCuota = Int32.Parse(txtCuotas.Text);
            _terminoDePago.fechaLimite = dtpFechaLimite.Value;
            

            _ordenCompra.saldo = double.Parse(txtSaldo.Text);
            _ordenCompra.monto = double.Parse(txtMontoTotal.Text);
            _ordenCompra.direccionDeEntrega = txtDireccion.Text;
            _ordenCompra.fechaDeCompra = dtpFechaCompra.Value;
            _ordenCompra.fechaDeEntrega = dtpFechaEntrega.Value;
            _ordenCompra.terminoDePago = (VentasWS.terminoDePago)_terminoDePago;
            VentasWS.vendedor vendedor = new VentasWS.vendedor();
            vendedor.idUsuario = _usuario.idUsuario;
            vendedor.nombre = _usuario.nombre;
            _ordenCompra.vendedor = vendedor;

            if (rbDelivery.Checked)
            {
                _ordenCompra.formaDeEntrega = VentasWS.formaDeEntrega.ADestino;
            }
            else
                _ordenCompra.formaDeEntrega = VentasWS.formaDeEntrega.EnAlmacen;
            _ordenCompra.moneda = (VentasWS.moneda)cbMoneda.SelectedItem;
            _ordenCompra.activo = true;
            _ordenCompra.pagado = false;
            int resultado = daoVentasWS.insertarOrdenDeCompra(_ordenCompra, _cliente.idCliente);
            if (resultado != 0)
            {
                MessageBox.Show("Se ha registrado con éxito", "Mensaje de confirmación", MessageBoxButtons.OK, MessageBoxIcon.Information);
                _frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmVentas(_frmPrincipal, this._usuario));
            }
        }

        private void btBuscarCliente_Click_1(object sender, EventArgs e)
        {
            frmBuscarCliente _frmBuscarCliente = new frmBuscarCliente();
            if (_frmBuscarCliente.ShowDialog() == DialogResult.OK)
            {
                this._cliente = _frmBuscarCliente.ClienteSeleccionado;
                if (_cliente is GestClientesWS.personaNatural)
                {
                    txtNombreCliente.Text = ((GestClientesWS.personaNatural)_cliente).nombre + ", " + ((GestClientesWS.personaNatural)_cliente).apellido;
                    txtNumDocCliente.Text = ((GestClientesWS.personaNatural)_cliente).numDeDocumento;
                }
                else if (_cliente is GestClientesWS.empresa)
                {
                    txtNombreCliente.Text = ((GestClientesWS.empresa)_cliente).razonSocial;
                    txtNumDocCliente.Text = ((GestClientesWS.empresa)_cliente).RUC;
                }

            }
        }

        private void btAgregarProducto_Click_1(object sender, EventArgs e)
        {
            VentasWS.pedido ped = new VentasWS.pedido();
            ped.producto = new VentasWS.producto();

            ped.producto.nombre = _stock.producto.nombre;
            ped.producto.idProducto = _stock.producto.idProducto;
            ped.producto.precio = _stock.producto.precio;
            ped.cantidad = Int32.Parse(txtCantidad.Text);
            ped.descuento = double.Parse(txtDescuento.Text);
            _pedidos.Add(ped);
            calcularTotal();
            _stock = null;
            _pedido = null; 
            txtNombreProducto.Text = "";
            txtCodigoProducto.Text = "";
            txtPrecio.Text = "";
            txtCantidad.Text = "";
            txtDescuento.Text = "";
        }

        private void calcularTotal()
        {
            double saldoSinDescuento = 0;
            _ordenCompra.saldo = 0;
            foreach (VentasWS.pedido ped in _pedidos)
            {
                saldoSinDescuento += ped.producto.precio * ped.cantidad;
                _ordenCompra.saldo += (ped.producto.precio-(ped.producto.precio*ped.descuento/100))*ped.cantidad;
            }
            txtMontoTotal.Text = saldoSinDescuento.ToString("N2");
            txtSaldo.Text = _ordenCompra.saldo.ToString("N2");
        }
        private double calcularMontoCuota()
        {
            double saldo = _ordenCompra.saldo;
            int cant = Int32.Parse(txtCuotas.Text);
            double cuota = saldo / cant;
            //double cuota = ((_ordenCompra.saldo)/ (Int32.Parse(txtCuotas.Text)));
            txtMontoCuota.Text = cuota.ToString("N2");
            return cuota;
        }
        private void btEliminarProducto_Click(object sender, EventArgs e)
        {
            if (dgvProductos.CurrentRow.Index != -1)
            {
                VentasWS.pedido ped = (VentasWS.pedido)dgvProductos.CurrentRow.DataBoundItem;
                _pedidos.Remove(ped);
                calcularTotal();
            }
        }
        

        private void btBuscarProducto_Click_1(object sender, EventArgs e)
        {
            frmBuscarProducto _frmBuscarProducto = new frmBuscarProducto();
            if (_frmBuscarProducto.ShowDialog() == DialogResult.OK)
            {
                _stock = _frmBuscarProducto.StockSeleccionado;
                txtNombreProducto.Text = _stock.producto.nombre;
                txtCodigoProducto.Text = _stock.producto.idProducto.ToString();
                txtPrecio.Text = _stock.producto.precio.ToString();
            }
        }

        private void dgvProductos_CellFormatting_1(object sender, DataGridViewCellFormattingEventArgs e)
        {
            try
            {
                VentasWS.pedido pedido = (VentasWS.pedido)dgvProductos.Rows[e.RowIndex].DataBoundItem;
                dgvProductos.Rows[e.RowIndex].Cells[0].Value = pedido.producto.idProducto;
                dgvProductos.Rows[e.RowIndex].Cells[1].Value = pedido.producto.nombre;
                dgvProductos.Rows[e.RowIndex].Cells[2].Value = pedido.producto.precio;
                dgvProductos.Rows[e.RowIndex].Cells[3].Value = pedido.cantidad;
                dgvProductos.Rows[e.RowIndex].Cells[4].Value = pedido.producto.devuelto.ToString();
            }
            catch (Exception ex) { }
        }

        private void btReclamo_Click_1(object sender, EventArgs e)
        {

        }

        private void btPago_Click_1(object sender, EventArgs e)
        {

        }

        private void btAnular_Click(object sender, EventArgs e)
        {
            if ((MessageBox.Show("¿Está seguro que desea aunlar la venta?", "Saliendo", MessageBoxButtons.YesNo) == DialogResult.Yes))
            {
                _frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmVentas(_frmPrincipal, this._usuario));
            }
        }

        
    }
}
