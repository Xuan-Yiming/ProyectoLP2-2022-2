
package pe.edu.pucp.lp2soft.rrhh.model;

import java.util.Date;
public class Administrador extends Usuario {
    private String area;

    public Administrador( TipoDeDocumento tipoDeDocumento, String numDeDocumento, String nombre, String apellido, Date fechaDeNacimiento, int telefono, String direccion, String email,String password, Date fechaIngreso,String area) {
        super(tipoDeDocumento, numDeDocumento, nombre, apellido, fechaDeNacimiento, telefono, direccion, email, password, fechaIngreso);
        this.area = area;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }
    
    
}
