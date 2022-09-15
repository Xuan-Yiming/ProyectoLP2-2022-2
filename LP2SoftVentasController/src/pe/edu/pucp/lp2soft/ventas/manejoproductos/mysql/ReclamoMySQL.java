/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.pucp.lp2soft.ventas.manejoproductos.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import pe.edu.pucp.lp2soft.config.DBManager;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Reclamo;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.dao.ReclamoDAO;

/**
 *
 * @author xuany
 */
public class ReclamoMySQL implements ReclamoDAO {
    private Connection con;
    private CallableStatement cs;
    private ResultSet rs;

    @Override
    public int insertar(Reclamo reclamo) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call INSERTAR_RECLAMO(?,?,?,?)}");
            cs.registerOutParameter("_ID_RECLAMO", java.sql.Types.INTEGER);
            cs.setDate("_FECHA", new java.sql.Date(reclamo.getFecha().getTime()));
            cs.setBoolean("_ATENDIDO", reclamo.isAtendido());
            cs.setString("_JUSTIFICACION", reclamo.getJustificacion());
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
        // throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int modificar(Reclamo reclamo) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call MODIFICAR_RECLAMO(?,?,?,?)}");
            cs.setInt("_ID_RECLAMO", reclamo.getId());
            cs.setDate("_FECHA", new java.sql.Date(reclamo.getFecha().getTime()));
            cs.setBoolean("_ATENDIDO", reclamo.isAtendido());
            cs.setString("_JUSTIFICACION", reclamo.getJustificacion());
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
        // throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int eliminar(int id) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call ELIMINAR_RECLAMO(?)}");
            cs.setInt("_ID_RECLAMO", id);
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
        // throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Reclamo> listarTodos() {
        ArrayList<Reclamo> reclamos = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_RECLAMOS()}");
            rs = cs.executeQuery();
            while(rs.next()){
                Reclamo reclamo = new Reclamo();
                reclamo.setId(rs.getInt("ID_RECLAMO"));
                reclamo.setFecha(rs.getDate("FECHA"));
                reclamo.setAtendido(rs.getBoolean("ATENDIDO"));
                reclamo.setJustificacion(rs.getString("JUSTIFICACION"));
                reclamos.add(reclamo);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return reclamos;
        // throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
