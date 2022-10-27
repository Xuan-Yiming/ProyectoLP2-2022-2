using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QingYunSoft.Cliente
{
    public partial class frmInfoCliente : Form
    {
        public frmInfoCliente()
        {
            InitializeComponent();
        }
        private frmPrincipal _frmPrincipal;
        private Estado estado;
        private GestClientesWS.cliente _cliente;

        private frmPersonaNatural _frmInfoClientePersona = new frmPersonaNatural();
        private frmEmpresa _frmInfoClienteEmpresa = new frmEmpresa();
        public frmInfoCliente(frmPrincipal _frmPrincipal, Estado estado)
        {
            InitializeComponent();
            this._frmPrincipal = _frmPrincipal;
            this.estado = estado;
            establecerEstadoComponentes();
        }
        public frmInfoCliente(frmPrincipal _frmPrincipal, Estado estado, GestClientesWS.cliente cliente)
        {
            InitializeComponent();
            this._frmPrincipal = _frmPrincipal;
            this.estado = estado;
            this._cliente = cliente;
            establecerEstadoComponentes();

            txtID.Text = cliente.idCliente.ToString();
            txtCategoria.Text = cliente.categoria;
            if(cliente is GestClientesWS.empresa)
            {
                cbTipoCliente.SelectedIndex = 0;
                _frmInfoClienteEmpresa.Ruc = ((GestClientesWS.empresa)cliente).RUC;
                _frmInfoClienteEmpresa.RazonSocial = ((GestClientesWS.empresa)cliente).razonSocial;
                _frmInfoClienteEmpresa.Direccion = ((GestClientesWS.empresa)cliente).direccion;
                mostrarFormularioEnPnlTipoCliente(_frmInfoClienteEmpresa);
            }
            else
            {
                cbTipoCliente.SelectedIndex = 1;
                _frmInfoClientePersona.TipoDocumento = ((GestClientesWS.personaNatural)cliente).tipoDeDocumento;
                _frmInfoClientePersona.NumeroDocumento = ((GestClientesWS.personaNatural)cliente).numDeDocumento;
                _frmInfoClientePersona.Nombres = ((GestClientesWS.personaNatural)cliente).nombre;
                _frmInfoClientePersona.Apellidos = ((GestClientesWS.personaNatural)cliente).apellido;
                _frmInfoClientePersona.Telefono = ((GestClientesWS.personaNatural)cliente).telefono;
                _frmInfoClientePersona.Correo = ((GestClientesWS.personaNatural)cliente).email;
                _frmInfoClientePersona.Direccion = ((GestClientesWS.personaNatural)cliente).direccion;
                _frmInfoClientePersona.FechaNacimiento = ((GestClientesWS.personaNatural)cliente).fechaDeNacimiento;
                mostrarFormularioEnPnlTipoCliente(_frmInfoClientePersona);
            }
        }

        public void establecerEstadoComponentes()
        {
            switch (estado)
            {

                case Estado.Nuevo:
                    txtID.Enabled = false;
                    txtCategoria.Enabled = true;
                    cbTipoCliente.Enabled = true;
                    pnlTipoCliente.Enabled = true;

                    btAnular.Enabled = false;
                    btEditarGuardar.Enabled = true;
                    btRegresar.Enabled = true;
                    btCancelar.Enabled = true;
                    btEditarGuardar.Text = "Guardar";
                    break;
                case Estado.Modificar:
                    txtID.Enabled = false;
                    txtCategoria.Enabled = true;
                    cbTipoCliente.Enabled = true;
                    pnlTipoCliente.Enabled = true;

                    btAnular.Enabled = true;
                    btEditarGuardar.Enabled = true;
                    btRegresar.Enabled = true;
                    btCancelar.Enabled = true;
                    btEditarGuardar.Text = "Guardar";
                    break;
                case Estado.Resultado:
                    //disable all txtbox
                    txtID.Enabled = false;
                    txtCategoria.Enabled = false;
                    cbTipoCliente.Enabled = false;
                    pnlTipoCliente.Enabled = false;

                    btAnular.Enabled = true;
                    btEditarGuardar.Enabled = false;
                    btRegresar.Enabled = true;
                    btCancelar.Enabled = false;
                    btEditarGuardar.Text = "Editar";
                    break;

            }
        }

        public void mostrarFormularioEnPnlTipoCliente(Form _frm)
        {
            pnlTipoCliente.Controls.Clear();
            _frm.TopLevel = false;
            _frm.FormBorderStyle = FormBorderStyle.None;
            _frm.Dock = DockStyle.Fill;
            pnlTipoCliente.Controls.Add(_frm);
            _frm.Show();
        }

        private void cbTipoCliente_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbTipoCliente.Text == "Persona Natural")
            {
                mostrarFormularioEnPnlTipoCliente(_frmInfoClientePersona);
            }
            else if (cbTipoCliente.Text == "Empresa")
            {
                mostrarFormularioEnPnlTipoCliente(_frmInfoClienteEmpresa);
            }
        }

        private void btEditarGuardar_Click(object sender, EventArgs e)
        {
            if (this.estado == Estado.Resultado)
            {
                this.estado = Estado.Modificar;
                btEditarGuardar.Text = "Guardar";
            }
            if (cbTipoCliente.Text == "Persona Natural")
            {

                this._cliente = new GestClientesWS.personaNatural();
                ((GestClientesWS.personaNatural)this._cliente).tipoDeDocumento = _frmInfoClientePersona.TipoDocumento;
                ((GestClientesWS.personaNatural)this._cliente).numDeDocumento = _frmInfoClientePersona.NumeroDocumento;
                ((GestClientesWS.personaNatural)this._cliente).nombre = _frmInfoClientePersona.Nombres;
                ((GestClientesWS.personaNatural)this._cliente).apellido = _frmInfoClientePersona.Apellidos;
                ((GestClientesWS.personaNatural)this._cliente).fechaDeNacimiento = _frmInfoClientePersona.FechaNacimiento;
                ((GestClientesWS.personaNatural)this._cliente).direccion = _frmInfoClientePersona.Direccion;
                ((GestClientesWS.personaNatural)this._cliente).telefono = _frmInfoClientePersona.Telefono;
                ((GestClientesWS.personaNatural)this._cliente).email = _frmInfoClientePersona.Correo;
                this._cliente.categoria = txtCategoria.Text;
            }
            else if (cbTipoCliente.Text == "Empresa")
            {
                this._cliente = new GestClientesWS.empresa();
                ((GestClientesWS.empresa)this._cliente).RUC = _frmInfoClienteEmpresa.Ruc;
                ((GestClientesWS.empresa)this._cliente).razonSocial = _frmInfoClienteEmpresa.RazonSocial;
                ((GestClientesWS.empresa)this._cliente).direccion = _frmInfoClienteEmpresa.Direccion;
                this._cliente.categoria = txtCategoria.Text;

            }
        }

        private void btRegresar_Click(object sender, EventArgs e)
        {
            _frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmClientes(_frmPrincipal));
        }

        private void btCancelar_Click(object sender, EventArgs e)
        {
            _frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmClientes(_frmPrincipal));
        }
    }
}
