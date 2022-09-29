namespace LP2Soft
{
    partial class frmSupervisorAlmacen
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
            this.lblTitulo = new System.Windows.Forms.Label();
            this.lblIDalmacen = new System.Windows.Forms.Label();
            this.txtIDalmacen = new System.Windows.Forms.TextBox();
            this.lblConfirmaciónContraseña = new System.Windows.Forms.Label();
            this.txtConfirmarPassword = new System.Windows.Forms.TextBox();
            this.lblPassword = new System.Windows.Forms.Label();
            this.txtPassword = new System.Windows.Forms.TextBox();
            this.txtUsername = new System.Windows.Forms.TextBox();
            this.lblUsername = new System.Windows.Forms.Label();
            this.btAceptar = new System.Windows.Forms.Button();
            this.lblFechaIngreso = new System.Windows.Forms.Label();
            this.dtpFechaIngreso = new System.Windows.Forms.DateTimePicker();
            this.btRegresar = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // lblTitulo
            // 
            this.lblTitulo.AutoSize = true;
            this.lblTitulo.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTitulo.ForeColor = System.Drawing.Color.Black;
            this.lblTitulo.Location = new System.Drawing.Point(195, 28);
            this.lblTitulo.Name = "lblTitulo";
            this.lblTitulo.Size = new System.Drawing.Size(385, 20);
            this.lblTitulo.TabIndex = 1;
            this.lblTitulo.Text = "REGISTRO DE SUPERVISOR DE ALMACÉN";
            // 
            // lblIDalmacen
            // 
            this.lblIDalmacen.AutoSize = true;
            this.lblIDalmacen.Location = new System.Drawing.Point(249, 228);
            this.lblIDalmacen.Name = "lblIDalmacen";
            this.lblIDalmacen.Size = new System.Drawing.Size(100, 16);
            this.lblIDalmacen.TabIndex = 21;
            this.lblIDalmacen.Text = "ID del almacén:";
            // 
            // txtIDalmacen
            // 
            this.txtIDalmacen.Location = new System.Drawing.Point(355, 222);
            this.txtIDalmacen.Name = "txtIDalmacen";
            this.txtIDalmacen.Size = new System.Drawing.Size(120, 22);
            this.txtIDalmacen.TabIndex = 20;
            // 
            // lblConfirmaciónContraseña
            // 
            this.lblConfirmaciónContraseña.AutoSize = true;
            this.lblConfirmaciónContraseña.Location = new System.Drawing.Point(212, 185);
            this.lblConfirmaciónContraseña.Name = "lblConfirmaciónContraseña";
            this.lblConfirmaciónContraseña.Size = new System.Drawing.Size(137, 16);
            this.lblConfirmaciónContraseña.TabIndex = 19;
            this.lblConfirmaciónContraseña.Text = "Confirmar contraseña:";
            // 
            // txtConfirmarPassword
            // 
            this.txtConfirmarPassword.Location = new System.Drawing.Point(355, 182);
            this.txtConfirmarPassword.Name = "txtConfirmarPassword";
            this.txtConfirmarPassword.Size = new System.Drawing.Size(148, 22);
            this.txtConfirmarPassword.TabIndex = 18;
            // 
            // lblPassword
            // 
            this.lblPassword.AutoSize = true;
            this.lblPassword.Location = new System.Drawing.Point(270, 147);
            this.lblPassword.Name = "lblPassword";
            this.lblPassword.Size = new System.Drawing.Size(79, 16);
            this.lblPassword.TabIndex = 17;
            this.lblPassword.Text = "Contraseña:";
            // 
            // txtPassword
            // 
            this.txtPassword.Location = new System.Drawing.Point(355, 144);
            this.txtPassword.Name = "txtPassword";
            this.txtPassword.Size = new System.Drawing.Size(148, 22);
            this.txtPassword.TabIndex = 16;
            // 
            // txtUsername
            // 
            this.txtUsername.Location = new System.Drawing.Point(355, 102);
            this.txtUsername.Name = "txtUsername";
            this.txtUsername.Size = new System.Drawing.Size(120, 22);
            this.txtUsername.TabIndex = 15;
            // 
            // lblUsername
            // 
            this.lblUsername.AutoSize = true;
            this.lblUsername.Location = new System.Drawing.Point(276, 105);
            this.lblUsername.Name = "lblUsername";
            this.lblUsername.Size = new System.Drawing.Size(73, 16);
            this.lblUsername.TabIndex = 14;
            this.lblUsername.Text = "Username:";
            // 
            // btAceptar
            // 
            this.btAceptar.BackColor = System.Drawing.SystemColors.ButtonShadow;
            this.btAceptar.Location = new System.Drawing.Point(638, 361);
            this.btAceptar.Name = "btAceptar";
            this.btAceptar.Size = new System.Drawing.Size(103, 42);
            this.btAceptar.TabIndex = 25;
            this.btAceptar.Text = "Aceptar";
            this.btAceptar.UseVisualStyleBackColor = false;
            this.btAceptar.Click += new System.EventHandler(this.btAceptar_Click);
            // 
            // lblFechaIngreso
            // 
            this.lblFechaIngreso.AutoSize = true;
            this.lblFechaIngreso.Location = new System.Drawing.Point(234, 267);
            this.lblFechaIngreso.Name = "lblFechaIngreso";
            this.lblFechaIngreso.Size = new System.Drawing.Size(115, 16);
            this.lblFechaIngreso.TabIndex = 27;
            this.lblFechaIngreso.Text = "Fecha de Ingreso:";
            // 
            // dtpFechaIngreso
            // 
            this.dtpFechaIngreso.Location = new System.Drawing.Point(355, 262);
            this.dtpFechaIngreso.Name = "dtpFechaIngreso";
            this.dtpFechaIngreso.Size = new System.Drawing.Size(255, 22);
            this.dtpFechaIngreso.TabIndex = 26;
            // 
            // btRegresar
            // 
            this.btRegresar.BackColor = System.Drawing.SystemColors.ButtonShadow;
            this.btRegresar.Location = new System.Drawing.Point(529, 361);
            this.btRegresar.Name = "btRegresar";
            this.btRegresar.Size = new System.Drawing.Size(103, 42);
            this.btRegresar.TabIndex = 28;
            this.btRegresar.Text = "Regresar";
            this.btRegresar.UseVisualStyleBackColor = false;
            this.btRegresar.Click += new System.EventHandler(this.btRegresar_Click);
            // 
            // frmSupervisorAlmacen
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btRegresar);
            this.Controls.Add(this.lblFechaIngreso);
            this.Controls.Add(this.dtpFechaIngreso);
            this.Controls.Add(this.btAceptar);
            this.Controls.Add(this.lblIDalmacen);
            this.Controls.Add(this.txtIDalmacen);
            this.Controls.Add(this.lblConfirmaciónContraseña);
            this.Controls.Add(this.txtConfirmarPassword);
            this.Controls.Add(this.lblPassword);
            this.Controls.Add(this.txtPassword);
            this.Controls.Add(this.txtUsername);
            this.Controls.Add(this.lblUsername);
            this.Controls.Add(this.lblTitulo);
            this.Name = "frmSupervisorAlmacen";
            this.Text = "Registro de Supervisor de Almacén";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblTitulo;
        private System.Windows.Forms.Label lblIDalmacen;
        private System.Windows.Forms.TextBox txtIDalmacen;
        private System.Windows.Forms.Label lblConfirmaciónContraseña;
        private System.Windows.Forms.TextBox txtConfirmarPassword;
        private System.Windows.Forms.Label lblPassword;
        private System.Windows.Forms.TextBox txtPassword;
        private System.Windows.Forms.TextBox txtUsername;
        private System.Windows.Forms.Label lblUsername;
        private System.Windows.Forms.Button btAceptar;
        private System.Windows.Forms.Label lblFechaIngreso;
        private System.Windows.Forms.DateTimePicker dtpFechaIngreso;
        private System.Windows.Forms.Button btRegresar;
    }
}