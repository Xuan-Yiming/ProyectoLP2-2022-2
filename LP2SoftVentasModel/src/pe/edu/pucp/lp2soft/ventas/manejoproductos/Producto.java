package pe.edu.pucp.lp2soft.ventas.manejoproductos;

public class Producto {
    private int id;
    private String nombre;
    private double precio;
    private String unidad;
    private int stockMinimo;
    private boolean devuelto;
    


    public Producto() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public Producto(int id, String nombre, double precio, String unidad, int stockMinimo, boolean devuelto) {
        this.id = id;
        this.nombre = nombre;
        this.precio = precio;
        this.unidad = unidad;
        this.stockMinimo = stockMinimo;
        this.devuelto = devuelto;
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

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getUnidad() {
        return unidad;
    }

    public void setUnidad(String unidad) {
        this.unidad = unidad;
    }

    public int getStockMinimo() {
        return stockMinimo;
    }

    public void setStockMinimo(int stockMinimo) {
        this.stockMinimo = stockMinimo;
    }

    public boolean isDevuelto() {
        return devuelto;
    }

    public void setDevuelto(boolean devuelto) {
        this.devuelto = devuelto;
    }
    
    //metodos
    public void eliminarProducto(){
    }
    public void actualizarPrecio(double precio){
    }
    public void actualizarStockMinimo(int stockMinimo){
    }
    public void actualizarDevuelto(int devuelto){
    }
    public void mostrarProducto(){
    }
}
