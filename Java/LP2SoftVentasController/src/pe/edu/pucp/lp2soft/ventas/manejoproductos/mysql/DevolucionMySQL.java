//package pe.edu.pucp.lp2soft.ventas.manejoproductos.mysql;
//
//import java.sql.CallableStatement;
//import java.sql.Connection;
//import java.sql.ResultSet;
//import java.util.ArrayList;
//import pe.edu.pucp.lp2soft.config.DBManager;
//import pe.edu.pucp.lp2soft.ventas.manejoproductos.Devolucion;
//import pe.edu.pucp.lp2soft.ventas.manejoproductos.dao.DevolucionDAO;
//
//public class DevolucionMySQL implements DevolucionDAO {
//
//    private Connection con;
//    private CallableStatement cs;
//    private ResultSet rs;
//
//    @Override
//    public int insertar(Devolucion devolucion) {
//        int resultado = 0;
//        try{
//            con = DBManager.getInstance().getConnection();
//            cs = con.prepareCall("{call INSERTAR_DEVOLUCION(?,?,?)}");
//            cs.registerOutParameter("_id_devolucion", java.sql.Types.INTEGER);
//            cs.setInt("_fid_producto", devolucion.getIdProducto());
//            cs.setInt("_fid_reclamo", devolucion.getIdReclamo());
//            
//            cs.executeUpdate();
//            resultado = cs.executeUpdate();
//            devolucion.setId(cs.getInt("_id_devolucion"));
//        }catch(Exception ex){
//            System.out.println(ex.getMessage());
//        }finally{
//            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
//        }
//        return resultado;
//    }
//
//    @Override
//    public int modificar(Devolucion devolucion) {
//        int resultado = 0;
//        try{
//            con = DBManager.getInstance().getConnection();
//            cs = con.prepareCall("{call MODIFICAR_DEVOLUCION(?,?,?,?)}");
//            cs.setInt("_id_devolucion", devolucion.getId());
//            cs.setInt("_fid_producto", devolucion.getIdProducto());
//            cs.setInt("_fid_reclamo", devolucion.getIdReclamo());
//            cs.setBoolean("_activo", devolucion.isActivo());
//            cs.executeUpdate();
//            resultado = cs.executeUpdate();
//        }catch(Exception ex){
//            System.out.println(ex.getMessage());
//        }finally{
//            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
//        }
//        return resultado;
//    }
//
//    @Override
//    public int eliminar(int id) {
//        int resultado = 0;
//        try{
//            con = DBManager.getInstance().getConnection();
//            cs = con.prepareCall("{call ELIMINAR_DEVOLUCION(?)}");
//            cs.setInt("_id_devolucion", id);
//            cs.executeUpdate();
//            resultado = cs.executeUpdate();
//        }catch(Exception ex){
//            System.out.println(ex.getMessage());
//        }finally{
//            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
//        }
//        return resultado;
//    }
//
//    @Override
//    public ArrayList<Devolucion> listarTodos() {
//        ArrayList<Devolucion> devoluciones = new ArrayList<>();
//        try{
//            con = DBManager.getInstance().getConnection();
//            cs = con.prepareCall("{call LISTAR_DEVOLUCIONES()}");
//            rs = cs.executeQuery();
//            while(rs.next()){
//                Devolucion devolucion = new Devolucion();
//                devolucion.setId(rs.getInt("id_devolucion"));
//                devolucion.setIdProducto(rs.getInt("fid_producto"));
//                devolucion.setIdReclamo(rs.getInt("fid_reclamo"));
//                devoluciones.add(devolucion);
//            }
//        }catch(Exception ex){
//            System.out.println(ex.getMessage());
//        }finally{
//            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
//        }
//        return devoluciones;
//        //throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }
//    
//}

package pe.edu.pucp.lp2soft.ventas.manejoproductos.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import pe.edu.pucp.lp2soft.config.DBManager;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Devolucion;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Producto;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.dao.DevolucionDAO;

public class DevolucionMySQL implements DevolucionDAO {

    private Connection con;
    private CallableStatement cs;
    private ResultSet rs;

    @Override
    public int insertarDevolucion(Devolucion devolucion) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call INSERTAR_DEVOLUCION(?,?,?,?,?)}");
            cs.registerOutParameter("_id_devolucion", java.sql.Types.INTEGER);
            cs.setInt("_fid_producto", devolucion.getProducto().getIdProducto());
            cs.setInt("_fid_reclamo", devolucion.getFid_reclamo());
            cs.setInt("_cantidad", devolucion.getCantidad());
            cs.setBoolean("_activo", devolucion.getActivo());
            cs.executeUpdate();
            resultado = cs.executeUpdate();
            devolucion.setIdDevolucion(cs.getInt("_id_devolucion"));
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public int modificarDevolucion(Devolucion devolucion) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call MODIFICAR_DEVOLUCION(?,?,?,?,?)}");
            cs.setInt("_id_devolucion", devolucion.getIdDevolucion());
            cs.setInt("_fid_producto", devolucion.getProducto().getIdProducto());
            cs.setInt("_fid_reclamo", devolucion.getFid_reclamo());
            cs.setInt("_cantidad", devolucion.getCantidad());
            cs.setBoolean("_activo", devolucion.getActivo());
            cs.executeUpdate();
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public int eliminarDevolucion(int id) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call ELIMINAR_DEVOLUCION(?)}");
            cs.setInt("_id_devolucion", id);
            cs.executeUpdate();
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public ArrayList<Devolucion> listarTodosDevolucion() {
        ArrayList<Devolucion> devoluciones = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_DEVOLUCIONES()}");
            rs = cs.executeQuery();
            Producto producto=new Producto();
            while(rs.next()){
                Devolucion devolucion = new Devolucion();
                devolucion.setIdDevolucion(rs.getInt("id_devolucion"));
                producto.setIdProducto(rs.getInt("fid_producto"));
                devolucion.setProducto(producto);
                devolucion.setFid_reclamo(rs.getInt("fid_reclamo"));
                devoluciones.add(devolucion);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return devoluciones;
        //throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    @Override
    public ArrayList<Devolucion> listarDevolucionXReclamo(int idReclamo) {
        ArrayList<Devolucion> devoluciones = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_DEVOLUCIONES_X_RECLAMO(?)}");
            cs.setInt("_id_reclamo",idReclamo);
            rs = cs.executeQuery();
            Producto producto=new Producto();
            while(rs.next()){
                Devolucion devolucion = new Devolucion();
                devolucion.setIdDevolucion(rs.getInt("id_devolucion"));
                devolucion.setCantidad(rs.getInt("cantidad"));
                producto.setIdProducto(rs.getInt("fid_producto"));
                devolucion.setProducto(producto);
                devolucion.setFid_reclamo(rs.getInt("fid_reclamo"));
                producto.setIdProducto(rs.getInt("id_producto"));
                producto.setNombre(rs.getString("nombre"));
                devoluciones.add(devolucion);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return devoluciones;
        //throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
