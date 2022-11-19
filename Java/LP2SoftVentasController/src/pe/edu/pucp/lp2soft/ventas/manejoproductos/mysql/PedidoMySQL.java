package pe.edu.pucp.lp2soft.ventas.manejoproductos.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import pe.edu.pucp.lp2soft.config.DBManager;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Pedido;
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
}
