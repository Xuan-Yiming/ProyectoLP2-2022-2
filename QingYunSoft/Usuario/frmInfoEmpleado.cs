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
        //El objeto empleado que manejaremos a lo largo del uso del formulario
        private RRHHWS.usuario usuario;
        public usuario Usuario { get => usuario; set => usuario = value; }
        public frmInfoEmpleado()
        {
            InitializeComponent();
            this.estado = estado;
            usuario = frmBusqEmpleados.UsuarioSeleccionado;
            if (usuario == null)
                estado = Estado.Nuevo;
            else
            {
                estado = Estado.Modificar;
                if (frmBusqEmpleados.UsuarioSeleccionado is RRHHWS.supervisorDeAlmacen)
                {
                    usuario = new RRHHWS.supervisorDeAlmacen();
                }
                else if (frmBusqEmpleados.UsuarioSeleccionado is RRHHWS.vendedor)
                {
                    usuario = new RRHHWS.vendedor();
                }
                else
                {
                    usuario = new RRHHWS.administrador();
                }
            }
            if (estado == Estado.Nuevo)
            {
                establecerEstadoComponentes();
            }
            else
            {
                txtID.Text = usuario.idPersona.ToString();
                txtUsername.Text = usuario.username;
                txtContrasena.Text = usuario.password;
                if (usuario is RRHHWS.supervisorDeAlmacen)
                {
                    cbTipoUsuario.Text = "Supervisor de almacen";
                    lblVariableTipo.Text = "Nombre del Almacen";
                    txtVariableTipo.Text = ((RRHHWS.supervisorDeAlmacen)usuario).almacen.nombre;
                }
                else if (usuario is RRHHWS.vendedor)
                {
                    cbTipoUsuario.Text = "Vendedor";
                    lblVariableTipo.Text = "Cantidad de ventas";
                    txtVariableTipo.Text = ((RRHHWS.vendedor)usuario).cantidadVentas.ToString();
                }
                else
                {
                    cbTipoUsuario.Text = "Administrador";
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

                establecerEstadoComponentes();
            }
        }


        
        //Los DAOs de conexión
        private RRHHWS.RRHHWSClient daoRRHH;
 
        private frmPrincipal _frmPrincipal;
        private Estado estado;

        frmBuscarEmpleados frmBusqEmpleados = new frmBuscarEmpleados();

        

        public void establecerEstadoComponentes()
        {
            switch (estado)
            {
                
                case Estado.Nuevo:
                    btAnular.Enabled = false;
                    btEditarGuardar.Enabled = true;
                    btRegresar.Enabled = true;
                    btCancelar.Enabled = true;
                    break;
                case Estado.Modificar:
                    
                    btAnular.Enabled = true;
                    btEditarGuardar.Enabled = true;
                    btRegresar.Enabled = true;
                    btCancelar.Enabled = true;
                    break;
                
            }
        }


        public frmInfoEmpleado(frmPrincipal _frmPrincipal, Estado estado)
        {
            InitializeComponent();
            this._frmPrincipal = _frmPrincipal;
            this.estado = estado;
            usuario = frmBusqEmpleados.UsuarioSeleccionado;
            if (usuario == null)
                estado = Estado.Nuevo;
            else {
                estado = Estado.Modificar;
                if (frmBusqEmpleados.UsuarioSeleccionado is RRHHWS.supervisorDeAlmacen)
                {
                    usuario = new RRHHWS.supervisorDeAlmacen();
                }
                else if(frmBusqEmpleados.UsuarioSeleccionado is RRHHWS.vendedor)
                {
                    usuario = new RRHHWS.vendedor();
                }
                else
                {
                    usuario = new RRHHWS.administrador();
                }
            }                

            if (estado == Estado.Nuevo)
            {
                establecerEstadoComponentes();
            }
            else
            {
                txtID.Text = usuario.idPersona.ToString();
                txtUsername.Text = usuario.username;
                txtContrasena.Text = usuario.password;
                if(usuario is RRHHWS.supervisorDeAlmacen)
                {
                    cbTipoUsuario.Text = "Supervisor de almacen";
                    lblVariableTipo.Text = "Nombre del Almacen";
                    txtVariableTipo.Text = ((RRHHWS.supervisorDeAlmacen)usuario).almacen.nombre;
                }
                else if(usuario is RRHHWS.vendedor)
                {
                    cbTipoUsuario.Text = "Vendedor";
                    lblVariableTipo.Text = "Cantidad de ventas";
                    txtVariableTipo.Text = ((RRHHWS.vendedor)usuario).cantidadVentas.ToString();
                }
                else
                {
                    cbTipoUsuario.Text = "Administrador";
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
                
                establecerEstadoComponentes();
            }
        }

        private void textBox9_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void btEditarGuardar_Click(object sender, EventArgs e)
        {
            if (cbTipoUsuario.Text == "Supervisor de almacen")
            {

                usuario = new RRHHWS.supervisorDeAlmacen();
                ((RRHHWS.supervisorDeAlmacen)usuario).almacen.nombre = txtVariableTipo.Text;

            }
            else if (cbTipoUsuario.Text == "Administrador")
            {
                usuario = new RRHHWS.administrador();
                ((RRHHWS.administrador)usuario).area = txtVariableTipo.Text;
            }
            else
            {
                usuario = new RRHHWS.vendedor();
                ((RRHHWS.vendedor)usuario).cantidadVentas = Int32.Parse(txtVariableTipo.Text);
            }

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
            usuario.nombre = txtNombre.Text;
            usuario.numDeDocumento = txtNumeroDocumento.Text;
            usuario.apellido = txtApellido.Text;

            usuario.fechaDeNacimiento = dtpFechaNacimiento.Value;
            usuario.fechaDeNacimientoSpecified = true;
            usuario.fechaIngreso = dtpFechaIngreso.Value;
            usuario.fechaIngresoSpecified = true;
            usuario.tipoDeDocumento = (RRHHWS.tipoDeDocumento)cbTipoDocumento.SelectedItem;
            usuario.username = txtUsername.Text;
            usuario.password = txtContrasena.Text;
            usuario.telefono = txtTelefono.Text;
            usuario.email = txtCorreo.Text;
            usuario.direccion = txtDireccion.Text;
            



            if (estado == Estado.Nuevo)
            {
                //Se registra el empleado utilizando el DAO de conexión
                //RRHHWS.cuentaUsuario cuentaUsuario = new RRHHWS.cuentaUsuario();
                //cuentaUsuario.username = empleado.nombre.Substring(0, 1).ToLower() +
                //    empleado.apellidoPaterno.ToLower();
                //cuentaUsuario.password = "123456";
                //cuentaUsuario.idCuentaUsuario = daoRRHH.insertarCuentaUsuario(cuentaUsuario);
                //empleado.cuentaUsuario = cuentaUsuario;
                int resultado;
                if (usuario is RRHHWS.supervisorDeAlmacen)
                {
                     resultado = daoRRHH.insertarSupervisor((RRHHWS.supervisorDeAlmacen)usuario);
                }
                else if (usuario is RRHHWS.vendedor)
                {
                     resultado = daoRRHH.insertarVendedor((RRHHWS.vendedor)usuario);
                }
                else
                {
                     resultado = daoRRHH.insertarAdministrador((RRHHWS.administrador)usuario);
                }

                if (resultado != 0)
                {
                    MessageBox.Show("Se ha registrado exitosamente el empleado", "Mensaje de Confirmación", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    txtID.Text = resultado.ToString();
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
                if (usuario is RRHHWS.supervisorDeAlmacen)
                {
                    resultado = daoRRHH.modificarSupervisor((RRHHWS.supervisorDeAlmacen)usuario);
                }
                else if (usuario is RRHHWS.vendedor)
                {
                    resultado = daoRRHH.modificarVendedor((RRHHWS.vendedor)usuario);
                }
                else
                {
                    resultado = daoRRHH.modificarAdministrador((RRHHWS.administrador)usuario);
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
            if (MessageBox.Show("¿Esta seguro que desea eliminar este empleado?", "Mensaje de confirmación", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.Yes)
            {

                int result;
                if (usuario is RRHHWS.supervisorDeAlmacen)
                {
                    result = daoRRHH.eliminarSupervisor(((RRHHWS.supervisorDeAlmacen)usuario).idUsuario, ((RRHHWS.supervisorDeAlmacen)usuario).almacen.id);
                }
                else if (usuario is RRHHWS.vendedor)
                {
                    result = daoRRHH.eliminarVendedor(((RRHHWS.vendedor)usuario).idPersona, ((RRHHWS.vendedor)usuario).cantidadVentas);
                }
                else
                {
                    result = daoRRHH.eliminarAdministrador(((RRHHWS.administrador)usuario).idUsuario, ((RRHHWS.administrador)usuario).area);
                }

                if (result == 1)
                    MessageBox.Show("Se ha eliminado exitosamente el empleado", "Mensaje de Confirmación", MessageBoxButtons.OK, MessageBoxIcon.Information);
                else
                    MessageBox.Show("Ha ocurrido un error al momento de eliminar el empleado", "Mensaje de Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void cbTipoUsuario_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbTipoUsuario.Text == "Supervisor de almacen")
            {

                lblVariableTipo.Text = "Nombre del Almacen";

            }
            else if (cbTipoUsuario.Text == "Administrador")
            {
                lblVariableTipo.Text = "Area";
            }
            else
            {
                lblVariableTipo.Text = "Cantidad de Ventas";
            }
        }
    }
}
