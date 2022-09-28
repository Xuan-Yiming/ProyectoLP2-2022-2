package pe.edu.pucp.lp2soft.gestclientes.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import pe.edu.pucp.lp2soft.config.DBManager;
import pe.edu.pucp.lp2soft.gestclientes.dao.ClienteDAO;
import pe.edu.pucp.lp2soft.gestclientes.model.Cliente;

public class ClienteMySQL implements ClienteDAO{
    private Connection con;
    private CallableStatement cs; 
    private ResultSet rs;

    @Override
    public int insertar(Cliente cliente) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call INSERTAR_CLIENTE(?,?,?)}");
            cs.registerOutParameter("_id_cliente", java.sql.Types.INTEGER);
            cs.setString("_categoria", cliente.getCategoria());
            cs.setBoolean("_activo", cliente.getActivo());
            resultado = cs.executeUpdate();   
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public int modificar(Cliente cliente) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call MODIFICAR_CLIENTE(?,?,?)}");
            cs.setInt("_id_cliente", cliente.getIdCliente());
            cs.setString("_categoria", cliente.getCategoria());
            cs.setBoolean("_activo", cliente.getActivo());
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public int eliminar(int idCliente) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call ELIMINAR_CLIENTE(?)}");
            cs.setInt("_id_cliente", idCliente);
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public ArrayList<Cliente> listarTodas() {
        ArrayList<Cliente> clientes = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("call LISTAR_CLIENTES()");
            rs = cs.executeQuery();
            while(rs.next()){
                Cliente cliente = new Cliente(){};
                cliente.setIdCliente(rs.getInt("id_cliente"));
                cliente.setCategoria(rs.getString("categoria"));
                cliente.setActivo(rs.getBoolean("activo"));
                clientes.add(cliente);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){
                System.out.println(ex.getMessage());
            }
        }
        return clientes;
    }
}
