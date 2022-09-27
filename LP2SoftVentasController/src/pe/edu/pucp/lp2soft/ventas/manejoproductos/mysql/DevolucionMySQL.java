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
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Devolucion;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.dao.DevolucionDAO;

/**
 *
 * @author xuany
 */
public class DevolucionMySQL implements DevolucionDAO {

    private Connection con;
    private CallableStatement cs;
    private ResultSet rs;

    @Override
    public int insertar(Devolucion devolucion) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call INSERTAR_DEVOLUCION(?,?,?,?)}");
            cs.registerOutParameter("_id_devolucion", java.sql.Types.INTEGER);
            cs.setInt("_id_producto", devolucion.getIdProducto());
            cs.setInt("_id_reclamo", devolucion.getIdReclamo());
            cs.setBoolean("_activo", true);
            cs.executeUpdate();
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public int modificar(Devolucion devolucion) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call MODIFICAR_DEVOLUCION(?,?,?,?)}");
            cs.setInt("_id_devolucion", devolucion.getId());
            cs.setInt("_id_producto", devolucion.getIdProducto());
            cs.setInt("_id_reclamo", devolucion.getIdReclamo());
            cs.setBoolean("_activo", devolucion.isActivo());
            cs.executeUpdate();
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public int eliminar(int id) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call ELIMINAR_DEVOLUCION(?)}");
            cs.setInt("_id_devolucion", id);
            cs.executeUpdate();
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public ArrayList<Devolucion> listarTodos() {
        ArrayList<Devolucion> devoluciones = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_DEVOLUCIONES()}");
            rs = cs.executeQuery();
            while(rs.next()){
                Devolucion devolucion = new Devolucion();
                devolucion.setId(rs.getInt("id_devolucion"));
                devolucion.setIdProducto(rs.getInt("id_producto"));
                devolucion.setIdReclamo(rs.getInt("id_reclamo"));
                devolucion.setActivo(rs.getBoolean("activo"));
                devoluciones.add(devolucion);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return devoluciones;
        //throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
