package pe.edu.pucp.lp2soft.ventaspagos;
import java.util.Date;

public class DocumentoCredito {
    private int id;
    private Date fechaCreacion;
    private double monto;
    private boolean anulado;

    public DocumentoCredito(int id, Date fechaCreacion, double monto, boolean anulado) {
        this.id = id;
        this.fechaCreacion = fechaCreacion;
        this.monto = monto;
        this.anulado = anulado;
    }

    public DocumentoCredito() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }



    public int getId() {
        return id;
    }
    
    public void setId(int id){
        this.id = id;
    }

    public Date getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public boolean isAnulado() {
        return anulado;
    }

    public void setAnulado(boolean anulado) {
        this.anulado = anulado;
    }
     
}
