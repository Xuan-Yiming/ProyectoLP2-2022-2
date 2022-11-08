using QingYunSoft.Cliente;
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
        //private VentasWS.terminoDePago _terminoDePago;
        //private VentasWS.pedido _pedidos;
        private RRHHWS.usuario _usuario;

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
            establecerEstadoComponentes();
        }

        //public frmInfoVenta(frmPrincipal _frmPrincipal, Estado estado, VentasWS.ordenDeCompra ordenDeCompra, RRHHWS.usuario _usuario)
        //{
        //    InitializeComponent();
        //    this._estado = estado;
        //    this._frmPrincipal = _frmPrincipal;
        //    this._venta = ordenDeCompra;
        //    this._usuario = _usuario;
        //    establecerEstadoComponentes();
        //}
        
        //metodos
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

                    this.cbFormaDeEntrega.Enabled = true;
                    this.dtpFechaEntrega.Enabled = true;
                    this.txtDireccion.Enabled = false;

                    this.txtCodigoProducto.Enabled = false;
                    this.txtNombreProducto.Enabled = false;
                    this.txtPrecio.Enabled = false;
                    this.txtCantidad.Enabled = true;
                    this.txtDescuento.Enabled = true;
                    this.btEliminar.Enabled = true;

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

                    this.cbFormaDeEntrega.Enabled = false;
                    this.dtpFechaEntrega.Enabled = false;
                    this.txtDireccion.Enabled = false;

                    this.txtCodigoProducto.Enabled = false;
                    this.txtNombreProducto.Enabled = false;
                    this.txtPrecio.Enabled = false;
                    this.txtCantidad.Enabled = false;
                    this.txtDescuento.Enabled = false;
                    this.btEliminar.Enabled = true;

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

                    this.cbFormaDeEntrega.Enabled = true;
                    this.dtpFechaEntrega.Enabled = true;
                    this.txtDireccion.Enabled = false;

                    this.txtCodigoProducto.Enabled = false;
                    this.txtNombreProducto.Enabled = false;
                    this.txtPrecio.Enabled = false;
                    this.txtCantidad.Enabled = true;
                    this.txtDescuento.Enabled = true;
                    this.btEliminar.Enabled = true;

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
                _frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmVentas(_frmPrincipal,this._usuario));
            }
            
        }


        private void btCancelar_Click(object sender, EventArgs e)
        {
            if ((MessageBox.Show("¿Está seguro que desea salir sin guardar el cambio?", "Saliendo", MessageBoxButtons.YesNo) == DialogResult.Yes))
            {
                _frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmVentas(_frmPrincipal,this._usuario));
            }
        }

        private void btEditarGuardar_Click(object sender, EventArgs e)
        {
            if(this._estado == Estado.Resultado)
            {
                this._estado = Estado.Modificar;
                establecerEstadoComponentes();
            }
            else
            {
                //si es venta nueva
                //if(this._venta == null)
                //{
                //    this._venta = new VentasWS.ordenDeCompra();
                //}
                //this._venta.idCliente = this._cliente.idCliente;
                //this._venta.idVendedor = this._usuario.idUsuario;
                //this._venta.moneda = (VentasWS.moneda)this.cbMoneda.SelectedItem;
                //this._venta.direccionDeEntrega = this.txtDireccion.Text;
                //this._venta.formaDeEntrega = (VentasWS.formaDeEntrega)this.cbFormaDeEntrega.SelectedItem;
                //this._venta.fechaDeEntrega = this.dtpFechaEntrega.Value;
                //this._venta.fechaDeCompra = this.dtpFechaCompra.Value;
                //this._venta.monto = Double.Parse(txtMontoTotal.Text);

                //this._venta.moneda = (VentasWS.moneda)this.cbMoneda.SelectedItem;

                //this._terminoDePago.numeroCuota = Int32.Parse(this.txtCuotas.Text);
                //this._terminoDePago.montoCuota = double.Parse(this.txtMontoCuota.Text);
                //this._terminoDePago.fechaLimite = this.dtpFechaLimite.Value;
            }
        }

        private void btBuscarCliente_Click(object sender, EventArgs e)
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

        private void btAgregarProducto_Click(object sender, EventArgs e)
        {

        }

        private void btEliminar_Click(object sender, EventArgs e)
        {

        }        
        private void btReclamo_Click(object sender, EventArgs e)
        {

        }

        private void btPago_Click(object sender, EventArgs e)
        {

        }

    }
}
