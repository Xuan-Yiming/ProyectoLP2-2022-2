package pe.edu.pucp.lp2soft.ventaspagos;
import java.util.Date;

public class DocumentoCredito {
    private static int correlativo = 1;
    private int id;
    private Date fechaCreacion;
    private double monto;
    private boolean anulado;

    public DocumentoCredito(Date fechaCreacion, double monto, boolean anulado) {
        this.fechaCreacion = fechaCreacion;
        this.monto = monto;
        this.anulado = anulado;
        this.id = correlativo;
        correlativo++;
    }

    public int getId() {
        return id;
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
