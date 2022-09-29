/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package pe.edu.pucp.lp2soft.ventas.manejoproductos.dao;
import java.util.ArrayList;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Almacen;
/**
 *
 * @author xuany
 */
public interface AlmacenDAO {
    public int insertar(Almacen almacen);
    public int modificar(Almacen almacen);
    public int eliminar(int id);
    public ArrayList<Almacen> listarTodos();
}
