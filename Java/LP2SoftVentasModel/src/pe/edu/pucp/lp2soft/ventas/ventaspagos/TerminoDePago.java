package pe.edu.pucp.lp2soft.ventas.ventaspagos;
import java.util.Date;

public class TerminoDePago {

    private int id;
    private Date fechaLimite;
    private int numeroCuota;
    private double montoCuota;
    private Boolean activo;

    public Boolean isActivo() {
        return activo;
    }

    public void setActivo(Boolean activo) {
        this.activo = activo;
    }

    public TerminoDePago() {
    }
    
    public TerminoDePago(Date fechaLimite, int numeroCuota, double montoCuota, Boolean activo) {
        this.fechaLimite = fechaLimite;
        this.numeroCuota = numeroCuota;
        this.montoCuota = montoCuota;
        this.activo = activo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    
}
