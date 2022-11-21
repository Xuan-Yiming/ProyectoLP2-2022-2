package pe.edu.pucp.lp2soft.ventas.manejoproductos.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import pe.edu.pucp.lp2soft.config.DBManager;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Pedido;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Producto;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.dao.PedidoDAO;

public class PedidoMySQL implements PedidoDAO {
    private Connection con;
    private CallableStatement cs;
    private ResultSet rs;

    @Override
    public int insertar(Pedido pedido) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call INSERTAR_PEDIDO(?,?,?,?,?)}");
            cs.registerOutParameter("_id_pedido", java.sql.Types.INTEGER);
            cs.setInt("_fid_producto", pedido.getProducto().getIdProducto());
            cs.setInt("_cantidad", pedido.getCantidad());
            cs.setDouble("_descuento", pedido.getDescuento());
            cs.setBoolean("_activo", true);
            cs.executeUpdate();
            pedido.setIdPedido(cs.getInt("_id_pedido"));
            resultado = pedido.getIdPedido();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public int eliminar(int id) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call ELIMINAR_PEDIDO(?)}");
            cs.setInt("_id_pedido", id);
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }
    
    @Override
    public ArrayList<Pedido> listarPedidosPorIdOrdenDeCompra(int id_ordenDeCompra) {
        ArrayList<Pedido> pedidos = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_PEDIDOS_X_ORDEN(?)}");
            cs.setInt("_id_orden",  id_ordenDeCompra);
            rs = cs.executeQuery();
            while(rs.next()){
                Pedido pedido = new Pedido();
                pedido.setProducto(new Producto());
                pedido.getProducto().setNombre(rs.getString("nombre"));
                pedido.getProducto().setIdProducto(rs.getInt("id_producto"));
                pedido.setCantidad(rs.getInt("cantidad"));
                pedido.getProducto().setPrecio(rs.getDouble("precio"));
                pedidos.add(pedido);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{rs.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return pedidos;
    }
}
