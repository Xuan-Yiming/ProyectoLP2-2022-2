package pe.edu.pucp.lp2soft.ventas.manejoproductos;

public class Stock {
    private int cantidad;
    private Producto producto;
    
    
    public Stock(int cantidad, Producto producto){
        this.cantidad=cantidad;
        this.producto=producto;
    }
    
    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }
    
    
    //metodos
    void actualizarStock(Producto producto,int cant){
    }
    void mostrarStock(Producto producto){
    }   
}
