namespace QingYunSoft.Cliente
{
    partial class frmClientes
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
            this.panel9 = new System.Windows.Forms.Panel();
            this.btBuscar = new System.Windows.Forms.Button();
            this.panel8 = new System.Windows.Forms.Panel();
            this.panel7 = new System.Windows.Forms.Panel();
            this.panel10 = new System.Windows.Forms.Panel();
            this.dgvVentas = new System.Windows.Forms.DataGridView();
            this.nombreCliente = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tipoCliente = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tipoDocumento = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.nmrDocumento = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.categoria = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.panel6 = new System.Windows.Forms.Panel();
            this.panel2 = new System.Windows.Forms.Panel();
            this.btNuevoCiente = new System.Windows.Forms.Button();
            this.panel5 = new System.Windows.Forms.Panel();
            this.panel1 = new System.Windows.Forms.Panel();
            this.panel9.SuspendLayout();
            this.panel8.SuspendLayout();
            this.panel7.SuspendLayout();
            this.panel10.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvVentas)).BeginInit();
            this.panel6.SuspendLayout();
            this.panel2.SuspendLayout();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Dock = System.Windows.Forms.DockStyle.Left;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(0, 12);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(174, 25);
            this.label1.TabIndex = 0;
            this.label1.Text = "Clientes Recientes";
            // 
            // panel9
            // 
            this.panel9.Controls.Add(this.btBuscar);
            this.panel9.Dock = System.Windows.Forms.DockStyle.Right;
            this.panel9.Location = new System.Drawing.Point(916, 0);
            this.panel9.Margin = new System.Windows.Forms.Padding(4);
            this.panel9.Name = "panel9";
            this.panel9.Padding = new System.Windows.Forms.Padding(7, 6, 7, 6);
            this.panel9.Size = new System.Drawing.Size(53, 49);
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
            this.btBuscar.Location = new System.Drawing.Point(7, 6);
            this.btBuscar.Margin = new System.Windows.Forms.Padding(4);
            this.btBuscar.Name = "btBuscar";
            this.btBuscar.Padding = new System.Windows.Forms.Padding(13, 12, 13, 12);
            this.btBuscar.Size = new System.Drawing.Size(39, 37);
            this.btBuscar.TabIndex = 1;
            this.btBuscar.UseVisualStyleBackColor = true;
            this.btBuscar.Click += new System.EventHandler(this.btBuscar_Click);
            // 
            // panel8
            // 
            this.panel8.Controls.Add(this.label1);
            this.panel8.Dock = System.Windows.Forms.DockStyle.Left;
            this.panel8.Location = new System.Drawing.Point(0, 0);
            this.panel8.Margin = new System.Windows.Forms.Padding(4);
            this.panel8.Name = "panel8";
            this.panel8.Padding = new System.Windows.Forms.Padding(0, 12, 0, 0);
            this.panel8.Size = new System.Drawing.Size(405, 49);
            this.panel8.TabIndex = 0;
            // 
            // panel7
            // 
            this.panel7.Controls.Add(this.panel9);
            this.panel7.Controls.Add(this.panel8);
            this.panel7.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel7.Location = new System.Drawing.Point(67, 0);
            this.panel7.Margin = new System.Windows.Forms.Padding(4);
            this.panel7.Name = "panel7";
            this.panel7.Size = new System.Drawing.Size(969, 49);
            this.panel7.TabIndex = 0;
            // 
            // panel10
            // 
            this.panel10.Controls.Add(this.dgvVentas);
            this.panel10.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel10.Location = new System.Drawing.Point(67, 49);
            this.panel10.Margin = new System.Windows.Forms.Padding(4);
            this.panel10.Name = "panel10";
            this.panel10.Size = new System.Drawing.Size(969, 490);
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
            this.nombreCliente,
            this.tipoCliente,
            this.tipoDocumento,
            this.nmrDocumento,
            this.categoria});
            this.dgvVentas.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dgvVentas.GridColor = System.Drawing.SystemColors.ActiveBorder;
            this.dgvVentas.Location = new System.Drawing.Point(0, 0);
            this.dgvVentas.Margin = new System.Windows.Forms.Padding(4);
            this.dgvVentas.Name = "dgvVentas";
            this.dgvVentas.ReadOnly = true;
            this.dgvVentas.RowHeadersVisible = false;
            this.dgvVentas.RowHeadersWidth = 62;
            this.dgvVentas.Size = new System.Drawing.Size(969, 490);
            this.dgvVentas.TabIndex = 1;
            // 
            // nombreCliente
            // 
            this.nombreCliente.HeaderText = "Nombre Cliente";
            this.nombreCliente.MinimumWidth = 8;
            this.nombreCliente.Name = "nombreCliente";
            this.nombreCliente.ReadOnly = true;
            this.nombreCliente.Width = 200;
            // 
            // tipoCliente
            // 
            this.tipoCliente.HeaderText = "Tipo de cliente";
            this.tipoCliente.MinimumWidth = 8;
            this.tipoCliente.Name = "tipoCliente";
            this.tipoCliente.ReadOnly = true;
            this.tipoCliente.Width = 150;
            // 
            // tipoDocumento
            // 
            this.tipoDocumento.HeaderText = "Tipo de documento";
            this.tipoDocumento.MinimumWidth = 8;
            this.tipoDocumento.Name = "tipoDocumento";
            this.tipoDocumento.ReadOnly = true;
            this.tipoDocumento.Width = 130;
            // 
            // nmrDocumento
            // 
            this.nmrDocumento.HeaderText = "Numero de documento";
            this.nmrDocumento.MinimumWidth = 8;
            this.nmrDocumento.Name = "nmrDocumento";
            this.nmrDocumento.ReadOnly = true;
            this.nmrDocumento.Width = 150;
            // 
            // categoria
            // 
            this.categoria.HeaderText = "Categoria";
            this.categoria.MinimumWidth = 8;
            this.categoria.Name = "categoria";
            this.categoria.ReadOnly = true;
            this.categoria.Width = 70;
            // 
            // panel6
            // 
            this.panel6.Controls.Add(this.panel10);
            this.panel6.Controls.Add(this.panel7);
            this.panel6.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel6.Location = new System.Drawing.Point(0, 160);
            this.panel6.Margin = new System.Windows.Forms.Padding(4);
            this.panel6.Name = "panel6";
            this.panel6.Padding = new System.Windows.Forms.Padding(67, 0, 67, 25);
            this.panel6.Size = new System.Drawing.Size(1103, 564);
            this.panel6.TabIndex = 3;
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.btNuevoCiente);
            this.panel2.Dock = System.Windows.Forms.DockStyle.Left;
            this.panel2.Location = new System.Drawing.Point(44, 0);
            this.panel2.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.panel2.Name = "panel2";
            this.panel2.Padding = new System.Windows.Forms.Padding(9, 16, 36, 16);
            this.panel2.Size = new System.Drawing.Size(143, 159);
            this.panel2.TabIndex = 0;
            // 
            // btNuevoCiente
            // 
            this.btNuevoCiente.BackColor = System.Drawing.SystemColors.ControlLightLight;
            this.btNuevoCiente.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btNuevoCiente.FlatAppearance.BorderSize = 0;
            this.btNuevoCiente.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btNuevoCiente.Image = global::QingYunSoft.Properties.Resources.person_badge_plus;
            this.btNuevoCiente.Location = new System.Drawing.Point(9, 16);
            this.btNuevoCiente.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btNuevoCiente.Name = "btNuevoCiente";
            this.btNuevoCiente.Size = new System.Drawing.Size(98, 127);
            this.btNuevoCiente.TabIndex = 0;
            this.btNuevoCiente.Text = "Nuevo Cliente";
            this.btNuevoCiente.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            this.btNuevoCiente.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.btNuevoCiente.UseVisualStyleBackColor = false;
            this.btNuevoCiente.Click += new System.EventHandler(this.btNuevoCiente_Click);
            // 
            // panel5
            // 
            this.panel5.BackColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.panel5.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.panel5.Location = new System.Drawing.Point(44, 159);
            this.panel5.Margin = new System.Windows.Forms.Padding(4);
            this.panel5.Name = "panel5";
            this.panel5.Size = new System.Drawing.Size(1015, 1);
            this.panel5.TabIndex = 0;
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.panel2);
            this.panel1.Controls.Add(this.panel5);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.panel1.Name = "panel1";
            this.panel1.Padding = new System.Windows.Forms.Padding(44, 0, 44, 0);
            this.panel1.Size = new System.Drawing.Size(1103, 160);
            this.panel1.TabIndex = 2;
            // 
            // frmClientes
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ControlLightLight;
            this.ClientSize = new System.Drawing.Size(1103, 724);
            this.Controls.Add(this.panel6);
            this.Controls.Add(this.panel1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "frmClientes";
            this.Text = "frmClientes";
            this.panel9.ResumeLayout(false);
            this.panel8.ResumeLayout(false);
            this.panel8.PerformLayout();
            this.panel7.ResumeLayout(false);
            this.panel10.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvVentas)).EndInit();
            this.panel6.ResumeLayout(false);
            this.panel2.ResumeLayout(false);
            this.panel1.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btNuevoCiente;
        private System.Windows.Forms.Button btBuscar;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Panel panel9;
        private System.Windows.Forms.Panel panel8;
        private System.Windows.Forms.Panel panel7;
        private System.Windows.Forms.Panel panel10;
        private System.Windows.Forms.DataGridView dgvVentas;
        private System.Windows.Forms.Panel panel6;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Panel panel5;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.DataGridViewTextBoxColumn nombreCliente;
        private System.Windows.Forms.DataGridViewTextBoxColumn tipoCliente;
        private System.Windows.Forms.DataGridViewTextBoxColumn tipoDocumento;
        private System.Windows.Forms.DataGridViewTextBoxColumn nmrDocumento;
        private System.Windows.Forms.DataGridViewTextBoxColumn categoria;
    }
}