package pe.edu.pucp.lp2soft.rrhh.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import pe.edu.pucp.lp2soft.config.DBManager;
import pe.edu.pucp.lp2soft.enums.Area;
import pe.edu.pucp.lp2soft.rrhh.dao.UsuarioDAO;
import pe.edu.pucp.lp2soft.rrhh.model.Administrador;
import pe.edu.pucp.lp2soft.rrhh.model.SupervisorDeAlmacen;
import pe.edu.pucp.lp2soft.rrhh.model.Usuario;
import pe.edu.pucp.lp2soft.rrhh.model.Vendedor;
import pe.edu.pucp.lp2soft.enums.Sexo;
import pe.edu.pucp.lp2soft.enums.TipoDeDocumento;


public class UsuarioMySQL implements UsuarioDAO {
    
    private Connection con;
    private CallableStatement cs;
    private ResultSet rs;
    
    @Override
    public int insertarUsuario(Usuario usuario) {        
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            if (usuario instanceof Administrador){
                cs = con.prepareCall("{call INSERTAR_ADMINISTRADOR(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
                cs.setString("_area", ((Administrador)usuario).getArea().name());
            }
            else if (usuario instanceof SupervisorDeAlmacen){
                cs = con.prepareCall("{call INSERTAR_SUPERVISOR_DE_ALMACEN(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            }
            else if (usuario instanceof Vendedor){               
                cs = con.prepareCall("{call INSERTAR_VENDEDOR(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
                cs.setInt("_cantidad_ventas", ((Vendedor)usuario).getCantidadVentas());
            }
            cs.registerOutParameter("_id_usuario", java.sql.Types.INTEGER);
            cs.setString("_username", usuario.getUsername());
            cs.setString("_password", usuario.getPassword());            
            cs.setDate("_fecha_de_ingreso", new java.sql.Date(usuario.getFechaIngreso().getTime()));
            cs.setBytes("_foto_de_perfil", usuario.getFotoPerfil());
            cs.setString("_tipo_de_documento", usuario.getTipoDeDocumento().name());
            cs.setString("_numero_de_documento", usuario.getNumDeDocumento());
            cs.setString("_nombre", usuario.getNombre());
            cs.setString("_apellido", usuario.getApellido());
            cs.setDate("_fecha_de_nacimiento", new java.sql.Date(usuario.getFechaDeNacimiento().getTime()));
            cs.setString("_sexo", usuario.getSexo().name());
            cs.setString("_telefono", usuario.getTelefono());
            cs.setString("_direccion", usuario.getDireccion());
            cs.setString("_email", usuario.getEmail());
            cs.setBoolean("_activo", usuario.getActivo());
            cs.executeUpdate();
            resultado = cs.getInt("_id_usuario");
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public int modificarUsuario(Usuario usuario) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            if (usuario instanceof Administrador){
                cs = con.prepareCall("{call MODIFICAR_ADMINISTRADOR(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
                cs.setString("_area", ((Administrador)usuario).getArea().name());
            }
            else if (usuario instanceof SupervisorDeAlmacen){
                cs = con.prepareCall("{call MODIFICAR_SUPERVISOR_DE_ALMACEN(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            }
            else if (usuario instanceof Vendedor){               
                cs = con.prepareCall("{call MODIFICAR_VENDEDOR(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
                cs.setInt("_cantidad_ventas", ((Vendedor)usuario).getCantidadVentas());
            }
            cs.setInt("_id_usuario", usuario.getIdUsuario());
            cs.setString("_username", usuario.getUsername());
            cs.setString("_password", usuario.getPassword());            
            cs.setDate("_fecha_de_ingreso", new java.sql.Date(usuario.getFechaIngreso().getTime()));
            cs.setBytes("_foto_de_perfil", usuario.getFotoPerfil());
            cs.setString("_tipo_de_documento", usuario.getTipoDeDocumento().name());
            cs.setString("_numero_de_documento", usuario.getNumDeDocumento());
            cs.setString("_nombre", usuario.getNombre());
            cs.setString("_apellido", usuario.getApellido());
            cs.setDate("_fecha_de_nacimiento", new java.sql.Date(usuario.getFechaDeNacimiento().getTime()));
            cs.setString("_sexo", usuario.getSexo().name());
            cs.setString("_telefono", usuario.getTelefono());
            cs.setString("_direccion", usuario.getDireccion());
            cs.setString("_email", usuario.getEmail());
            cs.setBoolean("_activo", usuario.getActivo());
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public int eliminarUsuario(int idUsuario) {
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
                Usuario usuario;
                if(rs.getString("area")!=null){
                    usuario  = new Administrador();
                    ((Administrador)usuario).setArea(Area.valueOf(rs.getString("area")));
                }else if (rs.getInt("cantidad_ventas")>0){
                    usuario = new Vendedor();
                    ((Vendedor)usuario).setCantidadVentas(rs.getInt("cantidad_ventas"));
                }else{
                    usuario = new SupervisorDeAlmacen();
                }
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
                usuario.setActivo(true);
                usuario.setIdPersona(usuario.getIdUsuario());
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

    @Override
    public ArrayList<Usuario> listarPorDocumentoNombre(String docNombre) {
        ArrayList<Usuario> usuarios = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("call LISTAR_USUARIOS_X_DOCUMENTO_NOMBRE(?)");
            cs.setString(1, docNombre);
            rs = cs.executeQuery();
            while(rs.next()){
                Usuario usuario;
                if(rs.getString("area")!=null){
                    usuario  = new Administrador();
                    ((Administrador)usuario).setArea(Area.valueOf(rs.getString("area")));
                }else if (rs.getInt("cantidad_ventas")>0){
                    usuario = new Vendedor();
                    ((Vendedor)usuario).setCantidadVentas(rs.getInt("cantidad_ventas"));
                }else{
                    usuario = new SupervisorDeAlmacen();
                }
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

    @Override
    public Usuario verificar(Usuario cuentaUsuario) {
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call VERIFICAR_CUENTA_USUARIO(?,?)}");
            cs.setString("_username", cuentaUsuario.getUsername());
            cs.setString("_password", cuentaUsuario.getPassword());
            rs = cs.executeQuery();
            rs.next();
            Usuario usuario;
            if(rs.getString("area")!=null){
                usuario  = new Administrador();
                ((Administrador)usuario).setArea(Area.valueOf(rs.getString("area")));
            }else if (rs.getInt("cantidad_ventas")>0){
                usuario = new Vendedor();
                ((Vendedor)usuario).setCantidadVentas(rs.getInt("cantidad_ventas"));
            }else{
                usuario = new SupervisorDeAlmacen();
            }
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
            return usuario;
            
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return null;
    }

}
