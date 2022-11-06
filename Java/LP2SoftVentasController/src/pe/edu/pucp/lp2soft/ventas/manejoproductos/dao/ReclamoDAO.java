package pe.edu.pucp.lp2soft.ventas.manejoproductos.dao;

import java.util.ArrayList;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Reclamo;

public interface ReclamoDAO {
    public int insertar(Reclamo reclamo);
    public int modificar(Reclamo reclamo);
    public int eliminar(int id);
    public ArrayList<Reclamo> listarTodos();
}
