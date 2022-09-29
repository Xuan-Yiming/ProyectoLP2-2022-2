namespace LP2Soft
{
    partial class frmEliminarUsuario
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
            this.btRegresar = new System.Windows.Forms.Button();
            this.btAceptar = new System.Windows.Forms.Button();
            this.txtIDusuario = new System.Windows.Forms.TextBox();
            this.lblMensaje = new System.Windows.Forms.Label();
            this.lblTitulo = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // btRegresar
            // 
            this.btRegresar.BackColor = System.Drawing.SystemColors.ButtonShadow;
            this.btRegresar.Location = new System.Drawing.Point(544, 362);
            this.btRegresar.Name = "btRegresar";
            this.btRegresar.Size = new System.Drawing.Size(103, 42);
            this.btRegresar.TabIndex = 67;
            this.btRegresar.Text = "Regresar";
            this.btRegresar.UseVisualStyleBackColor = false;
            // 
            // btAceptar
            // 
            this.btAceptar.BackColor = System.Drawing.SystemColors.ButtonShadow;
            this.btAceptar.Location = new System.Drawing.Point(653, 362);
            this.btAceptar.Name = "btAceptar";
            this.btAceptar.Size = new System.Drawing.Size(103, 42);
            this.btAceptar.TabIndex = 64;
            this.btAceptar.Text = "Aceptar";
            this.btAceptar.UseVisualStyleBackColor = false;
            // 
            // txtIDusuario
            // 
            this.txtIDusuario.Location = new System.Drawing.Point(393, 189);
            this.txtIDusuario.Name = "txtIDusuario";
            this.txtIDusuario.Size = new System.Drawing.Size(120, 22);
            this.txtIDusuario.TabIndex = 57;
            // 
            // lblMensaje
            // 
            this.lblMensaje.AutoSize = true;
            this.lblMensaje.Location = new System.Drawing.Point(272, 179);
            this.lblMensaje.Name = "lblMensaje";
            this.lblMensaje.Size = new System.Drawing.Size(118, 32);
            this.lblMensaje.TabIndex = 56;
            this.lblMensaje.Text = "Ingrese el ID del \r\nusuario a eliminar :";
            // 
            // lblTitulo
            // 
            this.lblTitulo.AutoSize = true;
            this.lblTitulo.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTitulo.ForeColor = System.Drawing.Color.Black;
            this.lblTitulo.Location = new System.Drawing.Point(294, 36);
            this.lblTitulo.Name = "lblTitulo";
            this.lblTitulo.Size = new System.Drawing.Size(183, 20);
            this.lblTitulo.TabIndex = 55;
            this.lblTitulo.Text = "ELIMINAR USUARIO";
            // 
            // frmEliminarUsuario
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btRegresar);
            this.Controls.Add(this.btAceptar);
            this.Controls.Add(this.txtIDusuario);
            this.Controls.Add(this.lblMensaje);
            this.Controls.Add(this.lblTitulo);
            this.Name = "frmEliminarUsuario";
            this.Text = "Eliminar Usuario";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btRegresar;
        private System.Windows.Forms.Button btAceptar;
        private System.Windows.Forms.TextBox txtIDusuario;
        private System.Windows.Forms.Label lblMensaje;
        private System.Windows.Forms.Label lblTitulo;
    }
}