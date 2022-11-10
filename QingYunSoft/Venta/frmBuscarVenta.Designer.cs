namespace QingYunSoft.Venta
{
    partial class frmBuscarVenta
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
            this.label1 = new System.Windows.Forms.Label();
            this.txtCliente = new System.Windows.Forms.TextBox();
            this.dgvVentas = new System.Windows.Forms.DataGridView();
            this.ID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.nombreCliente = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.fechaVenta = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.moneda = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.monto = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.label2 = new System.Windows.Forms.Label();
            this.dtpFecha = new System.Windows.Forms.DateTimePicker();
            this.btBuscarPorCliente = new System.Windows.Forms.Button();
            this.btBuscarPorFecha = new System.Windows.Forms.Button();
            this.btSeleccionar = new System.Windows.Forms.Button();
            this.btBuscarCliente = new System.Windows.Forms.Button();
            this.btCancelar = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgvVentas)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(16, 41);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(48, 16);
            this.label1.TabIndex = 0;
            this.label1.Text = "Cliente";
            // 
            // txtCliente
            // 
            this.txtCliente.Enabled = false;
            this.txtCliente.Location = new System.Drawing.Point(192, 37);
            this.txtCliente.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.txtCliente.Name = "txtCliente";
            this.txtCliente.Size = new System.Drawing.Size(216, 22);
            this.txtCliente.TabIndex = 1;
            // 
            // dgvVentas
            // 
            this.dgvVentas.AllowUserToAddRows = false;
            this.dgvVentas.AllowUserToDeleteRows = false;
            this.dgvVentas.BackgroundColor = System.Drawing.SystemColors.Control;
            this.dgvVentas.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.dgvVentas.ColumnHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.Single;
            this.dgvVentas.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvVentas.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.ID,
            this.nombreCliente,
            this.fechaVenta,
            this.moneda,
            this.monto});
            this.dgvVentas.GridColor = System.Drawing.SystemColors.ActiveBorder;
            this.dgvVentas.Location = new System.Drawing.Point(16, 129);
            this.dgvVentas.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.dgvVentas.Name = "dgvVentas";
            this.dgvVentas.ReadOnly = true;
            this.dgvVentas.RowHeadersVisible = false;
            this.dgvVentas.RowHeadersWidth = 51;
            this.dgvVentas.Size = new System.Drawing.Size(937, 350);
            this.dgvVentas.TabIndex = 2;
            this.dgvVentas.CellFormatting += new System.Windows.Forms.DataGridViewCellFormattingEventHandler(this.dgvVentas_CellFormatting);
            // 
            // ID
            // 
            this.ID.HeaderText = "Numero Venta";
            this.ID.MinimumWidth = 6;
            this.ID.Name = "ID";
            this.ID.ReadOnly = true;
            this.ID.Width = 125;
            // 
            // nombreCliente
            // 
            this.nombreCliente.HeaderText = "Nombre Cliente";
            this.nombreCliente.MinimumWidth = 6;
            this.nombreCliente.Name = "nombreCliente";
            this.nombreCliente.ReadOnly = true;
            this.nombreCliente.Width = 250;
            // 
            // fechaVenta
            // 
            this.fechaVenta.HeaderText = "Fecha de Venta";
            this.fechaVenta.MinimumWidth = 6;
            this.fechaVenta.Name = "fechaVenta";
            this.fechaVenta.ReadOnly = true;
            this.fechaVenta.Width = 150;
            // 
            // moneda
            // 
            this.moneda.HeaderText = "Moneda";
            this.moneda.MinimumWidth = 6;
            this.moneda.Name = "moneda";
            this.moneda.ReadOnly = true;
            this.moneda.Width = 50;
            // 
            // monto
            // 
            this.monto.HeaderText = "Monto Total";
            this.monto.MinimumWidth = 6;
            this.monto.Name = "monto";
            this.monto.ReadOnly = true;
            this.monto.Width = 125;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(16, 87);
            this.label2.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(114, 16);
            this.label2.TabIndex = 3;
            this.label2.Text = "Fecha de la venta";
            // 
            // dtpFecha
            // 
            this.dtpFecha.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtpFecha.Location = new System.Drawing.Point(192, 80);
            this.dtpFecha.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.dtpFecha.Name = "dtpFecha";
            this.dtpFecha.Size = new System.Drawing.Size(265, 23);
            this.dtpFecha.TabIndex = 7;
            // 
            // btBuscarPorCliente
            // 
            this.btBuscarPorCliente.Location = new System.Drawing.Point(515, 33);
            this.btBuscarPorCliente.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.btBuscarPorCliente.Name = "btBuscarPorCliente";
            this.btBuscarPorCliente.Size = new System.Drawing.Size(147, 28);
            this.btBuscarPorCliente.TabIndex = 8;
            this.btBuscarPorCliente.Text = "Buscar por cliente";
            this.btBuscarPorCliente.UseVisualStyleBackColor = true;
            this.btBuscarPorCliente.Click += new System.EventHandler(this.btBuscarPorCliente_Click);
            // 
            // btBuscarPorFecha
            // 
            this.btBuscarPorFecha.Location = new System.Drawing.Point(515, 76);
            this.btBuscarPorFecha.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.btBuscarPorFecha.Name = "btBuscarPorFecha";
            this.btBuscarPorFecha.Size = new System.Drawing.Size(147, 28);
            this.btBuscarPorFecha.TabIndex = 9;
            this.btBuscarPorFecha.Text = "Buscar por fecha";
            this.btBuscarPorFecha.UseVisualStyleBackColor = true;
            this.btBuscarPorFecha.Click += new System.EventHandler(this.btBuscarPorFecha_Click);
            // 
            // btSeleccionar
            // 
            this.btSeleccionar.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(157)))), ((int)(((byte)(36)))));
            this.btSeleccionar.FlatAppearance.BorderSize = 0;
            this.btSeleccionar.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btSeleccionar.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.btSeleccionar.Location = new System.Drawing.Point(812, 486);
            this.btSeleccionar.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.btSeleccionar.Name = "btSeleccionar";
            this.btSeleccionar.Size = new System.Drawing.Size(141, 36);
            this.btSeleccionar.TabIndex = 10;
            this.btSeleccionar.Text = "Seleccionar";
            this.btSeleccionar.UseVisualStyleBackColor = false;
            this.btSeleccionar.Click += new System.EventHandler(this.btSeleccionar_Click);
            // 
            // btBuscarCliente
            // 
            this.btBuscarCliente.BackgroundImage = global::QingYunSoft.Properties.Resources.magnifyingglass_circle;
            this.btBuscarCliente.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.btBuscarCliente.FlatAppearance.BorderSize = 0;
            this.btBuscarCliente.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btBuscarCliente.Location = new System.Drawing.Point(419, 30);
            this.btBuscarCliente.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.btBuscarCliente.Name = "btBuscarCliente";
            this.btBuscarCliente.Size = new System.Drawing.Size(40, 37);
            this.btBuscarCliente.TabIndex = 11;
            this.btBuscarCliente.UseVisualStyleBackColor = true;
            this.btBuscarCliente.Click += new System.EventHandler(this.btBuscarCliente_Click);
            // 
            // btCancelar
            // 
            this.btCancelar.BackgroundImage = global::QingYunSoft.Properties.Resources.multiply;
            this.btCancelar.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.btCancelar.FlatAppearance.BorderSize = 0;
            this.btCancelar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btCancelar.Location = new System.Drawing.Point(900, 18);
            this.btCancelar.Margin = new System.Windows.Forms.Padding(4, 4, 13, 4);
            this.btCancelar.Name = "btCancelar";
            this.btCancelar.Size = new System.Drawing.Size(53, 62);
            this.btCancelar.TabIndex = 33;
            this.btCancelar.UseVisualStyleBackColor = true;
            this.btCancelar.Click += new System.EventHandler(this.btCancelar_Click);
            // 
            // frmBuscarVenta
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ControlLightLight;
            this.ClientSize = new System.Drawing.Size(971, 550);
            this.Controls.Add(this.btCancelar);
            this.Controls.Add(this.btBuscarCliente);
            this.Controls.Add(this.btSeleccionar);
            this.Controls.Add(this.btBuscarPorFecha);
            this.Controls.Add(this.btBuscarPorCliente);
            this.Controls.Add(this.dtpFecha);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.dgvVentas);
            this.Controls.Add(this.txtCliente);
            this.Controls.Add(this.label1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "frmBuscarVenta";
            this.Text = " ";
            this.MouseDown += new System.Windows.Forms.MouseEventHandler(this.frmBuscarVenta_MouseDown);
            ((System.ComponentModel.ISupportInitialize)(this.dgvVentas)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtCliente;
        private System.Windows.Forms.DataGridView dgvVentas;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.DateTimePicker dtpFecha;
        private System.Windows.Forms.Button btBuscarPorCliente;
        private System.Windows.Forms.Button btBuscarPorFecha;
        private System.Windows.Forms.Button btSeleccionar;
        private System.Windows.Forms.DataGridViewTextBoxColumn ID;
        private System.Windows.Forms.DataGridViewTextBoxColumn nombreCliente;
        private System.Windows.Forms.DataGridViewTextBoxColumn fechaVenta;
        private System.Windows.Forms.DataGridViewTextBoxColumn moneda;
        private System.Windows.Forms.DataGridViewTextBoxColumn monto;
        private System.Windows.Forms.Button btBuscarCliente;
        private System.Windows.Forms.Button btCancelar;
    }
}