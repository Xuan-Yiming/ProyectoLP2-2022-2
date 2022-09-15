/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.pucp.lp2soft.ventas.manejoproductos.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import pe.edu.pucp.lp2soft.config.DBManager;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Stock;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.dao.StockDAO;

/**
 *
 * @author xuany
 */
public class StockMySQL implements StockDAO {
    private Connection con;
    private CallableStatement cs;
    private ResultSet rs;

    @Override
    public int insertar(Stock stock) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call INSERTAR_STOCK(?,?,?)}");
            cs.registerOutParameter("_ID_STOCK", java.sql.Types.INTEGER);
            cs.setInt("_CANTIDAD", stock.getCantidad());
            cs.setInt("_ID_PRODUCTO", stock.getProducto().getId());
            
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
        // throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int modificar(Stock stock) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call MODIFICAR_STOCK(?,?,?)}");
            cs.setInt("_ID_STOCK", stock.getId());
            cs.setInt("_CANTIDAD", stock.getCantidad());
            cs.setInt("_ID_PRODUCTO", stock.getProducto().getId());
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
        // throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int eliminar(int id) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call ELIMINAR_STOCK(?)}");
            cs.setInt("_ID_STOCK", id);
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
        // throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Stock> listarTodos() {
        ArrayList<Stock> stocks = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_STOCKS()}");
            rs = cs.executeQuery();
            while(rs.next()){
                Stock stock = new Stock();
                stock.setId(rs.getInt("ID_STOCK"));
                stock.setCantidad(rs.getInt("CANTIDAD"));
                stock.getProducto().setId(rs.getInt("ID_PRODUCTO"));
                stocks.add(stock);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return stocks;
        // throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
