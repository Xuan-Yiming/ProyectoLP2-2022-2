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
    public partial class busquedaDocCre : Form
    {
        public busquedaDocCre()
        {
            InitializeComponent();
        }

        private void btnAgregado_Click(object sender, EventArgs e)
        {
            frmDocumentoCredito frmdocumentoCredito = new frmDocumentoCredito();
            frmdocumentoCredito.ShowDialog();
        }

        private void btnRegsar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void BtnSeleccionar_Click(object sender, EventArgs e)
        {
            frmDocumentoCredito frmdocumentoCredito = new frmDocumentoCredito();
            frmdocumentoCredito.ShowDialog();
        }
    }
}
