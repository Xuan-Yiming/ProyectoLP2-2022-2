using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QingYunSoft.Cliente
{
    public partial class frmClientes : Form
    {
        public frmClientes()
        {
            InitializeComponent();
            this.CenterToParent();
        }
        private frmPrincipal _frmPrincipal;
        public frmClientes(frmPrincipal _frmPrincipal)
        {
            InitializeComponent();
            this.CenterToParent();
            this._frmPrincipal = _frmPrincipal;
        }

        private void btBuscar_Click(object sender, EventArgs e)
        {
            frmBuscarCliente _frmBuscarCliente = new frmBuscarCliente();
            _frmBuscarCliente.ShowDialog();
        }

        private void btNuevoCiente_Click(object sender, EventArgs e)
        {
            frmInfoCliente _frmInfoClientes = new frmInfoCliente(_frmPrincipal, Estado.Nuevo);
            _frmPrincipal.mostrarFormularioEnPnlPrincipal(_frmInfoClientes);
        }

        
    }
}
