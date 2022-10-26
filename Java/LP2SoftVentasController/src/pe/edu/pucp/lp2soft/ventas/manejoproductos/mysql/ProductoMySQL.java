package pe.edu.pucp.lp2soft.ventas.manejoproductos.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import pe.edu.pucp.lp2soft.config.DBManager;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Producto;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.dao.ProductoDAO;

public class ProductoMySQL implements ProductoDAO{
    private Connection con;
    private CallableStatement cs;
    private ResultSet rs;

    @Override
    public int insertar(Producto producto) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call INSERTAR_PRODUCTO(?,?,?,?,?,?,?,?,?,?)}");
            cs.registerOutParameter("_id_producto", java.sql.Types.INTEGER);
            cs.setInt("_fid_almacen", producto.getIdAlamcen());
            cs.setString("_codigo_lote", producto.getCodigoLote());
            cs.setString("_nombre", producto.getNombre());
            cs.setDouble("_costo", producto.getCosto());
            cs.setDouble("_precio", producto.getPrecio());
            cs.setInt("_cantidad", producto.getCantidad());
            cs.setDate("_fecha_ingreso", new java.sql.Date(producto.getFechaDeIngreso().getTime()));
            cs.setBoolean("_devuelto", producto.isDevuelto());
            cs.setBoolean("_activo", true);
            resultado = cs.executeUpdate();
            producto.setId(cs.getInt("_id_producto"));
            
            
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public int modificar(Producto producto) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call MODIFICAR_PRODUCTO(?,?,?,?,?,?,?,?,?,?)}");
            cs.setInt("_id_producto", producto.getId());
            cs.setInt("_fid_almacen", producto.getIdAlamcen());
            cs.setString("_codigo_lote", producto.getCodigoLote());
            cs.setString("_nombre", producto.getNombre());
            cs.setDouble("_costo", producto.getCosto());
            cs.setDouble("_precio", producto.getPrecio());
            cs.setInt("_cantidad", producto.getCantidad());
            cs.setDate("_fecha_ingreso", new java.sql.Date(producto.getFechaDeIngreso().getTime()));
            cs.setBoolean("_devuelto", producto.isDevuelto());
            cs.setBoolean("_activo", producto.isActivo());
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public int eliminar(int idProducto) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call ELIMINAR_PRODUCTO(?)}");
            cs.setInt("_id_producto", idProducto);
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
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
                producto.setId(rs.getInt("id_producto"));
                producto.setIdAlamcen(rs.getInt("fid_almacen"));
                producto.setCodigoLote(rs.getString("codigo_lote"));
                producto.setNombre(rs.getString("nombre"));
                producto.setCosto(rs.getDouble("costo"));
                producto.setPrecio(rs.getDouble("precio"));
                producto.setCantidad(rs.getInt("cantidad"));
                producto.setFechaDeIngreso(rs.getDate("fecha_ingreso"));
                producto.setDevuelto(rs.getBoolean("devuelto"));
                productos.add(producto);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return productos;
    }

    @Override
    public ArrayList<Producto> listarPorNombre(String nombre) {
        ArrayList<Producto> productos = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_PRODUCTOS_X_NOMBRE(?)}");
            cs.setString("_nombre",nombre);
            rs = cs.executeQuery();
            while(rs.next()){
                Producto producto = new Producto();
                producto.setId(rs.getInt("id_producto"));
                producto.setIdAlamcen(rs.getInt("fid_almacen"));
                producto.setCodigoLote(rs.getString("codigo_lote"));
                producto.setNombre(rs.getString("nombre"));
                producto.setCosto(rs.getDouble("costo"));
                producto.setPrecio(rs.getDouble("precio"));
                producto.setCantidad(rs.getInt("cantidad"));
                producto.setFechaDeIngreso(rs.getDate("fecha_ingreso"));
                producto.setDevuelto(rs.getBoolean("devuelto"));
                productos.add(producto);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return productos;
    }
    
}
