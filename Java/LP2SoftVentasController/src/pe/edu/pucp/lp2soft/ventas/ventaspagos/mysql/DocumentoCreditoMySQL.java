//package pe.edu.pucp.lp2soft.ventas.ventaspagos.mysql;
//
//import java.sql.CallableStatement;
//import java.sql.Connection;
//import java.sql.ResultSet;
//import java.util.ArrayList;
//import pe.edu.pucp.lp2soft.config.DBManager;
//import pe.edu.pucp.lp2soft.ventas.ventaspagos.dao.DocumentoCreditoDAO;
//import pe.edu.pucp.lp2soft.ventas.ventaspagos.DocumentoCredito;
//import pe.edu.pucp.lp2soft.ventas.ventaspagos.Moneda;
//
//public class DocumentoCreditoMySQL implements DocumentoCreditoDAO {
//    private Connection con;
//    private CallableStatement cs;
//    private ResultSet rs;
//    @Override
//    public int insertar(DocumentoCredito documentoCredito) {
//        int resultado = 0;
//        try{
//            con = DBManager.getInstance().getConnection();
//            cs = con.prepareCall("{call insertar_documento_credito(?,?,?,?,?,?,?,?)}");
//            cs.registerOutParameter("_id_documento_credito", java.sql.Types.INTEGER);
//            cs.setInt("_fid_orden_de_compra", documentoCredito.getIdOrdenDeCompra());
//            cs.setInt("_fid_documento_debito", documentoCredito.getIdDocumentoDebito());
//            cs.setDate("_fecha_creacion", new java.sql.Date(documentoCredito.getFechaCreacion().getTime()));
//            cs.setDate("_fecha_vencimiento", new java.sql.Date(documentoCredito.getFechaVencimiento().getTime()));
//            cs.setDouble("_monto", documentoCredito.getMonto());
//            cs.setInt("_fid_moneda", documentoCredito.getMoneda().getId());
//            cs.setBoolean("_anulado", false);
//            
//            resultado = cs.executeUpdate();
//            documentoCredito.setId(cs.getInt("_id_documento_credito"));
//        }catch(Exception ex){
//            System.out.println(ex.getMessage());
//        }finally{
//            try{
//                con.close();
//            }catch(Exception ex){
//                System.out.println(ex.getMessage());
//            }
//        }
//        return resultado;
//        //  throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }
//
//    @Override
//    public int modificar(DocumentoCredito documentoCredito) {
//        int resultado = 0;
//        try{
//            con = DBManager.getInstance().getConnection();
//            cs = con.prepareCall("{call modificar_documento_credito(?,?,?,?,?,?,?,?,?)}");
//            cs.setInt("_id_documento_credito", documentoCredito.getId());
//            cs.setInt("_fid_orden_de_compra", documentoCredito.getIdOrdenDeCompra());
//            cs.setInt("_fid_documento_debito", documentoCredito.getIdDocumentoDebito());
//            cs.setDate("_fecha_creacion", new java.sql.Date(documentoCredito.getFechaCreacion().getTime()));
//            cs.setDate("_fecha_vencimiento", new java.sql.Date(documentoCredito.getFechaVencimiento().getTime()));
//            cs.setDouble("_monto", documentoCredito.getMonto());
//            cs.setInt("_fid_moneda", documentoCredito.getMoneda().getId());
//            cs.setBoolean("_anulado", documentoCredito.isAnulado());
//            cs.setBoolean("_activo", documentoCredito.isActivo());
//            resultado = cs.executeUpdate();
//        }catch(Exception ex){
//            System.out.println(ex.getMessage());
//        }finally{
//            try{
//                con.close();
//            }catch(Exception ex){
//                System.out.println(ex.getMessage());
//            }
//        }
//        return resultado;
//        //  throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }
//
//    @Override
//    public int eliminar(int id) {
//        int resultado = 0;
//        try{
//            con = DBManager.getInstance().getConnection();
//            cs = con.prepareCall("{call eliminar_documento_credito(?)}");
//            cs.setInt("_id_documento_credito", id);
//            resultado = cs.executeUpdate();
//        }catch(Exception ex){
//            System.out.println(ex.getMessage());
//        }finally{
//            try{
//                con.close();
//            }catch(Exception ex){
//                System.out.println(ex.getMessage());
//            }
//        }
//        return resultado;
//        //  throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }
//
//    @Override
//    public ArrayList<DocumentoCredito> listarTodos() {
//        ArrayList<DocumentoCredito> documentos = new ArrayList<>();
//        try{
//            con = DBManager.getInstance().getConnection();
//            cs = con.prepareCall("{call listar_documentos_credito()}");
//            rs = cs.executeQuery();
//            while(rs.next()){
//                DocumentoCredito documento = new DocumentoCredito();
//                documento.setId(rs.getInt("id_documento_credito"));
//                documento.setIdOrdenDeCompra(rs.getInt("fid_orden_de_compra"));
//                documento.setIdDocumentoDebito(rs.getInt("fid_documento_debito"));
//                documento.setFechaCreacion(rs.getDate("fecha_creacion"));
//                documento.setFechaVencimiento(rs.getDate("fecha_vencimiento"));
//                documento.setMonto(rs.getDouble("monto"));
//                Moneda moneda = new Moneda();
//                //falta listar todos los tipo de cambios
//                moneda.setId(rs.getInt("fid_moneda"));
//                documento.setMoneda(moneda);
//                documento.setAnulado(rs.getBoolean("anulado"));
//                documentos.add(documento);
//            }
//        }catch(Exception ex){
//            System.out.println(ex.getMessage());
//        }finally{
//            try{
//                con.close();
//            }catch(Exception ex){
//                System.out.println(ex.getMessage());
//            }
//        }
//        return documentos;
//        //  throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }
//    
//}
