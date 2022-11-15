namespace QingYunSoft.Almacen
{
    partial class frmBuscarAlmacen
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
            this.btSeleccionar = new System.Windows.Forms.Button();
            this.btBuscarAlmacen = new System.Windows.Forms.Button();
            this.txtNombreAlmacen = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.dgvAlmacenes = new System.Windows.Forms.DataGridView();
            this.btCancelar = new System.Windows.Forms.Button();
            this.id = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.nombre = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.supervisor = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.direccion = new System.Windows.Forms.DataGridViewTextBoxColumn();
            ((System.ComponentModel.ISupportInitialize)(this.dgvAlmacenes)).BeginInit();
            this.SuspendLayout();
            // 
            // btSeleccionar
            // 
            this.btSeleccionar.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(157)))), ((int)(((byte)(36)))));
            this.btSeleccionar.FlatAppearance.BorderSize = 0;
            this.btSeleccionar.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btSeleccionar.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.btSeleccionar.Location = new System.Drawing.Point(632, 331);
            this.btSeleccionar.Name = "btSeleccionar";
            this.btSeleccionar.Size = new System.Drawing.Size(106, 29);
            this.btSeleccionar.TabIndex = 21;
            this.btSeleccionar.Text = "Seleccionar";
            this.btSeleccionar.UseVisualStyleBackColor = false;
            this.btSeleccionar.Click += new System.EventHandler(this.btSeleccionar_Click);
            // 
            // btBuscarAlmacen
            // 
            this.btBuscarAlmacen.Location = new System.Drawing.Point(406, 20);
            this.btBuscarAlmacen.Name = "btBuscarAlmacen";
            this.btBuscarAlmacen.Size = new System.Drawing.Size(162, 23);
            this.btBuscarAlmacen.TabIndex = 20;
            this.btBuscarAlmacen.Text = "Buscar por Nombre";
            this.btBuscarAlmacen.UseVisualStyleBackColor = true;
            this.btBuscarAlmacen.Click += new System.EventHandler(this.btBuscarAlmacen_Click);
            // 
            // txtNombreAlmacen
            // 
            this.txtNombreAlmacen.Location = new System.Drawing.Point(122, 22);
            this.txtNombreAlmacen.Name = "txtNombreAlmacen";
            this.txtNombreAlmacen.Size = new System.Drawing.Size(200, 20);
            this.txtNombreAlmacen.TabIndex = 19;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 25);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(104, 13);
            this.label1.TabIndex = 18;
            this.label1.Text = "Nombre del almacen";
            // 
            // dgvAlmacenes
            // 
            this.dgvAlmacenes.AllowUserToAddRows = false;
            this.dgvAlmacenes.AllowUserToDeleteRows = false;
            this.dgvAlmacenes.BackgroundColor = System.Drawing.SystemColors.ControlLight;
            this.dgvAlmacenes.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.dgvAlmacenes.ColumnHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.Single;
            this.dgvAlmacenes.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvAlmacenes.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.id,
            this.nombre,
            this.supervisor,
            this.direccion});
            this.dgvAlmacenes.GridColor = System.Drawing.SystemColors.ActiveBorder;
            this.dgvAlmacenes.Location = new System.Drawing.Point(15, 61);
            this.dgvAlmacenes.Name = "dgvAlmacenes";
            this.dgvAlmacenes.ReadOnly = true;
            this.dgvAlmacenes.RowHeadersVisible = false;
            this.dgvAlmacenes.RowHeadersWidth = 62;
            this.dgvAlmacenes.Size = new System.Drawing.Size(723, 264);
            this.dgvAlmacenes.TabIndex = 22;
            this.dgvAlmacenes.CellFormatting += new System.Windows.Forms.DataGridViewCellFormattingEventHandler(this.dgvAlmacenes_CellFormatting);
            // 
            // btCancelar
            // 
            this.btCancelar.BackgroundImage = global::QingYunSoft.Properties.Resources.multiply;
            this.btCancelar.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.btCancelar.FlatAppearance.BorderSize = 0;
            this.btCancelar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btCancelar.Location = new System.Drawing.Point(698, 5);
            this.btCancelar.Margin = new System.Windows.Forms.Padding(3, 3, 10, 3);
            this.btCancelar.Name = "btCancelar";
            this.btCancelar.Size = new System.Drawing.Size(40, 50);
            this.btCancelar.TabIndex = 32;
            this.btCancelar.UseVisualStyleBackColor = true;
            this.btCancelar.Click += new System.EventHandler(this.btCancelar_Click);
            // 
            // id
            // 
            this.id.HeaderText = "Codigo";
            this.id.Name = "id";
            this.id.ReadOnly = true;
            // 
            // nombre
            // 
            this.nombre.HeaderText = "Nombre Almacen";
            this.nombre.Name = "nombre";
            this.nombre.ReadOnly = true;
            this.nombre.Width = 200;
            // 
            // supervisor
            // 
            this.supervisor.HeaderText = "Supervisor";
            this.supervisor.Name = "supervisor";
            this.supervisor.ReadOnly = true;
            this.supervisor.Width = 150;
            // 
            // direccion
            // 
            this.direccion.HeaderText = "Direccion";
            this.direccion.Name = "direccion";
            this.direccion.ReadOnly = true;
            // 
            // frmBuscarAlmacen
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ControlLightLight;
            this.ClientSize = new System.Drawing.Size(750, 380);
            this.Controls.Add(this.btCancelar);
            this.Controls.Add(this.dgvAlmacenes);
            this.Controls.Add(this.btSeleccionar);
            this.Controls.Add(this.btBuscarAlmacen);
            this.Controls.Add(this.txtNombreAlmacen);
            this.Controls.Add(this.label1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "frmBuscarAlmacen";
            this.Text = "frmBuscarAlmacen";
            this.MouseDown += new System.Windows.Forms.MouseEventHandler(this.frmBuscarAlmacen_MouseDown);
            ((System.ComponentModel.ISupportInitialize)(this.dgvAlmacenes)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btSeleccionar;
        private System.Windows.Forms.Button btBuscarAlmacen;
        private System.Windows.Forms.TextBox txtNombreAlmacen;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DataGridView dgvAlmacenes;
        private System.Windows.Forms.Button btCancelar;
        private System.Windows.Forms.DataGridViewTextBoxColumn id;
        private System.Windows.Forms.DataGridViewTextBoxColumn nombre;
        private System.Windows.Forms.DataGridViewTextBoxColumn supervisor;
        private System.Windows.Forms.DataGridViewTextBoxColumn direccion;
    }
}