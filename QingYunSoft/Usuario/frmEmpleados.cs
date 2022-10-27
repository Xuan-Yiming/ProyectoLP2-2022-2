using QingYunSoft.Cliente;
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

    public partial class frmEmpleados : Form
    {
        public frmEmpleados()
        {
            InitializeComponent();
        }

        private void btNuevoUsuario_Click(object sender, EventArgs e)
        {

        }

        private void btBuscar_Click(object sender, EventArgs e)
        {
            frmBuscarEmpleados _frmBuscarEmpleados = new frmBuscarEmpleados();
            _frmBuscarEmpleados.ShowDialog();
        }
    }
}
