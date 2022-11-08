//package pe.edu.pucp.lp2soft.ventas.ventaspagos.mysql;
//
//import java.sql.CallableStatement;
//import java.sql.Connection;
//import java.sql.ResultSet;
//import java.util.ArrayList;
//import pe.edu.pucp.lp2soft.config.DBManager;
//import pe.edu.pucp.lp2soft.ventas.ventaspagos.dao.TerminoDePagoDAO;
//import pe.edu.pucp.lp2soft.ventas.ventaspagos.TerminoDePago;
//
//public class TerminoDePagoMySQL implements TerminoDePagoDAO {
//    private Connection con;
//    private CallableStatement cs;
//    private ResultSet rs;
//
//    @Override
//    public int insertar(TerminoDePago terminoDePago) {
//        int resultado = 0;
//        try{
//            con = DBManager.getInstance().getConnection();
//            cs = con.prepareCall("{call INSERTAR_TERMINO_DE_PAGO(?,?,?,?)}");
//            cs.registerOutParameter("_id_termino_de_pago", java.sql.Types.INTEGER);
//            cs.setDate("_fecha_limite", new java.sql.Date(terminoDePago.getFechaLimite().getTime()));
//            cs.setInt("_numero_cuota", terminoDePago.getNumeroCuota());
//            cs.setDouble("_monto_cuota", terminoDePago.getMontoCuota());
//            resultado = cs.executeUpdate();
//            terminoDePago.setId(cs.getInt("_id_termino_de_pago"));
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
//        // throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }
//
//    @Override
//    public int modificar(TerminoDePago terminoDePago) {
//        int resultado = 0;
//        try{
//            con = DBManager.getInstance().getConnection();
//            cs = con.prepareCall("{call MODIFICAR_TERMINO_DE_PAGO(?,?,?,?,?)}");
//            cs.setInt("_id_termino_de_pago", terminoDePago.getId());
//            cs.setDate("_fecha_limite", new java.sql.Date(terminoDePago.getFechaLimite().getTime()));
//            cs.setInt("_numero_cuota", terminoDePago.getNumeroCuota());
//            cs.setDouble("_monto_cuota", terminoDePago.getMontoCuota());
//            cs.setBoolean("_activo", terminoDePago.isActivo());
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
//        // throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }
//
//    @Override
//    public int eliminar(int id) {
//        int resultado = 0;
//        try{
//            con = DBManager.getInstance().getConnection();
//            cs = con.prepareCall("{call ELIMINAR_TERMINO_DE_PAGO(?)}");
//            cs.setInt("_id_termino_de_pago", id);
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
//        // throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }
//
//    @Override
//    public ArrayList<TerminoDePago> listarTodos() {
//        ArrayList<TerminoDePago> terminosDePago = new ArrayList<>();
//        try{
//            con = DBManager.getInstance().getConnection();
//            cs = con.prepareCall("{call LISTAR_TERMINOS_DE_PAGO()}");
//            rs = cs.executeQuery();
//            while(rs.next()){
//                TerminoDePago terminoDePago = new TerminoDePago();
//                terminoDePago.setId(rs.getInt("id_termino_de_pago"));
//                terminoDePago.setFechaLimite(rs.getDate("fecha_limite"));
//                terminoDePago.setNumeroCuota(rs.getInt("numero_cuota"));
//                terminoDePago.setMontoCuota(rs.getDouble("monto_cuota"));
//                terminosDePago.add(terminoDePago);
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
//        return terminosDePago;
//        // throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }
//    
//}
