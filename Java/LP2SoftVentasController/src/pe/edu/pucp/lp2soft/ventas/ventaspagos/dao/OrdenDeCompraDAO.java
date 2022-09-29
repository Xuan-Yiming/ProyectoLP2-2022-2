/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package pe.edu.pucp.lp2soft.ventas.ventaspagos.dao;

import java.util.ArrayList;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.OrdenDeCompra;

/**
 *
 * @author xuany
 */
public interface OrdenDeCompraDAO {
    public int insertar(OrdenDeCompra ordenDeCompra);
    public int modificar(OrdenDeCompra ordenDeCompra);
    public int eliminar(int id);
    public ArrayList<OrdenDeCompra> listarTodos();
}
