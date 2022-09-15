package pe.edu.pucp.lp2soft.ventaspagos;
import java.util.Date;

public class TerminoDePago {
    private int id;
    private Date fechaLimite;
    private int numeroCuota;
    private double montoCuota;

    public TerminoDePago(int id, Date fechaLimite, int numeroCuota, double montoCuota) {
        this.id = id;
        this.fechaLimite = fechaLimite;
        this.numeroCuota = numeroCuota;
        this.montoCuota = montoCuota;
    }

    public TerminoDePago() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }



    public int getId() {
        return id;
    }
    
        public void setId(int id){
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
