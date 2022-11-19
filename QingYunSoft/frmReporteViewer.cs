using System;
using System.IO;
using System.Windows.Forms;

namespace QingYunSoft
{
    public partial class frmReporteViewer : Form
    {
        private SaveFileDialog sfdArchivo;
        private Byte[] _archivo;
        public frmReporteViewer(Byte[] recurso)
        {
            InitializeComponent();
            _archivo = recurso;
            File.WriteAllBytes("temp.pdf", recurso);
            PDFview.LoadFile("temp.pdf");
            PDFview.setShowScrollbars(true);
        }

        private void btDescagar_Click(object sender, EventArgs e)
        {
            sfdArchivo = new System.Windows.Forms.SaveFileDialog();
            sfdArchivo.Filter = "PDF Files (*.pdf)|*.pdf";
            if (sfdArchivo.ShowDialog() == DialogResult.OK)
            {
                try
                {
                    String archivoGenerar = sfdArchivo.FileName;
                    File.WriteAllBytes(archivoGenerar, _archivo);
                    MessageBox.Show("Se ha guardado el archivo", "Mensaje de Confirmación", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Se ha generado un error al momento de guardar el archivo", "Mensaje de Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }
    }
}
