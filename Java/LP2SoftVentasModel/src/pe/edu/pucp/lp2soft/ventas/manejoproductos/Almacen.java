
package pe.edu.pucp.lp2soft.ventas.manejoproductos;
import java.util.ArrayList;

public class Almacen {
    private int id;
    private String  nombre;
    private String  direccion;
    private ArrayList<Producto> productos;
    private Boolean activo;

    public Boolean isActivo() {
        return activo;
    }

    public void setActivo(Boolean activo) {
        this.activo = activo;
    }

    public Almacen() {
    }
    
    public Almacen(String nombre,String direccion) {
        this.nombre=nombre;
        this.direccion=direccion;
        this.activo=true;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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