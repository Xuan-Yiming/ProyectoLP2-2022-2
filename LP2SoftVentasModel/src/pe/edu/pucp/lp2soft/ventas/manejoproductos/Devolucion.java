package pe.edu.pucp.lp2soft.ventas.manejoproductos;
import java.util.Date;

public class Devolucion {
    private static int correlativo=1; 
    private int id;
    private int cantidad;
    private Date fecha;
    private Producto producto;
    
    public Devolucion(int cantidad,Date fecha,Producto producto){
        this.id=correlativo;
        this.cantidad=cantidad;
        this.fecha=fecha;
        this.producto=producto;
        correlativo++;
    }
    
    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

}
