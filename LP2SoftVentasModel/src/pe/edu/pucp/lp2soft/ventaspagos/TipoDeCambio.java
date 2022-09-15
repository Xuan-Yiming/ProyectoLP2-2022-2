package pe.edu.pucp.lp2soft.ventaspagos;
import java.util.Date;

public class TipoDeCambio {
    private int id;
    private Date fecha;
    private double cambio;

    public TipoDeCambio(int id, Date fecha, double cambio) {
        this.id = id;
        this.fecha = fecha;
        this.cambio = cambio;
    }

    public TipoDeCambio() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
