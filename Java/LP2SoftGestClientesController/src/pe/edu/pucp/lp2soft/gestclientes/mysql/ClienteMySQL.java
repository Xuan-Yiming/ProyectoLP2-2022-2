package pe.edu.pucp.lp2soft.gestclientes.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import pe.edu.pucp.lp2soft.config.DBManager;
import pe.edu.pucp.lp2soft.gestclientes.dao.ClienteDAO;
import pe.edu.pucp.lp2soft.gestclientes.model.Cliente;
import pe.edu.pucp.lp2soft.gestclientes.model.Empresa;
import pe.edu.pucp.lp2soft.gestclientes.model.PersonaNatural;
import pe.edu.pucp.lp2soft.rrhh.model.TipoDeDocumento;

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

    @Override
    public ArrayList<Cliente> listarClientes(){
        ArrayList<Cliente> clientes = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("call LISTAR_TODOS_CLIENTES()");
            rs = cs.executeQuery();
            while(rs.next()){
                Cliente _cliente = new Cliente(){};
                _cliente.setIdCliente(rs.getInt("id_cliente"));
                _cliente.setCategoria(rs.getString("categoria"));

                if(rs.getString("razon_social") != null){
                    Empresa empresa = new Empresa();
                    empresa.setIdCliente(rs.getInt("id_cliente"));
                    empresa.setCategoria(rs.getString("categoria"));
                    empresa.setRUC(rs.getString("RUC"));
                    empresa.setRazonSocial(rs.getString("razon_social"));
                    empresa.setDireccion(rs.getString("direccion"));
                    empresa.setActivo(true);
                    clientes.add(empresa);
                }else{
                    PersonaNatural personaNatural = new PersonaNatural();
                    personaNatural.setIdCliente(rs.getInt("id_cliente"));
                    personaNatural.setCategoria(rs.getString("categoria"));
                    personaNatural.setNumDeDocumento(rs.getString("numero_de_documento"));
                    personaNatural.setTipoDeDocumento(TipoDeDocumento.valueOf(rs.getString("tipo_de_documento")));
                    personaNatural.setNombre(rs.getString("nombre"));
                    personaNatural.setApellido(rs.getString("apellido"));
                    personaNatural.setFechaDeNacimiento(rs.getDate("fecha_de_nacimiento"));
                    personaNatural.setTelefono(rs.getString("telefono"));
                    personaNatural.setDireccion(rs.getString("direccion"));
                    personaNatural.setEmail(rs.getString("email"));
                    personaNatural.setActivo(true);
                    clientes.add(personaNatural);
                }
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

    @Override
    public ArrayList<Cliente> listarPorDocumentoNombre(String docNombre) {
        ArrayList<Cliente> clientes = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("call LISTAR_CLIENTE_X_NOMBRE_DNI_RAZON_RUC(?)");
            cs.setString("_doc_nombre",docNombre);
            rs = cs.executeQuery();
            while(rs.next()){
                if(rs.getString("razon_social") != null){
                    Empresa empresa = new Empresa();
                    empresa.setIdCliente(rs.getInt("id_cliente"));
                    empresa.setCategoria(rs.getString("categoria"));
                    empresa.setRUC(rs.getString("RUC"));
                    empresa.setRazonSocial(rs.getString("razon_social"));
                    empresa.setDireccion(rs.getString("direccion"));
                    empresa.setActivo(true);
                    clientes.add(empresa);
                }else{
                    PersonaNatural personaNatural = new PersonaNatural();
                    personaNatural.setIdCliente(rs.getInt("id_cliente"));
                    personaNatural.setCategoria(rs.getString("categoria"));
                    personaNatural.setNumDeDocumento(rs.getString("numero_de_documento"));
                    personaNatural.setTipoDeDocumento(TipoDeDocumento.valueOf(rs.getString("tipo_de_documento")));
                    personaNatural.setNombre(rs.getString("nombre"));
                    personaNatural.setApellido(rs.getString("apellido"));
                    personaNatural.setFechaDeNacimiento(rs.getDate("fecha_de_nacimiento"));
                    personaNatural.setTelefono(rs.getString("telefono"));
                    personaNatural.setDireccion(rs.getString("direccion"));
                    personaNatural.setEmail(rs.getString("email"));
                    personaNatural.setActivo(true);
                    clientes.add(personaNatural);
                }       
                
                
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{rs.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return clientes;
    }
}
