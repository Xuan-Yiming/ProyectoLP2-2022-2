/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package pe.edu.pucp.lp2soft.ventas.ventaspagos.dao;

import java.util.ArrayList;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.DocumentoDebito;

/**
 *
 * @author xuany
 */
public interface DocumentoDebitoDAO {
    public int insertar(DocumentoDebito documentoDebito);
    public int modificar(DocumentoDebito documentoDebito);
    public int eliminar(int id);
    public ArrayList<DocumentoDebito> listarTodos();
}
