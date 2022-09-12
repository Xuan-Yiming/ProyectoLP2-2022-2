
package pe.edu.pucp.lp2soft.ventas.manejoproductos;
import java.util.ArrayList;

public class Almacen {
    private static int correlativo=1;
    private int id;
    private String  nombre;
    private String  direccion;
    private ArrayList<Stock> productos;
    
    public Almacen(String nombre,String direccion){
        this.id=correlativo;
        this.nombre=nombre;
        this.direccion=direccion;
        correlativo++;
    }
    
    public ArrayList<Stock> getProductos() {
        return productos;
    }

    public void setProductos(ArrayList<Stock> productos) {
        this.productos = productos;
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

    //metodos
    void mostrarStock(){};
    
}
