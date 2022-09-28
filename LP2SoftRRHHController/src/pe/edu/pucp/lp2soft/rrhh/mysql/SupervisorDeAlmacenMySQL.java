
package pe.edu.pucp.lp2soft.rrhh.mysql;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import pe.edu.pucp.lp2soft.config.DBManager;




import pe.edu.pucp.lp2soft.rrhh.dao.SupervisorDeAlmacenDAO;
import pe.edu.pucp.lp2soft.rrhh.model.SupervisorDeAlmacen;
import pe.edu.pucp.lp2soft.rrhh.model.TipoDeDocumento;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Almacen;


public class SupervisorDeAlmacenMySQL implements SupervisorDeAlmacenDAO  {
    
    private Connection con;
    private CallableStatement cs;
    private ResultSet rs;
    
    @Override
    public int insertar(SupervisorDeAlmacen supervisorAlmacen) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call INSERTAR_SUPERVISOR_DE_ALMACEN(?,?,?,?,?,?,?,?,?,?,?,?)}");
            cs.registerOutParameter("_id_usuario", java.sql.Types.INTEGER);
            cs.setInt("_fid_almacen", supervisorAlmacen.getAlmacen().getId());
            cs.setString("_password", supervisorAlmacen.getPassword());
            cs.setDate("_fecha_de_ingreso", new java.sql.Date(supervisorAlmacen.getFechaIngreso().getTime()));
            cs.setString("_tipo_de_documento", supervisorAlmacen.getTipoDeDocumento().name());
            cs.setString("_numero_de_documento", supervisorAlmacen.getNumDeDocumento());
            cs.setString("_nombre", supervisorAlmacen.getNombre());
            cs.setString("_apellido", supervisorAlmacen.getApellido());
            cs.setDate("_fecha_de_nacimiento", new java.sql.Date(supervisorAlmacen.getFechaDeNacimiento().getTime()));
            cs.setString("_telefono", supervisorAlmacen.getTelefono());
            cs.setString("_direccion", supervisorAlmacen.getDireccion());
            cs.setString("_email", supervisorAlmacen.getEmail());
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public int modificar(SupervisorDeAlmacen supervisorAlmacen) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call MODIFICAR_SUPERVISOR_DE_ALMACEN(?,?,?"
                    + ",?,?,?,?,?,?,?,?,?)}");
            cs.setInt("_id_usuario", supervisorAlmacen.getIdUsuario());
            cs.setInt("_fid_almacen", supervisorAlmacen.getAlmacen().getId());
            cs.setString("_password", supervisorAlmacen.getPassword());
            cs.setDate("_fecha_de_ingreso", new java.sql.Date(supervisorAlmacen.getFechaIngreso().getTime()));
            cs.setString("_tipo_de_documento", supervisorAlmacen.getTipoDeDocumento().name());
            cs.setString("_numero_de_documento", supervisorAlmacen.getNumDeDocumento());
            cs.setString("_nombre", supervisorAlmacen.getNombre());
            cs.setString("_apellido", supervisorAlmacen.getApellido());
            cs.setDate("_fecha_de_nacimiento", new java.sql.Date(supervisorAlmacen.getFechaDeNacimiento().getTime()));
            cs.setString("_telefono", supervisorAlmacen.getTelefono());
            cs.setString("_direccion", supervisorAlmacen.getDireccion());
            cs.setString("_email", supervisorAlmacen.getEmail());
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public int eliminar(int id_usuario, int id_almacen) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call ELIMINAR_SUPERVISOR_DE_ALMACEN(?,?)}");
            cs.setInt("_id_usuario", id_usuario);
            cs.setInt("_fid_almacen", id_almacen);
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public ArrayList<SupervisorDeAlmacen> listarTodos() {
        ArrayList<SupervisorDeAlmacen> supervisoresAlmacen = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("call LISTAR_SUPERVISORES_DE_ALMACEN()");
            rs = cs.executeQuery();
            while(rs.next()){
                SupervisorDeAlmacen supervisorAlmacen = new SupervisorDeAlmacen();
                supervisorAlmacen.setIdUsuario(rs.getInt("id_usuario"));
                supervisorAlmacen.setAlmacen(new Almacen());
                supervisorAlmacen.getAlmacen().setId(rs.getInt("fid_almacen"));
                supervisorAlmacen.setPassword(rs.getString("password"));
                supervisorAlmacen.setFechaIngreso(rs.getDate("fecha_de_ingreso"));
                supervisorAlmacen.setTipoDeDocumento(TipoDeDocumento.valueOf((rs.getString("tipo_documento"))));
                supervisorAlmacen.setNumDeDocumento(rs.getString("numero_de_documento"));
                supervisorAlmacen.setNombre(rs.getString("nombre"));
                supervisorAlmacen.setApellido(rs.getString("apellido"));
                supervisorAlmacen.setFechaDeNacimiento(rs.getDate("fecha_de_nacimiento"));
                supervisorAlmacen.setTelefono(rs.getString("telefono"));
                supervisorAlmacen.setDireccion(rs.getString("direccion"));
                supervisorAlmacen.setEmail(rs.getString("email"));
                supervisoresAlmacen.add(supervisorAlmacen);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){
                System.out.println(ex.getMessage());
            }
        }
        return supervisoresAlmacen;
    }
    
}
