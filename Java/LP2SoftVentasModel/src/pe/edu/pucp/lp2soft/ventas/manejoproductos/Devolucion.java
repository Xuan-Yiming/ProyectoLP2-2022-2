package pe.edu.pucp.lp2soft.ventas.manejoproductos;

import java.util.Date;

public class Devolucion {
    private int idDevolucion;
    private Producto producto;
    private int fid_reclamo;
    private int cantidad;
    private Boolean activo;

    public Devolucion() {
    }

    public int getIdDevolucion() {
        return idDevolucion;
    }

    public void setIdDevolucion(int idDevolucion) {
        this.idDevolucion = idDevolucion;
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

    public Boolean getActivo() {
        return activo;
    }

    public void setActivo(Boolean activo) {
        this.activo = activo;
    }
    
    public int getFid_reclamo() {
        return fid_reclamo;
    }

    public void setFid_reclamo(int fid_reclamo) {
        this.fid_reclamo = fid_reclamo;
    }
    
}


