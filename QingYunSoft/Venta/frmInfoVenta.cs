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
        private Estado estado;
        private frmPrincipal _frmPrincipal;
        private VentasWS.ordenDeCompra _venta;
        private GestClientesWS.cliente _cliente;
        private VentasWS.terminoDePago _terminoDePago;
        private double montoTotal = 0;
        public frmInfoVenta()
        {
            InitializeComponent();
        }
        public frmInfoVenta(frmPrincipal _frmPrincipal, Estado estado)
        {
            InitializeComponent();
            this.estado = estado;
            this._frmPrincipal = _frmPrincipal;
            this.montoTotal = 0;
        }

        public frmInfoVenta(frmPrincipal _frmPrincipal, Estado estado, VentasWS.ordenDeCompra ordenDeCompra)
        {
            InitializeComponent();
            this.estado = estado;
            this._frmPrincipal = _frmPrincipal;
        }
        
        private void btRegresar_Click(object sender, EventArgs e)
        {
            _frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmVentas(_frmPrincipal));
        }

        private void btReclamo_Click(object sender, EventArgs e)
        {

        }

        private void btPago_Click(object sender, EventArgs e)
        {

        }

        private void btCancelar_Click(object sender, EventArgs e)
        {
            _frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmVentas(_frmPrincipal));
        }

        private void btEditarGuardar_Click(object sender, EventArgs e)
        {
            this._venta = new VentasWS.ordenDeCompra();
            if (cbFormaDeEntrega.SelectedText == VentasWS.formaDeEntrega.EnAlmacen.ToString())
                this._venta.formaDeEntrega = VentasWS.formaDeEntrega.EnAlmacen;
            else
                this._venta.formaDeEntrega = VentasWS.formaDeEntrega.ADestino;
            this._venta.fechaDeEntrega = dtpFechaEntrega.Value;
            this._venta.direccionDeEntrega = txtDireccion.Text;

            //termino de pago
            this._terminoDePago.numeroCuota =  Int32.Parse(this.txtCuotas.Text);
            this._terminoDePago.montoCuota = double.Parse(this.txtMontoTotal.Text) / this._terminoDePago.numeroCuota;
            
            this._venta.monto = this.montoTotal;
            //moneda
            
        }

        private void btBuscarCliente_Click(object sender, EventArgs e)
        {
            frmBuscarCliente _frmBuscarCliente = new frmBuscarCliente();
            if (_frmBuscarCliente.ShowDialog() == DialogResult.OK)
            {
                this._cliente = _frmBuscarCliente.ClienteSeleccionado;
                if (_cliente is GestClientesWS.personaNatural)
                {
                    txtNombreCliente.Text = ((GestClientesWS.personaNatural)_cliente).nombre + " " + ((GestClientesWS.personaNatural)_cliente).apellido;
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
    }
}
