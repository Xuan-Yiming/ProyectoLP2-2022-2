package pe.edu.pucp.lp2soft.ventas.manejoproductos;
import java.util.Date;

public class Devolucion {


    private int id;
    private int idProducto;
    private int idReclamo;
    private Boolean activo;

    public Boolean isActivo() {
        return activo;
    }

    public void setActivo(Boolean activo) {
        this.activo = activo;
    }

    public Devolucion() {
    }

    public Devolucion(int idProducto, int idReclamo, Boolean activo){
        this.idProducto = idProducto;
        this.idReclamo = idReclamo;
        this.activo = activo;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public int getIdReclamo() {
        return idReclamo;
    }

    public void setIdReclamo(int idReclamo) {
        this.idReclamo = idReclamo;
    }
    
    
}


