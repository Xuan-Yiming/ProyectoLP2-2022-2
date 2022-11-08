package pe.edu.pucp.lp2soft.ventas.manejoproductos.dao;

import java.util.ArrayList;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Stock;

/**
 *
 * @author xuany
 */
public interface StockDAO {
    public int insertar(Stock stock, int idAlmacen);
    public int modificar(Stock stock, int idAlmacen);
    public int eliminar(int idAlmacen, int idProducto);
    public ArrayList<Stock> listarPorAlmacen(int idAlmacen);
    public ArrayList<Stock> listarPorAlmacenYNombre(int idAlmacen, String nombre);
}
