package pe.edu.pucp.lp2soft.ventas.ventaspagos;
import java.util.Date;

public class DocumentoCredito {

    private int id;
    private int idOrdenDeCompra;
    private int idDocumentoDebito;
    private Date fechaCreacion;
    private Date fechaVencimiento;
    private double monto;
    private Moneda moneda;
    private boolean anulado;
    private Boolean activo;

    public Boolean isActivo() {
        return activo;
    }

    public void setActivo(Boolean activo) {
        this.activo = activo;
    }

    public DocumentoCredito() {
    }

    public DocumentoCredito(int idOrdenDeCompra, int idDocumentoDebito, Date fechaCreacion, Date fechaVencimiento, double monto, Moneda moneda, boolean anulado, Boolean activo) {
        this.idOrdenDeCompra = idOrdenDeCompra;
        this.idDocumentoDebito = idDocumentoDebito;
        this.fechaCreacion = fechaCreacion;
        this.fechaVencimiento = fechaVencimiento;
        this.monto = monto;
        this.moneda = moneda;
        this.anulado = anulado;
        this.activo = activo;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdOrdenDeCompra() {
        return idOrdenDeCompra;
    }

    public void setIdOrdenDeCompra(int idOrdenDeCompra) {
        this.idOrdenDeCompra = idOrdenDeCompra;
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

    public Moneda getMoneda() {
        return moneda;
    }

    public void setMoneda(Moneda moneda) {
        this.moneda = moneda;
    }

    public boolean isAnulado() {
        return anulado;
    }

    public void setAnulado(boolean anulado) {
        this.anulado = anulado;
    }
    
    
}
