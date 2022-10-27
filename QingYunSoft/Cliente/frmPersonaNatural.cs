using QingYunSoft.GestClientesWS;
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
    public partial class frmPersonaNatural : Form
    {
        private GestClientesWS.tipoDeDocumento tipoDocumento;
        private string numeroDocumento;
        private string nombres;
        private string apellidos;
        private string direccion;
        private string telefono;
        private string correo;
        private DateTime fechaNacimiento;
        public frmPersonaNatural()
        {
            InitializeComponent();
        }


        public tipoDeDocumento TipoDocumento { get => tipoDocumento; set => tipoDocumento = value; }
        public string NumeroDocumento { get => numeroDocumento; set => numeroDocumento = value; }
        public string Nombres { get => nombres; set => nombres = value; }
        public string Apellidos { get => apellidos; set => apellidos = value; }
        public string Direccion { get => direccion; set => direccion = value; }
        public string Telefono { get => telefono; set => telefono = value; }
        public string Correo { get => correo; set => correo = value; }
        public DateTime FechaNacimiento { get => fechaNacimiento; set => fechaNacimiento = value; }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.tipoDocumento = (GestClientesWS.tipoDeDocumento)comboBox2.SelectedItem;
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {
            this.numeroDocumento = textBox2.Text;
            
        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {
            this.nombres = textBox3.Text;
        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {
            this.apellidos = textBox4.Text;
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            this.telefono = textBox1.Text;
        }

        private void textBox5_TextChanged(object sender, EventArgs e)
        {
            this.correo = textBox5.Text;
        }

        private void textBox6_TextChanged(object sender, EventArgs e)
        {
            this.direccion = textBox6.Text;
        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {
            this.fechaNacimiento = dateTimePicker1.Value;
        }
    }
}
