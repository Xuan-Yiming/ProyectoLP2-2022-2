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
import pe.edu.pucp.lp2soft.ventas.ventaspagos.dao.DocumentoCreditoDAO;
import pe.edu.pucp.lp2soft.ventaspagos.DocumentoCredito;

/**
 *
 * @author xuany
 */
public class DocumentoCreditoMySQL implements DocumentoCreditoDAO {
    private Connection con;
    private CallableStatement cs;
    private ResultSet rs;
    @Override
    public int insertar(DocumentoCredito documentoCredito) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call insertar_documento_credito(?,?,?,?,?,?,?,?,?)}");
            cs.registerOutParameter("_id_documentoCredito", java.sql.Types.INTEGER);
            cs.setInt("_id_ordendecompra", documentoCredito.getIdOrdenDeCompra());
            cs.setInt("_id_DocumentoDebito", documentoCredito.getIdDocumentoDebito());
            cs.setDate("_fechaCreacion", new java.sql.Date(documentoCredito.getFechaCreacion().getTime()));
            cs.setDate("_fechaVencimiento", new java.sql.Date(documentoCredito.getFechaVencimiento().getTime()));
            cs.setDouble("_monto", documentoCredito.getMonto());
            cs.setInt("_id_moneda", documentoCredito.getIdMoneda().getId());
            cs.setBoolean("_anulado", documentoCredito.isAnulado());
            cs.setBoolean("_activo", documentoCredito.isActivo());
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
        //  throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int modificar(DocumentoCredito documentoCredito) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call modificar_documento_credito(?,?,?,?,?,?,?,?,?)}");
            cs.setInt("_id_documentoCredito", documentoCredito.getId());
            cs.setInt("_id_ordendecompra", documentoCredito.getIdOrdenDeCompra());
            cs.setInt("_id_DocumentoDebito", documentoCredito.getIdDocumentoDebito());
            cs.setDate("_fechaCreacion", new java.sql.Date(documentoCredito.getFechaCreacion().getTime()));
            cs.setDate("_fechaVencimiento", new java.sql.Date(documentoCredito.getFechaVencimiento().getTime()));
            cs.setDouble("_monto", documentoCredito.getMonto());
            cs.setInt("_id_moneda", documentoCredito.getIdMoneda().getId());
            cs.setBoolean("_anulado", documentoCredito.isAnulado());
            cs.setBoolean("_activo", documentoCredito.isActivo());
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
        //  throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int eliminar(int id) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call eliminar_documento_credito(?)}");
            cs.setInt("_id_documentoCredito", id);
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
        //  throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<DocumentoCredito> listarTodos() {
        ArrayList<DocumentoCredito> documentos = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call listar_documentos_credito()}");
            rs = cs.executeQuery();
            while(rs.next()){
                DocumentoCredito documento = new DocumentoCredito();
                documento.setId(rs.getInt("id_documentoCredito"));
                documento.setIdOrdenDeCompra(rs.getInt("id_ordendecompra"));
                documento.setIdDocumentoDebito(rs.getInt("id_DocumentoDebito"));
                documento.setFechaCreacion(rs.getDate("fechaCreacion"));
                documento.setFechaVencimiento(rs.getDate("fechaVencimiento"));
                documento.setMonto(rs.getDouble("monto"));
                Moneda moneda = new Moneda();
                //falta listar todos los tipo de cambios
                moneda.setId(rs.getInt("id_moneda"));
                documento.setIdMoneda(moneda);
                documento.setAnulado(rs.getBoolean("anulado"));
                documento.setActivo(rs.getBoolean("activo"));
                documentos.add(documento);
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
        return documentos;
        //  throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
