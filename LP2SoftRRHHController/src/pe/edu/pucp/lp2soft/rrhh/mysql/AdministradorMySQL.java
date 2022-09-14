
package pe.edu.pucp.lp2soft.rrhh.mysql;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import pe.edu.pucp.lp2soft.config.DBManager;
import pe.edu.pucp.lp2soft.rrhh.dao.AdministradorDAO;
import pe.edu.pucp.lp2soft.rrhh.model.Administrador;

public class AdministradorMySQL implements AdministradorDAO {

    private Connection con;
    private CallableStatement cs;
    private ResultSet rs;
    
    
    @Override
    public int insertar(Administrador administrador) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call INSERTAR_USUARIO(?,?,?,?,?,?,?,?,?,?,?)}");
            cs.registerOutParameter("_id_usuario", java.sql.Types.INTEGER);
            cs.setString("_password", usuario.getPassword());
            cs.setDate("_fecha_de_ingreso", new java.sql.Date(usuario.getFechaIngreso().getTime()));
            cs.setString("_tipo_de_documento", usuario.getTipoDeDocumento().name());
            cs.setString("_numero_de_documento", usuario.getNumDeDocumento());
            cs.setString("_nombre", usuario.getNombre());
            cs.setString("_apellido", usuario.getApellido());
            cs.setDate("_fecha_de_nacimiento", new java.sql.Date(usuario.getFechaDeNacimiento().getTime()));
            cs.setString("_telefono", usuario.getTelefono());
            cs.setString("_direccion", usuario.getDireccion());
            cs.setString("_email", usuario.getEmail());
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public int modificar(Administrador administrador) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int eliminar(int id_usuario, String area) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Administrador> listarTodos() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
