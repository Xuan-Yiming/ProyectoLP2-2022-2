using QingYunSoft.Cliente;
using QingYunSoft.RRHHWS;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QingYunSoft.Usuario
{
    public partial class frmBuscarEmpleados : Form
    {
        private RRHHWS.RRHHWSClient daoRRHH;
        private RRHHWS.usuario usuarioSeleccionado;
        public RRHHWS.usuario UsuarioSeleccionado { get => usuarioSeleccionado; set => usuarioSeleccionado = value; }

        public frmBuscarEmpleados()
        {
            InitializeComponent();
            this.CenterToParent();
            daoRRHH = new RRHHWS.RRHHWSClient();
            dgvUsuarios.AutoGenerateColumns = false;
        }
        private frmPrincipal _frmPrincipal;
        public frmBuscarEmpleados(frmPrincipal _frmPrincipal)
        {
            InitializeComponent();
            this.CenterToParent();
            daoRRHH = new RRHHWS.RRHHWSClient();
            dgvUsuarios.AutoGenerateColumns = false;
            this._frmPrincipal = _frmPrincipal;
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            //RRHHWS.usuario[] empleados = daoRRHH.listarUsuariosPorDocumentoNombre(txtDNINombre.Text);
            //if (empleados != null)
            //    dgvUsuarios.DataSource = empleados.ToList();
            //else
            //    dgvUsuarios.DataSource = null;
        }

        private void dgvUsuarios_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            RRHHWS.usuario usuario = (RRHHWS.usuario)dgvUsuarios.Rows[e.RowIndex].DataBoundItem;
            dgvUsuarios.Rows[e.RowIndex].Cells[0].Value = usuario.nombre + " " + usuario.apellido;
            dgvUsuarios.Rows[e.RowIndex].Cells[2].Value = usuario.tipoDeDocumento.ToString();
            dgvUsuarios.Rows[e.RowIndex].Cells[3].Value = usuario.numDeDocumento;
            dgvUsuarios.Rows[e.RowIndex].Cells[4].Value = usuario.fechaIngreso;
            if (usuario is RRHHWS.supervisorDeAlmacen)
            {
                dgvUsuarios.Rows[e.RowIndex].Cells[1].Value = "Sup. almacen";

            }
            else if(usuario is RRHHWS.vendedor)
            {
                dgvUsuarios.Rows[e.RowIndex].Cells[1].Value = "Vendedor";
            }
            else
            {
                dgvUsuarios.Rows[e.RowIndex].Cells[1].Value = "Administrador";
            }
        }

        private void btSeleccionar_Click(object sender, EventArgs e)
        {
            if (dgvUsuarios.CurrentRow != null)
            {
                usuarioSeleccionado = (RRHHWS.usuario)dgvUsuarios.CurrentRow.DataBoundItem;
                this.DialogResult = DialogResult.OK;
            }
        }
    }
}
