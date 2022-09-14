
package pe.edu.pucp.lp2soft.rrhh.dao;

import java.util.ArrayList;
import pe.edu.pucp.lp2soft.rrhh.model.Persona;


public interface PersonaDAO {
    public int insertar(Persona persona);
    public int modificar(Persona persona);
    public int eliminar(String numDeDocumento);
    public ArrayList<Persona> listarTodos();
}
