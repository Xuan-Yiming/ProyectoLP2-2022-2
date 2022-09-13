
package pe.edu.pucp.lp2soft.rrhh.model;

import java.util.Date;

public abstract class Usuario extends Persona implements UConsultable {
    private static int correlativo = 1;
    private int idUsuario;
    private String password;
    private Date fechaIngreso;

    public Usuario( TipoDeDocumento tipoDeDocumento, String numDeDocumento, String nombre, String apellido, Date fechaDeNacimiento, String telefono, String direccion, String email,String password, Date fechaIngreso) {
        super(tipoDeDocumento, numDeDocumento, nombre, apellido, fechaDeNacimiento, telefono, direccion, email);
        idUsuario = correlativo;
        this.password = password;
        this.fechaIngreso = fechaIngreso;
        correlativo++;
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
