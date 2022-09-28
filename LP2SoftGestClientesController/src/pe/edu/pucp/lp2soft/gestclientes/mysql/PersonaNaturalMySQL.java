package pe.edu.pucp.lp2soft.gestclientes.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import pe.edu.pucp.lp2soft.config.DBManager;
import pe.edu.pucp.lp2soft.gestclientes.dao.PersonaNaturalDAO;
import pe.edu.pucp.lp2soft.gestclientes.model.PersonaNatural;

public class PersonaNaturalMySQL implements PersonaNaturalDAO{
    private Connection con;
    private CallableStatement cs; 
    private ResultSet rs;
    
    @Override
    public int insertar(PersonaNatural personaNatural) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call INSERTAR_PERSONA_NATURAL(?,?,?,?,?,?,?,?,?)}");
            cs.registerOutParameter("_id_persona_natural", java.sql.Types.INTEGER);
            cs.setString("_categoria",  personaNatural.getCategoria());
            cs.setString("_numero_de_documento", personaNatural.getNumDeDocumento());
            cs.setString("_nombre", personaNatural.getNombre());
            cs.setString("_apellido", personaNatural.getApellido());
            cs.setDate("_fecha_de_nacimiento", new java.sql.Date(personaNatural.getFechaDeNacimiento().getTime()));
            cs.setString("_telefono", personaNatural.getTelefono());
            cs.setString("_direccion", personaNatural.getDireccion());
            cs.setString("_email", personaNatural.getEmail());
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public int modificar(PersonaNatural personaNatural) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call MODIFICAR_PERSONA_NATURAL(?,?,?,?,?,?,?,?,?)}");
            cs.setInt("_id_persona_natural", personaNatural.getIdCliente());
            cs.setString("_categoria", personaNatural.getCategoria());
            cs.setString("_numero_de_documento", personaNatural.getNumDeDocumento());
            cs.setString("_nombre", personaNatural.getNombre());
            cs.setString("_apellido", personaNatural.getApellido());
            cs.setDate("_fecha_de_nacimiento", new java.sql.Date(personaNatural.getFechaDeNacimiento().getTime()));
            cs.setString("_telefono", personaNatural.getTelefono());
            cs.setString("_direccion", personaNatural.getDireccion());
            cs.setString("_email", personaNatural.getEmail());
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public int eliminar(int idPersonaNatural) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call ELIMINAR_PERSONA_NATURAL(?)}");
            cs.setInt("_id_persona_natural", idPersonaNatural);
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public ArrayList<PersonaNatural> listarTodas() {
        ArrayList<PersonaNatural> personasNaturales = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("call LISTAR_PERSONAS_NATURALES()");
            rs = cs.executeQuery();
            while(rs.next()){
                PersonaNatural personaNatural = new PersonaNatural();
                personaNatural.setIdCliente(rs.getInt("id_persona_natural"));
                personaNatural.setCategoria(rs.getString("categoria"));
                personaNatural.setNumDeDocumento(rs.getString("numero_de_documento"));
                personaNatural.setNombre(rs.getString("nombre"));
                personaNatural.setApellido(rs.getString("apellido"));
                personaNatural.setFechaDeNacimiento(rs.getDate("fecha_de_nacimiento"));
                personaNatural.setTelefono(rs.getString("telefono"));
                personaNatural.setDireccion(rs.getString("direccion"));
                personaNatural.setEmail(rs.getString("email"));
                personasNaturales.add(personaNatural);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){
                System.out.println(ex.getMessage());
            }
        }
        return personasNaturales;
    }
    
}
