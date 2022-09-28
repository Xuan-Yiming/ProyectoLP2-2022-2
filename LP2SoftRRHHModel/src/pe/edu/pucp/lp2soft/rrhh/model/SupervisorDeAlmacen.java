
package pe.edu.pucp.lp2soft.rrhh.model;

import java.util.Date;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Almacen;

public class SupervisorDeAlmacen extends Usuario {
    private Almacen almacen;
	
	//Constructor vacio
    public SupervisorDeAlmacen(){}
	
    public SupervisorDeAlmacen(TipoDeDocumento tipoDeDocumento, String numDeDocumento, String nombre, String apellido, Date fechaDeNacimiento, String telefono, String direccion, String email,Boolean activo,String username,String password, Date fechaIngreso, Almacen almacen) {
        super(tipoDeDocumento, numDeDocumento, nombre, apellido, fechaDeNacimiento, telefono, direccion, email,activo,username, password, fechaIngreso);
        this.almacen = almacen;
    }

    
    
    public Almacen getAlmacen() {
        return almacen;
    }

    public void setAlmacen(Almacen almacen) {
        this.almacen = almacen;
    }
    
    
}
