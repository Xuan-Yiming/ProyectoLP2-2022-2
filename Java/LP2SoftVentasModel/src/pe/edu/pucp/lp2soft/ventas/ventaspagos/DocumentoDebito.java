package pe.edu.pucp.lp2soft.ventas.ventaspagos;
import java.util.ArrayList;
import java.util.Date;

public class DocumentoDebito {
    private int idDocumentoDebito;
    private Date fechaCreacion;
    private double impuesto;
    private double monto;
    private boolean anulado;
    private Boolean activo;

    public DocumentoDebito() {
    }

    public int getIdDocumentoDebito() {
        return idDocumentoDebito;
    }

    public void setIdDocumentoDebito(int idDocumentoDebito) {
        this.idDocumentoDebito = idDocumentoDebito;
    }

    public Date getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public double getImpuesto() {
        return impuesto;
    }

    public void setImpuesto(double impuesto) {
        this.impuesto = impuesto;
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
