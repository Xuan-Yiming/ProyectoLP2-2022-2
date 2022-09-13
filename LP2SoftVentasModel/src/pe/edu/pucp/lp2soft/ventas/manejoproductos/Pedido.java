
package pe.edu.pucp.lp2soft.ventas.manejoproductos;

public class Pedido {

    private int cantidad;
    private Unidad unidad;
    private double descuento;
    private Producto producto;

    public Unidad getUnidad() {
        return unidad;
    }

    public void setUnidad(Unidad unidad) {
        this.unidad = unidad;
    }
    
    public Pedido(int cantidad, double descuento,Producto producto, Unidad unidad){
        this.cantidad=cantidad;
        this.descuento=descuento;
        this.producto=producto;
        this.unidad = unidad;
    }
    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }
    
    
    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getDescuento() {
        return descuento;
    }

    public void setDescuento(double descuento) {
        this.descuento = descuento;
    }
   
}
