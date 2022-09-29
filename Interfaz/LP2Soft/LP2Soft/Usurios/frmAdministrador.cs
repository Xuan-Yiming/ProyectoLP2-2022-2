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
    public partial class frmAdministrador : Form
    {
        public frmAdministrador()
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
            limpiarComponentes();
            this.Close();
        }

        private void btRegresar_Click(object sender, EventArgs e)
        {
            limpiarComponentes();
            this.Close();
        }
    }
}
