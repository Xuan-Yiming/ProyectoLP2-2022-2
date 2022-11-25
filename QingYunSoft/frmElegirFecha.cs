using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QingYunSoft.Venta
{
    public partial class frmElegirFecha : Form
    {
        private ReportesWS.ReporteWSClient daoReportes;
        private int opcion;
        public frmElegirFecha(int opcion)
        {
            InitializeComponent();            
            CenterToScreen();

            this.opcion = opcion;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            daoReportes = new ReportesWS.ReporteWSClient();
            frmReporteViewer _frmReporteViewer;
            switch (opcion)
            {
                case 1:
                    _frmReporteViewer = new frmReporteViewer(daoReportes.generarReporteVentasPeriodo(this.dateTimePicker1.Value, this.dateTimePicker2.Value));
                    break;
                case 2:
                    _frmReporteViewer = new frmReporteViewer(daoReportes.generarReporteTop5Clientes(this.dateTimePicker1.Value, this.dateTimePicker2.Value));
                    break;
                case 3:
                    _frmReporteViewer = new frmReporteViewer(daoReportes.generarReporteVendedoresMasVentas(this.dateTimePicker1.Value, this.dateTimePicker2.Value));
                    break;
                default:
                    break;
            }
            
            
            _frmReporteViewer.Show();
        }
    }
}
