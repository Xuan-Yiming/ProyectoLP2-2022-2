using QingYunSoft.Venta;
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
    public partial class frmVentas : Form
    {
        private Estado estado;
        public Estado Estado { get => estado; set => estado = value; }
        public frmVentas()
        {
            InitializeComponent();
        }
        private frmPrincipal _frmPrincipal;
        public frmVentas(frmPrincipal _frmPrincipal)
        {
            InitializeComponent();
            this._frmPrincipal = _frmPrincipal;
        }

        private void frmInicio_Load(object sender, EventArgs e)
        {

        }
        
        private void dgvVentas_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            
        }

        private void btNuevaVenta_Click(object sender, EventArgs e)
        {
            
            _frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmInfoVenta(_frmPrincipal,Estado.Nuevo));
        }

        private void btBuscar_Click(object sender, EventArgs e)
        {
            frmBuscarVenta _frmBuscarVenta = new frmBuscarVenta();
            _frmBuscarVenta.ShowDialog();
        }
    }
}
