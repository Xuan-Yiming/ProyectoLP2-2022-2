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
import pe.edu.pucp.lp2soft.ventas.ventaspagos.dao.TerminoDePagoDAO;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.TerminoDePago;

/**
 *
 * @author xuany
 */
public class TerminoDePagoMySQL implements TerminoDePagoDAO {
    private Connection con;
    private CallableStatement cs;
    private ResultSet rs;

    @Override
    public int insertar(TerminoDePago terminoDePago) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call insertar_terminoDePago(?,?,?,?,?)}");
            cs.registerOutParameter("_id_terminoDePago", java.sql.Types.INTEGER);
            cs.setDate("_fechaLimite", new java.sql.Date(terminoDePago.getFechaLimite().getTime()));
            cs.setInt("_numeroCuota", terminoDePago.getNumeroCuota());
            cs.setDouble("_montoCuota", terminoDePago.getMontoCuota());
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
    public int modificar(TerminoDePago terminoDePago) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call modificar_terminoDePago(?,?,?,?,?)}");
            cs.setInt("_id_terminoDePago", terminoDePago.getId());
            cs.setDate("_fechaLimite", new java.sql.Date(terminoDePago.getFechaLimite().getTime()));
            cs.setInt("_numeroCuota", terminoDePago.getNumeroCuota());
            cs.setDouble("_montoCuota", terminoDePago.getMontoCuota());
            cs.setBoolean("_activo", terminoDePago.isActivo());
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
            cs = con.prepareCall("{call eliminar_terminoDePago(?)}");
            cs.setInt("_id_terminoDePago", id);
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
    public ArrayList<TerminoDePago> listarTodos() {
        ArrayList<TerminoDePago> terminosDePago = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call listar_terminoDePago()}");
            rs = cs.executeQuery();
            while(rs.next()){
                TerminoDePago terminoDePago = new TerminoDePago();
                terminoDePago.setId(rs.getInt("id_terminoDePago"));
                terminoDePago.setFechaLimite(rs.getDate("fechaLimite"));
                terminoDePago.setNumeroCuota(rs.getInt("numeroCuota"));
                terminoDePago.setMontoCuota(rs.getDouble("montoCuota"));
                terminoDePago.setActivo(rs.getBoolean("activo"));
                terminosDePago.add(terminoDePago);
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
        return terminosDePago;
        // throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
