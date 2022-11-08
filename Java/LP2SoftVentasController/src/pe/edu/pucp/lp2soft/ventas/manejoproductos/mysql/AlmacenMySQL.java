package pe.edu.pucp.lp2soft.ventas.manejoproductos.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import pe.edu.pucp.lp2soft.config.DBManager;
import pe.edu.pucp.lp2soft.rrhh.dao.SupervisorDeAlmacenDAO;
import pe.edu.pucp.lp2soft.rrhh.model.SupervisorDeAlmacen;
import pe.edu.pucp.lp2soft.rrhh.mysql.SupervisorDeAlmacenMySQL;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Almacen;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Stock;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.dao.AlmacenDAO;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.dao.ProductoDAO;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.dao.StockDAO;

public class AlmacenMySQL implements AlmacenDAO {
   private Connection con;
   private CallableStatement cs;
   private ResultSet rs;
   SupervisorDeAlmacenDAO supAlmDAO = new SupervisorDeAlmacenMySQL();
   ProductoDAO prodDAO = new ProductoMySQL();
   StockDAO stockDAO = new StockMySQL();
   @Override
   public int insertar(Almacen almacen) {
       int resultado = 0;
       try{
           con = DBManager.getInstance().getConnection();
           cs = con.prepareCall("{call INSERTAR_ALMACEN(?,?,?,?,?)}");
           cs.registerOutParameter("_id_almacen", java.sql.Types.INTEGER);
           cs.setInt("_fid_supervisor",almacen.getSupervisor().getIdUsuario());
           cs.setString("_nombre", almacen.getNombre());            
           cs.setString("_direccion", almacen.getDireccion());
           cs.setBoolean("_activo", true);
           resultado = cs.executeUpdate();
        //    for (Stock stock : almacen.getProductos()){
        //         cs = con.prepareCall("{call INSERTAR_STOCK(?,?,?,?)}");
        //         cs.setInt("_fid_almacen", almacen.getIdAlmacen());
        //         cs.setInt("_fid_producto", stock.getProducto().getIdProducto());
        //         cs.setInt("_cantidad", stock.getCantidad());
        //         cs.setBoolean("_activo",stock.getActivo());
        //         cs.executeUpdate();
        //    }
       }catch(Exception ex){
           System.out.println(ex.getMessage());
       }finally{
           try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
       }
       return resultado;
   }

   @Override
   public int modificar(Almacen almacen) {
       int resultado = 0;
       try{
           con = DBManager.getInstance().getConnection();
           cs = con.prepareCall("{call MODIFICAR_ALMACEN(?,?,?,?,?)}");
           cs.setInt("_fid_supervisor",almacen.getSupervisor().getIdUsuario());
           cs.setInt("_id_almacen", almacen.getIdAlmacen());
           cs.setString("_nombre", almacen.getNombre());
           cs.setString("_direccion", almacen.getDireccion());
           cs.setBoolean("_activo", almacen.getActivo());
           resultado = cs.executeUpdate();
        //    for (Stock stock : almacen.getProductos()){
        //         cs = con.prepareCall("{call MODIFICAR_STOCK(?,?,?,?)}");
        //         cs.setInt("_fid_almacen", almacen.getIdAlmacen());
        //         cs.setInt("_fid_producto", stock.getProducto().getIdProducto());
        //         cs.setInt("_cantidad", stock.getCantidad());
        //         cs.setBoolean("_activo",true);
        //         cs.executeUpdate();
        //    }
       }catch(Exception ex){
           System.out.println(ex.getMessage());
       }finally{
           try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
       }
       return resultado;
   }

   @Override
   public int eliminar(Almacen almacen) {
       int resultado = 0;
       try{
           con = DBManager.getInstance().getConnection();
           cs = con.prepareCall("{call ELIMINAR_ALMACEN(?)}");
           cs.setInt("_id_almacen", almacen.getIdAlmacen());
           resultado = cs.executeUpdate();
        //    for (Stock stock : almacen.getProductos()){
        //         cs = con.prepareCall("{call ELIMINAR_STOCK(?,?)}");
        //         cs.setInt("_fid_almacen", almacen.getIdAlmacen());
        //         cs.setInt("_fid_producto", stock.getProducto().getIdProducto());
        //         cs.executeUpdate();
        //    }
       }catch(Exception ex){
           System.out.println(ex.getMessage());
       }finally{
           try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
       }
       return resultado;
   }

   @Override
   public ArrayList<Almacen> listarTodos() {
       ArrayList<Almacen> almacenes = new ArrayList<>();
       
       try{
           con = DBManager.getInstance().getConnection();
           cs = con.prepareCall("{call LISTAR_ALMACENES()}");
           rs = cs.executeQuery();
           while(rs.next()){
               Almacen almacen = new Almacen();
               almacen.setIdAlmacen(rs.getInt("id_almacen"));
               almacen.setNombre(rs.getString("nombre"));
               almacen.setDireccion(rs.getString("direccion"));
               almacen.setActivo(rs.getBoolean("activo"));
               almacen.setSupervisor((SupervisorDeAlmacen) supAlmDAO.buscarPorID(rs.getInt("fid_supervisor")));
               almacen.setProductos(stockDAO.listarPorAlmacen(rs.getInt("id_almacen")));
                             
               almacenes.add(almacen);
           }
       }catch(Exception ex){
           System.out.println(ex.getMessage());
       }finally{
           try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
       }
       return almacenes;
   }

   @Override
   public ArrayList<Almacen> listarPorNombre(String nombre) {
       ArrayList<Almacen> almacenes = new ArrayList<>();
       try{
           con = DBManager.getInstance().getConnection();
           cs = con.prepareCall("{call LISTAR_ALMACENES_X_NOMBRE(?)}");
           cs.setString("_nombre",nombre);
           rs = cs.executeQuery();
           while(rs.next()){
               Almacen almacen = new Almacen();
                almacen.setIdAlmacen(rs.getInt("id_almacen"));
                almacen.setNombre(rs.getString("nombre"));
                almacen.setDireccion(rs.getString("direccion"));
                almacen.setSupervisor((SupervisorDeAlmacen) supAlmDAO.buscarPorID(rs.getInt("fid_supervisor")));
                almacen.setActivo(rs.getBoolean("activo"));
                almacen.setProductos(stockDAO.listarPorAlmacen(rs.getInt("id_almacen")));
                
                almacenes.add(almacen);
           }
       }catch(Exception ex){
           System.out.println(ex.getMessage());
       }finally{
           try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
       }
       return almacenes;
   }
}
