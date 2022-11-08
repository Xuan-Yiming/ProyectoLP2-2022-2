package pe.edu.pucp.lp2soft.ventas.manejoproductos;

import java.util.ArrayList;
import pe.edu.pucp.lp2soft.rrhh.model.SupervisorDeAlmacen;

public class Almacen {
    private int idAlmacen;
    private String  nombre;
    private String  direccion;
    private ArrayList<Stock> productos;
    private SupervisorDeAlmacen supervisor;
    private Boolean activo;

    public Almacen() {
    }

    public int getIdAlmacen() {
        return idAlmacen;
    }

    public void setIdAlmacen(int idAlmacen) {
        this.idAlmacen = idAlmacen;
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

    public ArrayList<Stock> getProductos() {
        return productos;
    }

    public void setProductos(ArrayList<Stock> productos) {
        this.productos = productos;
    }

    public SupervisorDeAlmacen getSupervisor() {
        return supervisor;
    }

    public void setSupervisor(SupervisorDeAlmacen supervisor) {
        this.supervisor = supervisor;
    }

    public Boolean getActivo() {
        return activo;
    }

    public void setActivo(Boolean activo) {
        this.activo = activo;
    }

    
}
