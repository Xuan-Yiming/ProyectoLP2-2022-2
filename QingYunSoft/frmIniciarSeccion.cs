using QingYunSoft.RRHHWS;
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
    public partial class frmIniciarSeccion : Form
    {
        //objetos
        private RRHHWS.usuario _usuario;
        private RRHHWS.RRHHWSClient daoRRHHWSClient;

        //constructor
        public frmIniciarSeccion()
        {
            InitializeComponent();
            this.CenterToScreen();
            //round form border
            this.FormBorderStyle = FormBorderStyle.None;
            this.Region = System.Drawing.Region.FromHrgn(CreateRoundRectRgn(0, 0, this.Width, this.Height, 15, 15));
            
            //prueba
            //this._usuario = new RRHHWS.administrador();
            //this._usuario.nombre = "Jarumy";
        }

        //metodos
        private void btIngresar_Click(object sender, EventArgs e)
        {
            daoRRHHWSClient = new RRHHWS.RRHHWSClient();
            RRHHWS.usuario usuario = new RRHHWS.administrador();
            usuario.username = txtUsuario.Text;
            usuario.password = txtClave.Text;
            this._usuario = daoRRHHWSClient.verificarCuentaUsuario(usuario);
            if (this._usuario != null)
            {
                frmPrincipal _frmPrincipal = new frmPrincipal(this._usuario);
                this.Hide();
                _frmPrincipal.ShowDialog();
                if (_frmPrincipal.DialogResult == DialogResult.Cancel)
                {
                    this.Close();
                }
                else if (_frmPrincipal.DialogResult == DialogResult.OK)
                {
                    this.Show();
                }
            }
            else
            {
                MessageBox.Show("Usuario o contraseña incorrectos: Error Code");
            }
                    
        }

        private void btSalir_Click(object sender, EventArgs e)
        {
            //confirmar antes de cerrar la aplicacion
            if (MessageBox.Show("¿Está seguro que desea salir de la aplicación?", "Saliendo", MessageBoxButtons.YesNo) == DialogResult.Yes)
            {
                this.Close();
            }        
        }

        //otros

        //round border
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
        //out drop shadow
        [DllImport("user32.dll", EntryPoint = "ReleaseCapture")]
        private extern static void ReleaseCapture();
        [DllImport("user32.dll", EntryPoint = "SendMessage")]
        private static extern void SendMessage(IntPtr hWnd, int wMsg, int wParam, int lParam);
        [DllImport("dwmapi.dll")]
        public static extern int DwmExtendFrameIntoClientArea(IntPtr hWnd, ref MARGINS pMarInset);
        [DllImport("dwmapi.dll")]
        public static extern int DwmSetWindowAttribute(IntPtr hwnd, int attr, ref int attrValue, int attrSize);
        [DllImport("dwmapi.dll")]
        public static extern int DwmIsCompositionEnabled(ref int pfEnabled);
        private bool m_aeroEnabled;                     // variables for box shadow
        private const int CS_DROPSHADOW = 0x00020000;
        private const int WM_NCPAINT = 0x0085;
        private const int WM_ACTIVATEAPP = 0x001C;
        public struct MARGINS                           // struct for box shadow
        {
            public int leftWidth;
            public int rightWidth;
            public int topHeight;
            public int bottomHeight;
        }
        private const int WM_NCHITTEST = 0x84;          // variables for dragging the form
        private const int HTCLIENT = 0x1;
        private const int HTCAPTION = 0x2;
        protected override CreateParams CreateParams
        {
            get
            {
                m_aeroEnabled = CheckAeroEnabled();

                CreateParams cp = base.CreateParams;
                if (!m_aeroEnabled)
                    cp.ClassStyle |= CS_DROPSHADOW;

                return cp;
            }
        }
        private bool CheckAeroEnabled()
        {
            if (Environment.OSVersion.Version.Major >= 6)
            {
                int enabled = 0;
                DwmIsCompositionEnabled(ref enabled);
                return (enabled == 1) ? true : false;
            }
            return false;
        }
        protected override void WndProc(ref Message m)
        {
            switch (m.Msg)
            {
                case WM_NCPAINT:                        // box shadow
                    if (m_aeroEnabled)
                    {
                        var v = 2;
                        DwmSetWindowAttribute(this.Handle, 2, ref v, 4);
                        MARGINS margins = new MARGINS()
                        {
                            bottomHeight = 1,
                            leftWidth = 1,
                            rightWidth = 1,
                            topHeight = 1
                        };
                        DwmExtendFrameIntoClientArea(this.Handle, ref margins);

                    }
                    break;
                default:
                    break;
            }
            base.WndProc(ref m);

            if (m.Msg == WM_NCHITTEST && (int)m.Result == HTCLIENT)     // drag the form
                m.Result = (IntPtr)HTCAPTION;

        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {
            //prueba
            this._usuario = new RRHHWS.administrador();
            this._usuario.nombre = "Jarumy";
            frmPrincipal _frmPrincipal = new frmPrincipal(this._usuario);
            this.Hide();
            _frmPrincipal.ShowDialog();
            if (_frmPrincipal.DialogResult == DialogResult.Cancel)
            {
                this.Close();
            }
            else if (_frmPrincipal.DialogResult == DialogResult.OK)
            {
                this.Show();
            }
        }

        private void txtUsuario_TextChanged(object sender, EventArgs e)
        {

        }
        //out drop shadow done

    }
}
