package pe.edu.pucp.lp2soft.ventas.manejoproductos.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import pe.edu.pucp.lp2soft.config.DBManager;

import pe.edu.pucp.lp2soft.ventas.manejoproductos.Stock;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.dao.ProductoDAO;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.dao.StockDAO;

public class StockMySQL implements StockDAO{
    private Connection con;
    private CallableStatement cs;
    private ResultSet rs;
    ProductoDAO prodDAO = new ProductoMySQL();
    @Override
    public int insertar(Stock stock, int idAlmacen) {
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call INSERTAR_STOCK(?,?,?,?)}");
            cs.setInt("_fid_almacen", idAlmacen);
            cs.setInt("_fid_producto", stock.getProducto().getIdProducto());
            cs.setInt("_cantidad", stock.getCantidad());
            cs.setBoolean("_activo", true);
            return cs.executeUpdate();
            
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return 0;
    }

    @Override
    public int modificar(Stock stock, int idAlmacen) {
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call MODIFICAR_STOCK(?,?,?,?)}");
            cs.setInt("_fid_almacen", idAlmacen);
            cs.setInt("_fid_producto", stock.getProducto().getIdProducto());
            cs.setInt("_cantidad", stock.getCantidad());
            cs.setBoolean("_activo", true);            
            return cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return 0;
    }

    @Override
    public int eliminar(int idAlmacen, int idProducto) {
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call ELIMINAR_STOCK(?,?)}");
            cs.setInt("_fid_almacen", idAlmacen);
            cs.setInt("_fid_producto", idProducto);
            return cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return 0;
    }

    @Override
    public ArrayList<Stock> listarPorAlmacen(int idAlmacen) {
        ArrayList<Stock> stocks = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_STOCK_X_ALMACEN(?)}");
            cs.setInt("_fid_almacen", idAlmacen);
            rs = cs.executeQuery();
            while(rs.next()){
                Stock stock = new Stock();
                stock.setProducto(prodDAO.buscar(rs.getInt("id_producto")));
                stock.setCantidad(rs.getInt("cantidad"));
                stock.setActivo(rs.getBoolean("activo"));
                stocks.add(stock);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return stocks;
    }
    
    @Override
    public ArrayList<Stock> listarPorAlmacenYNombre(int idAlmacen, String nombre) {
        ArrayList<Stock> stocks = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_STOCK_X_ALMACEN_Y_NOMBRE_PRODUCTO(?,?)}");
            cs.setInt("_fid_almacen", idAlmacen);
            cs.setString("_nombre", nombre);
            rs = cs.executeQuery();
            while(rs.next()){
                Stock stock = new Stock();
                stock.setProducto(prodDAO.buscar(rs.getInt("id_producto")));
                stock.setCantidad(rs.getInt("cantidad"));
                stock.setActivo(rs.getBoolean("activo"));
                stocks.add(stock);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return stocks;
    }

//    @Override
//    public ArrayList<Stock> listarPorProducto(int idProducto) {
//        ArrayList<Stock> stocks = new ArrayList<>();
//        try{
//            con = DBManager.getInstance().getConnection();
//            cs = con.prepareCall("{call LISTAR_STOCK_X_PRODUCTO(?)}");
//            cs.setInt("_fid_producto", idProducto);
//            rs = cs.executeQuery();
//            while(rs.next()){
//                Stock stock = new Stock();
//                stock.setProducto(prodDAO.buscar(rs.getInt("id_producto")));
//                stock.setCantidad(rs.getInt("cantidad"));
//                stock.setActivo(rs.getBoolean("activo"));
//                stocks.add(stock);
//            }
//        }catch(Exception ex){
//            System.out.println(ex.getMessage());
//        }finally{
//            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
//        }
//        return stocks;
//    }

//    @Override
//    public Stock buscar(int idAlmacen, int idProducto){
//        Stock stock = new Stock();
//        try{
//            con = DBManager.getInstance().getConnection();
//            cs = con.prepareCall("{call BUSCAR_STOCK(?,?)}");
//            cs.setInt("_fid_almacen", idAlmacen);
//            cs.setInt("_fid_producto", idProducto);
//            rs = cs.executeQuery();
//            rs.next()
//            stock.setProducto(prodDAO.buscar(rs.getInt("id_producto")));
//            stock.setCantidad(rs.getInt("cantidad"));
//            stock.setActivo(rs.getBoolean("activo"));
//            
//        }catch(Exception ex){
//            System.out.println(ex.getMessage());
//        }finally{
//            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
//        }
//        return stock;
//    }

}