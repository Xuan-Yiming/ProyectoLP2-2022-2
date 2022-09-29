using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace LP2Soft.Clientes
{
    public partial class frmBusquedaCliente : Form
    {
        public frmBusquedaCliente()
        {
            InitializeComponent();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            frmRegistroCliente frmregistrocliente = new frmRegistroCliente();
            frmregistrocliente.ShowDialog();
        }

        private void btnSeleccionar_Click(object sender, EventArgs e)
        {
            frmRegistroCliente frmregistroCliente = new frmRegistroCliente();
            frmregistroCliente.ShowDialog();
        }
    }
}
