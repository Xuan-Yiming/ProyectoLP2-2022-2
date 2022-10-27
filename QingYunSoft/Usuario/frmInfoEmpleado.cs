using QingYunSoft.Cliente;
using QingYunSoft.RRHHWS;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QingYunSoft.Usuario
{
    public partial class frmInfoEmpleado : Form
    {
        private frmPrincipal _frmPrincipal;
        
        private Estado estado;
        //El objeto empleado que manejaremos a lo largo del uso del formulario
        private RRHHWS.usuario _usuario;
        //Los DAOs de conexión
        private RRHHWS.RRHHWSClient daoRRHH; 
        public frmInfoEmpleado()
        {
            InitializeComponent();

        }
        public void establecerEstadoComponentes()
        {
            switch (estado)
            {
                
                case Estado.Nuevo:
                    txtID.Enabled = false;
                    txtUsername.Enabled = true;
                    cbTipoUsuario.Enabled = true;
                    txtContrasena.Enabled = true;
                    txtVariableTipo.Enabled = true;
                    dtpFechaIngreso.Enabled = false;

                    cbTipoDocumento.Enabled = true;
                    txtNumeroDocumento.Enabled = true;
                    txtNombre.Enabled = true;
                    txtApellido.Enabled = true;
                    txtTelefono.Enabled = true;
                    txtCorreo.Enabled = true;
                    txtDireccion.Enabled = true;
                    dtpFechaNacimiento.Enabled = true;
                    
                    txtID.Enabled = false;
                    btAnular.Enabled = false;
                    btEditarGuardar.Enabled = true;
                    btRegresar.Enabled = true;
                    btCancelar.Enabled = true;
                    btEditarGuardar.Text = "Guardar";
                    
                    break;
                case Estado.Modificar:
                    txtID.Enabled = false;
                    txtUsername.Enabled = true;
                    cbTipoUsuario.Enabled = true;
                    txtContrasena.Enabled = true;
                    txtVariableTipo.Enabled = true;
                    dtpFechaIngreso.Enabled = false;

                    cbTipoDocumento.Enabled = true;
                    txtNumeroDocumento.Enabled = true;
                    txtNombre.Enabled = true;
                    txtApellido.Enabled = true;
                    txtTelefono.Enabled = true;
                    txtCorreo.Enabled = true;
                    txtDireccion.Enabled = true;
                    dtpFechaNacimiento.Enabled = true;
                    
                    txtID.Enabled = true;
                    btAnular.Enabled = true;
                    btEditarGuardar.Enabled = true;                    
                    btRegresar.Enabled = true;
                    btCancelar.Enabled = true;
                    btEditarGuardar.Text = "Guardar";
                    break;
                case Estado.Resultado:
                    //disable all txtbox
                    txtID.Enabled = false;
                    txtUsername.Enabled = false;
                    cbTipoUsuario.Enabled = false;
                    txtContrasena.Enabled = false;
                    txtVariableTipo.Enabled = false;
                    dtpFechaIngreso.Enabled = false;
                    
                    cbTipoDocumento.Enabled = false;
                    txtNumeroDocumento.Enabled = false;
                    txtNombre.Enabled = false;
                    txtApellido.Enabled = false;
                    txtTelefono.Enabled = false;
                    txtCorreo.Enabled = false;
                    txtDireccion.Enabled = false;
                    dtpFechaNacimiento.Enabled = false;

                    btAnular.Enabled = true;
                    btEditarGuardar.Enabled = false;
                    btRegresar.Enabled = true;
                    btCancelar.Enabled = false;
                    btEditarGuardar.Text = "Editar";
                    break;

            }
        }
        public frmInfoEmpleado(frmPrincipal _frmPrincipal, Estado estado)
        {
            InitializeComponent();
            this._frmPrincipal = _frmPrincipal;
            this.estado = estado;

            if (this.estado == Estado.Nuevo)
            {
                establecerEstadoComponentes();
            }

            cbTipoDocumento.Items.Add(RRHHWS.tipoDeDocumento.DNI);
            cbTipoDocumento.Items.Add(RRHHWS.tipoDeDocumento.CE);
            cbTipoDocumento.Items.Add(RRHHWS.tipoDeDocumento.Pasaporte);
            cbTipoDocumento.Items.Add(RRHHWS.tipoDeDocumento.PNAC);
            daoRRHH = new RRHHWS.RRHHWSClient();
        }
        public frmInfoEmpleado(frmPrincipal _frmPrincipal, Estado estado, RRHHWS.usuario usuario)
        {
            InitializeComponent();
            this._frmPrincipal = _frmPrincipal;
            this.estado = estado;
            cbTipoDocumento.Items.Add(RRHHWS.tipoDeDocumento.DNI);
            cbTipoDocumento.Items.Add(RRHHWS.tipoDeDocumento.CE);
            cbTipoDocumento.Items.Add(RRHHWS.tipoDeDocumento.Pasaporte);
            cbTipoDocumento.Items.Add(RRHHWS.tipoDeDocumento.PNAC);
            daoRRHH = new RRHHWS.RRHHWSClient();
            if (this.estado == Estado.Nuevo)
            {
                establecerEstadoComponentes();
            }
            else if (this.estado == Estado.Resultado)
            {
                txtID.Text = usuario.idUsuario.ToString();
                txtUsername.Text = usuario.username;
                txtContrasena.Text = usuario.password;
                if (usuario is RRHHWS.supervisorDeAlmacen)
                {
                    cbTipoUsuario.SelectedIndex = 2;
                    lblVariableTipo.Text = "";
                    txtVariableTipo.Enabled = false;
                }
                else if (usuario is RRHHWS.vendedor)
                {
                    cbTipoUsuario.SelectedIndex = 1;
                    lblVariableTipo.Text = "Cantidad de ventas";
                    txtVariableTipo.Text = ((RRHHWS.vendedor)usuario).cantidadVentas.ToString();
                }
                else if (usuario is RRHHWS.administrador)
                {
                    cbTipoUsuario.SelectedIndex = 0;
                    lblVariableTipo.Text = "Area";
                    txtVariableTipo.Text = ((RRHHWS.administrador)usuario).area;
                }
                dtpFechaIngreso.Value = usuario.fechaIngreso;
                cbTipoDocumento.SelectedValue = usuario.tipoDeDocumento.ToString();
                txtNumeroDocumento.Text = usuario.numDeDocumento;
                txtNombre.Text = usuario.nombre;
                txtApellido.Text = usuario.apellido;
                txtTelefono.Text = usuario.telefono;
                txtCorreo.Text = usuario.email;
                txtDireccion.Text = usuario.direccion;
                dtpFechaNacimiento.Value = usuario.fechaDeNacimiento;
                
                this._usuario = usuario;
            }

        }

        private void btEditarGuardar_Click(object sender, EventArgs e)
        {
            daoRRHH = new RRHHWS.RRHHWSClient();
            if (this.estado == Estado.Resultado)
            {
                this.estado = Estado.Modificar;
                btEditarGuardar.Text = "Guardar";
                establecerEstadoComponentes();
            }
            else
            {
                if (txtNumeroDocumento.Text.Trim().Length < 1)
                {
                    MessageBox.Show("El documento ingresado es inválido", "Mensaje de advertencia", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
                try
                {
                    Int32.Parse(txtNumeroDocumento.Text);
                }
                catch (Exception ex)
                {
                    MessageBox.Show("El DNI debe ser un número", "Mensaje de advertencia", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
                if (txtNombre.Text.Trim() == "")
                {
                    MessageBox.Show("Debe ingresar un nombre", "Mensaje de advertencia", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
                if (txtApellido.Text.Trim() == "")
                {
                    MessageBox.Show("Debe ingresar un apellido", "Mensaje de advertencia", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
                if (txtUsername.Text.Trim() == "")
                {
                    MessageBox.Show("Debe indicar el nombre de usuario", "Mensaje de advertencia", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
                if (cbTipoUsuario.SelectedIndex == -1)
                {
                    MessageBox.Show("No ha seleccionado tipo de usuario", "Mensaje de advertencia", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
                if (cbTipoDocumento.SelectedIndex == -1)
                {
                    MessageBox.Show("No ha seleccionado tipo de documento", "Mensaje de advertencia", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
                if (txtContrasena.Text == "")
                {
                    MessageBox.Show("No ha ingresado la contraseña", "Mensaje de advertencia", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
                if (txtTelefono.Text == "")
                {
                    MessageBox.Show("No ha ingresado el numero de telefono", "Mensaje de advertencia", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
                if (txtDireccion.Text == "")
                {
                    MessageBox.Show("No ha ingresado la direccion", "Mensaje de advertencia", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
                if (txtCorreo.Text == "")
                {
                    MessageBox.Show("No ha ingresado el correo electrónico", "Mensaje de advertencia", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
                //Se inicializa el objeto empleado y se completan todos sus datos
                
                if (cbTipoUsuario.SelectedIndex == 0)
                {
                    this._usuario = new RRHHWS.administrador();
                    ((RRHHWS.administrador)this._usuario).area = txtVariableTipo.Text;
                }
                else if (cbTipoUsuario.SelectedIndex == 1)
                {
                    this._usuario = new RRHHWS.vendedor();
                    ((RRHHWS.vendedor)this._usuario).cantidadVentas = Int32.Parse(txtVariableTipo.Text);
                }
                else
                {
                    this._usuario = new RRHHWS.supervisorDeAlmacen();
                }
                this._usuario.username = txtUsername.Text;
                this._usuario.password = txtContrasena.Text;
                this._usuario.fechaIngreso = dtpFechaIngreso.Value;
                
                
                this._usuario.tipoDeDocumento = (RRHHWS.tipoDeDocumento)cbTipoDocumento.SelectedItem;                
                this._usuario.numDeDocumento = txtNumeroDocumento.Text;
                this._usuario.nombre = txtNombre.Text;
                this._usuario.apellido = txtApellido.Text;
                this._usuario.telefono = txtTelefono.Text;
                this._usuario.email = txtCorreo.Text;
                this._usuario.direccion = txtDireccion.Text;
                this._usuario.fechaDeNacimiento = dtpFechaNacimiento.Value;
                
                this._usuario.fechaDeNacimientoSpecified = true;
                this._usuario.fechaIngresoSpecified = true;

            }

            if (estado == Estado.Nuevo)
            {
                //Se registra el empleado utilizando el DAO de conexión
                //RRHHWS.cuentaUsuario cuentaUsuario = new RRHHWS.cuentaUsuario();
                //cuentaUsuario.username = empleado.nombre.Substring(0, 1).ToLower() +
                //    empleado.apellidoPaterno.ToLower();
                //cuentaUsuario.password = "123456";
                //cuentaUsuario.idCuentaUsuario = daoRRHH.insertarCuentaUsuario(cuentaUsuario);
                //empleado.cuentaUsuario = cuentaUsuario;
                daoRRHH = new RRHHWSClient();
                int resultado;
                if (this._usuario is RRHHWS.supervisorDeAlmacen)
                {
                     resultado = daoRRHH.insertarSupervisor((RRHHWS.supervisorDeAlmacen)this._usuario);
                }
                else if (this._usuario is RRHHWS.vendedor)
                {
                     resultado = daoRRHH.insertarVendedor((RRHHWS.vendedor)this._usuario);
                }
                else
                {
                     resultado = daoRRHH.insertarAdministrador((RRHHWS.administrador)this._usuario);
                }

                if (resultado != 0)
                {
                    MessageBox.Show("Se ha registrado exitosamente el empleado", "Mensaje de Confirmación", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    txtID.Text = resultado.ToString();
                    this._usuario.idUsuario = resultado;
                    establecerEstadoComponentes();
                }
                else
                {
                    MessageBox.Show("Ha ocurrido un error al momento de registrar el empleado", "Mensaje de Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            else if (estado == Estado.Modificar)
            {
                int resultado;
                if (this._usuario is RRHHWS.supervisorDeAlmacen)
                {
                    resultado = daoRRHH.modificarSupervisor((RRHHWS.supervisorDeAlmacen)this._usuario);
                }
                else if (this._usuario is RRHHWS.vendedor)
                {
                    resultado = daoRRHH.modificarVendedor((RRHHWS.vendedor)this._usuario);
                }
                else
                {
                    resultado = daoRRHH.modificarAdministrador((RRHHWS.administrador)this._usuario);
                }

                if (resultado != 0)
                {
                    MessageBox.Show("Se ha modificado exitosamente el empleado", "Mensaje de Confirmación", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    establecerEstadoComponentes();
                }
                else
                    MessageBox.Show("Ha ocurrido un error al momento de modificar el empleado", "Mensaje de Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            
        }

        private void btAnular_Click(object sender, EventArgs e)
        {
            daoRRHH = new RRHHWS.RRHHWSClient();
            if (MessageBox.Show("¿Esta seguro que desea eliminar este empleado?", "Mensaje de confirmación", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.Yes)
            {

                int result;
                if (this._usuario is RRHHWS.supervisorDeAlmacen)
                {
                    result = daoRRHH.eliminarSupervisor(((RRHHWS.supervisorDeAlmacen)this._usuario).idUsuario, ((RRHHWS.supervisorDeAlmacen)this._usuario).almacen.id);
                }
                else if (this._usuario is RRHHWS.vendedor)
                {
                    result = daoRRHH.eliminarVendedor(((RRHHWS.vendedor)this._usuario).idPersona, ((RRHHWS.vendedor)this._usuario).cantidadVentas);
                }
                else
                {
                    result = daoRRHH.eliminarAdministrador(((RRHHWS.administrador)this._usuario).idUsuario, ((RRHHWS.administrador)this._usuario).area);
                }

                if (result == 1)
                    MessageBox.Show("Se ha eliminado exitosamente el empleado", "Mensaje de Confirmación", MessageBoxButtons.OK, MessageBoxIcon.Information);
                else
                    MessageBox.Show("Ha ocurrido un error al momento de eliminar el empleado", "Mensaje de Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btRegresar_Click(object sender, EventArgs e)
        {
            _frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmEmpleados(_frmPrincipal));
        }

        private void btCancelar_Click(object sender, EventArgs e)
        {
            _frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmEmpleados(_frmPrincipal));
        }

        private void cbTipoUsuario_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbTipoUsuario.SelectedIndex == 0)
            {
                lblVariableTipo.Text = "Area";
            }
            else if (cbTipoUsuario.SelectedIndex == 1)
            {
                lblVariableTipo.Text = "Cantidad de ventas";
                txtVariableTipo.Enabled = false;
                if (this.estado == Estado.Nuevo) txtVariableTipo.Text = "0";
            }
            else
            {
                lblVariableTipo.Text = "";
                txtVariableTipo.Enabled = false;
            }
        }
    }
}
