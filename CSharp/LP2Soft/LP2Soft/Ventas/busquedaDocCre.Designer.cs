namespace LP2Soft.Ventas
{
    partial class busquedaDocCre
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
            this.label7 = new System.Windows.Forms.Label();
            this.btnAgregado = new System.Windows.Forms.Button();
            this.btnRegsar = new System.Windows.Forms.Button();
            this.BtnSeleccionar = new System.Windows.Forms.Button();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.colID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colMonto = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colFechaDeVec = new System.Windows.Forms.DataGridViewTextBoxColumn();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.Location = new System.Drawing.Point(26, 9);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(161, 20);
            this.label7.TabIndex = 20;
            this.label7.Text = "Documento credito";
            // 
            // btnAgregado
            // 
            this.btnAgregado.Location = new System.Drawing.Point(348, 389);
            this.btnAgregado.Name = "btnAgregado";
            this.btnAgregado.Size = new System.Drawing.Size(75, 23);
            this.btnAgregado.TabIndex = 19;
            this.btnAgregado.Text = "Agregar";
            this.btnAgregado.UseVisualStyleBackColor = true;
            this.btnAgregado.Click += new System.EventHandler(this.btnAgregado_Click);
            // 
            // btnRegsar
            // 
            this.btnRegsar.Location = new System.Drawing.Point(30, 389);
            this.btnRegsar.Name = "btnRegsar";
            this.btnRegsar.Size = new System.Drawing.Size(75, 23);
            this.btnRegsar.TabIndex = 18;
            this.btnRegsar.Text = "regresar";
            this.btnRegsar.UseVisualStyleBackColor = true;
            this.btnRegsar.Click += new System.EventHandler(this.btnRegsar_Click);
            // 
            // BtnSeleccionar
            // 
            this.BtnSeleccionar.Location = new System.Drawing.Point(439, 389);
            this.BtnSeleccionar.Name = "BtnSeleccionar";
            this.BtnSeleccionar.Size = new System.Drawing.Size(75, 23);
            this.BtnSeleccionar.TabIndex = 17;
            this.BtnSeleccionar.Text = "Seleccionar";
            this.BtnSeleccionar.UseVisualStyleBackColor = true;
            this.BtnSeleccionar.Click += new System.EventHandler(this.BtnSeleccionar_Click);
            // 
            // dataGridView1
            // 
            this.dataGridView1.AllowUserToAddRows = false;
            this.dataGridView1.AllowUserToDeleteRows = false;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.colID,
            this.colMonto,
            this.colFechaDeVec});
            this.dataGridView1.Location = new System.Drawing.Point(30, 42);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.Size = new System.Drawing.Size(484, 341);
            this.dataGridView1.TabIndex = 16;
            // 
            // colID
            // 
            this.colID.HeaderText = "ID";
            this.colID.Name = "colID";
            this.colID.Width = 70;
            // 
            // colMonto
            // 
            this.colMonto.HeaderText = "monto";
            this.colMonto.Name = "colMonto";
            this.colMonto.Width = 50;
            // 
            // colFechaDeVec
            // 
            this.colFechaDeVec.HeaderText = "fecha de vencimiento";
            this.colFechaDeVec.Name = "colFechaDeVec";
            // 
            // busquedaDocCre
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(536, 450);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.btnAgregado);
            this.Controls.Add(this.btnRegsar);
            this.Controls.Add(this.BtnSeleccionar);
            this.Controls.Add(this.dataGridView1);
            this.Name = "busquedaDocCre";
            this.Text = "busquedaDocCre";
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Button btnAgregado;
        private System.Windows.Forms.Button btnRegsar;
        private System.Windows.Forms.Button BtnSeleccionar;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.DataGridViewTextBoxColumn colID;
        private System.Windows.Forms.DataGridViewTextBoxColumn colMonto;
        private System.Windows.Forms.DataGridViewTextBoxColumn colFechaDeVec;
    }
}