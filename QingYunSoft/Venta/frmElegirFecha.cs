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
        public frmElegirFecha()
        {
            InitializeComponent();
            CenterToScreen();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            daoReportes = new ReportesWS.ReporteWSClient();
            frmReporteViewer _frmReporteViewer = new frmReporteViewer(daoReportes.generarReporteVentasPeriodo(this.dateTimePicker1.Value, this.dateTimePicker2.Value));
            _frmReporteViewer.Show();
        }
    }
}
