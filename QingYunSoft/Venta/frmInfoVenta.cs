﻿using QingYunSoft.Almacen;
using QingYunSoft.Cliente;
using QingYunSoft.VentasWS;
using System;
using System.ComponentModel;
using System.Linq;
using System.Windows.Forms;

namespace QingYunSoft
{
    public partial class frmInfoVenta : Form
    {
        //objetos
        private Estado _estado;
        private frmPrincipal _frmPrincipal;

        //dao
        private VentasWS.VentasWSClient daoVentasWS;

        //
        private GestClientesWS.cliente _cliente;
        private VentasWS.stock _stock;
        private VentasWS.pedido[] _pedidos = null;
        private VentasWS.terminoDePago _terminoDePago;
        private VentasWS.moneda _moneda;
        private VentasWS.ordenDeCompra _ordenDeCompra;
        private RRHHWS.usuario _vendedor;
        private VentasWS.almacen[] _almacenes;
        //constructores
        public frmInfoVenta()
        {
            InitializeComponent();
        }

        public frmInfoVenta(frmPrincipal _frmPrincipal, Estado estado, RRHHWS.usuario _usuario)
        {
            //nueva venta
            InitializeComponent();
            this._estado = estado;
            this._frmPrincipal = _frmPrincipal;
            this._vendedor = _usuario;
            
            dgvProductos.AutoGenerateColumns = false;
            dgvProductos.SelectionMode = DataGridViewSelectionMode.FullRowSelect;

            daoVentasWS = new VentasWS.VentasWSClient();
            cbMoneda.DataSource = daoVentasWS.listarMonedas();
            cbMoneda.DisplayMember = "abreviatura";
            cbMoneda.ValueMember = "idMoneda";

            this._almacenes = daoVentasWS.listarAlmacen();

            limpiarComponentes();
            establecerEstadoComponentes();
        }

        public frmInfoVenta(frmPrincipal _frmPrincipal, Estado estado, VentasWS.ordenDeCompra ordenDeCompra, RRHHWS.usuario _usuario)
        {
            InitializeComponent();
            this._estado = estado;
            this._frmPrincipal = _frmPrincipal;
            this._ordenDeCompra = ordenDeCompra;
            this._cliente = ordenDeCompra.cliente;
            this._vendedor = _usuario;
            establecerEstadoComponentes();

            this._almacenes = daoVentasWS.listarAlmacen();


            if (_cliente is GestClientesWS.personaNatural)
            {
                txtNombreCliente.Text = ((GestClientesWS.personaNatural)_cliente).nombre + ", " + ((GestClientesWS.personaNatural)_cliente).apellido;
                txtNumDocCliente.Text = ((GestClientesWS.personaNatural)_cliente).numDeDocumento;
            }
            else
            {
                txtNombreCliente.Text = ((GestClientesWS.empresa)_cliente).razonSocial;
                txtNumDocCliente.Text = ((GestClientesWS.empresa)_cliente).RUC;
            }

            if (ordenDeCompra.formaDeEntrega == VentasWS.formaDeEntrega.ADestino)
            {
                rbDelivery.Checked = true;
                rbTienda.Checked = false;
            }
            else
            {
                rbDelivery.Checked = false;
                rbTienda.Checked = true;
            }           

            txtDireccion.Text = ordenDeCompra.direccionDeEntrega;
            dtpFechaEntrega.Value = ordenDeCompra.fechaDeEntrega;

            dtpFechaLimite.Value = ordenDeCompra.fechaLimite;

            txtMontoTotal.Text = ordenDeCompra.monto.ToString();
            if (ordenDeCompra.pagado)
            {
                rbCancelado.Checked = true;
                rbNoCancelado.Checked = false;
            }
            else
            {
                rbCancelado.Checked = false;
                rbNoCancelado.Checked = true;
            }
            dtpFechaCompra.Value = ordenDeCompra.fechaDeCompra;

            dgvProductos.DataSource = daoVentasWS.listarPedidosPorIdOrdenDeCompra(ordenDeCompra.idOrdenDeCompra);
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

        private void btBuscarProducto_Click_1(object sender, EventArgs e)
        {
            frmBuscarProducto _frmBuscarProducto = new frmBuscarProducto(this._almacenes);
            if (_frmBuscarProducto.ShowDialog() == DialogResult.OK)
            {
                _stock = _frmBuscarProducto.StockSeleccionado;
                
                txtNombreProducto.Text = _stock.producto.nombre;
                txtStock.Text = _stock.cantidad.ToString();                
                txtPrecio.Text = _stock.producto.precio.ToString();
            }
        }

        private void btAgregarProducto_Click_1(object sender, EventArgs e)
        {
            if (txtCantidad.Text == "")
            {
                MessageBox.Show("Debe ingresar la cantidad", "Mensaje de Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            if (txtDescuento.Text == "")
            {
                txtDescuento.Text = "0.0";
            }
            if (!Int32.TryParse(txtCantidad.Text, out int a) || !double.TryParse(txtDescuento.Text, out double b)){
                MessageBox.Show("Debe ingresar un numero en cantidad y descuento", "Mensaje de Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            VentasWS.pedido pedido = new VentasWS.pedido();

            pedido.cantidad = int.Parse(txtCantidad.Text);
            pedido.producto = _stock.producto;
            pedido.descuento = double.Parse(txtDescuento.Text);

            _pedidos.Append(pedido);
            dgvProductos.DataSource = _pedidos;
            dgvProductos.Refresh();

            txtMontoTotal.Text = calcularMontoTotal().ToString();
        }

        private double calcularMontoTotal()
        {
            {
                double montoTotal = 0;
                foreach (VentasWS.pedido pedido in _pedidos)
                {
                    montoTotal += pedido.producto.precio * pedido.cantidad * (1-pedido.descuento/100);
                }
                return montoTotal;
            }
        }
        private void btEliminarProducto_Click(object sender, EventArgs e)
        {
            if (dgvProductos.CurrentRow.Index != -1)
            {
                VentasWS.pedido pedido = (VentasWS.pedido)dgvProductos.CurrentRow.DataBoundItem;
                _pedidos = _pedidos.Except(new VentasWS.pedido[] { pedido }).ToArray();

                dgvProductos.DataSource = _pedidos;
                dgvProductos.Refresh();

                txtMontoTotal.Text = calcularMontoTotal().ToString();
            }
        }

        private void btEditarGuardar_Click(object sender, EventArgs e)
        {

            if (this._estado == Estado.Resultado)
            {
                establecerEstadoComponentes();
                return;
            }
            //verificar datos
            if (this._cliente == null || (!rbCancelado.Checked && !rbNoCancelado.Checked) || (!rbDelivery.Checked && ! rbTienda.Checked) ||
                txtDireccion.Text == "" || cbMoneda.SelectedIndex == -1 || this._pedidos == null)
            {
                MessageBox.Show("Debe llenar todos los campos", "Mensaje de Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            //guardar los datos
            if (rbTienda.Checked)
            {
                _ordenDeCompra.formaDeEntrega = VentasWS.formaDeEntrega.EnAlmacen;
            }else if (rbDelivery.Checked)
            {
                _ordenDeCompra.formaDeEntrega = VentasWS.formaDeEntrega.ADestino;
            }
            _ordenDeCompra.fechaDeEntrega = dtpFechaEntrega.Value;
            _ordenDeCompra.fechaDeEntregaSpecified = true;
            _ordenDeCompra.direccionDeEntrega = txtDireccion.Text;

            _ordenDeCompra.moneda = (VentasWS.moneda)cbMoneda.SelectedItem;

            _ordenDeCompra.fechaLimite = dtpFechaLimite.Value;
            _ordenDeCompra.fechaDeCompra = dtpFechaCompra.Value;
            _ordenDeCompra.monto = double.Parse(txtMontoTotal.Text);
            if (rbCancelado.Checked)
            {
                _ordenDeCompra.pagado = true;
            }else if (rbNoCancelado.Checked)
            {
                _ordenDeCompra.pagado = false;
            }

            _ordenDeCompra.pedidos = this._pedidos;

            _ordenDeCompra.vendedor = new VentasWS.vendedor();
            _ordenDeCompra.vendedor.idUsuario = this._vendedor.idUsuario;

            int resultado = daoVentasWS.insertarOrdenDeCompra(this._ordenDeCompra, _cliente.idCliente);
            if (resultado != 0)
            {
                MessageBox.Show("Se ha registrado con éxito", "Mensaje de confirmación", MessageBoxButtons.OK, MessageBoxIcon.Information);
                this._estado = Estado.Resultado;
                establecerEstadoComponentes();
            }
            else
            {
                MessageBox.Show("Ha ocurrido un error al momento de insertar la orden de compra", "Mensaje de Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }

        private void btReclamo_Click_1(object sender, EventArgs e)
        {

        }

        private void btAnular_Click(object sender, EventArgs e)
        {
            if ((MessageBox.Show("¿Está seguro que desea aunlar la venta?", "Saliendo", MessageBoxButtons.YesNo) == DialogResult.Yes))
            {
                _frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmVentas(_frmPrincipal, this._vendedor));
            }
        }
        private void btRegresar_Click(object sender, EventArgs e)
        {
            if ((MessageBox.Show("¿Está seguro que desea salir sin guardar el cambio?", "Saliendo", MessageBoxButtons.YesNo) == DialogResult.Yes))
            {
                _frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmVentas(_frmPrincipal, this._vendedor));
            }

        }
        private void btCancelar_Click(object sender, EventArgs e)
        {
            if ((MessageBox.Show("¿Esta seguro que desea borrar los datos ingresado?", "Saliendo", MessageBoxButtons.YesNo) == DialogResult.Yes))
            {
                limpiarComponentes();
                this._estado = Estado.Nuevo;
                establecerEstadoComponentes();
            }
        }
        private void cbMoneda_SelectedIndexChanged(object sender, EventArgs e)
        {
            VentasWS.moneda moneda = (VentasWS.moneda)cbMoneda.SelectedItem;
            txtTipoDeCambio.Text = moneda.cambios[0].cambio.ToString();
        }
        
        private void establecerEstadoComponentes()
        {
            switch (this._estado)
            {
                case Estado.Nuevo:
                    btEditarGuardar.Text = "Guardar";
                    btEditarGuardar.Enabled = true;
                    btAnular.Enabled = false;
                    btReclamo.Enabled = false;

                    txtNombreCliente.Enabled = false;
                    txtNumDocCliente.Enabled = false;
                    btBuscarCliente.Enabled = true;

                    rbDelivery.Enabled = true;
                    rbTienda.Enabled = true;
                    dtpFechaEntrega.Enabled = true;
                    txtDireccion.Enabled = true;

                    cbMoneda.Enabled = true;
                    txtTipoDeCambio.Enabled = false;
                    
                    dtpFechaLimite.Enabled = true;

                    txtMontoTotal.Enabled = false;
                    rbCancelado.Enabled = true;
                    rbNoCancelado.Enabled = true;
                    dtpFechaCompra.Enabled = false;

                    txtNombreProducto.Enabled = false;
                    txtStock.Enabled = false;
                    txtPrecio.Enabled = false;
                    txtCantidad.Enabled = true;
                    txtDescuento.Enabled = true;
                    btBuscarProducto.Enabled = true;
                    btEliminarProducto.Enabled = true;
                    btAgregarProducto.Enabled = true;

                    break;
                case Estado.Resultado:
                    btEditarGuardar.Text = "Guardar";
                    btEditarGuardar.Enabled = true;
                    btAnular.Enabled = true;
                    btReclamo.Enabled = true;

                    txtNombreCliente.Enabled = false;
                    txtNumDocCliente.Enabled = false;
                    btBuscarCliente.Enabled = false;

                    rbDelivery.Enabled = false;
                    rbTienda.Enabled = false;
                    dtpFechaEntrega.Enabled = false;
                    txtDireccion.Enabled = false;

                    cbMoneda.Enabled = false;
                    txtTipoDeCambio.Enabled = false;

                    dtpFechaLimite.Enabled = false;

                    txtMontoTotal.Enabled = false;
                    rbCancelado.Enabled = false;
                    rbNoCancelado.Enabled = false;
                    dtpFechaCompra.Enabled = false;

                    txtNombreProducto.Enabled = false;
                    txtStock.Enabled = false;
                    txtPrecio.Enabled = false;
                    txtCantidad.Enabled = false;
                    txtDescuento.Enabled = false;
                    btBuscarProducto.Enabled = false;
                    btEliminarProducto.Enabled = false;
                    btAgregarProducto.Enabled = false;
                    break;
                default:
                    break;
            }
        }
        private void dgvProductos_CellFormatting_1(object sender, DataGridViewCellFormattingEventArgs e)
        {
            VentasWS.pedido pedido = (VentasWS.pedido)dgvProductos.Rows[e.RowIndex].DataBoundItem;
            dgvProductos.Rows[e.RowIndex].Cells[0].Value = pedido.producto.idProducto;
            dgvProductos.Rows[e.RowIndex].Cells[1].Value = pedido.producto.nombre;
            dgvProductos.Rows[e.RowIndex].Cells[2].Value = pedido.cantidad;
            dgvProductos.Rows[e.RowIndex].Cells[3].Value = pedido.cantidad*pedido.producto.precio*(1 - pedido.descuento/100);
        }
        
        public void limpiarComponentes()
        {
            txtNombreCliente.Text = "";
            txtNumDocCliente.Text = "";

            rbDelivery.Checked = false;
            rbTienda.Checked = false;
            txtDireccion.Text = "";
            
            txtNombreProducto.Text = "";
            txtPrecio.Text = "";
            txtCantidad.Text = "";
            txtDescuento.Text = "";
            txtStock.Text = "";

            cbMoneda.SelectedIndex = -1;
            
            dtpFechaCompra.Value = DateTime.Now;
            dtpFechaLimite.Value = DateTime.Now;
            dtpFechaEntrega.Value = DateTime.Now;

            this._cliente = null;
            this._stock = null;
            this._pedidos = null;
            this._terminoDePago = null;
            this._moneda = null;
            this._ordenDeCompra = null;

            
        }
    }
}
