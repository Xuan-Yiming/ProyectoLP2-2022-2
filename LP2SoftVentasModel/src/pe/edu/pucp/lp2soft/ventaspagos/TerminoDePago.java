package pe.edu.pucp.lp2soft.ventaspagos;
import java.util.Date;

public class TerminoDePago {
    private static int correlativo = 1;
    private int id;
    private Date fechaLimite;
    private int numeroCuota;
    private double montoCuota;

    public TerminoDePago(Date fechaLimite, int numeroCuota, double montoCuota) {
        this.fechaLimite = fechaLimite;
        this.numeroCuota = numeroCuota;
        this.montoCuota = montoCuota;
        this.id = correlativo;
        correlativo++;
    }

    public int getId() {
        return id;
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
