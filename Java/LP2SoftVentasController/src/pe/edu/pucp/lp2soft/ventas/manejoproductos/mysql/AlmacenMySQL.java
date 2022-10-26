package pe.edu.pucp.lp2soft.ventas.manejoproductos.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import pe.edu.pucp.lp2soft.config.DBManager;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Almacen;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.dao.AlmacenDAO;

public class AlmacenMySQL implements AlmacenDAO {
    private Connection con;
    private CallableStatement cs;
    private ResultSet rs;

    @Override
    public int insertar(Almacen almacen) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call INSERTAR_ALMACEN(?,?,?,?)}");
            cs.registerOutParameter("_id_almacen", java.sql.Types.INTEGER);
            cs.setString("_nombre", almacen.getNombre());
            cs.setString("_direccion", almacen.getDireccion());
            cs.setBoolean("_activo", true);
            resultado = cs.executeUpdate();
            almacen.setId(cs.getInt("_id_almacen"));
            
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
            cs = con.prepareCall("{call MODIFICAR_ALMACEN(?,?,?,?)}");
            cs.setInt("_id_almacen", almacen.getId());
            cs.setString("_nombre", almacen.getNombre());
            cs.setString("_direccion", almacen.getDireccion());
            cs.setBoolean("_activo", almacen.isActivo());
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
            cs = con.prepareCall("{call ELIMINAR_ALMACEN(?)}");
            cs.setInt("_id_almacen", id);
            resultado = cs.executeUpdate();
            
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
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
                almacen.setId(rs.getInt("id_almacen"));
                almacen.setNombre(rs.getString("nombre"));
                almacen.setDireccion(rs.getString("direccion"));
                almacenes.add(almacen);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return almacenes;
    }

    @Override
    public ArrayList<Almacen> listarPorNombre(String nombre) {
        ArrayList<Almacen> almacenes = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_ALMACENES_X_NOMBRE(?)}");
            cs.setString("_nombre",nombre);
            rs = cs.executeQuery();
            while(rs.next()){
                Almacen almacen = new Almacen();
                almacen.setId(rs.getInt("id_almacen"));
                almacen.setNombre(rs.getString("nombre"));
                almacen.setDireccion(rs.getString("direccion"));
                almacenes.add(almacen);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return almacenes;
    }
}
