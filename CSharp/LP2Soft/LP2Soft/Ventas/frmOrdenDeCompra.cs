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
    public partial class frmOrdenDeCompra : Form
    {
        public frmOrdenDeCompra()
        {
            InitializeComponent();
        }

        private void btReclamo_Click(object sender, EventArgs e)
        {
            frmReclamo frmreclamo = new frmReclamo();
            frmreclamo.ShowDialog();
        }

        private void btSiguiente_Click(object sender, EventArgs e)
        {
            frmReclamo frmreclamo = new frmReclamo();
            frmreclamo.ShowDialog();
        }

        private void BDD_Click(object sender, EventArgs e)
        {
            busquedaDocDeb busquedadocdeb = new busquedaDocDeb();
            busquedadocdeb.Show();
        }

        private void BDC_Click(object sender, EventArgs e)
        {
            busquedaDocCre busquedadocCre = new busquedaDocCre();
            busquedadocCre.Show();
        }
    }
}
