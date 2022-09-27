package pe.edu.pucp.lp2soft.ventas.manejoproductos;
import java.util.Date;
import java.util.ArrayList;

public class Reclamo {
    private int id;//numero de reclamo
    private int idOrdenDeCompra;
    private Date fecha;
    private boolean atendido;
    private String justificacion;
    ArrayList<Devolucion> devoluciones;

    public Reclamo() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdOrdenDeCompra() {
        return idOrdenDeCompra;
    }

    public void setIdOrdenDeCompra(int idOrdenDeCompra) {
        this.idOrdenDeCompra = idOrdenDeCompra;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public boolean isAtendido() {
        return atendido;
    }

    public void setAtendido(boolean atendido) {
        this.atendido = atendido;
    }

    public String getJustificacion() {
        return justificacion;
    }

    public void setJustificacion(String justificacion) {
        this.justificacion = justificacion;
    }

    public ArrayList<Devolucion> getDevoluciones() {
        return devoluciones;
    }

    public void setDevoluciones(ArrayList<Devolucion> devoluciones) {
        this.devoluciones = devoluciones;
    }
    
    
}
