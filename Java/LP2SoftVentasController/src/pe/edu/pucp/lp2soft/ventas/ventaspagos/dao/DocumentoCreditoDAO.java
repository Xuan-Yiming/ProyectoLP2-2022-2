/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package pe.edu.pucp.lp2soft.ventas.ventaspagos.dao;

import java.util.ArrayList;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.DocumentoCredito;

/**
 *
 * @author xuany
 */
public interface DocumentoCreditoDAO {
    public int insertar(DocumentoCredito documentoCredito);
    public int modificar(DocumentoCredito documentoCredito);
    public int eliminar(int id);
    public ArrayList<DocumentoCredito> listarTodos();
}
