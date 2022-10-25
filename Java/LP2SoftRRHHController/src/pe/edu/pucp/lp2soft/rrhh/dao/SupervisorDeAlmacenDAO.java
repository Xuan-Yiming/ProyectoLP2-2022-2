
package pe.edu.pucp.lp2soft.rrhh.dao;

import java.util.ArrayList;
import pe.edu.pucp.lp2soft.rrhh.model.SupervisorDeAlmacen;


public interface SupervisorDeAlmacenDAO {
    public int insertar(SupervisorDeAlmacen supervisorAlmacen);
    public int modificar(SupervisorDeAlmacen supervisorAlmacen);
    public int eliminar(int id_usuario,int id_almacen);
    public ArrayList<SupervisorDeAlmacen> listarTodos();
    public ArrayList<SupervisorDeAlmacen> listarPorDocumentoNombre(String docNombre);
}
