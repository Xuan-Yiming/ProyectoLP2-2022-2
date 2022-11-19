package pe.edu.pucp.lp2soft.ventas.manejoproductos.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import pe.edu.pucp.lp2soft.config.DBManager;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Reclamo;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.dao.ReclamoDAO;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.OrdenDeCompra;

public class ReclamoMySQL implements ReclamoDAO {
    private Connection con;
    private CallableStatement cs;
    private ResultSet rs;

    @Override
    public int insertarReclamo(Reclamo reclamo) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call INSERTAR_RECLAMO(?,?,?,?,,?,?)}");
            cs.registerOutParameter("_id_reclamo", java.sql.Types.INTEGER);
            cs.setInt("_fid_orden_de_compra", reclamo.getOrdenDeCompra().getIdOrdenDeCompra());
            cs.setDate("_fecha", new java.sql.Date(reclamo.getFecha().getTime()));
            cs.setBoolean("_atendido", reclamo.isAtendido());
            cs.setString("_justificacion", reclamo.getJustificacion());
            cs.setString("_activo", reclamo.getJustificacion());
            cs.executeUpdate();
            reclamo.setIdReclamo(cs.getInt("_id_reclamo"));
            resultado = reclamo.getIdReclamo();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public int modificarReclamo(Reclamo reclamo) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call MODIFICAR_RECLAMO(?,?,?,?,?,?)}");
            cs.setInt("_id_reclamo", reclamo.getIdReclamo());
            cs.setInt("_fid_orden_de_compra", reclamo.getOrdenDeCompra().getIdOrdenDeCompra());
            cs.setDate("_fecha", new java.sql.Date(reclamo.getFecha().getTime()));
            cs.setBoolean("_atendido", reclamo.isAtendido());
            cs.setString("_justificacion", reclamo.getJustificacion());
            cs.setBoolean("_activo", reclamo.getActivo());
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public int eliminarReclamo(int id) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call ELIMINAR_RECLAMO(?)}");
            cs.setInt("_id_reclamo", id);
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public ArrayList<Reclamo> listarReclamoxOrden(int idOrden) {
        ArrayList<Reclamo> reclamos = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_RECLAMO_X_ORDEN(?)}");
            cs.setInt("_id_orden",idOrden);
            rs = cs.executeQuery();
            while(rs.next()){
                Reclamo reclamo = new Reclamo();
                reclamo.setIdReclamo(rs.getInt("id_reclamo"));
                reclamo.setOrdenDeCompra(new OrdenDeCompra());
                reclamo.getOrdenDeCompra().setIdOrdenDeCompra(rs.getInt("id_orden_de_compra"));
                reclamo.getOrdenDeCompra().setFechaDeCompra(rs.getDate("fecha_de_compra"));
                reclamo.setFecha(rs.getDate("fechaReclamo"));
                reclamo.setAtendido(rs.getBoolean("atendido"));
                reclamo.setJustificacion(rs.getString("justificacion"));
                reclamos.add(reclamo);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        System.out.println(reclamos);
        return reclamos;
    }
    @Override
    public ArrayList<Reclamo> listarReclamoTodos() {
        ArrayList<Reclamo> reclamos = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_RECLAMOS_TODO()}");
            rs = cs.executeQuery();
            while(rs.next()){
                Reclamo reclamo = new Reclamo();
                reclamo.setIdReclamo(rs.getInt("id_reclamo"));
                reclamo.setOrdenDeCompra(new OrdenDeCompra());
                reclamo.getOrdenDeCompra().setIdOrdenDeCompra(rs.getInt("fid_orden_de_compra"));
                reclamo.setFecha(rs.getDate("fecha"));
                reclamo.setAtendido(rs.getBoolean("atendido"));
                reclamo.setJustificacion(rs.getString("justificacion"));
                reclamos.add(reclamo);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return reclamos;
    }
}
