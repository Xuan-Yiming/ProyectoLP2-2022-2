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
import pe.edu.pucp.lp2soft.ventas.ventaspagos.dao.DocumentoDebitoDAO;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.DocumentoDebito;

/**
 *
 * @author xuany
 */
public class DocumentoDebitoMySQL implements DocumentoDebitoDAO {
    private Connection con;
    private CallableStatement cs;
    private ResultSet rs;

    @Override
    public int insertar(DocumentoDebito documentoDebito) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call insertar_documento_debito(?,?,?,?,?,?,?,?,?,?,?)}");
            cs.registerOutParameter("_id_documentoDebito", java.sql.Types.INTEGER);
            cs.setInt("_id_ordenDeCompra", documentoDebito.getIdOrdenDeCompra());
            cs.setDate("_fecha_creacion", documentoDebito.getFechaCreacion());
            cs.setDate("_fecha_vencimiento", documentoDebito.getFechaVencimiento());
            cs.setDouble("_impuesto", documentoDebito.getImpuesto());
            cs.setDouble("_monto", documentoDebito.getMonto());
            cs.setInt("_id_moneda", documentoDebito.getMoneda().getId());
            cs.setDouble("_saldo", documentoDebito.getSaldo());
            cs.setBoolean("_anulado", false);
            cs.setInt("_id_terminoDePago", documentoDebito.getTerminoDePago().getId());
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
    public int modificar(DocumentoDebito documentoDebito) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call modificar_documento_debito(?,?,?,?,?,?,?,?,?,?,?)}");
            cs.setInt("_id_documentoDebito", documentoDebito.getId());
            cs.setInt("_id_ordenDeCompra", documentoDebito.getIdOrdenDeCompra());
            cs.setDate("_fecha_creacion", documentoDebito.getFechaCreacion());
            cs.setDate("_fecha_vencimiento", documentoDebito.getFechaVencimiento());
            cs.setDouble("_impuesto", documentoDebito.getImpuesto());
            cs.setDouble("_monto", documentoDebito.getMonto());
            cs.setInt("_id_moneda", documentoDebito.getMoneda().getId());
            cs.setDouble("_saldo", documentoDebito.getSaldo());
            cs.setBoolean("_anulado", documentoDebito.isAnulado());
            cs.setInt("_id_terminoDePago", documentoDebito.getTerminoDePago().getId());
            cs.setBoolean("_activo", documentoDebito.isActivo());
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
            cs = con.prepareCall("{call eliminar_documento_debito(?)}");
            cs.setInt("_id_documentoDebito", id);
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
    public ArrayList<DocumentoDebito> listarTodos() {
        ArrayList<DocumentoDebito> documentosDebito = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call listar_documentos_debito()}");
            rs = cs.executeQuery();
            while(rs.next()){
                DocumentoDebito documentoDebito = new DocumentoDebito();
                documentoDebito.setId(rs.getInt("id_documentoDebito"));
                documentoDebito.setIdOrdenDeCompra(rs.getInt("id_ordenDeCompra"));
                documentoDebito.setFechaCreacion(rs.getDate("fecha_creacion"));
                documentoDebito.setFechaVencimiento(rs.getDate("fecha_vencimiento"));
                documentoDebito.setImpuesto(rs.getDouble("impuesto"));
                documentoDebito.setMonto(rs.getDouble("monto"));
                Moneda moneda = new Moneda();
                moneda.setId(rs.getInt("id_moneda"));
                documentoDebito.setMoneda(moneda);
                documentoDebito.setSaldo(rs.getDouble("saldo"));
                documentoDebito.setAnulado(rs.getBoolean("anulado"));
                TerminoDePago terminoDePago = new TerminoDePago();
                terminoDePago.setId(rs.getInt("id_terminoDePago"));
                documentoDebito.setTerminoDePago(terminoDePago);
                documentoDebito.setActivo(rs.getBoolean("activo"));
                documentosDebito.add(documentoDebito);
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
        return documentosDebito;
        // throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
