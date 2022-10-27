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
    public partial class frmClientes : Form
    {
        private frmPrincipal _frmPrincipal;
        private GestClientesWS.GestClientesWSClient daoClientes;
        public frmClientes()
        {
            InitializeComponent();
            this.CenterToParent();
        }
        public frmClientes(frmPrincipal _frmPrincipal)
        {
            InitializeComponent();
            this.CenterToParent();
            this._frmPrincipal = _frmPrincipal;

            //inicializar el datagridview
            dgvClientes.AutoGenerateColumns = false;
            dgvClientes.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dgvClientes.MultiSelect = false;

            //inicializar el dao
            daoClientes = new GestClientesWS.GestClientesWSClient();
            dgvClientes.DataSource = daoClientes.listarClientes();

        }

        private void btBuscar_Click(object sender, EventArgs e)
        {
            frmBuscarCliente _frmBuscarCliente = new frmBuscarCliente();
            if(_frmBuscarCliente.ShowDialog() == DialogResult.OK)
            {
                _frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmInfoCliente(_frmPrincipal, Estado.Resultado, _frmBuscarCliente.ClienteSeleccionado));
            }
        }

        private void btNuevoCiente_Click(object sender, EventArgs e)
        {
            frmInfoCliente _frmInfoClientes = new frmInfoCliente(_frmPrincipal, Estado.Nuevo);
            _frmPrincipal.mostrarFormularioEnPnlPrincipal(_frmInfoClientes);
        }

        private void dgvClientes_CellMouseDoubleClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            GestClientesWS.cliente clienteSeleccionado = (GestClientesWS.cliente)dgvClientes.CurrentRow.DataBoundItem;
            _frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmInfoCliente(_frmPrincipal, Estado.Resultado, clienteSeleccionado));
        }

        private void dgvClientes_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            GestClientesWS.cliente clienteI = (GestClientesWS.cliente)dgvClientes.Rows[e.RowIndex].DataBoundItem;
            if (clienteI is GestClientesWS.empresa)
            {
                dgvClientes.Rows[e.RowIndex].Cells["nombreCliente"].Value = ((GestClientesWS.empresa)clienteI).razonSocial;
                dgvClientes.Rows[e.RowIndex].Cells["tipoCliente"].Value = "empresa";
                dgvClientes.Rows[e.RowIndex].Cells["tipoDocumento"].Value = "RUC";
                dgvClientes.Rows[e.RowIndex].Cells["nmrDocumento"].Value = ((GestClientesWS.empresa)clienteI).RUC;
                dgvClientes.Rows[e.RowIndex].Cells["categoria"].Value = ((GestClientesWS.empresa)clienteI).categoria;

            }
            else {
                dgvClientes.Rows[e.RowIndex].Cells["nombreCliente"].Value = ((GestClientesWS.personaNatural)clienteI).nombre + " " + ((GestClientesWS.personaNatural)clienteI).apellido;
                dgvClientes.Rows[e.RowIndex].Cells["tipoCliente"].Value = "Persona Natural";
                dgvClientes.Rows[e.RowIndex].Cells["tipoDocumento"].Value = ((GestClientesWS.personaNatural)clienteI).tipoDeDocumento.ToString();
                dgvClientes.Rows[e.RowIndex].Cells["nmrDocumento"].Value = ((GestClientesWS.personaNatural)clienteI).numDeDocumento;
                dgvClientes.Rows[e.RowIndex].Cells["categoria"].Value = ((GestClientesWS.personaNatural)clienteI).categoria;

            }

        }
    }
}
