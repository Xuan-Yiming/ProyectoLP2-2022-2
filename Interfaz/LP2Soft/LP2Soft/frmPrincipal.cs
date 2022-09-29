using LP2Soft.Almacen;
using LP2Soft.Ventas;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace LP2Soft
{
    public partial class frmPrincipal : Form
    {
        [DllImport("user32.dll", EntryPoint = "ReleaseCapture")]
        private extern static void ReleaseCapture();
        [DllImport("user32.dll", EntryPoint = "SendMessage")]
        private static extern void SendMessage(IntPtr hWnd, int wMsg, int wParam, int lParam);
        public frmPrincipal()
        {
            InitializeComponent();
        }

        private void btnCerrar_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void panel1_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0xA1, 0x2, 0);
        }

        private void btnAlmacen_Click(object sender, EventArgs e)
        {
            panelPrincipal.Controls.Clear();
            frmAlmacenes frmalmacen = new frmAlmacenes();
            frmalmacen.TopLevel = false;
            frmalmacen.FormBorderStyle = FormBorderStyle.None;
            frmalmacen.Dock = DockStyle.Fill;
            panelPrincipal.Controls.Add(frmalmacen);
            frmalmacen.Show();
        }

        private void btnVenta_Click(object sender, EventArgs e)
        {
            panelPrincipal.Controls.Clear();
            frmVentas frmventas = new frmVentas();
            frmventas.TopLevel = false;
            frmventas.FormBorderStyle = FormBorderStyle.None;
            frmventas.Dock = DockStyle.Fill;
            panelPrincipal.Controls.Add(frmventas);
            frmventas.Show();
        }

        private void btnEmpleados_Click(object sender, EventArgs e)
        {
            panelPrincipal.Controls.Clear();
            frmRegistroUsuario frmregistroUsuario = new frmRegistroUsuario();
            frmregistroUsuario.TopLevel = false;
            frmregistroUsuario.FormBorderStyle = FormBorderStyle.None;
            frmregistroUsuario.Dock = DockStyle.Fill;
            panelPrincipal.Controls.Add(frmregistroUsuario);
            frmregistroUsuario.Show();
        }
    }
}
