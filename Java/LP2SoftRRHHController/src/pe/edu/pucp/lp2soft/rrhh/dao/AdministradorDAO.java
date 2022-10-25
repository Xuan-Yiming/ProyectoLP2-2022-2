
package pe.edu.pucp.lp2soft.rrhh.dao;

import java.util.ArrayList;
import pe.edu.pucp.lp2soft.rrhh.model.Administrador;


public interface AdministradorDAO {
    public int insertar(Administrador administrador);
    public int modificar(Administrador administrador);
    public int eliminar(int id_usuario,String area);
    public ArrayList<Administrador> listarTodos();
    public ArrayList<Administrador> listarPorDocumentoNombre(String docNombre);
}
