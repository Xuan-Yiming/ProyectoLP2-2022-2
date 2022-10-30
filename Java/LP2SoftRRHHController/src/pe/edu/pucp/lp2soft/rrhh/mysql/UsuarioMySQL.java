
package pe.edu.pucp.lp2soft.rrhh.mysql;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import pe.edu.pucp.lp2soft.config.DBManager;
import pe.edu.pucp.lp2soft.rrhh.dao.UsuarioDAO;
import pe.edu.pucp.lp2soft.rrhh.model.Administrador;
import pe.edu.pucp.lp2soft.rrhh.model.SupervisorDeAlmacen;
import pe.edu.pucp.lp2soft.rrhh.model.TipoDeDocumento;
import pe.edu.pucp.lp2soft.rrhh.model.Usuario;
import pe.edu.pucp.lp2soft.rrhh.model.Vendedor;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Almacen;


public class UsuarioMySQL implements UsuarioDAO {
    
    private Connection con;
    private CallableStatement cs;
    private ResultSet rs;
    
    @Override
    public int insertar(Usuario usuario) {
        
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call INSERTAR_USUARIO(?,?,?,?,?,?,?,?,?,?,?,?)}");
            cs.registerOutParameter("_id_usuario", java.sql.Types.INTEGER);
            cs.setString("_password", usuario.getPassword());
            cs.setString("_username", usuario.getUsername());
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
                    + ",?,?,?,?,?,?,?,?,?,?)}");
            cs.setInt("_id_usuario", usuario.getIdUsuario());
            cs.setString("_username", usuario.getUsername());
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
                usuario.setUsername(rs.getString("username"));
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
                usuario.setActivo(rs.getBoolean("activo"));
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
            if(rs.getString("cantidad_ventas")!=null){
                Vendedor vendedor = new Vendedor();
                vendedor.setIdUsuario(rs.getInt("id_usuario"));
                vendedor.setUsername(rs.getString("username"));
                vendedor.setPassword(rs.getString("password"));
                vendedor.setFechaIngreso(rs.getDate("fecha_de_ingreso"));
                vendedor.setIdPersona(rs.getInt("id_persona"));
                vendedor.setNumDeDocumento(rs.getString("numero_de_documento"));
                
                vendedor.setNombre(rs.getString("nombre"));
                vendedor.setApellido(rs.getString("apellido"));
                vendedor.setFechaDeNacimiento(rs.getDate("fecha_de_nacimiento"));
                vendedor.setTelefono(rs.getString("telefono"));
                vendedor.setDireccion(rs.getString("direccion"));
                vendedor.setEmail(rs.getString("email"));
                vendedor.setActivo(true);
                
                vendedor.setCantidadVentas(rs.getInt("cantidad_ventas"));
                
                return vendedor;
            }
            if(rs.getString("fid_almacen")!=null){
                SupervisorDeAlmacen supervisor = new SupervisorDeAlmacen();
                
                supervisor.setIdUsuario(rs.getInt("id_usuario"));
                supervisor.setUsername(rs.getString("username"));
                supervisor.setPassword(rs.getString("password"));
                supervisor.setFechaIngreso(rs.getDate("fecha_de_ingreso"));
                supervisor.setIdPersona(rs.getInt("id_persona"));
                supervisor.setNumDeDocumento(rs.getString("numero_de_documento"));
                
                supervisor.setNombre(rs.getString("nombre"));
                supervisor.setApellido(rs.getString("apellido"));
                supervisor.setFechaDeNacimiento(rs.getDate("fecha_de_nacimiento"));
                supervisor.setTelefono(rs.getString("telefono"));
                supervisor.setDireccion(rs.getString("direccion"));
                supervisor.setEmail(rs.getString("email"));
                supervisor.setActivo(true);
   
                return supervisor;
            }
            if(rs.getString("area")!=null){
                Administrador administrador = new Administrador();
                
                administrador.setIdUsuario(rs.getInt("id_usuario"));
                administrador.setUsername(rs.getString("username"));
                administrador.setPassword(rs.getString("password"));
                administrador.setFechaIngreso(rs.getDate("fecha_de_ingreso"));
                administrador.setIdPersona(rs.getInt("id_persona"));
                administrador.setNumDeDocumento(rs.getString("numero_de_documento"));
                
                administrador.setNombre(rs.getString("nombre"));
                administrador.setApellido(rs.getString("apellido"));
                administrador.setFechaDeNacimiento(rs.getDate("fecha_de_nacimiento"));
                administrador.setTelefono(rs.getString("telefono"));
                administrador.setDireccion(rs.getString("direccion"));
                administrador.setEmail(rs.getString("email"));
                administrador.setActivo(true);
                
                administrador.setArea(rs.getString("area"));
                
                return administrador;
            }
            
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return null;
    }

    @Override
    public ArrayList<Usuario> listarUsuarios() {
        ArrayList<Usuario> usuarios = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("call LISTAR_USUARIOS()");
            rs = cs.executeQuery();
            while(rs.next()){
                
                
                if(rs.getString("cantidad_ventas") != null){
                    Vendedor vendedor = new Vendedor();
                    vendedor.setIdUsuario(rs.getInt("id_usuario"));
                    vendedor.setIdPersona(rs.getInt("id_persona"));
                    vendedor.setCantidadVentas(rs.getInt("cantidad_ventas"));
                    vendedor.setPassword(rs.getString("password"));
                    vendedor.setUsername(rs.getString("username"));
                    vendedor.setFechaIngreso(rs.getDate("fecha_de_ingreso"));
                    vendedor.setTipoDeDocumento(TipoDeDocumento.valueOf((rs.getString("tipo_de_documento"))));
                    vendedor.setNumDeDocumento(rs.getString("numero_de_documento"));
                    vendedor.setNombre(rs.getString("nombre"));
                    vendedor.setApellido(rs.getString("apellido"));
                    vendedor.setFechaDeNacimiento(rs.getDate("fecha_de_nacimiento"));
                    vendedor.setTelefono(rs.getString("telefono"));
                    vendedor.setDireccion(rs.getString("direccion"));
                    vendedor.setEmail(rs.getString("email"));
                    vendedor.setActivo(true);
                    usuarios.add(vendedor);
                }else if(rs.getString("area") != null){
                    Administrador administrador = new Administrador();
                    administrador.setIdUsuario(rs.getInt("id_usuario"));
                    administrador.setIdUsuario(rs.getInt("id_persona"));
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
                    administrador.setActivo(true);
                    usuarios.add(administrador);
                }else{
                    SupervisorDeAlmacen supervisorAlmacen = new SupervisorDeAlmacen();
                    supervisorAlmacen.setIdUsuario(rs.getInt("id_usuario"));
                    supervisorAlmacen.setIdPersona(rs.getInt("id_persona"));
                    supervisorAlmacen.setAlmacen(new Almacen());
                    supervisorAlmacen.getAlmacen().setId(rs.getInt("fid_almacen"));
                    supervisorAlmacen.setPassword(rs.getString("password"));
                    supervisorAlmacen.setUsername(rs.getString("username"));
                    supervisorAlmacen.setFechaIngreso(rs.getDate("fecha_de_ingreso"));
                    supervisorAlmacen.setTipoDeDocumento(TipoDeDocumento.valueOf((rs.getString("tipo_de_documento"))));
                    supervisorAlmacen.setNumDeDocumento(rs.getString("numero_de_documento"));
                    supervisorAlmacen.setNombre(rs.getString("nombre"));
                    supervisorAlmacen.setApellido(rs.getString("apellido"));
                    supervisorAlmacen.setFechaDeNacimiento(rs.getDate("fecha_de_nacimiento"));
                    supervisorAlmacen.setTelefono(rs.getString("telefono"));
                    supervisorAlmacen.setDireccion(rs.getString("direccion"));
                    supervisorAlmacen.setEmail(rs.getString("email"));
                    supervisorAlmacen.setActivo(true);
                    usuarios.add(supervisorAlmacen);
                }
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
            cs.setString("_doc_nombre",docNombre);
            rs = cs.executeQuery();
            while(rs.next()){
                if(rs.getString("cantidad_ventas") != null){
                    Vendedor vendedor = new Vendedor();
                    vendedor.setIdUsuario(rs.getInt("id_usuario"));
                    vendedor.setIdPersona(rs.getInt("id_persona"));
                    vendedor.setCantidadVentas(rs.getInt("cantidad_ventas"));
                    vendedor.setPassword(rs.getString("password"));
                    vendedor.setUsername(rs.getString("username"));
                    vendedor.setFechaIngreso(rs.getDate("fecha_de_ingreso"));
                    vendedor.setTipoDeDocumento(TipoDeDocumento.valueOf((rs.getString("tipo_de_documento"))));
                    vendedor.setNumDeDocumento(rs.getString("numero_de_documento"));
                    vendedor.setNombre(rs.getString("nombre"));
                    vendedor.setApellido(rs.getString("apellido"));
                    vendedor.setFechaDeNacimiento(rs.getDate("fecha_de_nacimiento"));
                    vendedor.setTelefono(rs.getString("telefono"));
                    vendedor.setDireccion(rs.getString("direccion"));
                    vendedor.setEmail(rs.getString("email"));
                    vendedor.setActivo(true);
                    usuarios.add(vendedor);
                }else if(rs.getString("area") != null){
                    Administrador administrador = new Administrador();
                    administrador.setIdUsuario(rs.getInt("id_usuario"));
                    administrador.setIdUsuario(rs.getInt("id_persona"));
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
                    administrador.setActivo(true);
                    usuarios.add(administrador);
                }else{
                    SupervisorDeAlmacen supervisorAlmacen = new SupervisorDeAlmacen();
                    supervisorAlmacen.setIdUsuario(rs.getInt("id_usuario"));
                    supervisorAlmacen.setIdPersona(rs.getInt("id_persona"));
                    supervisorAlmacen.setAlmacen(new Almacen());
                    supervisorAlmacen.getAlmacen().setId(rs.getInt("fid_almacen"));
                    supervisorAlmacen.setPassword(rs.getString("password"));
                    supervisorAlmacen.setUsername(rs.getString("username"));
                    supervisorAlmacen.setFechaIngreso(rs.getDate("fecha_de_ingreso"));
                    supervisorAlmacen.setTipoDeDocumento(TipoDeDocumento.valueOf((rs.getString("tipo_de_documento"))));
                    supervisorAlmacen.setNumDeDocumento(rs.getString("numero_de_documento"));
                    supervisorAlmacen.setNombre(rs.getString("nombre"));
                    supervisorAlmacen.setApellido(rs.getString("apellido"));
                    supervisorAlmacen.setFechaDeNacimiento(rs.getDate("fecha_de_nacimiento"));
                    supervisorAlmacen.setTelefono(rs.getString("telefono"));
                    supervisorAlmacen.setDireccion(rs.getString("direccion"));
                    supervisorAlmacen.setEmail(rs.getString("email"));
                    supervisorAlmacen.setActivo(true);
                    usuarios.add(supervisorAlmacen);
                }       
                
                
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{rs.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return usuarios;
    }

    
    
}
