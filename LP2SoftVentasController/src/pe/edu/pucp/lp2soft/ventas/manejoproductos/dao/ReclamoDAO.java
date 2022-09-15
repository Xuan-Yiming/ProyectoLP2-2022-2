/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package pe.edu.pucp.lp2soft.ventas.manejoproductos.dao;

import java.util.ArrayList;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Reclamo;

/**
 *
 * @author xuany
 */
public interface ReclamoDAO {
    public int insertar(Reclamo reclamo);
    public int modificar(Reclamo reclamo);
    public int eliminar(int id);
    public ArrayList<Reclamo> listarTodos();
}
