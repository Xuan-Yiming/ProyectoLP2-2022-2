namespace QingYunSoft
{
    partial class frmVentas
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
            this.panel1 = new System.Windows.Forms.Panel();
            this.panel12 = new System.Windows.Forms.Panel();
            this.btReporteReclamos = new System.Windows.Forms.Button();
            this.panel11 = new System.Windows.Forms.Panel();
            this.btReporteClienteAdeudados = new System.Windows.Forms.Button();
            this.panel2 = new System.Windows.Forms.Panel();
            this.btNuevaVenta = new System.Windows.Forms.Button();
            this.panel5 = new System.Windows.Forms.Panel();
            this.panel6 = new System.Windows.Forms.Panel();
            this.panel10 = new System.Windows.Forms.Panel();
            this.dgvVentas = new System.Windows.Forms.DataGridView();
            this.ID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.vendedor = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.cliente = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.fechaVenta = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.moneda = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.monto = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.panel7 = new System.Windows.Forms.Panel();
            this.panel9 = new System.Windows.Forms.Panel();
            this.btBuscar = new System.Windows.Forms.Button();
            this.panel8 = new System.Windows.Forms.Panel();
            this.label1 = new System.Windows.Forms.Label();
            this.panel1.SuspendLayout();
            this.panel12.SuspendLayout();
            this.panel11.SuspendLayout();
            this.panel2.SuspendLayout();
            this.panel6.SuspendLayout();
            this.panel10.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvVentas)).BeginInit();
            this.panel7.SuspendLayout();
            this.panel9.SuspendLayout();
            this.panel8.SuspendLayout();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.panel12);
            this.panel1.Controls.Add(this.panel11);
            this.panel1.Controls.Add(this.panel2);
            this.panel1.Controls.Add(this.panel5);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Margin = new System.Windows.Forms.Padding(2);
            this.panel1.Name = "panel1";
            this.panel1.Padding = new System.Windows.Forms.Padding(33, 0, 33, 0);
            this.panel1.Size = new System.Drawing.Size(827, 130);
            this.panel1.TabIndex = 0;
            // 
            // panel12
            // 
            this.panel12.Controls.Add(this.btReporteReclamos);
            this.panel12.Dock = System.Windows.Forms.DockStyle.Left;
            this.panel12.Location = new System.Drawing.Point(247, 0);
            this.panel12.Margin = new System.Windows.Forms.Padding(2);
            this.panel12.Name = "panel12";
            this.panel12.Padding = new System.Windows.Forms.Padding(7, 13, 27, 13);
            this.panel12.Size = new System.Drawing.Size(107, 129);
            this.panel12.TabIndex = 4;
            this.panel12.Visible = false;
            // 
            // btReporteReclamos
            // 
            this.btReporteReclamos.BackColor = System.Drawing.SystemColors.ControlLightLight;
            this.btReporteReclamos.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btReporteReclamos.FlatAppearance.BorderSize = 0;
            this.btReporteReclamos.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btReporteReclamos.Image = global::QingYunSoft.Properties.Resources.doc_text;
            this.btReporteReclamos.Location = new System.Drawing.Point(7, 13);
            this.btReporteReclamos.Margin = new System.Windows.Forms.Padding(2);
            this.btReporteReclamos.Name = "btReporteReclamos";
            this.btReporteReclamos.Size = new System.Drawing.Size(73, 103);
            this.btReporteReclamos.TabIndex = 0;
            this.btReporteReclamos.Text = "Reclamos";
            this.btReporteReclamos.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            this.btReporteReclamos.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.btReporteReclamos.UseVisualStyleBackColor = false;
            this.btReporteReclamos.Click += new System.EventHandler(this.btReporteReclamos_Click);
            // 
            // panel11
            // 
            this.panel11.Controls.Add(this.btReporteClienteAdeudados);
            this.panel11.Dock = System.Windows.Forms.DockStyle.Left;
            this.panel11.Location = new System.Drawing.Point(140, 0);
            this.panel11.Margin = new System.Windows.Forms.Padding(2);
            this.panel11.Name = "panel11";
            this.panel11.Padding = new System.Windows.Forms.Padding(7, 13, 27, 13);
            this.panel11.Size = new System.Drawing.Size(107, 129);
            this.panel11.TabIndex = 3;
            // 
            // btReporteClienteAdeudados
            // 
            this.btReporteClienteAdeudados.BackColor = System.Drawing.SystemColors.ControlLightLight;
            this.btReporteClienteAdeudados.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btReporteClienteAdeudados.FlatAppearance.BorderSize = 0;
            this.btReporteClienteAdeudados.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btReporteClienteAdeudados.Image = global::QingYunSoft.Properties.Resources.doc_text;
            this.btReporteClienteAdeudados.Location = new System.Drawing.Point(7, 13);
            this.btReporteClienteAdeudados.Margin = new System.Windows.Forms.Padding(2);
            this.btReporteClienteAdeudados.Name = "btReporteClienteAdeudados";
            this.btReporteClienteAdeudados.Size = new System.Drawing.Size(73, 103);
            this.btReporteClienteAdeudados.TabIndex = 0;
            this.btReporteClienteAdeudados.Text = "Reporte de Ventas Por Periodo";
            this.btReporteClienteAdeudados.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            this.btReporteClienteAdeudados.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.btReporteClienteAdeudados.UseVisualStyleBackColor = false;
            this.btReporteClienteAdeudados.Click += new System.EventHandler(this.btReporteVEntasPorPeriodo_Click);
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.btNuevaVenta);
            this.panel2.Dock = System.Windows.Forms.DockStyle.Left;
            this.panel2.Location = new System.Drawing.Point(33, 0);
            this.panel2.Margin = new System.Windows.Forms.Padding(2);
            this.panel2.Name = "panel2";
            this.panel2.Padding = new System.Windows.Forms.Padding(7, 13, 27, 13);
            this.panel2.Size = new System.Drawing.Size(107, 129);
            this.panel2.TabIndex = 0;
            // 
            // btNuevaVenta
            // 
            this.btNuevaVenta.BackColor = System.Drawing.SystemColors.ControlLightLight;
            this.btNuevaVenta.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btNuevaVenta.FlatAppearance.BorderSize = 0;
            this.btNuevaVenta.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btNuevaVenta.Image = global::QingYunSoft.Properties.Resources.doc;
            this.btNuevaVenta.Location = new System.Drawing.Point(7, 13);
            this.btNuevaVenta.Margin = new System.Windows.Forms.Padding(2);
            this.btNuevaVenta.Name = "btNuevaVenta";
            this.btNuevaVenta.Size = new System.Drawing.Size(73, 103);
            this.btNuevaVenta.TabIndex = 0;
            this.btNuevaVenta.Text = "Venta Nueva";
            this.btNuevaVenta.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            this.btNuevaVenta.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.btNuevaVenta.UseVisualStyleBackColor = false;
            this.btNuevaVenta.Click += new System.EventHandler(this.btNuevaVenta_Click);
            // 
            // panel5
            // 
            this.panel5.BackColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.panel5.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.panel5.Location = new System.Drawing.Point(33, 129);
            this.panel5.Name = "panel5";
            this.panel5.Size = new System.Drawing.Size(761, 1);
            this.panel5.TabIndex = 0;
            // 
            // panel6
            // 
            this.panel6.Controls.Add(this.panel10);
            this.panel6.Controls.Add(this.panel7);
            this.panel6.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel6.Location = new System.Drawing.Point(0, 130);
            this.panel6.Name = "panel6";
            this.panel6.Padding = new System.Windows.Forms.Padding(50, 0, 50, 20);
            this.panel6.Size = new System.Drawing.Size(827, 458);
            this.panel6.TabIndex = 1;
            // 
            // panel10
            // 
            this.panel10.Controls.Add(this.dgvVentas);
            this.panel10.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel10.Location = new System.Drawing.Point(50, 40);
            this.panel10.Name = "panel10";
            this.panel10.Size = new System.Drawing.Size(727, 398);
            this.panel10.TabIndex = 1;
            // 
            // dgvVentas
            // 
            this.dgvVentas.AllowUserToAddRows = false;
            this.dgvVentas.AllowUserToDeleteRows = false;
            this.dgvVentas.BackgroundColor = System.Drawing.SystemColors.ControlLightLight;
            this.dgvVentas.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.dgvVentas.ColumnHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.Single;
            this.dgvVentas.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvVentas.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.ID,
            this.vendedor,
            this.cliente,
            this.fechaVenta,
            this.moneda,
            this.monto});
            this.dgvVentas.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dgvVentas.GridColor = System.Drawing.SystemColors.ActiveBorder;
            this.dgvVentas.Location = new System.Drawing.Point(0, 0);
            this.dgvVentas.Name = "dgvVentas";
            this.dgvVentas.ReadOnly = true;
            this.dgvVentas.RowHeadersVisible = false;
            this.dgvVentas.RowHeadersWidth = 62;
            this.dgvVentas.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvVentas.Size = new System.Drawing.Size(727, 398);
            this.dgvVentas.TabIndex = 1;
            this.dgvVentas.CellDoubleClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvVentas_CellDoubleClick);
            this.dgvVentas.CellFormatting += new System.Windows.Forms.DataGridViewCellFormattingEventHandler(this.dgvVentas_CellFormatting);
            // 
            // ID
            // 
            this.ID.HeaderText = "Numero Venta";
            this.ID.MinimumWidth = 8;
            this.ID.Name = "ID";
            this.ID.ReadOnly = true;
            this.ID.Width = 80;
            // 
            // vendedor
            // 
            this.vendedor.HeaderText = "Vendedor";
            this.vendedor.Name = "vendedor";
            this.vendedor.ReadOnly = true;
            this.vendedor.Width = 150;
            // 
            // cliente
            // 
            this.cliente.HeaderText = "Cliente";
            this.cliente.Name = "cliente";
            this.cliente.ReadOnly = true;
            this.cliente.Width = 150;
            // 
            // fechaVenta
            // 
            this.fechaVenta.HeaderText = "Fecha de Venta";
            this.fechaVenta.MinimumWidth = 8;
            this.fechaVenta.Name = "fechaVenta";
            this.fechaVenta.ReadOnly = true;
            this.fechaVenta.Width = 150;
            // 
            // moneda
            // 
            this.moneda.HeaderText = "Moneda";
            this.moneda.MinimumWidth = 8;
            this.moneda.Name = "moneda";
            this.moneda.ReadOnly = true;
            this.moneda.Width = 60;
            // 
            // monto
            // 
            this.monto.HeaderText = "Monto Total";
            this.monto.MinimumWidth = 8;
            this.monto.Name = "monto";
            this.monto.ReadOnly = true;
            this.monto.Width = 125;
            // 
            // panel7
            // 
            this.panel7.Controls.Add(this.panel9);
            this.panel7.Controls.Add(this.panel8);
            this.panel7.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel7.Location = new System.Drawing.Point(50, 0);
            this.panel7.Name = "panel7";
            this.panel7.Size = new System.Drawing.Size(727, 40);
            this.panel7.TabIndex = 0;
            // 
            // panel9
            // 
            this.panel9.Controls.Add(this.btBuscar);
            this.panel9.Dock = System.Windows.Forms.DockStyle.Right;
            this.panel9.Location = new System.Drawing.Point(687, 0);
            this.panel9.Name = "panel9";
            this.panel9.Padding = new System.Windows.Forms.Padding(5);
            this.panel9.Size = new System.Drawing.Size(40, 40);
            this.panel9.TabIndex = 1;
            // 
            // btBuscar
            // 
            this.btBuscar.BackgroundImage = global::QingYunSoft.Properties.Resources.magnifyingglass;
            this.btBuscar.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.btBuscar.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btBuscar.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btBuscar.FlatAppearance.BorderSize = 0;
            this.btBuscar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btBuscar.Location = new System.Drawing.Point(5, 5);
            this.btBuscar.Name = "btBuscar";
            this.btBuscar.Padding = new System.Windows.Forms.Padding(10);
            this.btBuscar.Size = new System.Drawing.Size(30, 30);
            this.btBuscar.TabIndex = 1;
            this.btBuscar.UseVisualStyleBackColor = true;
            this.btBuscar.Click += new System.EventHandler(this.btBuscar_Click);
            // 
            // panel8
            // 
            this.panel8.Controls.Add(this.label1);
            this.panel8.Dock = System.Windows.Forms.DockStyle.Left;
            this.panel8.Location = new System.Drawing.Point(0, 0);
            this.panel8.Name = "panel8";
            this.panel8.Padding = new System.Windows.Forms.Padding(0, 10, 0, 0);
            this.panel8.Size = new System.Drawing.Size(304, 40);
            this.panel8.TabIndex = 0;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Dock = System.Windows.Forms.DockStyle.Left;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(0, 10);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(117, 20);
            this.label1.TabIndex = 0;
            this.label1.Text = "Ultimas Ventas";
            // 
            // frmVentas
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ControlLightLight;
            this.ClientSize = new System.Drawing.Size(827, 588);
            this.Controls.Add(this.panel6);
            this.Controls.Add(this.panel1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "frmVentas";
            this.panel1.ResumeLayout(false);
            this.panel12.ResumeLayout(false);
            this.panel11.ResumeLayout(false);
            this.panel2.ResumeLayout(false);
            this.panel6.ResumeLayout(false);
            this.panel10.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvVentas)).EndInit();
            this.panel7.ResumeLayout(false);
            this.panel9.ResumeLayout(false);
            this.panel8.ResumeLayout(false);
            this.panel8.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Button btNuevaVenta;
        private System.Windows.Forms.Panel panel5;
        private System.Windows.Forms.Panel panel6;
        private System.Windows.Forms.Panel panel7;
        private System.Windows.Forms.Button btBuscar;
        private System.Windows.Forms.Panel panel8;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Panel panel9;
        private System.Windows.Forms.Panel panel10;
        private System.Windows.Forms.DataGridView dgvVentas;
        private System.Windows.Forms.Panel panel12;
        private System.Windows.Forms.Button btReporteReclamos;
        private System.Windows.Forms.Panel panel11;
        private System.Windows.Forms.Button btReporteClienteAdeudados;
        private System.Windows.Forms.DataGridViewTextBoxColumn ID;
        private System.Windows.Forms.DataGridViewTextBoxColumn vendedor;
        private System.Windows.Forms.DataGridViewTextBoxColumn cliente;
        private System.Windows.Forms.DataGridViewTextBoxColumn fechaVenta;
        private System.Windows.Forms.DataGridViewTextBoxColumn moneda;
        private System.Windows.Forms.DataGridViewTextBoxColumn monto;
    }
}