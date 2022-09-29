/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package pe.edu.pucp.lp2soft.ventas.manejoproductos.dao;

import java.util.ArrayList;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Pedido;

/**
 *
 * @author xuany
 */
public interface PedidoDAO {
    public int insertar(Pedido pedido);
    public int modificar(Pedido pedido);
    public int eliminar(int id);
    public ArrayList<Pedido> listarTodos();
}
