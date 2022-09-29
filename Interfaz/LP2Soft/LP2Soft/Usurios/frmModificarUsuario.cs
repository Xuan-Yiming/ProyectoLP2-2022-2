using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace LP2Soft
{
    public partial class frmModificarUsuario : Form
    {
        public frmModificarUsuario()
        {
            InitializeComponent();
        }

        public void limpiarComponentes()
        {
            txtID.Text = "";
            txtNombre.Text = "";
            txtApellido.Text = "";
            dtpFechaNacimiento.Value = DateTime.Now;
            txtTelefono.Text = "";
            txtEmail.Text = "";
            txtDireccion.Text = "";
            txtUsername.Text = "";
            txtPassword.Text = "";
            cboTipoDoc.Text = "";
            txtNumDoc.Text = "";

        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            frmBusquedaUsuario formBusqUsuarios = new frmBusquedaUsuario();
            if(formBusqUsuarios.ShowDialog() == DialogResult.OK)
            {

            }

        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("¿Esta seguro que desea eliminar este empleado?",
                "Mensaje de confirmación", MessageBoxButtons.YesNo, MessageBoxIcon.Warning
                ) == DialogResult.Yes)
            {
                
            }
        }

        private void btnAceptar_Click(object sender, EventArgs e)
        {
            limpiarComponentes();
            this.Close();
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            limpiarComponentes();
            this.Close();
        }
    }
}
