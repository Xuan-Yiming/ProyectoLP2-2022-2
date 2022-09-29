package pe.edu.pucp.lp2soft.gestclientes.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import pe.edu.pucp.lp2soft.config.DBManager;
import pe.edu.pucp.lp2soft.gestclientes.dao.EmpresaDAO;
import pe.edu.pucp.lp2soft.gestclientes.model.Empresa;

public class EmpresaMySQL implements EmpresaDAO{
    private Connection con;
    private CallableStatement cs; 
    private ResultSet rs;
    
    @Override
    public int insertar(Empresa empresa) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call INSERTAR_EMPRESA(?,?,?,?,?)}");
            cs.registerOutParameter("_id_empresa", java.sql.Types.INTEGER);
            cs.setString("_categoria", empresa.getCategoria());
            cs.setString("_RUC", empresa.getRUC());
            cs.setString("_razon_social", empresa.getRazonSocial());
            cs.setString("_direccion", empresa.getDireccion());
            resultado = cs.executeUpdate();
            empresa.setIdCliente(cs.getInt("_id_empresa"));
            
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public int modificar(Empresa empresa) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call MODIFICAR_EMPRESA(?,?,?,?,?,?)}");
            cs.setInt("_id_empresa", empresa.getIdCliente());
            cs.setString("_categoria", empresa.getCategoria());
            cs.setString("_RUC", empresa.getRUC());
            cs.setString("_razon_social", empresa.getRazonSocial());
            cs.setString("_direccion", empresa.getDireccion());
            cs.setBoolean("_activo", empresa.getActivo());
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public int eliminar(int idEmpresa) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call ELIMINAR_EMPRESA(?)}");
            cs.setInt("_id_empresa", idEmpresa);
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public ArrayList<Empresa> listarTodas() {
        ArrayList<Empresa> empresas = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("call LISTAR_EMPRESAS()");
            rs = cs.executeQuery();
            while(rs.next()){
                Empresa empresa = new Empresa();
                empresa.setIdCliente(rs.getInt("id_empresa"));
                empresa.setCategoria(rs.getString("categoria"));
                empresa.setRUC(rs.getString("RUC"));
                empresa.setRazonSocial(rs.getString("razon_social"));
                empresa.setDireccion(rs.getString("direccion"));
                empresas.add(empresa);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){
                System.out.println(ex.getMessage());
            }
        }
        return empresas;
    }
    
}
