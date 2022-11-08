//package pe.edu.pucp.lp2soft.ventas.manejoproductos.mysql;
//
//import java.sql.CallableStatement;
//import java.sql.Connection;
//import java.sql.ResultSet;
//import java.util.ArrayList;
//import pe.edu.pucp.lp2soft.config.DBManager;
//import pe.edu.pucp.lp2soft.ventas.manejoproductos.Pedido;
//import pe.edu.pucp.lp2soft.ventas.manejoproductos.dao.PedidoDAO;
//
//public class PedidoMySQL implements PedidoDAO {
//    private Connection con;
//    private CallableStatement cs;
//    private ResultSet rs;
//
//    @Override
//    public int insertar(Pedido pedido) {
//        int resultado = 0;
//        try{
//            con = DBManager.getInstance().getConnection();
//            cs = con.prepareCall("{call INSERTAR_PEDIDO(?,?,?,?)}");
//            cs.registerOutParameter("_id_pedido", java.sql.Types.INTEGER);
//            cs.setInt("_fid_producto", pedido.getIdProducto());
//            cs.setInt("_fid_orden_de_compra", pedido.getIdOrdenDeCompra());
//            cs.setDouble("_descuento", pedido.getDescuento());
//            resultado = cs.executeUpdate();
//            pedido.setId(cs.getInt("_id_pedido"));
//        }catch(Exception ex){
//            System.out.println(ex.getMessage());
//        }finally{
//            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
//        }
//        return resultado;
//        // throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }
//
//    @Override
//    public int modificar(Pedido pedido) {
//        int resultado = 0;
//        try{
//            con = DBManager.getInstance().getConnection();
//            cs = con.prepareCall("{call MODIFICAR_PEDIDOS(?,?,?,?,?)}");
//            cs.setInt("_id_pedido", pedido.getId());
//            cs.setInt("_fid_producto", pedido.getIdProducto());
//            cs.setInt("_fid_orden_de_compra", pedido.getIdOrdenDeCompra());
//            cs.setDouble("_descuento", pedido.getDescuento());
//            cs.setBoolean("_activo", pedido.isActivo());
//            resultado = cs.executeUpdate();
//        }catch(Exception ex){
//            System.out.println(ex.getMessage());
//        }finally{
//            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
//        }
//        return resultado;
//        // throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }
//
//    @Override
//    public int eliminar(int id) {
//        int resultado = 0;
//        try{
//            con = DBManager.getInstance().getConnection();
//            cs = con.prepareCall("{call ELIMINAR_PEDIDOS(?)}");
//            cs.setInt("_id_pedido", id);
//            resultado = cs.executeUpdate();
//        }catch(Exception ex){
//            System.out.println(ex.getMessage());
//        }finally{
//            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
//        }
//        return resultado;
//        // throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }
//
//    @Override
//    public ArrayList<Pedido> listarTodos() {
//        ArrayList<Pedido> pedidos = new ArrayList<>();
//        try{
//            con = DBManager.getInstance().getConnection();
//            cs = con.prepareCall("{call LISTAR_PEDIDOS()}");
//            rs = cs.executeQuery();
//            while(rs.next()){
//                Pedido pedido = new Pedido();
//                pedido.setId(rs.getInt("id_pedido"));
//                pedido.setIdProducto(rs.getInt("fid_producto"));
//                pedido.setIdOrdenDeCompra(rs.getInt("fid_orden_de_compra"));
//                pedido.setDescuento(rs.getDouble("descuento"));
//                pedidos.add(pedido);
//            }
//        }catch(Exception ex){
//            System.out.println(ex.getMessage());
//        }finally{
//            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
//        }
//        return pedidos;
//        // throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }
//	
//	@Override
//    public ArrayList<Pedido> listarPorOrdenDeCompra(int idOrdenDeCompra) {
//        ArrayList<Pedido> pedidos = new ArrayList<>();
//        try{
//            con = DBManager.getInstance().getConnection();
//            cs = con.prepareCall("{call LISTAR_PEDIDOS_X_ORDEN_DE_COMPRA(?)}");
//            cs.setInt("_id_orden_de_compra",idOrdenDeCompra);
//            rs = cs.executeQuery();
//            while(rs.next()){
//                Pedido pedido = new Pedido();
//                pedido.setId(rs.getInt("id_pedido"));
//                pedido.setIdProducto(rs.getInt("fid_producto"));
//                pedido.setIdOrdenDeCompra(rs.getInt("fid_orden_de_compra"));
//                pedido.setDescuento(rs.getDouble("descuento"));
//                pedidos.add(pedido);
//            }
//        }catch(Exception ex){
//            System.out.println(ex.getMessage());
//        }finally{
//            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
//        }
//        return pedidos;
//    }
// 
// 
//}
