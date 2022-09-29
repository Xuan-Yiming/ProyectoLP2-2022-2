using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace LP2Soft.Almacen
{
    public partial class frmListarProductos : Form
    {
        public frmListarProductos()
        {
            InitializeComponent();
        }

        private void BtnSeleccionar_Click(object sender, EventArgs e)
        {
            frmProducto frmproducto = new frmProducto();
            frmproducto.Show();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            frmProducto frmproducto = new frmProducto();
            frmproducto.Show();
        }
    }
}
