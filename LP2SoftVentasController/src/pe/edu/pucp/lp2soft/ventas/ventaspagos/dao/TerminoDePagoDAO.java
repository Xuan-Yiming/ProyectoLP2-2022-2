/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package pe.edu.pucp.lp2soft.ventas.ventaspagos.dao;

import java.util.ArrayList;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.TerminoDePago;

/**
 *
 * @author xuany
 */
public interface TerminoDePagoDAO {
    public int insertar(TerminoDePago terminoDePago);
    public int modificar(TerminoDePago terminoDePago);
    public int eliminar(int id);
    public ArrayList<TerminoDePago> listarTodos();
}
