/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package pe.edu.pucp.lp2soft.ventas.manejoproductos.dao;

import java.util.ArrayList;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Devolucion;

/**
 *
 * @author xuany
 */
public interface DevolucionDAO {
    public int insertar(Devolucion devolucion);
    public int modificar(Devolucion devolucion);
    public int eliminar(int id);
    public ArrayList<Devolucion> listarTodos();
}
