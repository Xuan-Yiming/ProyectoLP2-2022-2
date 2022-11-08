package pe.edu.pucp.lp2soft.ventas.ventaspagos;
import java.util.Date;

public class DocumentoCredito {
    private int idDocumentoCredito;
    private Date fechaCreacion;
    private Date fechaVencimiento;
    private double monto;
    private boolean anulado;
    private Boolean activo;

    public DocumentoCredito() {
    }

    public int getIdDocumentoCredito() {
        return idDocumentoCredito;
    }

    public void setIdDocumentoCredito(int idDocumentoCredito) {
        this.idDocumentoCredito = idDocumentoCredito;
    }

    public Date getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public Date getFechaVencimiento() {
        return fechaVencimiento;
    }

    public void setFechaVencimiento(Date fechaVencimiento) {
        this.fechaVencimiento = fechaVencimiento;
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

    public Boolean getActivo() {
        return activo;
    }

    public void setActivo(Boolean activo) {
        this.activo = activo;
    }

    
}
