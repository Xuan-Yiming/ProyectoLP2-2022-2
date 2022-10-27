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
        private frmPrincipal _frmPrincipal;
        //private BindingList<VentasWS> _detallesVenta;
        public frmVentas()
        {
            InitializeComponent();
        }
        
        public frmVentas(frmPrincipal _frmPrincipal)
        {
            InitializeComponent();
            this._frmPrincipal = _frmPrincipal;
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

        private void dgvVentas_CellContentDoubleClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
