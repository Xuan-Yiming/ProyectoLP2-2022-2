
package pe.edu.pucp.lp2soft.rrhh.dao;

import java.util.ArrayList;
import pe.edu.pucp.lp2soft.rrhh.model.Usuario;


public interface UsuarioDAO {
    public int insertar(Usuario usuario);
    public int modificar(Usuario usuario);
    public int eliminar(int idUsuario);
    public ArrayList<Usuario> listarTodos();
    public Usuario verificar(Usuario cuentaUsuario);
}
