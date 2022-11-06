package pe.edu.pucp.lp2soft.rrhh.dao;

import java.util.ArrayList;
import pe.edu.pucp.lp2soft.rrhh.model.Usuario;


public interface UsuarioDAO {
    public int insertarUsuario(Usuario usuario);
    public int modificarUsuario(Usuario usuario);
    public int eliminarUsuario(int idUsuario);

    public Usuario verificar(Usuario cuentaUsuario);
    public ArrayList<Usuario> listarTodos();
    public ArrayList<Usuario> listarPorDocumentoNombre(String docNombre);
}
