using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.MonthCalendar;

namespace LP2Soft
{
    public partial class frmSupervisorAlmacen : Form
    {
        public frmSupervisorAlmacen()
        {
            InitializeComponent();
        }

        public void limpiarComponentes()
        {
            txtUsername.Text = "";
            txtPassword.Text = "";
            txtConfirmarPassword.Text = "";
            dtpFechaIngreso.Value = DateTime.Now;
            txtIDalmacen.Text = "";

        }

        private void btRegresar_Click(object sender, EventArgs e)
        {
            limpiarComponentes();
            this.Close();
        }

        private void btAceptar_Click(object sender, EventArgs e)
        {
            limpiarComponentes();
            this.Close();
        }
    }
}
