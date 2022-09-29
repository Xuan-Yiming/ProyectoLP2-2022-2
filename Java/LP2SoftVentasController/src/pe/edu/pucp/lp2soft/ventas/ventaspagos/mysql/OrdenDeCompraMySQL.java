package pe.edu.pucp.lp2soft.ventas.ventaspagos.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import pe.edu.pucp.lp2soft.config.DBManager;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.FormaDeEntrega;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.Moneda;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.dao.OrdenDeCompraDAO;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.OrdenDeCompra;

public class OrdenDeCompraMySQL implements OrdenDeCompraDAO {
    private Connection con;
    private CallableStatement cs;
    private ResultSet rs;

    @Override
    public int insertar(OrdenDeCompra ordenDeCompra) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call insertar_orden_de_compra(?,?,?,?,?,?,?,?,?,?)}");
            cs.registerOutParameter("_id_orden_de_compra", java.sql.Types.INTEGER);
            cs.setInt("_fid_cliente", ordenDeCompra.getIdCliente());
            cs.setInt("_fid_vendedor", ordenDeCompra.getIdVendedor());
            cs.setDouble("_monto", ordenDeCompra.getMonto());
            cs.setInt("_fid_moneda", ordenDeCompra.getMoneda().getId());
            cs.setString("_direccion_de_entrega", ordenDeCompra.getDireccionDeEntrega());
            cs.setString("_forma_de_entrega", ordenDeCompra.getFormaDeEntrega().name());
            cs.setDate("_fecha_de_compra", new java.sql.Date(ordenDeCompra.getFechaDeCompra().getTime()));
            cs.setDate("_fecha_de_entrega", new java.sql.Date(ordenDeCompra.getFechaDeEntrega().getTime()));
            cs.setBoolean("_pagado", ordenDeCompra.isPagado());
            resultado = cs.executeUpdate();
            ordenDeCompra.setId(cs.getInt("_id_orden_de_compra"));
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

        // throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int modificar(OrdenDeCompra ordenDeCompra) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call modificar_orden_de_compra(?,?,?,?,?,?,?,?,?,?,?)}");
            cs.setInt("_id_orden_de_compra", ordenDeCompra.getId());
            cs.setInt("_fid_cliente", ordenDeCompra.getIdCliente());
            cs.setInt("_fid_vendedor", ordenDeCompra.getIdVendedor());
            cs.setDouble("_monto", ordenDeCompra.getMonto());
            cs.setInt("_fid_moneda", ordenDeCompra.getMoneda().getId());
            cs.setString("_direccion_de_entrega", ordenDeCompra.getDireccionDeEntrega());
            cs.setString("_forma_de_entrega", ordenDeCompra.getFormaDeEntrega().name());
            cs.setDate("_fecha_de_compra", new java.sql.Date(ordenDeCompra.getFechaDeCompra().getTime()));
            cs.setDate("_fecha_de_entrega", new java.sql.Date(ordenDeCompra.getFechaDeEntrega().getTime()));
            cs.setBoolean("_pagado", ordenDeCompra.isPagado());
            cs.setBoolean("_activo", ordenDeCompra.isActivo());
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
        // throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
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
        // throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
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
                orden.setId(rs.getInt("id_orden_de_compra"));
                orden.setIdCliente(rs.getInt("fid_cliente"));
                orden.setIdVendedor(rs.getInt("fid_vendedor"));
                orden.setMonto(rs.getDouble("monto"));

                Moneda moneda = new Moneda();
                moneda.setId(rs.getInt("fid_moneda"));
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
        // throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
