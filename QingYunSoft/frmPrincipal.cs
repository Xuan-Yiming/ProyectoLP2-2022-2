using QingYunSoft.Almacen;
using QingYunSoft.Cliente;
using QingYunSoft.Usuario;
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
        /*
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
        */
        [DllImport("user32.dll", EntryPoint = "ReleaseCapture")]
        private extern static void ReleaseCapture();
        [DllImport("user32.dll", EntryPoint = "SendMessage")]
        private static extern void SendMessage(IntPtr hWnd, int wMsg, int wParam, int lParam);

        //buttons
        private System.Windows.Forms.Button btnAlmacen = new System.Windows.Forms.Button();
        private System.Windows.Forms.Button btnVentas = new System.Windows.Forms.Button();
        private System.Windows.Forms.Button btnClientes = new System.Windows.Forms.Button();
        private System.Windows.Forms.Button btnUsuarios = new System.Windows.Forms.Button();

        //private Usuario usuario;

        public frmPrincipal()
        {
            InitializeComponent();
            //round form border
            //this.FormBorderStyle = FormBorderStyle.None;
            //this.Region = System.Drawing.Region.FromHrgn(CreateRoundRectRgn(0, 0, this.Width, this.Height, 15, 15));

            //round picturebox
            System.Drawing.Drawing2D.GraphicsPath gp = new System.Drawing.Drawing2D.GraphicsPath();
            gp.AddEllipse(0, 0, pcbFotoPerfil.Width - 3, pcbFotoPerfil.Height - 3);
            Region rg = new Region(gp);
            pcbFotoPerfil.Region = rg;

            this.CenterToScreen();
            inicializarBotones();
            establecerMenu();
            
        }
        public void mostrarFormularioEnPnlPrincipal(Form _frm)
        {
            pnlPrincipal.Controls.Clear();
            _frm.TopLevel = false;
            _frm.FormBorderStyle = FormBorderStyle.None;
            _frm.Dock = DockStyle.Fill;
            pnlPrincipal.Controls.Add(_frm);
            _frm.Show();
        }
        private void inicializarBotones()
        {
            //btn clientes
            this.btnClientes.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.btnClientes.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnClientes.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnClientes.FlatAppearance.BorderSize = 0;
            this.btnClientes.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnClientes.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnClientes.Image = global::QingYunSoft.Properties.Resources.rectangle_stack_person_crop;
            this.btnClientes.Location = new System.Drawing.Point(0, 0);
            this.btnClientes.Name = "btnClientes";
            this.btnClientes.Size = new System.Drawing.Size(133, 98);
            this.btnClientes.TabIndex = 1;
            this.btnClientes.Text = "Clientes";
            this.btnClientes.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.btnClientes.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.btnClientes.UseVisualStyleBackColor = true;
            this.btnClientes.Click += new System.EventHandler(this.btClientes_Click);

            //btn almacen
            this.btnAlmacen.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.btnAlmacen.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnAlmacen.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnAlmacen.FlatAppearance.BorderSize = 0;
            this.btnAlmacen.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnAlmacen.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnAlmacen.Image = global::QingYunSoft.Properties.Resources.cube_box;
            this.btnAlmacen.Location = new System.Drawing.Point(0, 0);
            this.btnAlmacen.Name = "btAlmacen";
            this.btnAlmacen.Size = new System.Drawing.Size(133, 98);
            this.btnAlmacen.TabIndex = 1;
            this.btnAlmacen.Text = "Almacen";
            this.btnAlmacen.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.btnAlmacen.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.btnAlmacen.UseVisualStyleBackColor = true;
            this.btnAlmacen.Click += new System.EventHandler(this.btAlmacen_Click);
            
            
            //btn ventas
            this.btnVentas.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.btnVentas.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnVentas.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnVentas.FlatAppearance.BorderSize = 0;
            this.btnVentas.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnVentas.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnVentas.Image = global::QingYunSoft.Properties.Resources.house;
            this.btnVentas.Location = new System.Drawing.Point(0, 0);
            this.btnVentas.Name = "btVentas";
            this.btnVentas.Size = new System.Drawing.Size(133, 98);
            this.btnVentas.TabIndex = 0;
            this.btnVentas.Text = "Ventas";
            this.btnVentas.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.btnVentas.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.btnVentas.UseVisualStyleBackColor = true;
            this.btnVentas.Click += new System.EventHandler(this.btInicio_Click);

            //btn empleados
            this.btnUsuarios.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.btnUsuarios.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnUsuarios.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnUsuarios.FlatAppearance.BorderSize = 0;
            this.btnUsuarios.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnUsuarios.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnUsuarios.Image = global::QingYunSoft.Properties.Resources.person_3;
            this.btnUsuarios.Location = new System.Drawing.Point(0, 0);
            this.btnUsuarios.Name = "btEmpleados";
            this.btnUsuarios.Size = new System.Drawing.Size(133, 98);
            this.btnUsuarios.TabIndex = 4;
            this.btnUsuarios.Text = "Empleados";
            this.btnUsuarios.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.btnUsuarios.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.btnUsuarios.UseVisualStyleBackColor = true;
            this.btnUsuarios.Click += new System.EventHandler(this.btEmpleados_Click);
        }
        private void establecerMenu()
        {
            
        }
        private void btInicio_Click(object sender, EventArgs e)
        {
            lbltitulo.Text = "Ventas";
            frmVentas _frmInicio = new frmVentas(this);
            mostrarFormularioEnPnlPrincipal(_frmInicio);
        }

        private void frmPrincipal_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0xA1, 0x2, 0);
        }

        private void panelTop_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0xA1, 0x2, 0);
        }

        private void btIniciarSeccion_Click(object sender, EventArgs e)
        {

        }

        private void frmPrincipal_Load(object sender, EventArgs e)
        {

        }

        private void btClientes_Click(object sender, EventArgs e)
        {
            lbltitulo.Text = "Clientes";
            frmClientes _frmClientes = new frmClientes(this);
            mostrarFormularioEnPnlPrincipal(_frmClientes);
        }

        private void btAlmacen_Click(object sender, EventArgs e)
        {
            lbltitulo.Text = "Almacen";
            frmAlmacen _frmAlmacen = new frmAlmacen();
            mostrarFormularioEnPnlPrincipal(_frmAlmacen);
        }

        private void btEmpleados_Click(object sender, EventArgs e)
        {
            lbltitulo.Text = "Empleados";
            frmEmpleados _frmEmpleados = new frmEmpleados();
            mostrarFormularioEnPnlPrincipal(_frmEmpleados);
        }

        private void btCerrarSeccion_Click(object sender, EventArgs e)
        {
            this.DialogResult = DialogResult.OK;
        }
    }
}
