namespace QingYunSoft.Almacen
{
    partial class frmInfoAlmacen
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmInfoAlmacen));
            this.panel3 = new System.Windows.Forms.Panel();
            this.dgvStocks = new System.Windows.Forms.DataGridView();
            this.ID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.nombre = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.precio = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.cantidad = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.devuelto = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.fechaIngreso = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.btModificar = new System.Windows.Forms.Button();
            this.btAgregar = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.label3 = new System.Windows.Forms.Label();
            this.txtDireccion = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.cbSupervisores = new System.Windows.Forms.ComboBox();
            this.label6 = new System.Windows.Forms.Label();
            this.txtNombre = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.txtID = new System.Windows.Forms.TextBox();
            this.btEditarGuardar = new System.Windows.Forms.Button();
            this.btAnular = new System.Windows.Forms.Button();
            this.panel2 = new System.Windows.Forms.Panel();
            this.panel1 = new System.Windows.Forms.Panel();
            this.btCancelar = new System.Windows.Forms.Button();
            this.btRegresar = new System.Windows.Forms.Button();
            this.panel3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvStocks)).BeginInit();
            this.groupBox2.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.panel2.SuspendLayout();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // panel3
            // 
            this.panel3.Controls.Add(this.dgvStocks);
            this.panel3.Controls.Add(this.groupBox2);
            this.panel3.Controls.Add(this.groupBox1);
            this.panel3.Controls.Add(this.btEditarGuardar);
            this.panel3.Controls.Add(this.btAnular);
            this.panel3.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel3.Location = new System.Drawing.Point(75, 0);
            this.panel3.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(1090, 797);
            this.panel3.TabIndex = 16;
            // 
            // dgvStocks
            // 
            this.dgvStocks.AllowUserToAddRows = false;
            this.dgvStocks.AllowUserToDeleteRows = false;
            this.dgvStocks.BackgroundColor = System.Drawing.SystemColors.ButtonHighlight;
            this.dgvStocks.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.dgvStocks.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvStocks.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.ID,
            this.nombre,
            this.precio,
            this.cantidad,
            this.devuelto,
            this.fechaIngreso});
            this.dgvStocks.GridColor = System.Drawing.SystemColors.ButtonHighlight;
            this.dgvStocks.Location = new System.Drawing.Point(21, 248);
            this.dgvStocks.Name = "dgvStocks";
            this.dgvStocks.ReadOnly = true;
            this.dgvStocks.RowHeadersVisible = false;
            this.dgvStocks.RowHeadersWidth = 62;
            this.dgvStocks.RowTemplate.Height = 28;
            this.dgvStocks.Size = new System.Drawing.Size(1053, 479);
            this.dgvStocks.TabIndex = 17;
            this.dgvStocks.CellFormatting += new System.Windows.Forms.DataGridViewCellFormattingEventHandler(this.dgvStocks_CellFormatting);
            // 
            // ID
            // 
            this.ID.HeaderText = "ID";
            this.ID.MinimumWidth = 8;
            this.ID.Name = "ID";
            this.ID.ReadOnly = true;
            this.ID.Width = 150;
            // 
            // nombre
            // 
            this.nombre.HeaderText = "Nombre";
            this.nombre.MinimumWidth = 8;
            this.nombre.Name = "nombre";
            this.nombre.ReadOnly = true;
            this.nombre.Width = 150;
            // 
            // precio
            // 
            this.precio.HeaderText = "Precio";
            this.precio.MinimumWidth = 8;
            this.precio.Name = "precio";
            this.precio.ReadOnly = true;
            this.precio.Width = 150;
            // 
            // cantidad
            // 
            this.cantidad.HeaderText = "Cantidad";
            this.cantidad.MinimumWidth = 8;
            this.cantidad.Name = "cantidad";
            this.cantidad.ReadOnly = true;
            this.cantidad.Width = 150;
            // 
            // devuelto
            // 
            this.devuelto.HeaderText = "Devuelto";
            this.devuelto.MinimumWidth = 8;
            this.devuelto.Name = "devuelto";
            this.devuelto.ReadOnly = true;
            this.devuelto.Width = 150;
            // 
            // fechaIngreso
            // 
            this.fechaIngreso.HeaderText = "Fecha de Ingreso";
            this.fechaIngreso.MinimumWidth = 8;
            this.fechaIngreso.Name = "fechaIngreso";
            this.fechaIngreso.ReadOnly = true;
            this.fechaIngreso.Width = 150;
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.btModificar);
            this.groupBox2.Controls.Add(this.btAgregar);
            this.groupBox2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox2.Location = new System.Drawing.Point(21, 151);
            this.groupBox2.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Padding = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.groupBox2.Size = new System.Drawing.Size(1053, 88);
            this.groupBox2.TabIndex = 16;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Productos";
            // 
            // btModificar
            // 
            this.btModificar.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btModificar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btModificar.Location = new System.Drawing.Point(670, 38);
            this.btModificar.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.btModificar.Name = "btModificar";
            this.btModificar.Size = new System.Drawing.Size(176, 35);
            this.btModificar.TabIndex = 25;
            this.btModificar.Text = "Modificar";
            this.btModificar.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btModificar.UseVisualStyleBackColor = true;
            this.btModificar.Click += new System.EventHandler(this.btModificar_Click);
            // 
            // btAgregar
            // 
            this.btAgregar.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btAgregar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btAgregar.Location = new System.Drawing.Point(868, 38);
            this.btAgregar.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.btAgregar.Name = "btAgregar";
            this.btAgregar.Size = new System.Drawing.Size(176, 35);
            this.btAgregar.TabIndex = 24;
            this.btAgregar.Text = "Agregar";
            this.btAgregar.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btAgregar.UseVisualStyleBackColor = true;
            this.btAgregar.Click += new System.EventHandler(this.btAgregar_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.txtDireccion);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.cbSupervisores);
            this.groupBox1.Controls.Add(this.label6);
            this.groupBox1.Controls.Add(this.txtNombre);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.txtID);
            this.groupBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(21, 9);
            this.groupBox1.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Padding = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.groupBox1.Size = new System.Drawing.Size(1053, 132);
            this.groupBox1.TabIndex = 1;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Informacion del almacenSeleccionado";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(512, 40);
            this.label3.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(81, 20);
            this.label3.TabIndex = 19;
            this.label3.Text = "Direccion";
            // 
            // txtDireccion
            // 
            this.txtDireccion.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtDireccion.Location = new System.Drawing.Point(598, 35);
            this.txtDireccion.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txtDireccion.MaxLength = 50;
            this.txtDireccion.Name = "txtDireccion";
            this.txtDireccion.Size = new System.Drawing.Size(306, 26);
            this.txtDireccion.TabIndex = 18;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(22, 78);
            this.label2.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(68, 20);
            this.label2.TabIndex = 3;
            this.label2.Text = "Nombre";
            // 
            // cbSupervisores
            // 
            this.cbSupervisores.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cbSupervisores.FormattingEnabled = true;
            this.cbSupervisores.Items.AddRange(new object[] {
            "Empresa",
            "Persona Natural"});
            this.cbSupervisores.Location = new System.Drawing.Point(598, 75);
            this.cbSupervisores.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.cbSupervisores.Name = "cbSupervisores";
            this.cbSupervisores.Size = new System.Drawing.Size(306, 28);
            this.cbSupervisores.TabIndex = 17;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.Location = new System.Drawing.Point(504, 80);
            this.label6.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(89, 20);
            this.label6.TabIndex = 16;
            this.label6.Text = "Supervisor";
            // 
            // txtNombre
            // 
            this.txtNombre.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtNombre.Location = new System.Drawing.Point(166, 75);
            this.txtNombre.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txtNombre.MaxLength = 50;
            this.txtNombre.Name = "txtNombre";
            this.txtNombre.Size = new System.Drawing.Size(306, 26);
            this.txtNombre.TabIndex = 2;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(22, 38);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(26, 20);
            this.label1.TabIndex = 1;
            this.label1.Text = "ID";
            // 
            // txtID
            // 
            this.txtID.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtID.Location = new System.Drawing.Point(166, 35);
            this.txtID.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txtID.Name = "txtID";
            this.txtID.Size = new System.Drawing.Size(306, 26);
            this.txtID.TabIndex = 0;
            // 
            // btEditarGuardar
            // 
            this.btEditarGuardar.BackColor = System.Drawing.Color.DarkOrange;
            this.btEditarGuardar.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btEditarGuardar.ForeColor = System.Drawing.Color.White;
            this.btEditarGuardar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btEditarGuardar.Location = new System.Drawing.Point(898, 735);
            this.btEditarGuardar.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.btEditarGuardar.Name = "btEditarGuardar";
            this.btEditarGuardar.Size = new System.Drawing.Size(176, 35);
            this.btEditarGuardar.TabIndex = 12;
            this.btEditarGuardar.Text = "Guardar";
            this.btEditarGuardar.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btEditarGuardar.UseVisualStyleBackColor = false;
            this.btEditarGuardar.Click += new System.EventHandler(this.btEditarGuardar_Click);
            // 
            // btAnular
            // 
            this.btAnular.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btAnular.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btAnular.Location = new System.Drawing.Point(704, 735);
            this.btAnular.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.btAnular.Name = "btAnular";
            this.btAnular.Size = new System.Drawing.Size(176, 35);
            this.btAnular.TabIndex = 15;
            this.btAnular.Text = "Anular";
            this.btAnular.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btAnular.UseVisualStyleBackColor = true;
            this.btAnular.Click += new System.EventHandler(this.btAnular_Click);
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.panel3);
            this.panel2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel2.Location = new System.Drawing.Point(0, 77);
            this.panel2.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.panel2.Name = "panel2";
            this.panel2.Padding = new System.Windows.Forms.Padding(75, 0, 75, 31);
            this.panel2.Size = new System.Drawing.Size(1240, 828);
            this.panel2.TabIndex = 20;
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.btCancelar);
            this.panel1.Controls.Add(this.btRegresar);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.panel1.Name = "panel1";
            this.panel1.Padding = new System.Windows.Forms.Padding(75, 0, 75, 0);
            this.panel1.Size = new System.Drawing.Size(1240, 77);
            this.panel1.TabIndex = 19;
            // 
            // btCancelar
            // 
            this.btCancelar.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("btCancelar.BackgroundImage")));
            this.btCancelar.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.btCancelar.Dock = System.Windows.Forms.DockStyle.Right;
            this.btCancelar.FlatAppearance.BorderSize = 0;
            this.btCancelar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btCancelar.Location = new System.Drawing.Point(1105, 0);
            this.btCancelar.Margin = new System.Windows.Forms.Padding(4, 5, 15, 5);
            this.btCancelar.Name = "btCancelar";
            this.btCancelar.Size = new System.Drawing.Size(60, 77);
            this.btCancelar.TabIndex = 3;
            this.btCancelar.UseVisualStyleBackColor = true;
            this.btCancelar.Click += new System.EventHandler(this.btCancelar_Click);
            // 
            // btRegresar
            // 
            this.btRegresar.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("btRegresar.BackgroundImage")));
            this.btRegresar.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.btRegresar.Dock = System.Windows.Forms.DockStyle.Left;
            this.btRegresar.FlatAppearance.BorderSize = 0;
            this.btRegresar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btRegresar.Location = new System.Drawing.Point(75, 0);
            this.btRegresar.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.btRegresar.Name = "btRegresar";
            this.btRegresar.Size = new System.Drawing.Size(60, 77);
            this.btRegresar.TabIndex = 0;
            this.btRegresar.UseVisualStyleBackColor = true;
            this.btRegresar.Click += new System.EventHandler(this.btRegresar_Click);
            // 
            // frmInfoAlmacen
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ControlLightLight;
            this.ClientSize = new System.Drawing.Size(1240, 905);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.panel1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.Name = "frmInfoAlmacen";
            this.Text = "frmInfoAlmacen";
            this.panel3.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvStocks)).EndInit();
            this.groupBox2.ResumeLayout(false);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.panel2.ResumeLayout(false);
            this.panel1.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ComboBox cbSupervisores;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox txtNombre;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtID;
        private System.Windows.Forms.Button btEditarGuardar;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Button btCancelar;
        private System.Windows.Forms.Button btRegresar;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txtDireccion;
        private System.Windows.Forms.Button btAnular;
        private System.Windows.Forms.Button btModificar;
        private System.Windows.Forms.Button btAgregar;
        private System.Windows.Forms.DataGridView dgvStocks;
        private System.Windows.Forms.DataGridViewTextBoxColumn ID;
        private System.Windows.Forms.DataGridViewTextBoxColumn nombre;
        private System.Windows.Forms.DataGridViewTextBoxColumn precio;
        private System.Windows.Forms.DataGridViewTextBoxColumn cantidad;
        private System.Windows.Forms.DataGridViewTextBoxColumn devuelto;
        private System.Windows.Forms.DataGridViewTextBoxColumn fechaIngreso;
    }
}