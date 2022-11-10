package pe.edu.pucp.lp2soft.ventas.manejoproductos.dao;

import java.util.ArrayList;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Reclamo;

public interface ReclamoDAO {
    public int insertarReclamo(Reclamo reclamo);
    public int modificarReclamo(Reclamo reclamo);
    public int eliminarReclamo(int id);
    public ArrayList<Reclamo> listarReclamoxOrden(int IdOrden);
    public ArrayList<Reclamo> listarReclamoTodos();
}
