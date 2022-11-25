namespace QingYunSoft.Venta
{
    partial class frmReclamo
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
            this.dtpFecha = new System.Windows.Forms.DateTimePicker();
            this.label9 = new System.Windows.Forms.Label();
            this.label14 = new System.Windows.Forms.Label();
            this.txtDescripcion = new System.Windows.Forms.RichTextBox();
            this.dgvProductos = new System.Windows.Forms.DataGridView();
            this.ID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.nombre = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.cantidad = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.precio = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.devolver = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.btEditarGuardar = new System.Windows.Forms.Button();
            this.btAnular = new System.Windows.Forms.Button();
            this.btAtender = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.txtID = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.dgvProductos)).BeginInit();
            this.SuspendLayout();
            // 
            // dtpFecha
            // 
            this.dtpFecha.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtpFecha.Location = new System.Drawing.Point(181, 66);
            this.dtpFecha.Name = "dtpFecha";
            this.dtpFecha.Size = new System.Drawing.Size(270, 20);
            this.dtpFecha.TabIndex = 14;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label9.Location = new System.Drawing.Point(16, 73);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(89, 13);
            this.label9.TabIndex = 13;
            this.label9.Text = "Fecha de registro";
            // 
            // label14
            // 
            this.label14.AutoSize = true;
            this.label14.Font = new System.Drawing.Font("Microsoft Sans Serif", 26.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label14.Location = new System.Drawing.Point(12, 21);
            this.label14.Name = "label14";
            this.label14.Size = new System.Drawing.Size(162, 39);
            this.label14.TabIndex = 15;
            this.label14.Text = "Reclamo";
            // 
            // txtDescripcion
            // 
            this.txtDescripcion.BackColor = System.Drawing.SystemColors.ControlLightLight;
            this.txtDescripcion.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtDescripcion.Location = new System.Drawing.Point(19, 136);
            this.txtDescripcion.Name = "txtDescripcion";
            this.txtDescripcion.Size = new System.Drawing.Size(432, 96);
            this.txtDescripcion.TabIndex = 16;
            this.txtDescripcion.Text = "";
            // 
            // dgvProductos
            // 
            this.dgvProductos.AllowUserToAddRows = false;
            this.dgvProductos.AllowUserToDeleteRows = false;
            this.dgvProductos.BackgroundColor = System.Drawing.SystemColors.ControlLight;
            this.dgvProductos.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.dgvProductos.ColumnHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.None;
            this.dgvProductos.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvProductos.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.ID,
            this.nombre,
            this.cantidad,
            this.precio,
            this.devolver});
            this.dgvProductos.GridColor = System.Drawing.SystemColors.ActiveBorder;
            this.dgvProductos.Location = new System.Drawing.Point(19, 250);
            this.dgvProductos.Name = "dgvProductos";
            this.dgvProductos.ReadOnly = true;
            this.dgvProductos.RowHeadersVisible = false;
            this.dgvProductos.RowHeadersWidth = 62;
            this.dgvProductos.Size = new System.Drawing.Size(432, 212);
            this.dgvProductos.TabIndex = 17;
            this.dgvProductos.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvProductos_CellContentClick);
            this.dgvProductos.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvProductos_CellContentClick);
            this.dgvProductos.CellFormatting += new System.Windows.Forms.DataGridViewCellFormattingEventHandler(this.dgvProductos_CellFormatting);
            // 
            // ID
            // 
            this.ID.HeaderText = "Codigo";
            this.ID.MinimumWidth = 8;
            this.ID.Name = "ID";
            this.ID.ReadOnly = true;
            this.ID.Width = 50;
            // 
            // nombre
            // 
            this.nombre.HeaderText = "Nombre";
            this.nombre.MinimumWidth = 6;
            this.nombre.Name = "nombre";
            this.nombre.ReadOnly = true;
            this.nombre.Width = 180;
            // 
            // cantidad
            // 
            this.cantidad.HeaderText = "Cantidad";
            this.cantidad.MinimumWidth = 6;
            this.cantidad.Name = "cantidad";
            this.cantidad.ReadOnly = true;
            this.cantidad.Width = 60;
            // 
            // precio
            // 
            this.precio.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.precio.HeaderText = "SubTotal";
            this.precio.MinimumWidth = 6;
            this.precio.Name = "precio";
            this.precio.ReadOnly = true;
            this.precio.Width = 80;
            // 
            // devolver
            // 
            this.devolver.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.devolver.FalseValue = "false";
            this.devolver.HeaderText = "Devolver";
            this.devolver.Name = "devolver";
            this.devolver.ReadOnly = true;
            this.devolver.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.devolver.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.devolver.TrueValue = "true";
            this.devolver.Width = 60;
            // 
            // btEditarGuardar
            // 
            this.btEditarGuardar.BackColor = System.Drawing.Color.DarkOrange;
            this.btEditarGuardar.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btEditarGuardar.ForeColor = System.Drawing.Color.White;
            this.btEditarGuardar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btEditarGuardar.Location = new System.Drawing.Point(334, 477);
            this.btEditarGuardar.Name = "btEditarGuardar";
            this.btEditarGuardar.Size = new System.Drawing.Size(117, 23);
            this.btEditarGuardar.TabIndex = 18;
            this.btEditarGuardar.Text = "Guardar";
            this.btEditarGuardar.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btEditarGuardar.UseVisualStyleBackColor = false;
            this.btEditarGuardar.Click += new System.EventHandler(this.btEditarGuardar_Click);
            // 
            // btAnular
            // 
            this.btAnular.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btAnular.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btAnular.Location = new System.Drawing.Point(201, 477);
            this.btAnular.Name = "btAnular";
            this.btAnular.Size = new System.Drawing.Size(117, 23);
            this.btAnular.TabIndex = 19;
            this.btAnular.Text = "Eliminar";
            this.btAnular.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btAnular.UseVisualStyleBackColor = true;
            this.btAnular.Click += new System.EventHandler(this.btAnular_Click);
            // 
            // btAtender
            // 
            this.btAtender.BackColor = System.Drawing.Color.DarkOrange;
            this.btAtender.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btAtender.ForeColor = System.Drawing.Color.White;
            this.btAtender.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btAtender.Location = new System.Drawing.Point(19, 477);
            this.btAtender.Name = "btAtender";
            this.btAtender.Size = new System.Drawing.Size(117, 23);
            this.btAtender.TabIndex = 20;
            this.btAtender.Text = "Atender";
            this.btAtender.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btAtender.UseVisualStyleBackColor = false;
            this.btAtender.Click += new System.EventHandler(this.btAtender_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(16, 120);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(65, 13);
            this.label1.TabIndex = 21;
            this.label1.Text = "Justificacion";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(16, 96);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(56, 13);
            this.label2.TabIndex = 22;
            this.label2.Text = "Id reclamo";
            // 
            // txtID
            // 
            this.txtID.Location = new System.Drawing.Point(181, 93);
            this.txtID.Name = "txtID";
            this.txtID.Size = new System.Drawing.Size(149, 20);
            this.txtID.TabIndex = 23;
            // 
            // frmReclamo
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.ClientSize = new System.Drawing.Size(469, 512);
            this.Controls.Add(this.txtID);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btAtender);
            this.Controls.Add(this.btAnular);
            this.Controls.Add(this.btEditarGuardar);
            this.Controls.Add(this.dgvProductos);
            this.Controls.Add(this.txtDescripcion);
            this.Controls.Add(this.label14);
            this.Controls.Add(this.dtpFecha);
            this.Controls.Add(this.label9);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Name = "frmReclamo";
            this.Text = "Reclamo";
            ((System.ComponentModel.ISupportInitialize)(this.dgvProductos)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DateTimePicker dtpFecha;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label label14;
        private System.Windows.Forms.RichTextBox txtDescripcion;
        private System.Windows.Forms.DataGridView dgvProductos;
        private System.Windows.Forms.Button btEditarGuardar;
        private System.Windows.Forms.Button btAnular;
        private System.Windows.Forms.Button btAtender;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtID;
        private System.Windows.Forms.DataGridViewTextBoxColumn ID;
        private System.Windows.Forms.DataGridViewTextBoxColumn nombre;
        private System.Windows.Forms.DataGridViewTextBoxColumn cantidad;
        private System.Windows.Forms.DataGridViewTextBoxColumn precio;
        private System.Windows.Forms.DataGridViewCheckBoxColumn devolver;
    }
}