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
    public partial class frmTipoUsuario : Form
    {
        public frmTipoUsuario()
        {
            InitializeComponent();
        }

        public void limpiarComponentes()
        {
            txtUsername.Text = "";
            txtPassword.Text = "";
            txtConfirmarPassword.Text = "";
            dtpFechaIngreso.Value = DateTime.Now;
            txtArea.Text = "";

        }

        private void btAceptar_Click(object sender, EventArgs e)
        {
            //limpiarComponentes();
            this.DialogResult = DialogResult.OK;
        }

        private void btRegresar_Click(object sender, EventArgs e)
        {
            //limpiarComponentes();
            this.DialogResult = DialogResult.No;
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void lblTitulo_Click(object sender, EventArgs e)
        {

        }

        private void lblFechaIngreso_Click(object sender, EventArgs e)
        {

        }

        private void dtpFechaIngreso_ValueChanged(object sender, EventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void lblNombreArea_Click(object sender, EventArgs e)
        {

        }

        private void txtArea_TextChanged(object sender, EventArgs e)
        {

        }

        private void lblConfirmaciónContraseña_Click(object sender, EventArgs e)
        {

        }

        private void txtConfirmarPassword_TextChanged(object sender, EventArgs e)
        {

        }

        private void lblPassword_Click(object sender, EventArgs e)
        {

        }

        private void txtPassword_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtUsername_TextChanged(object sender, EventArgs e)
        {

        }

        private void lblUsername_Click(object sender, EventArgs e)
        {

        }
    }
}
