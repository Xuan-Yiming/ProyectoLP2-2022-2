package pe.edu.pucp.lp2soft.ventas.ventaspagos;
import java.util.Date;

public class TipoDeCambio {

    private int id;
    private int idMoneda;
    private Date fecha;
    private double cambio;
    private Boolean activo;

    public Boolean isActivo() {
        return activo;
    }

    public void setActivo(Boolean activo) {
        this.activo = activo;
    }

    public TipoDeCambio() {
    }
    
    public TipoDeCambio(int idMoneda, Date fecha, double cambio, Boolean activo) {
        this.idMoneda = idMoneda;
        this.fecha = fecha;
        this.cambio = cambio;
        this.activo = activo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdMoneda() {
        return idMoneda;
    }

    public void setIdMoneda(int idMoneda) {
        this.idMoneda = idMoneda;
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
    
        
}
