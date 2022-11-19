using System;
using System.Windows.Forms;

namespace QingYunSoft.Usuario
{

    public partial class frmEmpleados : Form
    {
        //objetos
        private frmPrincipal _frmPrincipal;

        //daos
        private RRHHWS.RRHHWSClient daoEmpleados;

        public frmEmpleados(frmPrincipal _frmPrincipal)
        {
            InitializeComponent();
            this._frmPrincipal = _frmPrincipal;
            //empleados
            try
            {
                dgvEmpleados.AutoGenerateColumns = false;
                daoEmpleados = new RRHHWS.RRHHWSClient();
                dgvEmpleados.DataSource = daoEmpleados.listarUsuarios();
                dgvEmpleados.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void btNuevoUsuario_Click(object sender, EventArgs e)
        {
            frmInfoEmpleado _frmInfoEmpleado = new frmInfoEmpleado(_frmPrincipal, Estado.Nuevo);
            _frmPrincipal.mostrarFormularioEnPnlPrincipal(_frmInfoEmpleado);
        }

        private void btBuscar_Click(object sender, EventArgs e)
        {
            frmBuscarEmpleados _frmBuscarEmpleados = new frmBuscarEmpleados();
            if (_frmBuscarEmpleados.ShowDialog() == DialogResult.OK)
            {
                frmInfoEmpleado _frmInfoEmpleado = new frmInfoEmpleado(_frmPrincipal, Estado.Resultado, _frmBuscarEmpleados.UsuarioSeleccionado);
                _frmPrincipal.mostrarFormularioEnPnlPrincipal(_frmInfoEmpleado);
            }
        }

        private void dgvEmpleados_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            RRHHWS.usuario empleado = (RRHHWS.usuario)dgvEmpleados.Rows[e.RowIndex].DataBoundItem;
            dgvEmpleados.Rows[e.RowIndex].Cells["nombre"].Value = empleado.nombre + " " + empleado.apellido;
            dgvEmpleados.Rows[e.RowIndex].Cells["tipoDocumento"].Value = empleado.tipoDeDocumento.ToString();
            dgvEmpleados.Rows[e.RowIndex].Cells["nmrDocumento"].Value = empleado.numDeDocumento;
            dgvEmpleados.Rows[e.RowIndex].Cells["fechaIngreso"].Value = empleado.fechaIngreso;
            if (empleado is RRHHWS.administrador)
            {
                dgvEmpleados.Rows[e.RowIndex].Cells["cargo"].Value = "Administrador";
            }
            else if (empleado is RRHHWS.vendedor)
            {
                dgvEmpleados.Rows[e.RowIndex].Cells["cargo"].Value = "Vendedor";
            }
            else if (empleado is RRHHWS.supervisorDeAlmacen)
            {
                dgvEmpleados.Rows[e.RowIndex].Cells["cargo"].Value = "Sup. Almacen";
            }

        }
        private void dgvEmpleados_CellContentDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            RRHHWS.usuario usurioSeleccionado = (RRHHWS.usuario)dgvEmpleados.CurrentRow.DataBoundItem;
            _frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmInfoEmpleado(_frmPrincipal, Estado.Resultado, usurioSeleccionado));
        }

        private void dgvEmpleados_CellMouseDoubleClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            RRHHWS.usuario usurioSeleccionado = (RRHHWS.usuario)dgvEmpleados.CurrentRow.DataBoundItem;
            _frmPrincipal.mostrarFormularioEnPnlPrincipal(new frmInfoEmpleado(_frmPrincipal, Estado.Resultado, usurioSeleccionado));
        }

        private void btReporteMejoresVendedores_Click(object sender, EventArgs e)
        {
            frmReporteViewer _frmReporteViewer = new frmReporteViewer(daoEmpleados.mejoresVendedores());
            _frmReporteViewer.Show();
        }
    }
}
