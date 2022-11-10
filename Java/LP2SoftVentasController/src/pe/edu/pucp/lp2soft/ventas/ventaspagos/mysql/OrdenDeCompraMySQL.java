package pe.edu.pucp.lp2soft.ventas.ventaspagos.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import pe.edu.pucp.lp2soft.config.DBManager;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Pedido;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.FormaDeEntrega;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.Moneda;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.dao.OrdenDeCompraDAO;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.OrdenDeCompra;

public class OrdenDeCompraMySQL implements OrdenDeCompraDAO {
    private Connection con;
    private CallableStatement cs;
    private ResultSet rs;

    @Override
    public int insertar(OrdenDeCompra ordenDeCompra, int idCliente) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call INSERTAR_ORDEN_DE_COMPRA(?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            cs.registerOutParameter("_id_orden_de_compra", java.sql.Types.INTEGER);            
            cs.setInt("_fid_cliente", idCliente);
            cs.setInt("_fid_vendedor", ordenDeCompra.getVendedor().getIdUsuario());
            cs.setInt("_fid_moneda", ordenDeCompra.getMoneda().getIdMoneda());
            cs.setInt("_fid_termino_de_pago", ordenDeCompra.getTerminoDePago().getIdTerminoDePago());
            cs.setDouble("_monto", ordenDeCompra.getMonto());
            cs.setDouble("_saldo", ordenDeCompra.getSaldo());
            cs.setString("_direccion_de_entrega", ordenDeCompra.getDireccionDeEntrega());
            cs.setString("_forma_de_enterga", ordenDeCompra.getFormaDeEntrega().name());
            cs.setDate("_fecha_de_compra", new java.sql.Date(ordenDeCompra.getFechaDeCompra().getTime()));
            cs.setDate("_fecha_de_entrega", new java.sql.Date(ordenDeCompra.getFechaDeEntrega().getTime()));
            cs.setBoolean("_pagado", ordenDeCompra.isPagado());
            cs.setBoolean("_activo", ordenDeCompra.getActivo());
            cs.executeUpdate();
            ordenDeCompra.setIdOrdenDeCompra(cs.getInt("_id_orden_de_compra"));
            resultado = ordenDeCompra.getIdOrdenDeCompra();
            /*
            for(Pedido pedido : ordenDeCompra.getPedidos()){
                cs = con.prepareCall("{call INSERTAR_ORDEN_DE_COMPRA_PEDIDO(?,?,?)}");
                cs.registerOutParameter("_id_orden_de_compra_pedido", java.sql.Types.INTEGER);
                cs.setInt("_fid_orden_de_compra", ordenDeCompra.getIdOrdenDeCompra());
                cs.setInt("_fid_pedido", pedido.getIdPedido());
                cs.executeUpdate();
            }*/
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{
                con.close();
            }catch(Exception ex){
                System.out.println(ex.getMessage());
            }
        }
        return resultado;
    }

    @Override
    public int modificar(OrdenDeCompra ordenDeCompra) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call modificar_orden_de_compra(?,?,?,?,?,?,?,?,?)}");
            cs.setInt("_id_orden_de_compra", ordenDeCompra.getIdOrdenDeCompra());
            cs.setDouble("_monto", ordenDeCompra.getMonto());
            cs.setInt("_fid_moneda", ordenDeCompra.getMoneda().getIdMoneda());
            cs.setString("_direccion_de_entrega", ordenDeCompra.getDireccionDeEntrega());
            cs.setString("_forma_de_entrega", ordenDeCompra.getFormaDeEntrega().name());
            cs.setDate("_fecha_de_compra", new java.sql.Date(ordenDeCompra.getFechaDeCompra().getTime()));
            cs.setDate("_fecha_de_entrega", new java.sql.Date(ordenDeCompra.getFechaDeEntrega().getTime()));
            cs.setBoolean("_pagado", ordenDeCompra.isPagado());
            cs.setBoolean("_activo", ordenDeCompra.getActivo());
            resultado = cs.executeUpdate();
            
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{
                con.close();
            }catch(Exception ex){
                System.out.println(ex.getMessage());
            }
        }
        return resultado;
    }

    @Override
    public int eliminar(int id) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call ELIMINAR_ORDEN_DE_COMPRA(?)}");
            cs.setInt("_id_orden_de_compra", id);
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{
                con.close();
            }catch(Exception ex){
                System.out.println(ex.getMessage());
            }
        }
        return resultado;
    }

    @Override
    public ArrayList<OrdenDeCompra> listarTodos() {
        ArrayList<OrdenDeCompra> ordenes = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_ORDENES_DE_COMPRA()}");
            rs = cs.executeQuery();
            while(rs.next()){
                OrdenDeCompra orden = new OrdenDeCompra();
                orden.setIdOrdenDeCompra(rs.getInt("id_orden_de_compra"));
                orden.setMonto(rs.getDouble("monto"));

                Moneda moneda = new Moneda();
                moneda.setIdMoneda(rs.getInt("fid_moneda"));
                orden.setMoneda(moneda);
                orden.setDireccionDeEntrega(rs.getString("direccion_de_entrega"));
                orden.setFormaDeEntrega(FormaDeEntrega.valueOf(rs.getString("forma_de_entrega")));
                orden.setFechaDeCompra(rs.getDate("fecha_de_compra"));
                orden.setFechaDeEntrega(rs.getDate("fecha_de_entrega"));
                orden.setPagado(rs.getBoolean("pagado"));       
                ordenes.add(orden);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{
                con.close();
            }catch(Exception ex){
                System.out.println(ex.getMessage());
            }
        }
        return ordenes;
    }
	
	@Override
    public ArrayList<OrdenDeCompra> listarPorCliente(int idCliente) {
        ArrayList<OrdenDeCompra> ordenes = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_ORDENES_DE_COMPRA_X_CLIENTE(?)}");
            cs.setInt("_id_cliente",idCliente);
            rs = cs.executeQuery();
            while(rs.next()){
                OrdenDeCompra orden = new OrdenDeCompra();
                orden.setIdOrdenDeCompra(rs.getInt("id_orden_de_compra"));
                orden.setMonto(rs.getDouble("monto"));

                Moneda moneda = new Moneda();
                moneda.setIdMoneda(rs.getInt("fid_moneda"));
                orden.setMoneda(moneda);
                orden.setDireccionDeEntrega(rs.getString("direccion_de_entrega"));
                orden.setFormaDeEntrega(FormaDeEntrega.valueOf(rs.getString("forma_de_entrega")));
                orden.setFechaDeCompra(rs.getDate("fecha_de_compra"));
                orden.setFechaDeEntrega(rs.getDate("fecha_de_entrega"));
                orden.setPagado(rs.getBoolean("pagado"));       
                ordenes.add(orden);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return ordenes;
    }
	
	@Override
    public ArrayList<OrdenDeCompra> listarPorFecha(Date fecha) {
        ArrayList<OrdenDeCompra> ordenes = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_ORDENES_DE_COMPRA_X_FECHA(?)}");
            cs.setDate("_fecha", (java.sql.Date) fecha);
            rs = cs.executeQuery();
            while(rs.next()){
                OrdenDeCompra orden = new OrdenDeCompra();
                orden.setIdOrdenDeCompra(rs.getInt("id_orden_de_compra"));
                orden.setMonto(rs.getDouble("monto"));

                Moneda moneda = new Moneda();
                moneda.setIdMoneda(rs.getInt("fid_moneda"));
                orden.setMoneda(moneda);
                orden.setDireccionDeEntrega(rs.getString("direccion_de_entrega"));
                orden.setFormaDeEntrega(FormaDeEntrega.valueOf(rs.getString("forma_de_entrega")));
                orden.setFechaDeCompra(rs.getDate("fecha_de_compra"));
                orden.setFechaDeEntrega(rs.getDate("fecha_de_entrega"));
                orden.setPagado(rs.getBoolean("pagado"));       
                ordenes.add(orden);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return ordenes;
    }
    
	@Override
    public ArrayList<OrdenDeCompra> listarUltimas50() {
        ArrayList<OrdenDeCompra> ordenes = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_ORDENES_DE_COMPRA_ULTIMAS_50()}");
            rs = cs.executeQuery();
            while(rs.next()){
                OrdenDeCompra orden = new OrdenDeCompra();
                orden.setIdOrdenDeCompra(rs.getInt("id_orden_de_compra"));
                orden.setMonto(rs.getDouble("monto"));

                Moneda moneda = new Moneda();
                moneda.setIdMoneda(rs.getInt("fid_moneda"));
                orden.setMoneda(moneda);
                orden.setDireccionDeEntrega(rs.getString("direccion_de_entrega"));
                orden.setFormaDeEntrega(FormaDeEntrega.valueOf(rs.getString("forma_de_entrega")));
                orden.setFechaDeCompra(rs.getDate("fecha_de_compra"));
                orden.setFechaDeEntrega(rs.getDate("fecha_de_entrega"));
                orden.setPagado(rs.getBoolean("pagado"));       
                ordenes.add(orden);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{
                con.close();
            }catch(Exception ex){
                System.out.println(ex.getMessage());
            }
        }
        return ordenes;
    }
	
}
