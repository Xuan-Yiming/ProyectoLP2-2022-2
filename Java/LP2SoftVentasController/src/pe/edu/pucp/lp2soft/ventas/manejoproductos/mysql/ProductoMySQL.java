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
            cs = con.prepareCall("{call INSERTAR_PRODUCTO(?,?,?,?,?,?,?,?)}");
            cs.registerOutParameter("_id_producto", java.sql.Types.INTEGER);
            cs.setString("_nombre", producto.getNombre());
            cs.setDouble("_costo", producto.getCosto());
            cs.setDouble("_precio", producto.getPrecio());
            cs.setDate("_fecha_ingreso", new java.sql.Date(producto.getFechaDeIngreso().getTime()));
            cs.setBytes("_foto", producto.getFoto());
            cs.setBoolean("_devuelto", producto.getDevuelto());
            cs.setBoolean("_activo", true);
            resultado = cs.executeUpdate();
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
            cs = con.prepareCall("{call MODIFICAR_PRODUCTO(?,?,?,?,?,?,?,?)}");
            cs.setInt("_id_producto", producto.getIdProducto());
            cs.setString("_nombre", producto.getNombre());
            cs.setDouble("_costo", producto.getCosto());
            cs.setDouble("_precio", producto.getPrecio());
            cs.setDate("_fecha_ingreso", new java.sql.Date(producto.getFechaDeIngreso().getTime()));
            cs.setBytes("_foto", producto.getFoto());
            cs.setBoolean("_devuelto", producto.getDevuelto());
            cs.setBoolean("_activo", true);
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
    public ArrayList<Producto> listarPorNombre(String nombre) {
        ArrayList<Producto> productos = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_PRODUCTOS_X_NOMBRE(?)}");
            cs.setString("_nombre",nombre);
            rs = cs.executeQuery();
            while(rs.next()){
                Producto producto = new Producto();
                producto.setIdProducto(rs.getInt("id_producto"));
                producto.setNombre(rs.getString("nombre"));
                producto.setCosto(rs.getDouble("costo"));
                producto.setPrecio(rs.getDouble("precio"));
                producto.setFechaDeIngreso(rs.getDate("fecha_ingreso"));
                producto.setDevuelto(rs.getBoolean("devuelto"));
                producto.setFoto(rs.getBytes("foto"));
                producto.setActivo(rs.getBoolean("activo"));
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
    public Producto buscar(int idProducto){
        Producto producto = new Producto();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call BUSCAR_PRODUCTO(?)}");
            cs.setInt("_id_producto", idProducto);
            rs = cs.executeQuery();
            rs.next();
            producto.setIdProducto(rs.getInt("id_producto"));
            producto.setNombre(rs.getString("nombre"));
            producto.setCosto(rs.getDouble("costo"));
            producto.setPrecio(rs.getDouble("precio"));
            producto.setFechaDeIngreso(rs.getDate("fecha_ingreso"));
            producto.setDevuelto(rs.getBoolean("devuelto"));
            producto.setFoto(rs.getBytes("foto"));
            producto.setActivo(rs.getBoolean("activo"));
            
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return producto;
    }
}
