//package pe.edu.pucp.lp2soft.ventas.ventaspagos.mysql;
//
//import java.sql.CallableStatement;
//import java.sql.Connection;
//import java.sql.ResultSet;
//import java.util.ArrayList;
//import pe.edu.pucp.lp2soft.config.DBManager;
//import pe.edu.pucp.lp2soft.ventas.ventaspagos.dao.TipoDeCambioDAO;
//import pe.edu.pucp.lp2soft.ventas.ventaspagos.TipoDeCambio;
//
//public class TipoDeCambioMySQL implements TipoDeCambioDAO {
//    private Connection con;
//    private CallableStatement cs;
//    private ResultSet rs;
//
//    @Override
//    public int insertar(TipoDeCambio tipoDeCambio) {
//        int resultado = 0;
//        //insertar fecha (Date) y cambio (double)
//        try{
//            con = DBManager.getInstance().getConnection();
//            cs = con.prepareCall("{call INSERTAR_TIPO_DE_CAMBIO(?,?,?,?)}");
//            cs.registerOutParameter("_id_tipo_de_cambio", java.sql.Types.INTEGER);
//            cs.setInt("_fid_moneda", tipoDeCambio.getIdMoneda());
//            cs.setDate("_fecha", new java.sql.Date(tipoDeCambio.getFecha().getTime()));
//            cs.setDouble("_cambio", tipoDeCambio.getCambio());
//            
//            resultado = cs.executeUpdate();
//            tipoDeCambio.setId(cs.getInt("_id_tipo_de_cambio"));
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
//        
//        // throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }
//
//    @Override
//    public int modificar(TipoDeCambio tipoDeCambio) {
//        int resultado = 0;
//        try{
//            con = DBManager.getInstance().getConnection();
//            cs = con.prepareCall("{call MODIFICAR_TIPO_DE_CAMBIO(?,?,?,?,?)}");
//            cs.setInt("_id_tipo_de_cambio", tipoDeCambio.getId());
//            cs.setInt("_fid_moneda", tipoDeCambio.getIdMoneda());
//            cs.setDate("_fecha", new java.sql.Date(tipoDeCambio.getFecha().getTime()));
//            cs.setDouble("_cambio", tipoDeCambio.getCambio());
//            cs.setBoolean("_activo", tipoDeCambio.isActivo());
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
//            cs = con.prepareCall("{call ELIMINAR_TIPO_DE_CAMBIO(?)}");
//            cs.setInt("_id_tipo_de_cambio", id);
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
//    public ArrayList<TipoDeCambio> listarTodos() {
//        ArrayList<TipoDeCambio> tiposDeCambio = new ArrayList<>();
//        try{
//            con = DBManager.getInstance().getConnection();
//            cs = con.prepareCall("{call LISTAR_TIPOS_DE_CAMBIO()}");
//            rs = cs.executeQuery();
//            while(rs.next()){
//                TipoDeCambio tipoDeCambio = new TipoDeCambio();
//                tipoDeCambio.setId(rs.getInt("id_tipo_de_cambio"));
//                tipoDeCambio.setIdMoneda(rs.getInt("fid_moneda"));
//                tipoDeCambio.setFecha(rs.getDate("fecha"));
//                tipoDeCambio.setCambio(rs.getDouble("cambio"));
//                tiposDeCambio.add(tipoDeCambio);
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
//        return tiposDeCambio;
//        // throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }
//    
//}
