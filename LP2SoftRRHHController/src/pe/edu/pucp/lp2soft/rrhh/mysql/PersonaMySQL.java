
package pe.edu.pucp.lp2soft.rrhh.mysql;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import pe.edu.pucp.lp2soft.config.DBManager;
import pe.edu.pucp.lp2soft.rrhh.dao.PersonaDAO;
import pe.edu.pucp.lp2soft.rrhh.model.Persona;
import pe.edu.pucp.lp2soft.rrhh.model.TipoDeDocumento;


public class PersonaMySQL implements PersonaDAO{
    private Connection con;
    private CallableStatement cs;
    private ResultSet rs;
    
    @Override
    public int insertar(Persona persona) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call INSERTAR_PERSONA(?,?,?,?,?,?,?,?)}");
            cs.setString("_tipo_de_documento", persona.getTipoDeDocumento().name());
            cs.setString("_numero_de_documento", persona.getNumDeDocumento());
            cs.setString("_nombre", persona.getNombre());
            cs.setString("_apellido", persona.getApellido());
            cs.setDate("_fecha_de_nacimiento", new java.sql.Date(persona.getFechaDeNacimiento().getTime()));
            cs.setString("_telefono", persona.getTelefono());
            cs.setString("_direccion", persona.getDireccion());
            cs.setString("_email", persona.getEmail());
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public int modificar(Persona persona) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call MODIFICAR_PERSONA(?,?,?"
                    + ",?,?,?,?,?)}");
            cs.setString("_tipo_de_documento", persona.getTipoDeDocumento().name());
            cs.setString("_numero_de_documento", persona.getNumDeDocumento());
            cs.setString("_nombre", persona.getNombre());
            cs.setString("_apellido", persona.getApellido());
            cs.setDate("_fecha_de_nacimiento", new java.sql.Date(persona.getFechaDeNacimiento().getTime()));
            cs.setString("_telefono", persona.getTelefono());
            cs.setString("_direccion", persona.getDireccion());
            cs.setString("_email", persona.getEmail());
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public int eliminar(String numDeDocumento) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call ELIMINAR_PERSONA(?)}");
            cs.setString("_numero_de_documento", numDeDocumento);
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public ArrayList<Persona> listarTodos() {
        ArrayList<Persona> personas = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("call LISTAR_PERSONAS()");
            rs = cs.executeQuery();
            while(rs.next()){
                Persona persona = new Persona();
                persona.setTipoDeDocumento(TipoDeDocumento.valueOf((rs.getString("tipo_documento"))));
                persona.setNumDeDocumento(rs.getString("numero_de_documento"));
                persona.setNombre(rs.getString("nombre"));
                persona.setApellido(rs.getString("apellido"));
                persona.setFechaDeNacimiento(rs.getDate("fecha_de_nacimiento"));
                persona.setTelefono(rs.getString("telefono"));
                persona.setDireccion(rs.getString("direccion"));
                persona.setEmail(rs.getString("email"));
                personas.add(persona);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){
                System.out.println(ex.getMessage());
            }
        }
        return personas;
    }
}
