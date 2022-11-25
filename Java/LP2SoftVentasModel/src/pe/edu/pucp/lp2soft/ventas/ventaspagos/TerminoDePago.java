package pe.edu.pucp.lp2soft.ventas.ventaspagos;
import java.util.Date;

public class TerminoDePago {
    private int idTerminoDePago;
    private Date fechaLimite;
    private int numeroCuota;
    private double montoCuota;
    private Boolean activo;    

    public TerminoDePago() {
    }

    public int getIdTerminoDePago() {
        return idTerminoDePago;
    }

    public void setIdTerminoDePago(int idTerminoDePago) {
        this.idTerminoDePago = idTerminoDePago;
    }

    public Date getFechaLimite() {
        return fechaLimite;
    }

    public void setFechaLimite(Date fechaLimite) {
        this.fechaLimite = fechaLimite;
    }

    public int getNumeroCuota() {
        return numeroCuota;
    }

    public void setNumeroCuota(int numeroCuota) {
        this.numeroCuota = numeroCuota;
    }

    public double getMontoCuota() {
        return montoCuota;
    }

    public void setMontoCuota(double montoCuota) {
        this.montoCuota = montoCuota;
    }

    public Boolean getActivo() {
        return activo;
    }

    public void setActivo(Boolean activo) {
        this.activo = activo;
    }
    
    
}
