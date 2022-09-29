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
    public partial class frmProducto : Form
    {
        public frmProducto()
        {
            InitializeComponent();
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            frmBuscarProducto frmbuscarproducto = new frmBuscarProducto();
            if (frmbuscarproducto.ShowDialog() == DialogResult.OK)
            {
               
            }
        }
    }
}
