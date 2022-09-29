
package pe.edu.pucp.lp2soft.rrhh.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import pe.edu.pucp.lp2soft.config.DBManager;
import pe.edu.pucp.lp2soft.rrhh.dao.VendedorDAO;
import pe.edu.pucp.lp2soft.rrhh.model.TipoDeDocumento;
import pe.edu.pucp.lp2soft.rrhh.model.Vendedor;


public class VendedorMySQL implements VendedorDAO {
    
    private Connection con;
    private CallableStatement cs;
    private ResultSet rs;
    
    @Override
    public int insertar(Vendedor vendedor) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call INSERTAR_VENDEDOR(?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            cs.registerOutParameter("_id_usuario", java.sql.Types.INTEGER);
            cs.setInt("_cantidad_ventas", vendedor.getCantidadVentas());
            cs.setString("_username", vendedor.getUsername());
            cs.setString("_password", vendedor.getPassword());
            cs.setDate("_fecha_de_ingreso", new java.sql.Date(vendedor.getFechaIngreso().getTime()));
            cs.setString("_tipo_de_documento", vendedor.getTipoDeDocumento().name());
            cs.setString("_numero_de_documento", vendedor.getNumDeDocumento());
            cs.setString("_nombre", vendedor.getNombre());
            cs.setString("_apellido", vendedor.getApellido());
            cs.setDate("_fecha_de_nacimiento", new java.sql.Date(vendedor.getFechaDeNacimiento().getTime()));
            cs.setString("_telefono", vendedor.getTelefono());
            cs.setString("_direccion", vendedor.getDireccion());
            cs.setString("_email", vendedor.getEmail());
            resultado = cs.executeUpdate();
            vendedor.setIdUsuario(cs.getInt("_id_usuario"));
            
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public int modificar(Vendedor vendedor) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call MODIFICAR_VENDEDOR(?,?,?"
                    + ",?,?,?,?,?,?,?,?,?,?,?)}");
            cs.setInt("_id_usuario", vendedor.getIdUsuario());
            cs.setInt("_cantidad_ventas", vendedor.getCantidadVentas());
            cs.setString("_password", vendedor.getPassword());
            cs.setString("_username", vendedor.getUsername());
            cs.setDate("_fecha_de_ingreso", new java.sql.Date(vendedor.getFechaIngreso().getTime()));
            cs.setString("_tipo_de_documento", vendedor.getTipoDeDocumento().name());
            cs.setString("_numero_de_documento", vendedor.getNumDeDocumento());
            cs.setString("_nombre", vendedor.getNombre());
            cs.setString("_apellido", vendedor.getApellido());
            cs.setDate("_fecha_de_nacimiento", new java.sql.Date(vendedor.getFechaDeNacimiento().getTime()));
            cs.setString("_telefono", vendedor.getTelefono());
            cs.setString("_direccion", vendedor.getDireccion());
            cs.setString("_email", vendedor.getEmail());
            cs.setBoolean("_activo", vendedor.getActivo());
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public int eliminar(int id_usuario, int cantidadVentas) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call ELIMINAR_VENDEDOR(?)}");
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
    public ArrayList<Vendedor> listarTodos() {
        ArrayList<Vendedor> vendedores = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("call LISTAR_VENDEDORES()");
            rs = cs.executeQuery();
            while(rs.next()){
                Vendedor vendedor = new Vendedor();
                vendedor.setIdUsuario(rs.getInt("id_usuario"));
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
                vendedores.add(vendedor);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){
                System.out.println(ex.getMessage());
            }
        }
        return vendedores;
    }
    
}
