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

namespace QingYunSoft
{
    public partial class frmPrincipal : Form
    {
        [DllImport("Gdi32.dll", EntryPoint = "CreateRoundRectRgn")]
        private static extern IntPtr CreateRoundRectRgn
        (
            int nLeftRect, // x-coordinate of upper-left corner
            int nTopRect, // y-coordinate of upper-left corner
            int nRightRect, // x-coordinate of lower-right corner
            int nBottomRect, // y-coordinate of lower-right corner
            int nWidthEllipse, // height of ellipse
            int nHeightEllipse // width of ellipse
        );
        public frmPrincipal()
        {
            InitializeComponent();
            //round form border
            this.FormBorderStyle = FormBorderStyle.None;
            this.Region = System.Drawing.Region.FromHrgn(CreateRoundRectRgn(0, 0, this.Width, this.Height, 15, 15));

            //round picturebox
            System.Drawing.Drawing2D.GraphicsPath gp = new System.Drawing.Drawing2D.GraphicsPath();
            gp.AddEllipse(0, 0, pcbFotoPerfil.Width - 3, pcbFotoPerfil.Height - 3);
            Region rg = new Region(gp);
            pcbFotoPerfil.Region = rg;
        }

        private void btExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btMinimize_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Minimized;
        }

        private void btInicio_Click(object sender, EventArgs e)
        {
            pnlPrincipal.Controls.Clear();
            frmInicio _frmInicio = new frmInicio();
            _frmInicio.TopLevel = false;
            _frmInicio.FormBorderStyle = FormBorderStyle.None;
            _frmInicio.Dock = DockStyle.Fill;
            pnlPrincipal.Controls.Add(_frmInicio);
            _frmInicio.Show();
        }
    }
}
