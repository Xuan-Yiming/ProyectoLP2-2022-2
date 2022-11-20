package pe.edu.pucp.lp2soft.ventas.manejoproductos.dao;
import java.util.ArrayList;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Almacen;

public interface AlmacenDAO {
    public int insertar(Almacen almacen);
    public int modificar(Almacen almacen);
    public int eliminar(Almacen almacen);
    public ArrayList<Almacen> listarTodos();
    public ArrayList<Almacen> listarPorNombre(String nombre);
    public String buscarAlmacenxIdUsuario(int idUsuario);
}
