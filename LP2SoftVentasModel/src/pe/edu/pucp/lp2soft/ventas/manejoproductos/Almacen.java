
package pe.edu.pucp.lp2soft.ventas.manejoproductos;
import java.util.ArrayList;

public class Almacen {
    private int id;
    private int idSupervisorDeAlmacen;
    private String  nombre;
    private String  direccion;
    private ArrayList<Producto> productos;

    public Almacen() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdSupervisorDeAlmacen() {
        return idSupervisorDeAlmacen;
    }

    public void setIdSupervisorDeAlmacen(int idSupervisorDeAlmacen) {
        this.idSupervisorDeAlmacen = idSupervisorDeAlmacen;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public ArrayList<Producto> getProductos() {
        return productos;
    }

    public void setProductos(ArrayList<Producto> productos) {
        this.productos = productos;
    }

    
}
