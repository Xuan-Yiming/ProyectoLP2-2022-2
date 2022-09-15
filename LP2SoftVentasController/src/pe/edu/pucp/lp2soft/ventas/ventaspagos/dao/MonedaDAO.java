/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package pe.edu.pucp.lp2soft.ventas.ventaspagos.dao;

import java.util.ArrayList;
import pe.edu.pucp.lp2soft.ventaspagos.Moneda;

/**
 *
 * @author xuany
 */
public interface MonedaDAO {
    public int insertar(Moneda moneda);
    public int modificar(Moneda moneda);
    public int eliminar(int id);
    public ArrayList<Moneda> listarTodos();
}
