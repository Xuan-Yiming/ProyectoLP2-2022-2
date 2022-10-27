﻿namespace QingYunSoft
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
            this.panel4 = new System.Windows.Forms.Panel();
            this.btRegistrarPago = new System.Windows.Forms.Button();
            this.panel3 = new System.Windows.Forms.Panel();
            this.btRegistrarReclamo = new System.Windows.Forms.Button();
            this.panel2 = new System.Windows.Forms.Panel();
            this.btNuevaVenta = new System.Windows.Forms.Button();
            this.panel5 = new System.Windows.Forms.Panel();
            this.panel6 = new System.Windows.Forms.Panel();
            this.panel10 = new System.Windows.Forms.Panel();
            this.dgvVentas = new System.Windows.Forms.DataGridView();
            this.ID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.nombreCliente = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.fechaVenta = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.moneda = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.monto = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.anulado = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.panel7 = new System.Windows.Forms.Panel();
            this.panel9 = new System.Windows.Forms.Panel();
            this.btBuscar = new System.Windows.Forms.Button();
            this.panel8 = new System.Windows.Forms.Panel();
            this.label1 = new System.Windows.Forms.Label();
            this.panel1.SuspendLayout();
            this.panel4.SuspendLayout();
            this.panel3.SuspendLayout();
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
            this.panel1.Controls.Add(this.panel4);
            this.panel1.Controls.Add(this.panel3);
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
            // panel4
            // 
            this.panel4.Controls.Add(this.btRegistrarPago);
            this.panel4.Dock = System.Windows.Forms.DockStyle.Left;
            this.panel4.Location = new System.Drawing.Point(247, 0);
            this.panel4.Margin = new System.Windows.Forms.Padding(2);
            this.panel4.Name = "panel4";
            this.panel4.Padding = new System.Windows.Forms.Padding(7, 13, 27, 13);
            this.panel4.Size = new System.Drawing.Size(107, 129);
            this.panel4.TabIndex = 2;
            // 
            // btRegistrarPago
            // 
            this.btRegistrarPago.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btRegistrarPago.FlatAppearance.BorderSize = 0;
            this.btRegistrarPago.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btRegistrarPago.Image = global::QingYunSoft.Properties.Resources.creditcard;
            this.btRegistrarPago.ImageAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.btRegistrarPago.Location = new System.Drawing.Point(7, 13);
            this.btRegistrarPago.Margin = new System.Windows.Forms.Padding(2);
            this.btRegistrarPago.Name = "btRegistrarPago";
            this.btRegistrarPago.Size = new System.Drawing.Size(73, 103);
            this.btRegistrarPago.TabIndex = 0;
            this.btRegistrarPago.Text = "Registrar Pago";
            this.btRegistrarPago.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            this.btRegistrarPago.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.btRegistrarPago.UseVisualStyleBackColor = true;
            // 
            // panel3
            // 
            this.panel3.Controls.Add(this.btRegistrarReclamo);
            this.panel3.Dock = System.Windows.Forms.DockStyle.Left;
            this.panel3.Location = new System.Drawing.Point(140, 0);
            this.panel3.Margin = new System.Windows.Forms.Padding(2);
            this.panel3.Name = "panel3";
            this.panel3.Padding = new System.Windows.Forms.Padding(7, 13, 27, 13);
            this.panel3.Size = new System.Drawing.Size(107, 129);
            this.panel3.TabIndex = 1;
            // 
            // btRegistrarReclamo
            // 
            this.btRegistrarReclamo.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btRegistrarReclamo.FlatAppearance.BorderSize = 0;
            this.btRegistrarReclamo.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btRegistrarReclamo.Image = global::QingYunSoft.Properties.Resources.exclamationmark_triangle;
            this.btRegistrarReclamo.ImageAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.btRegistrarReclamo.Location = new System.Drawing.Point(7, 13);
            this.btRegistrarReclamo.Margin = new System.Windows.Forms.Padding(2);
            this.btRegistrarReclamo.Name = "btRegistrarReclamo";
            this.btRegistrarReclamo.Size = new System.Drawing.Size(73, 103);
            this.btRegistrarReclamo.TabIndex = 0;
            this.btRegistrarReclamo.Text = "Registrar Reclamo";
            this.btRegistrarReclamo.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            this.btRegistrarReclamo.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.btRegistrarReclamo.UseVisualStyleBackColor = true;
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
            this.nombreCliente,
            this.fechaVenta,
            this.moneda,
            this.monto,
            this.anulado});
            this.dgvVentas.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dgvVentas.GridColor = System.Drawing.SystemColors.ActiveBorder;
            this.dgvVentas.Location = new System.Drawing.Point(0, 0);
            this.dgvVentas.Name = "dgvVentas";
            this.dgvVentas.ReadOnly = true;
            this.dgvVentas.RowHeadersVisible = false;
            this.dgvVentas.RowHeadersWidth = 62;
            this.dgvVentas.Size = new System.Drawing.Size(727, 398);
            this.dgvVentas.TabIndex = 1;
            this.dgvVentas.CellContentDoubleClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvVentas_CellContentDoubleClick);
            // 
            // ID
            // 
            this.ID.HeaderText = "Numero Venta";
            this.ID.MinimumWidth = 8;
            this.ID.Name = "ID";
            this.ID.ReadOnly = true;
            this.ID.Width = 150;
            // 
            // nombreCliente
            // 
            this.nombreCliente.HeaderText = "Nombre Cliente";
            this.nombreCliente.MinimumWidth = 8;
            this.nombreCliente.Name = "nombreCliente";
            this.nombreCliente.ReadOnly = true;
            this.nombreCliente.Width = 200;
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
            this.moneda.Width = 50;
            // 
            // monto
            // 
            this.monto.HeaderText = "Monto Total";
            this.monto.MinimumWidth = 8;
            this.monto.Name = "monto";
            this.monto.ReadOnly = true;
            // 
            // anulado
            // 
            this.anulado.HeaderText = "Anulado";
            this.anulado.MinimumWidth = 8;
            this.anulado.Name = "anulado";
            this.anulado.ReadOnly = true;
            this.anulado.Width = 50;
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
            this.panel4.ResumeLayout(false);
            this.panel3.ResumeLayout(false);
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
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.Button btRegistrarReclamo;
        private System.Windows.Forms.Panel panel4;
        private System.Windows.Forms.Button btRegistrarPago;
        private System.Windows.Forms.Panel panel5;
        private System.Windows.Forms.Panel panel6;
        private System.Windows.Forms.Panel panel7;
        private System.Windows.Forms.Button btBuscar;
        private System.Windows.Forms.Panel panel8;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Panel panel9;
        private System.Windows.Forms.Panel panel10;
        private System.Windows.Forms.DataGridView dgvVentas;
        private System.Windows.Forms.DataGridViewTextBoxColumn ID;
        private System.Windows.Forms.DataGridViewTextBoxColumn nombreCliente;
        private System.Windows.Forms.DataGridViewTextBoxColumn fechaVenta;
        private System.Windows.Forms.DataGridViewTextBoxColumn moneda;
        private System.Windows.Forms.DataGridViewTextBoxColumn monto;
        private System.Windows.Forms.DataGridViewTextBoxColumn anulado;
    }
}