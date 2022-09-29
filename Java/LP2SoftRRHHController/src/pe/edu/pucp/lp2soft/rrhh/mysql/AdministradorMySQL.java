
package pe.edu.pucp.lp2soft.rrhh.mysql;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import pe.edu.pucp.lp2soft.config.DBManager;
import pe.edu.pucp.lp2soft.rrhh.dao.AdministradorDAO;
import pe.edu.pucp.lp2soft.rrhh.model.Administrador;
import pe.edu.pucp.lp2soft.rrhh.model.TipoDeDocumento;

public class AdministradorMySQL implements AdministradorDAO {

    private Connection con;
    private CallableStatement cs;
    private ResultSet rs;
    
    @Override
    public int insertar(Administrador administrador) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call INSERTAR_ADMINISTRADOR(?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            cs.registerOutParameter("_id_usuario", java.sql.Types.INTEGER);
            cs.setString("_area", administrador.getArea());
            cs.setString("_password", administrador.getPassword());
            cs.setString("_username", administrador.getUsername());
            cs.setDate("_fecha_de_ingreso", new java.sql.Date(administrador.getFechaIngreso().getTime()));
            cs.setString("_numero_de_documento", administrador.getNumDeDocumento());
            cs.setString("_tipo_de_documento", administrador.getTipoDeDocumento().name());
            cs.setString("_nombre", administrador.getNombre());
            cs.setString("_apellido", administrador.getApellido());
            cs.setDate("_fecha_de_nacimiento", new java.sql.Date(administrador.getFechaDeNacimiento().getTime()));
            cs.setString("_telefono", administrador.getTelefono());
            cs.setString("_direccion", administrador.getDireccion());
            cs.setString("_email", administrador.getEmail());
            resultado = cs.executeUpdate();
            administrador.setIdUsuario(cs.getInt("_id_usuario"));
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public int modificar(Administrador administrador) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call MODIFICAR_ADMINISTRADOR(?,?,?"
                    + ",?,?,?,?,?,?,?,?,?,?,?)}");
            cs.setInt("_id_usuario", administrador.getIdUsuario());
            cs.setString("_area", administrador.getArea());
            cs.setString("_password", administrador.getPassword());
            cs.setString("_username", administrador.getUsername());
            cs.setDate("_fecha_de_ingreso", new java.sql.Date(administrador.getFechaIngreso().getTime()));
            cs.setString("_tipo_de_documento", administrador.getTipoDeDocumento().name());
            cs.setString("_numero_de_documento", administrador.getNumDeDocumento());
            cs.setString("_nombre", administrador.getNombre());
            cs.setString("_apellido", administrador.getApellido());
            cs.setDate("_fecha_de_nacimiento", new java.sql.Date(administrador.getFechaDeNacimiento().getTime()));
            cs.setString("_telefono", administrador.getTelefono());
            cs.setString("_direccion", administrador.getDireccion());
            cs.setString("_email", administrador.getEmail());
            cs.setBoolean("_activo", administrador.getActivo());
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public int eliminar(int id_usuario, String area) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call ELIMINAR_ADMINISTRADOR(?)}");
            cs.setInt("_id_usuario", id_usuario);
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public ArrayList<Administrador> listarTodos() {
        ArrayList<Administrador> administradores = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("call LISTAR_ADMINISTRADORES()");
            rs = cs.executeQuery();
            while(rs.next()){
                Administrador administrador = new Administrador();
                administrador.setIdUsuario(rs.getInt("id_usuario"));
                administrador.setArea(rs.getString("area"));
                administrador.setPassword(rs.getString("password"));
                administrador.setUsername(rs.getString("username"));
                administrador.setFechaIngreso(rs.getDate("fecha_de_ingreso"));
                administrador.setTipoDeDocumento(TipoDeDocumento.valueOf((rs.getString("tipo_de_documento"))));
                administrador.setNumDeDocumento(rs.getString("numero_de_documento"));
                administrador.setNombre(rs.getString("nombre"));
                administrador.setApellido(rs.getString("apellido"));
                administrador.setFechaDeNacimiento(rs.getDate("fecha_de_nacimiento"));
                administrador.setTelefono(rs.getString("telefono"));
                administrador.setDireccion(rs.getString("direccion"));
                administrador.setEmail(rs.getString("email"));
                administradores.add(administrador);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){
                System.out.println(ex.getMessage());
            }
        }
        return administradores;
    }
    
}
