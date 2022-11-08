package pe.edu.pucp.lp2soft.rrhh.dao;

import java.util.ArrayList;
import pe.edu.pucp.lp2soft.rrhh.model.SupervisorDeAlmacen;

public interface SupervisorDeAlmacenDAO {
    public SupervisorDeAlmacen buscarPorID (int idUsuario);
    public ArrayList<SupervisorDeAlmacen> listarTodos();
}
