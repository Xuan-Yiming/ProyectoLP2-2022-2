package pe.edu.pucp.lp2soft.ventas.ventaspagos.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import pe.edu.pucp.lp2soft.config.DBManager;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.dao.MonedaDAO;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.Moneda;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.TipoDeCambio;

public class MonedaMySQL implements MonedaDAO {
    private Connection con;
    private CallableStatement cs;
    private ResultSet rs;
    private CallableStatement cs2;
    private ResultSet rs2;

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
    
    @Override 
    public int buscarMoneda (String nombre){
        int id=0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{CALL BUSCAR_MONEDA(?)}");
            cs.setString("_nombre", nombre);
            rs = cs.executeQuery();
            id = rs.getInt("id_moneda");
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{
                con.close();
            }catch(Exception ex){
                System.out.println(ex.getMessage());
            }
        }
        return id;
    }
    
    @Override
    public ArrayList<Moneda> listarTodos() {
        ArrayList<Moneda> monedas = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{CALL LISTAR_MONEDAS()}");
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
    }
    
    @Override
    public ArrayList<Moneda> listarMonedaUltimoTipoDeCambio(){
        ArrayList<Moneda> monedas = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{CALL LISTAR_MONEDAS()}");
            rs = cs.executeQuery();

            while(rs.next()){
                Moneda moneda = new Moneda();
                moneda.setIdMoneda(rs.getInt("id_moneda"));
                moneda.setNombre(rs.getString("nombre"));
                moneda.setAbreviatura(rs.getString("abreviatura"));
                cs2 = con.prepareCall("{CALL LISTAR_MONEDA_ULTIMO_TIPODECAMBIO(?)}");
                cs2.setInt("_id_moneda", moneda.getIdMoneda());
                rs2 = cs2.executeQuery();
                rs2.next();
                
                ArrayList<TipoDeCambio> cambios = new ArrayList<>();
                TipoDeCambio cambio= new TipoDeCambio();
                cambio.setFecha(rs2.getDate("fecha"));
                cambio.setCambio(rs2.getDouble("cambio"));
                cambios.add(cambio);
                moneda.setCambios(cambios);
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
    }

    @Override
    public void actualizarTipoDeCambio() {
//        Date hoy = new Date();
//        ArrayList<Moneda> monedas = listarMonedaUltimoTipoDeCambio();
//        for (int i = 0; i<monedas.size(); i++){
//            if(monedas.get(i).getCambios().get(0).getFecha().compareTo(hoy)!=0){
//                 Request request = new Request.Builder()
//                .url("https://api.apilayer.com/exchangerates_data/convert?to=PEN&from="+monedas.get(i).getAbreviatura()+"&amount=1")
//                .addHeader("apikey", "M4yskdVx6K55NujlIqMu5PeNhSdxNIXW")
//                //.method("GET", })
//                .build();
//                try (Response response = client.newCall(request).execute()){
//                    JSONObject j = new JSONObject(response.body());
//                    
//                    TipoDeCambio cambio = new TipoDeCambio();
//                    cambio.setActivo(true);
//                    cambio.setCambio(parseDouble(j.getString("rate")));
//                    cambio.setFecha(hoy);
//                    cambio.setFid_Moneda(monedas.get(i).getIdMoneda());
//                    
//                    daoTipodecambio.insertarTipoDeCambio(cambio);
//                    
//                }catch(Exception ex){
//                    System.out.println(ex.getMessage());
//                }
//                
//            }
//        }
    }
    
}
