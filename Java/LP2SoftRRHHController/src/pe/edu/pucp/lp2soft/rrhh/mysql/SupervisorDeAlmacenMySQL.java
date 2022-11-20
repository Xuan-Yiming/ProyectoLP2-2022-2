package pe.edu.pucp.lp2soft.rrhh.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import pe.edu.pucp.lp2soft.config.DBManager;
import pe.edu.pucp.lp2soft.enums.Sexo;
import pe.edu.pucp.lp2soft.enums.TipoDeDocumento;
import pe.edu.pucp.lp2soft.rrhh.model.SupervisorDeAlmacen;
import pe.edu.pucp.lp2soft.rrhh.dao.SupervisorDeAlmacenDAO;

public class SupervisorDeAlmacenMySQL implements SupervisorDeAlmacenDAO  {    
    private Connection con;
    private CallableStatement cs;
    private ResultSet rs;
    @Override
    public SupervisorDeAlmacen buscarPorID (int idUsuario) {
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call BUSCAR_SUPERVISOR_X_ID_USUARIO(?)}");
            cs.setInt("_id_usuario", idUsuario);
            rs = cs.executeQuery();
            rs.next();
            SupervisorDeAlmacen usuario = new SupervisorDeAlmacen();
            usuario.setIdUsuario(rs.getInt("id_usuario"));
            usuario.setUsername(rs.getString("username"));
            usuario.setPassword(rs.getString("password"));
            usuario.setFechaIngreso(rs.getDate("fecha_de_ingreso"));
            usuario.setFotoPerfil(rs.getBytes("foto_de_perfil"));
            usuario.setTipoDeDocumento(TipoDeDocumento.valueOf((rs.getString("tipo_de_documento"))));
            usuario.setNumDeDocumento(rs.getString("numero_de_documento"));
            usuario.setNombre(rs.getString("nombre"));
            usuario.setApellido(rs.getString("apellido"));
            usuario.setFechaDeNacimiento(rs.getDate("fecha_de_nacimiento"));
            usuario.setSexo(Sexo.valueOf(rs.getString("sexo")));
            usuario.setTelefono(rs.getString("telefono"));
            usuario.setDireccion(rs.getString("direccion"));
            usuario.setEmail(rs.getString("email"));
            usuario.setActivo(rs.getBoolean("activo"));
            usuario.setIdPersona(usuario.getIdUsuario());
            return (SupervisorDeAlmacen) usuario;
            
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return null;
    }

    @Override
    public ArrayList<SupervisorDeAlmacen> listarTodos(){
        ArrayList<SupervisorDeAlmacen> lista = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_SUPERVISORES()}");
            rs = cs.executeQuery();
            while(rs.next()){
                SupervisorDeAlmacen usuario = new SupervisorDeAlmacen();
                usuario.setIdUsuario(rs.getInt("id_usuario"));
                usuario.setUsername(rs.getString("username"));
                usuario.setPassword(rs.getString("password"));
                usuario.setFechaIngreso(rs.getDate("fecha_de_ingreso"));
                usuario.setFotoPerfil(rs.getBytes("foto_de_perfil"));
                usuario.setTipoDeDocumento(TipoDeDocumento.valueOf((rs.getString("tipo_de_documento"))));
                usuario.setNumDeDocumento(rs.getString("numero_de_documento"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setApellido(rs.getString("apellido"));
                usuario.setFechaDeNacimiento(rs.getDate("fecha_de_nacimiento"));
                usuario.setSexo(Sexo.valueOf(rs.getString("sexo")));
                usuario.setTelefono(rs.getString("telefono"));
                usuario.setDireccion(rs.getString("direccion"));
                usuario.setEmail(rs.getString("email"));
                usuario.setActivo(rs.getBoolean("activo"));
                usuario.setIdPersona(usuario.getIdUsuario());
                lista.add(usuario);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return lista;
    }
}
