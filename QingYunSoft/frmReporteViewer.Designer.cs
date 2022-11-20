namespace QingYunSoft
{
    partial class frmReporteViewer
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmReporteViewer));
            this.PDFview = new AxAcroPDFLib.AxAcroPDF();
            this.btDescagar = new System.Windows.Forms.Button();
            this.panel1 = new System.Windows.Forms.Panel();
            this.panel2 = new System.Windows.Forms.Panel();
            this.panel3 = new System.Windows.Forms.Panel();
            ((System.ComponentModel.ISupportInitialize)(this.PDFview)).BeginInit();
            this.panel1.SuspendLayout();
            this.panel2.SuspendLayout();
            this.panel3.SuspendLayout();
            this.SuspendLayout();
            // 
            // PDFview
            // 
            this.PDFview.Dock = System.Windows.Forms.DockStyle.Fill;
            this.PDFview.Enabled = true;
            this.PDFview.Location = new System.Drawing.Point(0, 0);
            this.PDFview.Name = "PDFview";
            this.PDFview.OcxState = ((System.Windows.Forms.AxHost.State)(resources.GetObject("PDFview.OcxState")));
            this.PDFview.Size = new System.Drawing.Size(667, 771);
            this.PDFview.TabIndex = 0;
            // 
            // btDescagar
            // 
            this.btDescagar.Dock = System.Windows.Forms.DockStyle.Right;
            this.btDescagar.Location = new System.Drawing.Point(582, 10);
            this.btDescagar.Name = "btDescagar";
            this.btDescagar.Size = new System.Drawing.Size(75, 30);
            this.btDescagar.TabIndex = 1;
            this.btDescagar.Text = "Descargar";
            this.btDescagar.UseVisualStyleBackColor = true;
            this.btDescagar.Click += new System.EventHandler(this.btDescagar_Click);
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.PDFview);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(667, 771);
            this.panel1.TabIndex = 2;
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.btDescagar);
            this.panel2.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.panel2.Location = new System.Drawing.Point(0, 771);
            this.panel2.Name = "panel2";
            this.panel2.Padding = new System.Windows.Forms.Padding(10);
            this.panel2.Size = new System.Drawing.Size(667, 50);
            this.panel2.TabIndex = 4;
            // 
            // panel3
            // 
            this.panel3.Controls.Add(this.panel1);
            this.panel3.Controls.Add(this.panel2);
            this.panel3.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel3.Location = new System.Drawing.Point(20, 20);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(667, 821);
            this.panel3.TabIndex = 5;
            // 
            // frmReporteViewer
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(707, 861);
            this.Controls.Add(this.panel3);
            this.Name = "frmReporteViewer";
            this.Padding = new System.Windows.Forms.Padding(20);
            this.Text = "frmReporteViewer";
            ((System.ComponentModel.ISupportInitialize)(this.PDFview)).EndInit();
            this.panel1.ResumeLayout(false);
            this.panel2.ResumeLayout(false);
            this.panel3.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private AxAcroPDFLib.AxAcroPDF PDFview;
        private System.Windows.Forms.Button btDescagar;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Panel panel3;
    }
}