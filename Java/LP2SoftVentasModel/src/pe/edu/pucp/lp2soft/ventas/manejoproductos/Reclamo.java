package pe.edu.pucp.lp2soft.ventas.manejoproductos;
import java.util.Date;
import java.util.ArrayList;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.OrdenDeCompra;

public class Reclamo {
    private int idReclamo;
    private OrdenDeCompra ordenDeCompra;
    private Date fecha;
    private boolean atendido;
    private String justificacion;
    private ArrayList<Devolucion> devoluciones;
    private Boolean activo;

    public Reclamo() {
    }

    public int getIdReclamo() {
        return idReclamo;
    }

    public void setIdReclamo(int idReclamo) {
        this.idReclamo = idReclamo;
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

    public Boolean getActivo() {
        return activo;
    }

    public void setActivo(Boolean activo) {
        this.activo = activo;
    }
    
    public OrdenDeCompra getOrdenDeCompra() {
        return ordenDeCompra;
    }
    public void setOrdenDeCompra(OrdenDeCompra ordenDeCompra) {
        this.ordenDeCompra = ordenDeCompra;
    }
}
