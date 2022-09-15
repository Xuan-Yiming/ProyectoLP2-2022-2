package pe.edu.pucp.lp2soft.ventas.manejoproductos;

public class Stock {
    private int id;
    private int cantidad;
    private Producto producto;

    public Stock(int id, int cantidad) {
        this.id = id;
        this.cantidad = cantidad;
    }

    
    public Stock() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
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
