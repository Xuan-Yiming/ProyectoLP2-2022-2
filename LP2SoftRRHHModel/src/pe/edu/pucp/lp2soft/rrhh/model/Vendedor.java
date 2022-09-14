
package pe.edu.pucp.lp2soft.rrhh.model;
import java.util.ArrayList;
import java.util.Date;
import pe.edu.pucp.lp2soft.ventaspagos.OrdenDeCompra;

public class Vendedor extends Usuario {
    private int cantidadVentas;
    private ArrayList<OrdenDeCompra> ordenesDeCompra;
    
	//Constructor vacio
    public Vendedor(){}
	
    public Vendedor( TipoDeDocumento tipoDeDocumento, String numDeDocumento, String nombre, String apellido, Date fechaDeNacimiento, String telefono, String direccion, String email,String password, Date fechaIngreso, int cantidadVentas) {
        super( tipoDeDocumento, numDeDocumento, nombre, apellido, fechaDeNacimiento, telefono, direccion, email, password, fechaIngreso);
        this.cantidadVentas = cantidadVentas;
    }

    public int getCantidadVentas() {
        return cantidadVentas;
    }

    public void setCantidadVentas(int cantidadVentas) {
        this.cantidadVentas = cantidadVentas;
    }

    public ArrayList<OrdenDeCompra> getOrdenesDeCompra() {
        return ordenesDeCompra;
    }

    public void setOrdenesDeCompra(ArrayList<OrdenDeCompra> ordenesDeCompra) {
        this.ordenesDeCompra = ordenesDeCompra;
    }
    
    
    
    

    
    
}
