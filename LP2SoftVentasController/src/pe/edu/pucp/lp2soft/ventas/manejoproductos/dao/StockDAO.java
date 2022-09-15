/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package pe.edu.pucp.lp2soft.ventas.manejoproductos.dao;

import java.util.ArrayList;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Stock;

/**
 *
 * @author xuany
 */
public interface StockDAO {
    public int insertar(Stock stock);
    public int modificar(Stock stock);
    public int eliminar(int id);
    public ArrayList<Stock> listarTodos();
}
