
package pe.edu.pucp.lp2soft.rrhh.model;

import java.util.Date;

public abstract class Usuario extends Persona implements UConsultable {
    private static int correlativo = 1;
    private int idUsuario;
    private String username;
    private String password;
    private Date fechaIngreso;

    public static int getCorrelativo() {
        return correlativo;
    }

    public static void setCorrelativo(int correlativo) {
        Usuario.correlativo = correlativo;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
    //Constructor vacio
    public Usuario(){}
    
    public Usuario( TipoDeDocumento tipoDeDocumento, String numDeDocumento, String nombre, String apellido, Date fechaDeNacimiento, String telefono, String direccion, String email,Boolean activo,String username,String password, Date fechaIngreso) {
        super(tipoDeDocumento, numDeDocumento, nombre, apellido, fechaDeNacimiento, telefono, direccion, email,activo);
        idUsuario = correlativo;
        this.username = username;
        this.password = password;
        this.fechaIngreso = fechaIngreso;
        correlativo++;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }
    
    public int getIdUsuario() {
        return idUsuario;
    }
       

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getFechaIngreso() {
        return fechaIngreso;
    }

    public void setFechaIngreso(Date fechaIngreso) {
        this.fechaIngreso = fechaIngreso;
    }
    
    
    
}
