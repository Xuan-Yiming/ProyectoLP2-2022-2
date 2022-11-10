//package pe.edu.pucp.lp2soft.ventas.ventaspagos.mysql;
//
//import java.sql.CallableStatement;
//import java.sql.Connection;
//import java.sql.ResultSet;
//import java.util.ArrayList;
//import pe.edu.pucp.lp2soft.config.DBManager;
//import pe.edu.pucp.lp2soft.ventas.ventaspagos.dao.MonedaDAO;
//import pe.edu.pucp.lp2soft.ventas.ventaspagos.Moneda;
//
//public class MonedaMySQL implements MonedaDAO {
//    private Connection con;
//    private CallableStatement cs;
//    private ResultSet rs;
//
//    @Override
//    public int insertar(Moneda moneda) {
//        int resultado = 0;
//        try{
//            con = DBManager.getInstance().getConnection();
//            cs = con.prepareCall("{CALL INSERTAR_MONEDA(?,?,?)}");
//            cs.registerOutParameter("_id_moneda", java.sql.Types.INTEGER);
//            cs.setString("_nombre", moneda.getNombre());
//            cs.setString("_abreviatura", moneda.getAbreviatura());
//            resultado = cs.executeUpdate();
//            moneda.setId(cs.getInt("_id_moneda"));
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
//    public int modificar(Moneda moneda) {
//        int resultado = 0;
//        try{
//            con = DBManager.getInstance().getConnection();
//            cs = con.prepareCall("{CALL MODIFICAR_MONEDA(?,?,?,?)}");
//            cs.setInt("_id_moneda", moneda.getId());
//            cs.setString("_nombre", moneda.getNombre());
//            cs.setString("_abreviatura", moneda.getAbreviatura());
//            cs.setBoolean("_activo", moneda.isActivo());
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
//            cs = con.prepareCall("{CALL ELIMINAR_MONEDA(?)}");
//            cs.setInt("_id_moneda", id);
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
//    public ArrayList<Moneda> listarTodos() {
//        ArrayList<Moneda> monedas = new ArrayList<>();
//        try{
//            con = DBManager.getInstance().getConnection();
//            cs = con.prepareCall("{CALL LISTAR_MONEDAS()}");
//            rs = cs.executeQuery();
//            while(rs.next()){
//                Moneda moneda = new Moneda();
//                moneda.setId(rs.getInt("id_moneda"));
//                moneda.setNombre(rs.getString("nombre"));
//                moneda.setAbreviatura(rs.getString("abreviatura"));
//                monedas.add(moneda);
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
//        return monedas;
//        // throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }
//    
//}

package pe.edu.pucp.lp2soft.ventas.ventaspagos.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import pe.edu.pucp.lp2soft.config.DBManager;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.dao.MonedaDAO;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.Moneda;

public class MonedaMySQL implements MonedaDAO {
    private Connection con;
    private CallableStatement cs;
    private ResultSet rs;

    @Override
    public int insertarMoneda(Moneda moneda) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{CALL INSERTAR_MONEDA(?,?,?,?)}");
            cs.registerOutParameter("_id_moneda", java.sql.Types.INTEGER);
            cs.setString("_nombre", moneda.getNombre());
            cs.setString("_abreviatura", moneda.getAbreviatura());
            cs.setBoolean("_activo", moneda.getActivo());
            resultado = cs.executeUpdate();
            moneda.setIdMoneda(cs.getInt("_id_moneda"));
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
    public int modificarMoneda(Moneda moneda) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{CALL MODIFICAR_MONEDA(?,?,?,?)}");
            cs.setInt("_id_moneda", moneda.getIdMoneda());
            cs.setString("_nombre", moneda.getNombre());
            cs.setString("_abreviatura", moneda.getAbreviatura());
            cs.setBoolean("_activo", moneda.getActivo());
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
    public int eliminarMoneda(int id) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{CALL ELIMINAR_MONEDA(?)}");
            cs.setInt("_id_moneda", id);
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
    public ArrayList<Moneda> listarMonedaXNombre(String nombre) {
        ArrayList<Moneda> monedas = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{CALL LISTAR_MONEDAS_X_NOMBRE(?)}");
            cs.setString(1, nombre);
            rs = cs.executeQuery();
            while(rs.next()){
                Moneda moneda = new Moneda();
                moneda.setIdMoneda(rs.getInt("id_moneda"));
                moneda.setNombre(rs.getString("nombre"));
                moneda.setAbreviatura(rs.getString("abreviatura"));
                monedas.add(moneda);
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
        return monedas;
        // throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
