/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.pucp.lp2soft.ventas.ventaspagos.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import pe.edu.pucp.lp2soft.config.DBManager;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.dao.OrdenDeCompraDAO;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.OrdenDeCompra;

/**
 *
 * @author xuany
 */
public class OrdenDeCompraMySQL implements OrdenDeCompraDAO {
    private Connection con;
    private CallableStatement cs;
    private ResultSet rs;

    @Override
    public int insertar(OrdenDeCompra ordenDeCompra) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call insertar_orden_de_compra(?,?,?,?,?,?,?,?,?,?,?)}");
            cs.registerOutParameter("_id_orden_de_compra", java.sql.Types.INTEGER);
            cs.setInt("_id_cliente", ordenDeCompra.getCliente().getId());
            cs.setInt("_id_vendedor", ordenDeCompra.getVendedor().getId());
            cs.setDouble("_monto", ordenDeCompra.getMonto());
            cs.setInt("_id_moneda", ordenDeCompra.getMoneda().getId());
            cs.setString("_direccionDeEntrega", ordenDeCompra.getDireccionDeEntrega());
            cs.setInt("_formaDeEntrega", ordenDeCompra.getFormaDeEntrega().value().ordinal());
            cs.setDate("_fechaDeCompra", new java.sql.Date(ordenDeCompra.getFechaDeCompra().getTime()));
            cs.setDate("_fechaDeEntrega", new java.sql.Date(ordenDeCompra.getFechaDeEntrega().getTime()));
            cs.setBoolean("_pagado", ordenDeCompra.isPagado());
            cs.setBoolean("_activo", true);
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
    public int modificar(OrdenDeCompra ordenDeCompra) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call modificar_orden_de_compra(?,?,?,?,?,?,?,?,?,?,?)}");
            cs.setInt("_id_orden_de_compra", ordenDeCompra.getId());
            cs.setInt("_id_cliente", ordenDeCompra.getCliente().getId());
            cs.setInt("_id_vendedor", ordenDeCompra.getVendedor().getId());
            cs.setDouble("_monto", ordenDeCompra.getMonto());
            cs.setInt("_id_moneda", ordenDeCompra.getMoneda().getId());
            cs.setString("_direccionDeEntrega", ordenDeCompra.getDireccionDeEntrega());
            cs.setInt("_formaDeEntrega", ordenDeCompra.getFormaDeEntrega().value().ordinal());
            cs.setDate("_fechaDeCompra", new java.sql.Date(ordenDeCompra.getFechaDeCompra().getTime()));
            cs.setDate("_fechaDeEntrega", new java.sql.Date(ordenDeCompra.getFechaDeEntrega().getTime()));
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
            cs = con.prepareCall("{call eliminar_orden_de_compra(?)}");
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
            cs = con.prepareCall("{call listar_todas_orden_de_compra()}");
            rs = cs.executeQuery();
            while(rs.next()){
                OrdenDeCompra orden = new OrdenDeCompra();
                orden.setId(rs.getInt("id_orden_de_compra"));
                orden.setIdCliente(rs.getInt("id_cliente"));
                orden.setIdVendedor(rs.getInt("id_vendedor"));
                orden.setMonto(rs.getDouble("monto"));

                Moneda moneda = new Moneda();
                moneda.setId(rs.getInt("id_moneda"));
                orden.setMoneda(moneda);
                orden.setDireccionDeEntrega(rs.getString("direccionDeEntrega"));
                orden.setFormaDeEntrega(FormaDeEntrega.fromInt(rs.getInt("formaDeEntrega")));
                orden.setFechaDeCompra(rs.getDate("fechaDeCompra"));
                orden.setFechaDeEntrega(rs.getDate("fechaDeEntrega"));
                orden.setPagado(rs.getBoolean("pagado"));
                orden.setActivo(rs.getBoolean("activo"));
                
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
