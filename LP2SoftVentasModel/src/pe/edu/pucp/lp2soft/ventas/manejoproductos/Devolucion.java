package pe.edu.pucp.lp2soft.ventas.manejoproductos;
import java.util.Date;

public class Devolucion {
    private int id;
    private int idProducto;
    private int idReclamo;

    public Devolucion() {
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


