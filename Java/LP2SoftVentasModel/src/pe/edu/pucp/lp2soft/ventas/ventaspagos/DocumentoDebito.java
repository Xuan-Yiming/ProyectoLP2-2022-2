package pe.edu.pucp.lp2soft.ventas.ventaspagos;
import java.util.ArrayList;
import java.util.Date;

public class DocumentoDebito {
    private int id;
    private int idOrdenDeCompra;
    private Date fechaCreacion;
    private Date fechaVencimiento;
    private double impuesto;
    private double monto;
    private Moneda moneda;
    private double saldo;
    private boolean anulado;
    private TerminoDePago terminoDePago;
    private ArrayList<DocumentoCredito> documentosCredito;
    private Boolean activo;

    public Boolean isActivo() {
        return activo;
    }

    public void setActivo(Boolean activo) {
        this.activo = activo;
    }

    public DocumentoDebito() {
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

    public Moneda getMoneda() {
        return moneda;
    }

    public void setMoneda(Moneda moneda) {
        this.moneda = moneda;
    }

    public double getSaldo() {
        return saldo;
    }

    public void setSaldo(double saldo) {
        this.saldo = saldo;
    }

    public boolean isAnulado() {
        return anulado;
    }

    public void setAnulado(boolean anulado) {
        this.anulado = anulado;
    }

    public TerminoDePago getTerminoDePago() {
        return terminoDePago;
    }

    public void setTerminoDePago(TerminoDePago terminoDePago) {
        this.terminoDePago = terminoDePago;
    }

    public ArrayList<DocumentoCredito> getDocumentosCredito() {
        return documentosCredito;
    }

    public void setDocumentosCredito(ArrayList<DocumentoCredito> documentosCredito) {
        this.documentosCredito = documentosCredito;
    }
    
    
}
