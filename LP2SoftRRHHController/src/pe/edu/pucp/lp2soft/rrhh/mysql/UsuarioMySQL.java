
package pe.edu.pucp.lp2soft.rrhh.mysql;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import pe.edu.pucp.lp2soft.config.DBManager;
import pe.edu.pucp.lp2soft.rrhh.dao.UsuarioDAO;
import pe.edu.pucp.lp2soft.rrhh.model.TipoDeDocumento;
import pe.edu.pucp.lp2soft.rrhh.model.Usuario;


public class UsuarioMySQL implements UsuarioDAO {
    
    private Connection con;
    private CallableStatement cs;
    private ResultSet rs;
    
    @Override
    public int insertar(Usuario usuario) {
        
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call INSERTAR_USUARIO(?,?,?,?,?,?,?,?,?,?,?)}");
            cs.registerOutParameter("_id_usuario", java.sql.Types.INTEGER);
            cs.setString("_password", usuario.getPassword());
            cs.setDate("_fecha_de_ingreso", new java.sql.Date(usuario.getFechaIngreso().getTime()));
            cs.setString("_tipo_de_documento", usuario.getTipoDeDocumento().name());
            cs.setString("_numero_de_documento", usuario.getNumDeDocumento());
            cs.setString("_nombre", usuario.getNombre());
            cs.setString("_apellido", usuario.getApellido());
            cs.setDate("_fecha_de_nacimiento", new java.sql.Date(usuario.getFechaDeNacimiento().getTime()));
            cs.setString("_telefono", usuario.getTelefono());
            cs.setString("_direccion", usuario.getDireccion());
            cs.setString("_email", usuario.getEmail());
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public int modificar(Usuario usuario) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call MODIFICAR_USUARIO(?,?,?"
                    + ",?,?,?,?,?,?,?,?)}");
            cs.setInt("_id_usuario", usuario.getIdUsuario());
            cs.setString("_password", usuario.getPassword());
            cs.setDate("_fecha_de_ingreso", new java.sql.Date(usuario.getFechaIngreso().getTime()));
            cs.setString("_tipo_de_documento", usuario.getTipoDeDocumento().name());
            cs.setString("_numero_de_documento", usuario.getNumDeDocumento());
            cs.setString("_nombre", usuario.getNombre());
            cs.setString("_apellido", usuario.getApellido());
            cs.setDate("_fecha_de_nacimiento", new java.sql.Date(usuario.getFechaDeNacimiento().getTime()));
            cs.setString("_telefono", usuario.getTelefono());
            cs.setString("_direccion", usuario.getDireccion());
            cs.setString("_email", usuario.getEmail());
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public int eliminar(int idUsuario) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call ELIMINAR_USUARIO(?)}");
            cs.setInt("_id_usuario", idUsuario);
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public ArrayList<Usuario> listarTodos() {
        ArrayList<Usuario> usuarios = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("call LISTAR_USUARIOS()");
            rs = cs.executeQuery();
            while(rs.next()){
                Usuario usuario = new Usuario() {};
                usuario.setIdUsuario(rs.getInt("id_usuario"));
                usuario.setPassword(rs.getString("password"));
                usuario.setFechaIngreso(rs.getDate("fecha_de_ingreso"));
                usuario.setTipoDeDocumento(TipoDeDocumento.valueOf((rs.getString("tipo_documento"))));
                usuario.setNumDeDocumento(rs.getString("numero_de_documento"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setApellido(rs.getString("apellido"));
                usuario.setFechaDeNacimiento(rs.getDate("fecha_de_nacimiento"));
                usuario.setTelefono(rs.getString("telefono"));
                usuario.setDireccion(rs.getString("direccion"));
                usuario.setEmail(rs.getString("email"));
                usuarios.add(usuario);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){
                System.out.println(ex.getMessage());
            }
        }
        return usuarios;
    }
    
}
