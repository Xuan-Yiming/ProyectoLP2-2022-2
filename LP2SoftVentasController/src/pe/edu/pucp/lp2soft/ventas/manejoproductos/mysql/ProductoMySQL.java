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
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Producto;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.dao.ProductoDAO;

/**
 *
 * @author xuany
 */
public class ProductoMySQL implements ProductoDAO{
    private Connection con;
    private CallableStatement cs;
    private ResultSet rs;

    @Override
    public int insertar(Producto producto) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call INSERTAR_PRODUCTO(?,?,?,?,?,?)}");
            cs.registerOutParameter("_ID_PRODUCTO", java.sql.Types.INTEGER);
            cs.setString("_NOMBRE", producto.getNombre());
            cs.setDouble("_PRECIO", producto.getPrecio());
            cs.setString("_UNIDAD", producto.getUnidad());
            cs.setInt("_STOCKMINIMO", producto.getStockMinimo());
            cs.setBoolean("_DEVUELTO", producto.isDevuelto());
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
    public int modificar(Producto producto) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call MODIFICAR_PRODUCTO(?,?,?,?,?,?)}");
            cs.setInt("_ID_PRODUCTO", producto.getId());
            cs.setString("_NOMBRE", producto.getNombre());
            cs.setDouble("_PRECIO", producto.getPrecio());
            cs.setString("_UNIDAD", producto.getUnidad());
            cs.setInt("_STOCKMINIMO", producto.getStockMinimo());
            cs.setBoolean("_DEVUELTO", producto.isDevuelto());
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
            cs = con.prepareCall("{call ELIMINAR_PRODUCTO(?)}");
            cs.setInt("_ID_PRODUCTO", id);
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
    public ArrayList<Producto> listarTodos() {
        ArrayList<Producto> productos = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_PRODUCTOS()}");
            rs = cs.executeQuery();
            while(rs.next()){
                Producto producto = new Producto();
                producto.setId(rs.getInt("ID_PRODUCTO"));
                producto.setNombre(rs.getString("NOMBRE"));
                producto.setPrecio(rs.getDouble("PRECIO"));
                producto.setUnidad(rs.getString("UNIDAD"));
                producto.setStockMinimo(rs.getInt("STOCKMINIMO"));
                producto.setDevuelto(rs.getBoolean("DEVUELTO"));
                productos.add(producto);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return productos;
        // throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
