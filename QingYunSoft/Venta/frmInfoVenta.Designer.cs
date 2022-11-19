namespace QingYunSoft
{
    partial class frmInfoVenta
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
            this.lblVenta = new System.Windows.Forms.Label();
            this.btCancelar = new System.Windows.Forms.Button();
            this.btRegresar = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.btBuscarCliente = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.txtNumDocCliente = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.txtNombreCliente = new System.Windows.Forms.TextBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.rbTienda = new System.Windows.Forms.RadioButton();
            this.rbDelivery = new System.Windows.Forms.RadioButton();
            this.dtpFechaEntrega = new System.Windows.Forms.DateTimePicker();
            this.label5 = new System.Windows.Forms.Label();
            this.txtDireccion = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.txtStock = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.btEliminarProducto = new System.Windows.Forms.Button();
            this.label19 = new System.Windows.Forms.Label();
            this.txtPrecio = new System.Windows.Forms.TextBox();
            this.label12 = new System.Windows.Forms.Label();
            this.label11 = new System.Windows.Forms.Label();
            this.txtDescuento = new System.Windows.Forms.TextBox();
            this.btAgregarProducto = new System.Windows.Forms.Button();
            this.label8 = new System.Windows.Forms.Label();
            this.txtCantidad = new System.Windows.Forms.TextBox();
            this.btBuscarProducto = new System.Windows.Forms.Button();
            this.label6 = new System.Windows.Forms.Label();
            this.txtNombreProducto = new System.Windows.Forms.TextBox();
            this.dgvProductos = new System.Windows.Forms.DataGridView();
            this.ID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.nombre = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.cantidad = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.precio = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.btReclamo = new System.Windows.Forms.Button();
            this.btEditarGuardar = new System.Windows.Forms.Button();
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.rbNoCancelado = new System.Windows.Forms.RadioButton();
            this.rbCancelado = new System.Windows.Forms.RadioButton();
            this.dtpFechaCompra = new System.Windows.Forms.DateTimePicker();
            this.label9 = new System.Windows.Forms.Label();
            this.label17 = new System.Windows.Forms.Label();
            this.label10 = new System.Windows.Forms.Label();
            this.txtMontoTotal = new System.Windows.Forms.TextBox();
            this.txtTipoDeCambio = new System.Windows.Forms.TextBox();
            this.label16 = new System.Windows.Forms.Label();
            this.groupBox5 = new System.Windows.Forms.GroupBox();
            this.dtpFechaLimite = new System.Windows.Forms.DateTimePicker();
            this.label14 = new System.Windows.Forms.Label();
            this.cbMoneda = new System.Windows.Forms.ComboBox();
            this.btAnular = new System.Windows.Forms.Button();
            this.panel2 = new System.Windows.Forms.Panel();
            this.panel3 = new System.Windows.Forms.Panel();
            this.groupBox6 = new System.Windows.Forms.GroupBox();
            this.label18 = new System.Windows.Forms.Label();
            this.panel1.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvProductos)).BeginInit();
            this.groupBox4.SuspendLayout();
            this.groupBox5.SuspendLayout();
            this.panel2.SuspendLayout();
            this.panel3.SuspendLayout();
            this.groupBox6.SuspendLayout();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.lblVenta);
            this.panel1.Controls.Add(this.btCancelar);
            this.panel1.Controls.Add(this.btRegresar);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Padding = new System.Windows.Forms.Padding(50, 0, 50, 0);
            this.panel1.Size = new System.Drawing.Size(827, 50);
            this.panel1.TabIndex = 0;
            // 
            // lblVenta
            // 
            this.lblVenta.AutoSize = true;
            this.lblVenta.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblVenta.Location = new System.Drawing.Point(96, 11);
            this.lblVenta.Name = "lblVenta";
            this.lblVenta.Size = new System.Drawing.Size(59, 24);
            this.lblVenta.TabIndex = 4;
            this.lblVenta.Text = "Venta";
            // 
            // btCancelar
            // 
            this.btCancelar.BackgroundImage = global::QingYunSoft.Properties.Resources.multiply;
            this.btCancelar.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.btCancelar.Dock = System.Windows.Forms.DockStyle.Right;
            this.btCancelar.FlatAppearance.BorderSize = 0;
            this.btCancelar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btCancelar.Location = new System.Drawing.Point(737, 0);
            this.btCancelar.Margin = new System.Windows.Forms.Padding(3, 3, 10, 3);
            this.btCancelar.Name = "btCancelar";
            this.btCancelar.Size = new System.Drawing.Size(40, 50);
            this.btCancelar.TabIndex = 3;
            this.btCancelar.UseVisualStyleBackColor = true;
            this.btCancelar.Click += new System.EventHandler(this.btCancelar_Click);
            // 
            // btRegresar
            // 
            this.btRegresar.BackgroundImage = global::QingYunSoft.Properties.Resources.arrow_left;
            this.btRegresar.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.btRegresar.Dock = System.Windows.Forms.DockStyle.Left;
            this.btRegresar.FlatAppearance.BorderSize = 0;
            this.btRegresar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btRegresar.Location = new System.Drawing.Point(50, 0);
            this.btRegresar.Name = "btRegresar";
            this.btRegresar.Size = new System.Drawing.Size(40, 50);
            this.btRegresar.TabIndex = 0;
            this.btRegresar.UseVisualStyleBackColor = true;
            this.btRegresar.Click += new System.EventHandler(this.btRegresar_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.btBuscarCliente);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.txtNumDocCliente);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.txtNombreCliente);
            this.groupBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(9, 6);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(219, 106);
            this.groupBox1.TabIndex = 1;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Cliente";
            // 
            // btBuscarCliente
            // 
            this.btBuscarCliente.BackgroundImage = global::QingYunSoft.Properties.Resources.magnifyingglass_circle;
            this.btBuscarCliente.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.btBuscarCliente.FlatAppearance.BorderSize = 0;
            this.btBuscarCliente.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btBuscarCliente.Location = new System.Drawing.Point(174, 44);
            this.btBuscarCliente.Name = "btBuscarCliente";
            this.btBuscarCliente.Size = new System.Drawing.Size(30, 30);
            this.btBuscarCliente.TabIndex = 4;
            this.btBuscarCliente.UseVisualStyleBackColor = true;
            this.btBuscarCliente.Click += new System.EventHandler(this.btBuscarCliente_Click_1);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(15, 51);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(62, 13);
            this.label2.TabIndex = 3;
            this.label2.Text = "Documento";
            // 
            // txtNumDocCliente
            // 
            this.txtNumDocCliente.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtNumDocCliente.Location = new System.Drawing.Point(83, 48);
            this.txtNumDocCliente.Name = "txtNumDocCliente";
            this.txtNumDocCliente.Size = new System.Drawing.Size(85, 20);
            this.txtNumDocCliente.TabIndex = 2;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(15, 25);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(44, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Nombre";
            // 
            // txtNombreCliente
            // 
            this.txtNombreCliente.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtNombreCliente.Location = new System.Drawing.Point(83, 22);
            this.txtNombreCliente.Name = "txtNombreCliente";
            this.txtNombreCliente.Size = new System.Drawing.Size(111, 20);
            this.txtNombreCliente.TabIndex = 0;
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.rbTienda);
            this.groupBox2.Controls.Add(this.rbDelivery);
            this.groupBox2.Controls.Add(this.dtpFechaEntrega);
            this.groupBox2.Controls.Add(this.label5);
            this.groupBox2.Controls.Add(this.txtDireccion);
            this.groupBox2.Controls.Add(this.label3);
            this.groupBox2.Controls.Add(this.label4);
            this.groupBox2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox2.Location = new System.Drawing.Point(245, 6);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(470, 106);
            this.groupBox2.TabIndex = 2;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Entrega";
            // 
            // rbTienda
            // 
            this.rbTienda.AutoSize = true;
            this.rbTienda.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F);
            this.rbTienda.Location = new System.Drawing.Point(144, 24);
            this.rbTienda.Margin = new System.Windows.Forms.Padding(2);
            this.rbTienda.Name = "rbTienda";
            this.rbTienda.Size = new System.Drawing.Size(106, 17);
            this.rbTienda.TabIndex = 5;
            this.rbTienda.Text = "Recojo en tienda";
            this.rbTienda.UseVisualStyleBackColor = true;
            // 
            // rbDelivery
            // 
            this.rbDelivery.AutoSize = true;
            this.rbDelivery.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F);
            this.rbDelivery.Location = new System.Drawing.Point(254, 25);
            this.rbDelivery.Margin = new System.Windows.Forms.Padding(2);
            this.rbDelivery.Name = "rbDelivery";
            this.rbDelivery.Size = new System.Drawing.Size(63, 17);
            this.rbDelivery.TabIndex = 6;
            this.rbDelivery.Text = "Delivery";
            this.rbDelivery.UseVisualStyleBackColor = true;
            // 
            // dtpFechaEntrega
            // 
            this.dtpFechaEntrega.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtpFechaEntrega.Location = new System.Drawing.Point(144, 48);
            this.dtpFechaEntrega.Name = "dtpFechaEntrega";
            this.dtpFechaEntrega.Size = new System.Drawing.Size(200, 20);
            this.dtpFechaEntrega.TabIndex = 6;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(15, 51);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(91, 13);
            this.label5.TabIndex = 5;
            this.label5.Text = "Fecha de entrega";
            // 
            // txtDireccion
            // 
            this.txtDireccion.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtDireccion.Location = new System.Drawing.Point(144, 74);
            this.txtDireccion.Name = "txtDireccion";
            this.txtDireccion.Size = new System.Drawing.Size(303, 20);
            this.txtDireccion.TabIndex = 0;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(15, 25);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(90, 13);
            this.label3.TabIndex = 3;
            this.label3.Text = "Forma de entrega";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(15, 77);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(106, 13);
            this.label4.TabIndex = 1;
            this.label4.Text = "Direccion de entrega";
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.txtStock);
            this.groupBox3.Controls.Add(this.label7);
            this.groupBox3.Controls.Add(this.btEliminarProducto);
            this.groupBox3.Controls.Add(this.label19);
            this.groupBox3.Controls.Add(this.txtPrecio);
            this.groupBox3.Controls.Add(this.label12);
            this.groupBox3.Controls.Add(this.label11);
            this.groupBox3.Controls.Add(this.txtDescuento);
            this.groupBox3.Controls.Add(this.btAgregarProducto);
            this.groupBox3.Controls.Add(this.label8);
            this.groupBox3.Controls.Add(this.txtCantidad);
            this.groupBox3.Controls.Add(this.btBuscarProducto);
            this.groupBox3.Controls.Add(this.label6);
            this.groupBox3.Controls.Add(this.txtNombreProducto);
            this.groupBox3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox3.Location = new System.Drawing.Point(9, 118);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(408, 100);
            this.groupBox3.TabIndex = 3;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Productos";
            // 
            // txtStock
            // 
            this.txtStock.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtStock.Location = new System.Drawing.Point(71, 46);
            this.txtStock.Name = "txtStock";
            this.txtStock.Size = new System.Drawing.Size(60, 20);
            this.txtStock.TabIndex = 19;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.Location = new System.Drawing.Point(8, 49);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(35, 13);
            this.label7.TabIndex = 18;
            this.label7.Text = "Stock";
            // 
            // btEliminarProducto
            // 
            this.btEliminarProducto.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btEliminarProducto.Location = new System.Drawing.Point(327, 44);
            this.btEliminarProducto.Name = "btEliminarProducto";
            this.btEliminarProducto.Size = new System.Drawing.Size(75, 23);
            this.btEliminarProducto.TabIndex = 17;
            this.btEliminarProducto.Text = "Quitar";
            this.btEliminarProducto.UseVisualStyleBackColor = true;
            this.btEliminarProducto.Click += new System.EventHandler(this.btEliminarProducto_Click);
            // 
            // label19
            // 
            this.label19.AutoSize = true;
            this.label19.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label19.Location = new System.Drawing.Point(145, 49);
            this.label19.Name = "label19";
            this.label19.Size = new System.Drawing.Size(37, 13);
            this.label19.TabIndex = 16;
            this.label19.Text = "Precio";
            // 
            // txtPrecio
            // 
            this.txtPrecio.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtPrecio.Location = new System.Drawing.Point(213, 46);
            this.txtPrecio.Name = "txtPrecio";
            this.txtPrecio.Size = new System.Drawing.Size(60, 20);
            this.txtPrecio.TabIndex = 15;
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label12.Location = new System.Drawing.Point(281, 75);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(15, 13);
            this.label12.TabIndex = 12;
            this.label12.Text = "%";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label11.Location = new System.Drawing.Point(145, 75);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(59, 13);
            this.label11.TabIndex = 11;
            this.label11.Text = "Descuento";
            // 
            // txtDescuento
            // 
            this.txtDescuento.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtDescuento.Location = new System.Drawing.Point(213, 72);
            this.txtDescuento.Name = "txtDescuento";
            this.txtDescuento.Size = new System.Drawing.Size(60, 20);
            this.txtDescuento.TabIndex = 10;
            // 
            // btAgregarProducto
            // 
            this.btAgregarProducto.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btAgregarProducto.Location = new System.Drawing.Point(327, 70);
            this.btAgregarProducto.Name = "btAgregarProducto";
            this.btAgregarProducto.Size = new System.Drawing.Size(75, 23);
            this.btAgregarProducto.TabIndex = 9;
            this.btAgregarProducto.Tag = "";
            this.btAgregarProducto.Text = "Agregar";
            this.btAgregarProducto.UseVisualStyleBackColor = true;
            this.btAgregarProducto.Click += new System.EventHandler(this.btAgregarProducto_Click_1);
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label8.Location = new System.Drawing.Point(10, 75);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(49, 13);
            this.label8.TabIndex = 7;
            this.label8.Text = "Cantidad";
            // 
            // txtCantidad
            // 
            this.txtCantidad.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtCantidad.Location = new System.Drawing.Point(71, 72);
            this.txtCantidad.Name = "txtCantidad";
            this.txtCantidad.Size = new System.Drawing.Size(60, 20);
            this.txtCantidad.TabIndex = 6;
            // 
            // btBuscarProducto
            // 
            this.btBuscarProducto.BackgroundImage = global::QingYunSoft.Properties.Resources.magnifyingglass_circle;
            this.btBuscarProducto.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.btBuscarProducto.FlatAppearance.BorderSize = 0;
            this.btBuscarProducto.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btBuscarProducto.Location = new System.Drawing.Point(243, 13);
            this.btBuscarProducto.Name = "btBuscarProducto";
            this.btBuscarProducto.Size = new System.Drawing.Size(30, 30);
            this.btBuscarProducto.TabIndex = 4;
            this.btBuscarProducto.UseVisualStyleBackColor = true;
            this.btBuscarProducto.Click += new System.EventHandler(this.btBuscarProducto_Click_1);
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.Location = new System.Drawing.Point(8, 23);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(44, 13);
            this.label6.TabIndex = 3;
            this.label6.Text = "Nombre";
            // 
            // txtNombreProducto
            // 
            this.txtNombreProducto.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtNombreProducto.Location = new System.Drawing.Point(71, 20);
            this.txtNombreProducto.Name = "txtNombreProducto";
            this.txtNombreProducto.Size = new System.Drawing.Size(159, 20);
            this.txtNombreProducto.TabIndex = 2;
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
            this.precio});
            this.dgvProductos.GridColor = System.Drawing.SystemColors.ActiveBorder;
            this.dgvProductos.Location = new System.Drawing.Point(9, 224);
            this.dgvProductos.Name = "dgvProductos";
            this.dgvProductos.ReadOnly = true;
            this.dgvProductos.RowHeadersVisible = false;
            this.dgvProductos.RowHeadersWidth = 62;
            this.dgvProductos.Size = new System.Drawing.Size(408, 282);
            this.dgvProductos.TabIndex = 8;
            this.dgvProductos.CellFormatting += new System.Windows.Forms.DataGridViewCellFormattingEventHandler(this.dgvProductos_CellFormatting_1);
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
            this.nombre.Width = 200;
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
            // btReclamo
            // 
            this.btReclamo.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btReclamo.Location = new System.Drawing.Point(598, 454);
            this.btReclamo.Name = "btReclamo";
            this.btReclamo.Size = new System.Drawing.Size(117, 23);
            this.btReclamo.TabIndex = 10;
            this.btReclamo.Text = "Ver Reclamo";
            this.btReclamo.UseVisualStyleBackColor = true;
            this.btReclamo.Click += new System.EventHandler(this.btReclamo_Click_1);
            // 
            // btEditarGuardar
            // 
            this.btEditarGuardar.BackColor = System.Drawing.Color.DarkOrange;
            this.btEditarGuardar.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btEditarGuardar.ForeColor = System.Drawing.Color.White;
            this.btEditarGuardar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btEditarGuardar.Location = new System.Drawing.Point(598, 483);
            this.btEditarGuardar.Name = "btEditarGuardar";
            this.btEditarGuardar.Size = new System.Drawing.Size(117, 23);
            this.btEditarGuardar.TabIndex = 12;
            this.btEditarGuardar.Text = "Guardar";
            this.btEditarGuardar.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btEditarGuardar.UseVisualStyleBackColor = false;
            this.btEditarGuardar.Click += new System.EventHandler(this.btEditarGuardar_Click);
            // 
            // groupBox4
            // 
            this.groupBox4.Controls.Add(this.rbNoCancelado);
            this.groupBox4.Controls.Add(this.rbCancelado);
            this.groupBox4.Controls.Add(this.dtpFechaCompra);
            this.groupBox4.Controls.Add(this.label9);
            this.groupBox4.Controls.Add(this.label17);
            this.groupBox4.Controls.Add(this.label10);
            this.groupBox4.Controls.Add(this.txtMontoTotal);
            this.groupBox4.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox4.Location = new System.Drawing.Point(423, 256);
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.Size = new System.Drawing.Size(292, 120);
            this.groupBox4.TabIndex = 13;
            this.groupBox4.TabStop = false;
            this.groupBox4.Text = "Resumen";
            // 
            // rbNoCancelado
            // 
            this.rbNoCancelado.AutoSize = true;
            this.rbNoCancelado.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rbNoCancelado.Location = new System.Drawing.Point(199, 56);
            this.rbNoCancelado.Name = "rbNoCancelado";
            this.rbNoCancelado.Size = new System.Drawing.Size(39, 17);
            this.rbNoCancelado.TabIndex = 14;
            this.rbNoCancelado.TabStop = true;
            this.rbNoCancelado.Text = "No";
            this.rbNoCancelado.UseVisualStyleBackColor = true;
            // 
            // rbCancelado
            // 
            this.rbCancelado.AutoSize = true;
            this.rbCancelado.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rbCancelado.Location = new System.Drawing.Point(149, 56);
            this.rbCancelado.Name = "rbCancelado";
            this.rbCancelado.Size = new System.Drawing.Size(34, 17);
            this.rbCancelado.TabIndex = 13;
            this.rbCancelado.TabStop = true;
            this.rbCancelado.Text = "Si";
            this.rbCancelado.UseVisualStyleBackColor = true;
            // 
            // dtpFechaCompra
            // 
            this.dtpFechaCompra.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtpFechaCompra.Location = new System.Drawing.Point(136, 79);
            this.dtpFechaCompra.Name = "dtpFechaCompra";
            this.dtpFechaCompra.Size = new System.Drawing.Size(111, 20);
            this.dtpFechaCompra.TabIndex = 12;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label9.Location = new System.Drawing.Point(40, 82);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(90, 13);
            this.label9.TabIndex = 11;
            this.label9.Text = "Fecha de compra";
            // 
            // label17
            // 
            this.label17.AutoSize = true;
            this.label17.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label17.Location = new System.Drawing.Point(69, 55);
            this.label17.Name = "label17";
            this.label17.Size = new System.Drawing.Size(58, 13);
            this.label17.TabIndex = 9;
            this.label17.Text = "Cancelado";
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label10.Location = new System.Drawing.Point(66, 29);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(64, 13);
            this.label10.TabIndex = 1;
            this.label10.Text = "Monto Total";
            // 
            // txtMontoTotal
            // 
            this.txtMontoTotal.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtMontoTotal.Location = new System.Drawing.Point(136, 25);
            this.txtMontoTotal.Name = "txtMontoTotal";
            this.txtMontoTotal.Size = new System.Drawing.Size(111, 20);
            this.txtMontoTotal.TabIndex = 0;
            // 
            // txtTipoDeCambio
            // 
            this.txtTipoDeCambio.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTipoDeCambio.Location = new System.Drawing.Point(217, 20);
            this.txtTipoDeCambio.Name = "txtTipoDeCambio";
            this.txtTipoDeCambio.Size = new System.Drawing.Size(69, 20);
            this.txtTipoDeCambio.TabIndex = 8;
            // 
            // label16
            // 
            this.label16.AutoSize = true;
            this.label16.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label16.Location = new System.Drawing.Point(133, 23);
            this.label16.Name = "label16";
            this.label16.Size = new System.Drawing.Size(80, 13);
            this.label16.TabIndex = 7;
            this.label16.Text = "Tipo de cambio";
            // 
            // groupBox5
            // 
            this.groupBox5.Controls.Add(this.dtpFechaLimite);
            this.groupBox5.Controls.Add(this.label14);
            this.groupBox5.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox5.Location = new System.Drawing.Point(423, 178);
            this.groupBox5.Name = "groupBox5";
            this.groupBox5.Size = new System.Drawing.Size(292, 72);
            this.groupBox5.TabIndex = 14;
            this.groupBox5.TabStop = false;
            this.groupBox5.Text = "Termino de pago";
            // 
            // dtpFechaLimite
            // 
            this.dtpFechaLimite.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtpFechaLimite.Location = new System.Drawing.Point(175, 31);
            this.dtpFechaLimite.Name = "dtpFechaLimite";
            this.dtpFechaLimite.Size = new System.Drawing.Size(111, 20);
            this.dtpFechaLimite.TabIndex = 10;
            // 
            // label14
            // 
            this.label14.AutoSize = true;
            this.label14.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label14.Location = new System.Drawing.Point(9, 37);
            this.label14.Name = "label14";
            this.label14.Size = new System.Drawing.Size(63, 13);
            this.label14.TabIndex = 3;
            this.label14.Text = "Fecha limite";
            // 
            // cbMoneda
            // 
            this.cbMoneda.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cbMoneda.FormattingEnabled = true;
            this.cbMoneda.Location = new System.Drawing.Point(58, 20);
            this.cbMoneda.Name = "cbMoneda";
            this.cbMoneda.Size = new System.Drawing.Size(69, 21);
            this.cbMoneda.TabIndex = 9;
            this.cbMoneda.Text = "Soles";
            this.cbMoneda.SelectedIndexChanged += new System.EventHandler(this.cbMoneda_SelectedIndexChanged);
            // 
            // btAnular
            // 
            this.btAnular.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btAnular.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btAnular.Location = new System.Drawing.Point(423, 483);
            this.btAnular.Name = "btAnular";
            this.btAnular.Size = new System.Drawing.Size(117, 23);
            this.btAnular.TabIndex = 15;
            this.btAnular.Text = "Eliminar";
            this.btAnular.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btAnular.UseVisualStyleBackColor = true;
            this.btAnular.Click += new System.EventHandler(this.btAnular_Click);
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.panel3);
            this.panel2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel2.Location = new System.Drawing.Point(0, 50);
            this.panel2.Name = "panel2";
            this.panel2.Padding = new System.Windows.Forms.Padding(50, 0, 50, 20);
            this.panel2.Size = new System.Drawing.Size(827, 538);
            this.panel2.TabIndex = 16;
            // 
            // panel3
            // 
            this.panel3.Controls.Add(this.groupBox6);
            this.panel3.Controls.Add(this.btReclamo);
            this.panel3.Controls.Add(this.groupBox1);
            this.panel3.Controls.Add(this.groupBox5);
            this.panel3.Controls.Add(this.btEditarGuardar);
            this.panel3.Controls.Add(this.groupBox4);
            this.panel3.Controls.Add(this.dgvProductos);
            this.panel3.Controls.Add(this.groupBox2);
            this.panel3.Controls.Add(this.groupBox3);
            this.panel3.Controls.Add(this.btAnular);
            this.panel3.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel3.Location = new System.Drawing.Point(50, 0);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(727, 518);
            this.panel3.TabIndex = 16;
            // 
            // groupBox6
            // 
            this.groupBox6.Controls.Add(this.txtTipoDeCambio);
            this.groupBox6.Controls.Add(this.label16);
            this.groupBox6.Controls.Add(this.label18);
            this.groupBox6.Controls.Add(this.cbMoneda);
            this.groupBox6.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox6.Location = new System.Drawing.Point(423, 118);
            this.groupBox6.Name = "groupBox6";
            this.groupBox6.Size = new System.Drawing.Size(292, 54);
            this.groupBox6.TabIndex = 16;
            this.groupBox6.TabStop = false;
            this.groupBox6.Text = "Moneda";
            // 
            // label18
            // 
            this.label18.AutoSize = true;
            this.label18.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label18.Location = new System.Drawing.Point(6, 23);
            this.label18.Name = "label18";
            this.label18.Size = new System.Drawing.Size(46, 13);
            this.label18.TabIndex = 1;
            this.label18.Text = "Moneda";
            // 
            // frmInfoVenta
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ControlLightLight;
            this.ClientSize = new System.Drawing.Size(827, 588);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.panel1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "frmInfoVenta";
            this.Text = "frmInfoVenta";
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvProductos)).EndInit();
            this.groupBox4.ResumeLayout(false);
            this.groupBox4.PerformLayout();
            this.groupBox5.ResumeLayout(false);
            this.groupBox5.PerformLayout();
            this.panel2.ResumeLayout(false);
            this.panel3.ResumeLayout(false);
            this.groupBox6.ResumeLayout(false);
            this.groupBox6.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Button btRegresar;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button btBuscarCliente;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtNumDocCliente;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtNombreCliente;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.DateTimePicker dtpFechaEntrega;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Button btCancelar;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Button btBuscarProducto;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox txtNombreProducto;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.TextBox txtDescuento;
        private System.Windows.Forms.Button btAgregarProducto;
        private System.Windows.Forms.DataGridView dgvProductos;
        private System.Windows.Forms.Button btReclamo;
        private System.Windows.Forms.Button btEditarGuardar;
        private System.Windows.Forms.GroupBox groupBox4;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.TextBox txtMontoTotal;
        private System.Windows.Forms.GroupBox groupBox5;
        private System.Windows.Forms.Label label14;
        private System.Windows.Forms.TextBox txtTipoDeCambio;
        private System.Windows.Forms.Label label16;
        private System.Windows.Forms.ComboBox cbMoneda;
        private System.Windows.Forms.Label label17;
        private System.Windows.Forms.Button btAnular;
        private System.Windows.Forms.Label label19;
        private System.Windows.Forms.TextBox txtPrecio;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.Button btEliminarProducto;
        private System.Windows.Forms.TextBox txtCantidad;
        private System.Windows.Forms.DateTimePicker dtpFechaLimite;
        private System.Windows.Forms.GroupBox groupBox6;
        private System.Windows.Forms.Label label18;
        private System.Windows.Forms.Label lblVenta;
        private System.Windows.Forms.DateTimePicker dtpFechaCompra;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.RadioButton rbTienda;
        private System.Windows.Forms.RadioButton rbDelivery;
        private System.Windows.Forms.TextBox txtDireccion;
        private System.Windows.Forms.TextBox txtStock;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.DataGridViewTextBoxColumn ID;
        private System.Windows.Forms.DataGridViewTextBoxColumn nombre;
        private System.Windows.Forms.DataGridViewTextBoxColumn cantidad;
        private System.Windows.Forms.DataGridViewTextBoxColumn precio;
        private System.Windows.Forms.RadioButton rbCancelado;
        private System.Windows.Forms.RadioButton rbNoCancelado;
    }
}