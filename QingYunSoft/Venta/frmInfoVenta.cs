using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QingYunSoft
{
    public partial class frmInfoVenta : Form
    {
        private Estado estado;
        public Estado Estado { get => estado; set => estado = value; }
        private frmPrincipal _frmPrincipal;
        public frmInfoVenta()
        {
            InitializeComponent();
        }
        public frmInfoVenta(frmPrincipal _frmPrincipal, Estado estado)
        {
            InitializeComponent();
            this.estado = estado;
            this._frmPrincipal = _frmPrincipal;
        }
        private void btRegresar_Click(object sender, EventArgs e)
        {
            _frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmVentas(_frmPrincipal));
        }

        private void btReclamo_Click(object sender, EventArgs e)
        {

        }

        private void btPago_Click(object sender, EventArgs e)
        {

        }

        private void btCancelar_Click(object sender, EventArgs e)
        {
            _frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmVentas(_frmPrincipal));
        }

        private void btEditarGuardar_Click(object sender, EventArgs e)
        {

        }
    }
}
