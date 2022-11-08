package pe.edu.pucp.lp2soft.ventas.ventaspagos;
import java.util.Date;

public class TipoDeCambio {
    private int idTipoDeCambio;
    private Date fecha;
    private double cambio;
    private Boolean activo;

    public TipoDeCambio() {
    }

    public int getIdTipoDeCambio() {
        return idTipoDeCambio;
    }

    public void setIdTipoDeCambio(int idTipoDeCambio) {
        this.idTipoDeCambio = idTipoDeCambio;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public double getCambio() {
        return cambio;
    }

    public void setCambio(double cambio) {
        this.cambio = cambio;
    }

    public Boolean getActivo() {
        return activo;
    }

    public void setActivo(Boolean activo) {
        this.activo = activo;
    }
    
    
}
