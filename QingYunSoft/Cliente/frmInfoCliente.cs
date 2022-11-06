using QingYunSoft.GestClientesWS;
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

namespace QingYunSoft.Cliente
{
    public partial class frmInfoCliente : Form
    {
        //objetos
        private frmPrincipal _frmPrincipal;
        private Estado estado;
        private GestClientesWS.cliente _cliente;
        //dao
        private GestClientesWS.GestClientesWSClient daoCliente = new GestClientesWS.GestClientesWSClient();
        //constructores
        public frmInfoCliente()
        {
            InitializeComponent();
            pnlEmpresa.Visible = false;
            pnlPersonaNatural.Visible = false;
            cbTipoDeDocumento.DataSource = Enum.GetValues(typeof(GestClientesWS.tipoDeDocumento));
            cbCategoria.DataSource = Enum.GetValues(typeof(GestClientesWS.categoria));
            cbSexo.DataSource = Enum.GetValues(typeof(GestClientesWS.sexo));
            limpiar();
        }

        public frmInfoCliente(frmPrincipal _frmPrincipal, Estado estado)//nuevo
        {
            InitializeComponent();
            this._frmPrincipal = _frmPrincipal;
            this.estado = estado;
            establecerEstadoComponentes();
            pnlEmpresa.Visible = false;
            pnlPersonaNatural.Visible = false;
            cbTipoDeDocumento.DataSource = Enum.GetValues(typeof(GestClientesWS.tipoDeDocumento));
            cbCategoria.DataSource = Enum.GetValues(typeof(GestClientesWS.categoria));
            cbSexo.DataSource = Enum.GetValues(typeof(GestClientesWS.sexo));
            limpiar();
        }
        public frmInfoCliente(frmPrincipal _frmPrincipal, Estado estado, GestClientesWS.cliente cliente)//resultado
        {
            InitializeComponent();
            this._frmPrincipal = _frmPrincipal;
            this.estado = estado;
            this._cliente = cliente;
            establecerEstadoComponentes();
            pnlEmpresa.Visible = false;
            pnlPersonaNatural.Visible = false;
            cbTipoDeDocumento.DataSource = Enum.GetValues(typeof(GestClientesWS.tipoDeDocumento));
            cbCategoria.DataSource = Enum.GetValues(typeof(GestClientesWS.categoria));
            cbSexo.DataSource = Enum.GetValues(typeof(GestClientesWS.sexo));

            txtID.Text = cliente.idCliente.ToString();
            cbCategoria.SelectedIndex = (int)cliente.categoria;
            if (cliente is GestClientesWS.empresa)
            {
                pnlEmpresa.Visible = true;
                pnlPersonaNatural.Visible = false;
                cbTipoCliente.SelectedIndex = 0;

                txtRuc.Text = ((GestClientesWS.empresa)cliente).RUC;
                txtRazonSocial.Text = ((GestClientesWS.empresa)cliente).razonSocial;
                txtDireccion.Text = ((GestClientesWS.empresa)cliente).direccion;
            }
            else
            {
                pnlEmpresa.Visible = false;
                pnlPersonaNatural.Visible = true;
                cbTipoCliente.SelectedIndex = 1;
                
                cbSexo.SelectedIndex = (int)((GestClientesWS.personaNatural)cliente).sexo;
                cbTipoDeDocumento.SelectedIndex = (int)((GestClientesWS.personaNatural)cliente).tipoDeDocumento;
                txtNumDocumento.Text = ((GestClientesWS.personaNatural)cliente).numDeDocumento;
                txtNombre.Text = ((GestClientesWS.personaNatural)cliente).nombre;
                txtApellido.Text = ((GestClientesWS.personaNatural)cliente).apellido;
                txtTelefono.Text = ((GestClientesWS.personaNatural)cliente).telefono;
                TxtCorreo.Text = ((GestClientesWS.personaNatural)cliente).email;
                txtDirecionP.Text = ((GestClientesWS.personaNatural)cliente).direccion;
                dtpFecha.Value = ((GestClientesWS.personaNatural)cliente).fechaDeNacimiento;
            }
        }

        public void establecerEstadoComponentes()
        {
            switch (estado)
            {

                case Estado.Nuevo:
                    txtID.Enabled = false;
                    cbCategoria.Enabled = true;
                    cbTipoCliente.Enabled = true;
                    pnlEmpresa.Enabled = true;
                    pnlPersonaNatural.Enabled = true;

                    btAnular.Enabled = false;
                    btEditarGuardar.Enabled = true;
                    btRegresar.Enabled = true;
                    btCancelar.Enabled = true;
                    btEditarGuardar.Text = "Guardar";
                    break;
                case Estado.Modificar:
                    txtID.Enabled = false;
                    cbCategoria.Enabled = true;
                    cbTipoCliente.Enabled = true;
                    pnlEmpresa.Enabled = true;
                    pnlPersonaNatural.Enabled = true;

                    btAnular.Enabled = true;
                    btEditarGuardar.Enabled = true;
                    btRegresar.Enabled = true;
                    btCancelar.Enabled = true;
                    btEditarGuardar.Text = "Guardar";
                    break;
                case Estado.Resultado:
                    //disable all txtbox
                    txtID.Enabled = false;
                    cbCategoria.Enabled = false;
                    cbTipoCliente.Enabled = false;
                    pnlEmpresa.Enabled = false;
                    pnlPersonaNatural.Enabled = false;

                    btAnular.Enabled = true;
                    btEditarGuardar.Enabled = true;
                    btRegresar.Enabled = true;
                    btCancelar.Enabled = false;
                    btEditarGuardar.Text = "Editar";
                    break;

            }
        }

        public void mostrarFormularioEnPnlTipoCliente(Form _frm)
        {
            pnlEmpresa.Controls.Clear();
            _frm.TopLevel = false;
            _frm.FormBorderStyle = FormBorderStyle.None;
            _frm.Dock = DockStyle.Fill;
            pnlEmpresa.Controls.Add(_frm);
            _frm.Show();
        }

        private void cbTipoCliente_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbTipoCliente.Text == "Persona Natural")
            {
                pnlEmpresa.Visible = false;
                pnlPersonaNatural.Visible = true;
            }
            else if (cbTipoCliente.Text == "Empresa")
            {
                pnlEmpresa.Visible = true;
                pnlPersonaNatural.Visible = false;
            }
        }

        private void btEditarGuardar_Click(object sender, EventArgs e)
        {
            int resultado = 0;
            if (this.estado == Estado.Resultado)
            {
                this.estado = Estado.Modificar;
                btEditarGuardar.Text = "Guardar";
                establecerEstadoComponentes();
            }
            else
            {
                if (cbTipoCliente.Text == "Persona Natural")
                {
                    this._cliente = new GestClientesWS.personaNatural();
                    ((GestClientesWS.personaNatural)this._cliente).tipoDeDocumento = (GestClientesWS.tipoDeDocumento)cbTipoDeDocumento.SelectedItem;
                    ((GestClientesWS.personaNatural)this._cliente).numDeDocumento = txtNumDocumento.Text;
                    ((GestClientesWS.personaNatural)this._cliente).nombre = txtNombre.Text;
                    ((GestClientesWS.personaNatural)this._cliente).apellido = txtApellido.Text;
                    ((GestClientesWS.personaNatural)this._cliente).fechaDeNacimiento = dtpFecha.Value;
                    ((GestClientesWS.personaNatural)this._cliente).direccion = txtDirecionP.Text;
                    ((GestClientesWS.personaNatural)this._cliente).telefono = txtTelefono.Text;
                    ((GestClientesWS.personaNatural)this._cliente).email = TxtCorreo.Text;
                    ((GestClientesWS.personaNatural)this._cliente).sexo = (GestClientesWS.sexo)cbSexo.SelectedItem;
                    this._cliente.categoria = (GestClientesWS.categoria)cbCategoria.SelectedItem;
                    this._cliente.activoSpecified = true;
                    this._cliente.activo = true;
                    this._cliente.categoriaSpecified = true;
                    ((GestClientesWS.personaNatural)this._cliente).sexoSpecified = true;
                    ((GestClientesWS.personaNatural)this._cliente).categoriaSpecified = true;
                    ((GestClientesWS.personaNatural)this._cliente).tipoDeDocumentoSpecified = true;
                    ((GestClientesWS.personaNatural)this._cliente).fechaDeNacimientoSpecified = true;
                    if (txtID.Text != "")
                    {
                        this._cliente.idCliente = Int32.Parse(txtID.Text);
                    }

                    if (this.estado == Estado.Nuevo)
                    {
                        resultado = daoCliente.insertarPersonaNatural((GestClientesWS.personaNatural)this._cliente);
                        if (resultado != 0)
                        {
                            MessageBox.Show("Se ha insertado correctamente");
                            txtID.Text = resultado.ToString();
                            this._cliente.idCliente = resultado;
                            this.estado = Estado.Resultado;
                            establecerEstadoComponentes();
                        }
                        else
                        {
                            MessageBox.Show("Ha ocurrido un error al momento de eliminar el cliente", "Mensaje de Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }
                    else
                    {
                        resultado = daoCliente.modificarPersonaNatural((GestClientesWS.personaNatural)this._cliente);
                        if (resultado != 0)
                        {
                            MessageBox.Show("Se ha modificado correctamente");
                            txtID.Text = resultado.ToString();
                            this._cliente.idCliente = resultado;
                            this.estado = Estado.Resultado;
                            establecerEstadoComponentes();
                        }
                        else
                        {
                            MessageBox.Show("Ha ocurrido un error al momento de eliminar el cliente", "Mensaje de Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }
                }
                else if (cbTipoCliente.Text == "Empresa")
                {
                    this._cliente = new GestClientesWS.empresa();
                    ((GestClientesWS.empresa)this._cliente).RUC = txtRuc.Text;
                    ((GestClientesWS.empresa)this._cliente).razonSocial = txtRazonSocial.Text;
                    ((GestClientesWS.empresa)this._cliente).direccion = txtDireccion.Text;
                    this._cliente.categoria = (GestClientesWS.categoria)cbCategoria.SelectedItem;
                    this._cliente.categoriaSpecified = true;
                    this._cliente.activo = true;
                    ((GestClientesWS.empresa)this._cliente).activoSpecified = true;
                    if (txtID.Text != "")
                    {
                        this._cliente.idCliente = Int32.Parse(txtID.Text);
                    }

                    if (this.estado == Estado.Nuevo)
                    {
                        resultado = daoCliente.insertarEmpresa((GestClientesWS.empresa)this._cliente);
                        if (resultado != 0)
                        {
                            MessageBox.Show("Se ha insertado correctamente");
                            txtID.Text = resultado.ToString();
                            this._cliente.idCliente = resultado;
                            this.estado = Estado.Resultado;
                            establecerEstadoComponentes();
                        }
                        else
                        {
                            MessageBox.Show("Ha ocurrido un error al momento de eliminar el cliente", "Mensaje de Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }
                    else
                    {
                        resultado = daoCliente.modificarEmpresa((GestClientesWS.empresa)this._cliente);
                        if (resultado != 0)
                        {
                            MessageBox.Show("Se ha modificado correctamente");
                            txtID.Text = resultado.ToString();
                            this._cliente.idCliente = resultado;
                            this.estado = Estado.Resultado;
                            establecerEstadoComponentes();
                        }
                        else
                        {
                            MessageBox.Show("Ha ocurrido un error al momento de eliminar el cliente", "Mensaje de Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }
                }
            }

        }

        private void btRegresar_Click(object sender, EventArgs e)
        {
            _frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmClientes(_frmPrincipal));
        }

        private void btCancelar_Click(object sender, EventArgs e)
        {
            this.estado = Estado.Nuevo;
            establecerEstadoComponentes();
            limpiar();
        }
        
        private void limpiar()
        {
            this.txtID.Text = "";
            this.txtNombre.Text = "";
            this.txtRazonSocial.Text = "";
            this.txtRuc.Text = "";
            this.txtApellido.Text = "";
            this.txtDirecionP.Text = "";
            this.txtDireccion.Text = "";
            this.txtTelefono.Text = "";
            this.TxtCorreo.Text = "";
            this.cbCategoria.SelectedIndex = -1;
            this.cbSexo.SelectedIndex = -1;
            this.cbTipoCliente.SelectedIndex = -1;
            this.cbTipoDeDocumento.SelectedIndex = -1;
            this.dtpFecha.Value = DateTime.Now;
            this.txtID.Focus();
            this._cliente = null;
        }
    

        private void btAnular_Click(object sender, EventArgs e)
        {
            

            if (MessageBox.Show("¿Esta seguro que desea eliminar este cliente?", "Mensaje de confirmación", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.Yes)
            {

                int result = 0;
                result = daoCliente.eliminarCliente(this._cliente.idCliente);
                if (result == 1)
                    MessageBox.Show("Se ha eliminado exitosamente el cliente", "Mensaje de Confirmación", MessageBoxButtons.OK, MessageBoxIcon.Information);
                else
                    MessageBox.Show("Ha ocurrido un error al momento de eliminar el cliente", "Mensaje de Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            _frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmClientes(_frmPrincipal));

        }
    }
}
