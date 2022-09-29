using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Drawing.Text;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace LP2Soft
{
    public partial class frmGestionUsuario : Form
    {
        private static Form formularioActivo = null;
        public frmGestionUsuario()
        {
            InitializeComponent();
        }

        private void btnRegistrar_Click(object sender, EventArgs e)
        {   
            

            frmRegistroUsuario formRegUsuarios = new frmRegistroUsuario();
            formRegUsuarios.ShowDialog();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            frmModificarUsuario formModificarUsuarios= new frmModificarUsuario();
            formModificarUsuarios.ShowDialog();
        }
    }
}
