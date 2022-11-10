package pe.edu.pucp.lp2soft.ventas.manejoproductos;
import java.util.Date;
import java.util.ArrayList;

public class Reclamo {
    private int idReclamo;
    private int fid_orden_de_compra;
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
    
    public int getFid_orden_de_compra() {
        return fid_orden_de_compra;
    }

    public void setFid_orden_de_compra(int fid_orden_de_compra) {
        this.fid_orden_de_compra = fid_orden_de_compra;
    }
}
