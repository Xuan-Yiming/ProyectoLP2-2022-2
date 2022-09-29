using LP2Soft.Almacen;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace LP2Soft.Ventas
{
    public partial class frmPedido : Form
    {
        public frmPedido()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.DialogResult = DialogResult.OK;
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            frmBuscarProducto frmbuscarProducto = new frmBuscarProducto();
            frmbuscarProducto.ShowDialog();
        }
    }
}
