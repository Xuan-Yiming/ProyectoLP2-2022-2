﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace LP2Soft.Ventas
{
    public partial class busquedaDocDeb : Form
    {
        public busquedaDocDeb()
        {
            InitializeComponent();
        }

        private void btnRegresar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            frmDocumentoDebito frmdocumentoDebito = new frmDocumentoDebito();
            frmdocumentoDebito.ShowDialog();
        }

        private void BtnSeleccionar_Click(object sender, EventArgs e)
        {
            frmDocumentoDebito frmdocumentoDebito = new frmDocumentoDebito();
            frmdocumentoDebito.ShowDialog();
        }
    }
}