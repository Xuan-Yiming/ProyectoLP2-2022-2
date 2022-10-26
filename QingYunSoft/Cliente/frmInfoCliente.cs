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
    public partial class frmInfoCliente : Form
    {
        public frmInfoCliente()
        {
            InitializeComponent();
        }
        private frmPrincipal _frmPrincipal;
        private Estado estado;
        public frmInfoCliente(frmPrincipal _frmPrincipal, Estado estado)
        {
            InitializeComponent();
            this._frmPrincipal = _frmPrincipal;
            this.estado = estado;
        }
        public void mostrarFormularioEnPnlTipoCliente(Form _frm)
        {
            pnlTipoCliente.Controls.Clear();
            _frm.TopLevel = false;
            _frm.FormBorderStyle = FormBorderStyle.None;
            _frm.Dock = DockStyle.Fill;
            pnlTipoCliente.Controls.Add(_frm);
            _frm.Show();
        }
        private void cbTipoCliente_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbTipoCliente.Text == "Persona Natural")
            {
                frmPersonaNatural _frmInfoClientePersona = new frmPersonaNatural();
                mostrarFormularioEnPnlTipoCliente(_frmInfoClientePersona);
            }
            else if (cbTipoCliente.Text == "Empresa")
            {
                frmEmpresa _frmInfoClienteEmpresa = new frmEmpresa();
                mostrarFormularioEnPnlTipoCliente(_frmInfoClienteEmpresa);
            }
        }

        private void btEditarGuardar_Click(object sender, EventArgs e)
        {

        }
    }
}
