package pe.edu.pucp.lp2soft.ventaspagos;
import java.util.Date;

public class TipoDeCambio {
    private Date fecha;
    private double cambio;

    public TipoDeCambio(Date fecha, double cambio) {
        this.fecha = fecha;
        this.cambio = cambio;
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
