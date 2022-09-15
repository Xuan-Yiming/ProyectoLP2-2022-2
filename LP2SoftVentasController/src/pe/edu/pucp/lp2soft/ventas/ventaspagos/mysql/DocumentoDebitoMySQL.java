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
import pe.edu.pucp.lp2soft.ventaspagos.DocumentoDebito;

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
            cs = con.prepareCall("{call insertar_documento_debito(?,?,?,?,?,?,?)}");
            cs.registerOutParameter("_id_documentoDebito", java.sql.Types.INTEGER);
            cs.setDate("_FECHACREACION", new java.sql.Date(documentoDebito.getFechaCreacion().getTime()));
            cs.setDate("_FECHAVENCIMIENTO", new java.sql.Date(documentoDebito.getFechaVencimiento().getTime()));
            cs.setDouble("_IMPUESTO", documentoDebito.getImpuesto());
            //moneda
            cs.setDouble("_MONTO", documentoDebito.getMonto());
            cs.setDouble("_SALDO", documentoDebito.getSaldo());
            cs.setBoolean("_ANULADO", documentoDebito.isAnulado());
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
            cs = con.prepareCall("{call modificar_documento_debito(?,?,?,?,?,?,?)}");
            cs.setInt("_id_documentoDebito", documentoDebito.getId());
            cs.setDate("_FECHACREACION", new java.sql.Date(documentoDebito.getFechaCreacion().getTime()));
            cs.setDate("_FECHAVENCIMIENTO", new java.sql.Date(documentoDebito.getFechaVencimiento().getTime()));
            cs.setDouble("_IMPUESTO", documentoDebito.getImpuesto());
            //moneda
            cs.setDouble("_MONTO", documentoDebito.getMonto());
            cs.setDouble("_SALDO", documentoDebito.getSaldo());
            cs.setBoolean("_ANULADO", documentoDebito.isAnulado());
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
                documentoDebito.setFechaCreacion(rs.getDate("FECHACREACION"));
                documentoDebito.setFechaVencimiento(rs.getDate("FECHAVENCIMIENTO"));
                documentoDebito.setImpuesto(rs.getDouble("IMPUESTO"));
                //moneda
                documentoDebito.setMonto(rs.getDouble("MONTO"));
                documentoDebito.setSaldo(rs.getDouble("SALDO"));
                documentoDebito.setAnulado(rs.getBoolean("ANULADO"));
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
