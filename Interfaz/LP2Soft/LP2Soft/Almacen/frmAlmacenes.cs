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
    public partial class frmAlmacenes : Form
    {
        public frmAlmacenes()
        {
            InitializeComponent();
        }

        private void toolStripButton3_Click(object sender, EventArgs e)
        {
            frmBuscarAlmacen frmbuscaralmacen = new frmBuscarAlmacen();
            if (frmbuscaralmacen.ShowDialog() == DialogResult.OK)
            {

            }
        }

        private void btnListarProductos_Click(object sender, EventArgs e)
        {
            frmListarProductos frmlistarProductos = new frmListarProductos();
            frmlistarProductos.Show();
        }
    }
}
