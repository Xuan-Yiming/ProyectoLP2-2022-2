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
import pe.edu.pucp.lp2soft.ventas.ventaspagos.dao.TipoDeCambioDAO;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.TipoDeCambio;

/**
 *
 * @author xuany
 */
public class TipoDeCambioMySQL implements TipoDeCambioDAO {
    private Connection con;
    private CallableStatement cs;
    private ResultSet rs;

    @Override
    public int insertar(TipoDeCambio tipoDeCambio) {
        int resultado = 0;
        //insertar fecha (Date) y cambio (double)
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call insertar_tipoDeCambio(?,?,?,?,?)}");
            cs.registerOutParameter("_id_tipoDeCambio", java.sql.Types.INTEGER);
            cs.setInt("_id_moneda", tipoDeCambio.getIdMoneda());
            cs.setDate("_fecha", new java.sql.Date(tipoDeCambio.getFecha().getTime()));
            cs.setDouble("_cambio", tipoDeCambio.getCambio());
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
    public int modificar(TipoDeCambio tipoDeCambio) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call modificar_tipoDeCambio(?,?,?,?,?)}");
            cs.setInt("_id_tipoDeCambio", tipoDeCambio.getId());
            cs.setInt("_id_moneda", tipoDeCambio.getIdMoneda());
            cs.setDate("_fecha", new java.sql.Date(tipoDeCambio.getFecha().getTime()));
            cs.setDouble("_cambio", tipoDeCambio.getCambio());
            cs.setBoolean("_activo", tipoDeCambio.isActivo());
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
            cs = con.prepareCall("{call eliminar_tipoDeCambio(?)}");
            cs.setInt("_id_tipoDeCambio", id);
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
    public ArrayList<TipoDeCambio> listarTodos() {
        ArrayList<TipoDeCambio> tiposDeCambio = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call listarTodos_tipoDeCambio()}");
            rs = cs.executeQuery();
            while(rs.next()){
                TipoDeCambio tipoDeCambio = new TipoDeCambio();
                tipoDeCambio.setId(rs.getInt("id_tipoDeCambio"));
                tipoDeCambio.setIdMoneda(rs.getInt("id_moneda"));
                tipoDeCambio.setFecha(rs.getDate("fecha"));
                tipoDeCambio.setCambio(rs.getDouble("cambio"));
                tipoDeCambio.setActivo(rs.getBoolean("activo"));
                tiposDeCambio.add(tipoDeCambio);
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
        return tiposDeCambio;
        // throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
