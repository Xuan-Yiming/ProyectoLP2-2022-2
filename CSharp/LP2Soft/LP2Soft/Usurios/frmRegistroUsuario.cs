using LP2Soft.Almacen;
using LP2Soft.Ventas;
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
    public partial class frmRegistroUsuario : Form
    {
        public frmRegistroUsuario()
        {
            InitializeComponent();
        }

        private void btSiguiente_Click(object sender, EventArgs e)
        {
            frmTipoUsuario frmtipoUsuario = new frmTipoUsuario();
            DialogResult result =  frmtipoUsuario.ShowDialog();
            
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            frmBusquedaUsuario frmbusquedaUsuario = new frmBusquedaUsuario();
            if(frmbusquedaUsuario.ShowDialog() == DialogResult.OK)
            {
                
            }
        }
    }
}
