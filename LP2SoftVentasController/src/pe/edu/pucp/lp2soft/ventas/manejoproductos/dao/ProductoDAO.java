/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package pe.edu.pucp.lp2soft.ventas.manejoproductos.dao;

import java.util.ArrayList;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Producto;

/**
 *
 * @author xuany
 */
public interface ProductoDAO {
    public int insertar(Producto producto);
    public int modificar(Producto producto);
    public int eliminar(int id);
    public ArrayList<Producto> listarTodos();
}
