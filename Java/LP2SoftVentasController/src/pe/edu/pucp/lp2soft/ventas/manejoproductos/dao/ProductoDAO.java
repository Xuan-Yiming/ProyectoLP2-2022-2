package pe.edu.pucp.lp2soft.ventas.manejoproductos.dao;

import java.util.ArrayList;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Producto;

public interface ProductoDAO {
    public int insertar(Producto producto);
    public int modificar(Producto producto);
    public int eliminar(int idProducto);
    public ArrayList<Producto> listarTodos();
    public ArrayList<Producto> listarPorNombre(String nombre);
}
