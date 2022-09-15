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
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Almacen;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.dao.AlmacenDAO;

/**
 *
 * @author xuany
 */
public class AlmacenMySQL implements AlmacenDAO {
    private Connection con;
    private CallableStatement cs;
    private ResultSet rs;

    @Override
    public int insertar(Almacen almacen) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call INSERTAR_ALMACEN(?,?,?)}");
            cs.registerOutParameter("_ID_ALMACEN", java.sql.Types.INTEGER);
            cs.setString("_NOMBRE", almacen.getNombre());
            cs.setString("_DIRECCION", almacen.getDireccion());
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public int modificar(Almacen almacen) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call MODIFICAR_ALMACEN(?,?,?)}");
            cs.setInt("_ID_ALMACEN", almacen.getId());
            cs.setString("_NOMBRE", almacen.getNombre());
            cs.setString("_DIRECCION", almacen.getDireccion());
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;

        //throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int eliminar(int id) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call ELIMINAR_ALMACEN(?)}");
            cs.setInt("_ID", id);
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        //throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        return resultado;
    }

    @Override
    public ArrayList<Almacen> listarTodos() {
        ArrayList<Almacen> almacenes = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_ALMACENES()}");
            rs = cs.executeQuery();
            while(rs.next()){
                Almacen almacen = new Almacen();
                almacen.setId(rs.getInt("ID_ALMACEN"));
                almacen.setNombre(rs.getString("NOMBRE"));
                almacen.setDireccion(rs.getString("DIRECCION"));
                almacenes.add(almacen);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return almacenes;
        //throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
