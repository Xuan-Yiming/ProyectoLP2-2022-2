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
    public partial class frmEmpresa : Form
    {
        private string ruc;
        private string razonSocial;
        private string direccion;
        
        public frmEmpresa()
        {
            InitializeComponent();
        }

        public string Ruc { get => ruc; set => ruc = value; }
        public string RazonSocial { get => razonSocial; set => razonSocial = value; }
        public string Direccion { get => direccion; set => direccion = value; }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            this.ruc = textBox1.Text;
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {
            this.razonSocial = textBox2.Text;
        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {
            this.direccion = textBox3.Text;
        }
    }
}
