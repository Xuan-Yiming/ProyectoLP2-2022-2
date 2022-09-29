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
    public partial class frmRegistroCliente : Form
    {
        public frmRegistroCliente()
        {
            InitializeComponent();
        }

        private void btSiguiente_Click(object sender, EventArgs e)
        {
            frmEmpresaCliente frmempresaCliente = new frmEmpresaCliente();
            frmempresaCliente.ShowDialog();
        }
    }
}
