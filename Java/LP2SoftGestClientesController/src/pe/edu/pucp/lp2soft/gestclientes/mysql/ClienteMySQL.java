package pe.edu.pucp.lp2soft.gestclientes.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import pe.edu.pucp.lp2soft.config.DBManager;
import pe.edu.pucp.lp2soft.gestclientes.dao.ClienteDAO;
import pe.edu.pucp.lp2soft.enums.Categoria;
import pe.edu.pucp.lp2soft.gestclientes.model.Cliente;
import pe.edu.pucp.lp2soft.gestclientes.model.Empresa;
import pe.edu.pucp.lp2soft.gestclientes.model.PersonaNatural;
import pe.edu.pucp.lp2soft.enums.Sexo;
import pe.edu.pucp.lp2soft.enums.TipoDeDocumento;

public class ClienteMySQL implements ClienteDAO{
    private Connection con;
    private CallableStatement cs; 
    private ResultSet rs;

    @Override
    public int insertar(Cliente cliente) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();

            if(cliente instanceof PersonaNatural){
                cs = con.prepareCall("{call INSERTAR_PERSONA_NATURAL(?,?,?,?,?,?,?,?,?,?,?,?)}");
                cs.registerOutParameter("_id_persona_natural", java.sql.Types.INTEGER);
                cs.setString("_categoria", cliente.getCategoria().name());
                cs.setBoolean("_activo", true);
                
                cs.setString("_tipo_de_documento", ((PersonaNatural)cliente).getTipoDeDocumento().name());
                cs.setString("_numero_de_documento", ((PersonaNatural)cliente).getNumDeDocumento());
                cs.setString("_nombre", ((PersonaNatural)cliente).getNombre());
                cs.setString("_apellido", ((PersonaNatural)cliente).getApellido());
                cs.setDate("_fecha_de_nacimiento", new java.sql.Date(((PersonaNatural)cliente).getFechaDeNacimiento().getTime()));
                cs.setString("_sexo", ((PersonaNatural)cliente).getSexo().name());
                cs.setString("_telefono", ((PersonaNatural)cliente).getTelefono());
                cs.setString("_direccion", ((PersonaNatural)cliente).getDireccion());
                cs.setString("_email", ((PersonaNatural)cliente).getEmail());
                cs.executeUpdate();
                resultado = cs.getInt("_id_persona_natural");
            }
            else if(cliente instanceof Empresa){
                cs = con.prepareCall("{call INSERTAR_EMPRESA(?,?,?,?,?,?)}");
                cs.registerOutParameter("_id_empresa", java.sql.Types.INTEGER);
                cs.setString("_categoria", cliente.getCategoria().name());
                cs.setBoolean("_activo", true);

                cs.setString("_RUC", ((Empresa)cliente).getRUC());
                cs.setString("_razon_social", ((Empresa)cliente).getRazonSocial());
                cs.setString("_direccion", ((Empresa)cliente).getDireccion());
                cs.executeUpdate();
                resultado = cs.getInt("_id_empresa");
            }
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

            if(cliente instanceof PersonaNatural){
                cs = con.prepareCall("{call MODIFICAR_PERSONA_NATURAL(?,?,?,?,?,?,?,?,?,?,?,?)}");
                cs.setInt("_id_persona_natural", cliente.getIdCliente());
                cs.setString("_categoria", cliente.getCategoria().name());
                cs.setBoolean("_activo", true);
                
                cs.setString("_tipo_de_documento", ((PersonaNatural)cliente).getTipoDeDocumento().name());
                cs.setString("_numero_de_documento", ((PersonaNatural)cliente).getNumDeDocumento());
                cs.setString("_nombre", ((PersonaNatural)cliente).getNombre());
                cs.setString("_apellido", ((PersonaNatural)cliente).getApellido());
                cs.setDate("_fecha_de_nacimiento", new java.sql.Date(((PersonaNatural)cliente).getFechaDeNacimiento().getTime()));
                cs.setString("_sexo", ((PersonaNatural)cliente).getSexo().name());
                cs.setString("_telefono", ((PersonaNatural)cliente).getTelefono());
                cs.setString("_direccion", ((PersonaNatural)cliente).getDireccion());
                cs.setString("_email", ((PersonaNatural)cliente).getEmail());
                
                resultado = cs.executeUpdate();
            }
            else if(cliente instanceof Empresa){
                cs = con.prepareCall("{call MODIFICAR_EMPRESA(?,?,?,?,?,?)}");
                cs.setInt("_id_empresa", cliente.getIdCliente());
                cs.setString("_categoria", cliente.getCategoria().name());
                cs.setBoolean("_activo", true);

                cs.setString("_RUC", ((Empresa)cliente).getRUC());
                cs.setString("_razon_social", ((Empresa)cliente).getRazonSocial());
                cs.setString("_direccion", ((Empresa)cliente).getDireccion());
                
                resultado = cs.executeUpdate();
            }
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
    public ArrayList<Cliente> listarTodos(){
        ArrayList<Cliente> clientes = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("call LISTAR_CLIENTES()");
            rs = cs.executeQuery();
            while(rs.next()){
                if(rs.getString("razon_social") != null){
                    Empresa empresa = new Empresa();
                    empresa.setIdCliente(rs.getInt("id_cliente"));
                    empresa.setCategoria(Categoria.valueOf(rs.getString("categoria")));
                    empresa.setRUC(rs.getString("RUC"));
                    empresa.setRazonSocial(rs.getString("razon_social"));
                    empresa.setDireccion(rs.getString("direccionE"));
                    empresa.setActivo(true);
                    clientes.add(empresa);
                }else{
                    PersonaNatural personaNatural = new PersonaNatural();
                    personaNatural.setIdCliente(rs.getInt("id_cliente"));
                    personaNatural.setCategoria(Categoria.valueOf(rs.getString("categoria")));
                    personaNatural.setNumDeDocumento(rs.getString("numero_de_documento"));
                    personaNatural.setTipoDeDocumento(TipoDeDocumento.valueOf(rs.getString("tipo_de_documento")));
                    personaNatural.setNombre(rs.getString("nombre"));
                    personaNatural.setApellido(rs.getString("apellido"));
                    personaNatural.setFechaDeNacimiento(rs.getDate("fecha_de_nacimiento"));
                    personaNatural.setSexo(Sexo.valueOf(rs.getString("sexo")));
                    personaNatural.setSexo(Sexo.valueOf(rs.getString("sexo")));
                    personaNatural.setTelefono(rs.getString("telefono"));
                    personaNatural.setDireccion(rs.getString("direccionP"));
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
            cs.setString(1,docNombre);
            rs = cs.executeQuery();
            while(rs.next()){
                if(rs.getString("razon_social") != null){
                    Empresa empresa = new Empresa();
                    empresa.setIdCliente(rs.getInt("id_cliente"));
                    empresa.setCategoria(Categoria.valueOf(rs.getString("categoria")));
                    empresa.setRUC(rs.getString("RUC"));
                    empresa.setRazonSocial(rs.getString("razon_social"));
                    empresa.setDireccion(rs.getString("direccionE"));
                    empresa.setActivo(true);
                    clientes.add(empresa);
                }else{
                    PersonaNatural personaNatural = new PersonaNatural();
                    personaNatural.setIdCliente(rs.getInt("id_cliente"));
                    personaNatural.setCategoria(Categoria.valueOf(rs.getString("categoria")));
                    personaNatural.setNumDeDocumento(rs.getString("numero_de_documento"));
                    personaNatural.setTipoDeDocumento(TipoDeDocumento.valueOf(rs.getString("tipo_de_documento")));
                    personaNatural.setNombre(rs.getString("nombre"));
                    personaNatural.setApellido(rs.getString("apellido"));
                    personaNatural.setFechaDeNacimiento(rs.getDate("fecha_de_nacimiento"));
                    personaNatural.setSexo(Sexo.valueOf(rs.getString("sexo")));
                    personaNatural.setTelefono(rs.getString("telefono"));
                    personaNatural.setDireccion(rs.getString("direccionP"));
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
