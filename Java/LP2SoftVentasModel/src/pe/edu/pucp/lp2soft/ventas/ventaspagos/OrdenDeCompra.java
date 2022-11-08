package pe.edu.pucp.lp2soft.ventas.ventaspagos;
import java.util.ArrayList;
import java.util.Date;
import pe.edu.pucp.lp2soft.rrhh.model.Vendedor;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Pedido;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Reclamo;


public class OrdenDeCompra{
    private int idOrdenDeCompra;
    private double monto;
    private double saldo;
    private Moneda moneda;
    private String direccionDeEntrega;
    private FormaDeEntrega formaDeEntrega;
    private Date fechaDeCompra;
    private Date fechaDeEntrega;
    private boolean pagado;
    private TerminoDePago terminoDePago;
    private ArrayList<DocumentoDebito> documentosDebito;
    private ArrayList<DocumentoCredito> documentosCredito;
    private ArrayList<Pedido> pedidos;
    private ArrayList<Reclamo> reclamos;
    private Vendedor vendedor;
    private Boolean activo;

    public OrdenDeCompra() {
    }

    public int getIdOrdenDeCompra() {
        return idOrdenDeCompra;
    }

    public void setIdOrdenDeCompra(int idOrdenDeCompra) {
        this.idOrdenDeCompra = idOrdenDeCompra;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public double getSaldo() {
        return saldo;
    }

    public void setSaldo(double saldo) {
        this.saldo = saldo;
    }

    public Moneda getMoneda() {
        return moneda;
    }

    public void setMoneda(Moneda moneda) {
        this.moneda = moneda;
    }

    public String getDireccionDeEntrega() {
        return direccionDeEntrega;
    }

    public void setDireccionDeEntrega(String direccionDeEntrega) {
        this.direccionDeEntrega = direccionDeEntrega;
    }

    public FormaDeEntrega getFormaDeEntrega() {
        return formaDeEntrega;
    }

    public void setFormaDeEntrega(FormaDeEntrega formaDeEntrega) {
        this.formaDeEntrega = formaDeEntrega;
    }

    public Date getFechaDeCompra() {
        return fechaDeCompra;
    }

    public void setFechaDeCompra(Date fechaDeCompra) {
        this.fechaDeCompra = fechaDeCompra;
    }

    public Date getFechaDeEntrega() {
        return fechaDeEntrega;
    }

    public void setFechaDeEntrega(Date fechaDeEntrega) {
        this.fechaDeEntrega = fechaDeEntrega;
    }

    public boolean isPagado() {
        return pagado;
    }

    public void setPagado(boolean pagado) {
        this.pagado = pagado;
    }

    public TerminoDePago getTerminoDePago() {
        return terminoDePago;
    }

    public void setTerminoDePago(TerminoDePago terminoDePago) {
        this.terminoDePago = terminoDePago;
    }

    public ArrayList<DocumentoDebito> getDocumentosDebito() {
        return documentosDebito;
    }

    public void setDocumentosDebito(ArrayList<DocumentoDebito> documentosDebito) {
        this.documentosDebito = documentosDebito;
    }

    public ArrayList<DocumentoCredito> getDocumentosCredito() {
        return documentosCredito;
    }

    public void setDocumentosCredito(ArrayList<DocumentoCredito> documentosCredito) {
        this.documentosCredito = documentosCredito;
    }

    public ArrayList<Pedido> getPedidos() {
        return pedidos;
    }

    public void setPedidos(ArrayList<Pedido> pedidos) {
        this.pedidos = pedidos;
    }

    public ArrayList<Reclamo> getReclamos() {
        return reclamos;
    }

    public void setReclamos(ArrayList<Reclamo> reclamos) {
        this.reclamos = reclamos;
    }

    public Vendedor getVendedor() {
        return vendedor;
    }

    public void setVendedor(Vendedor vendedor) {
        this.vendedor = vendedor;
    }

    public Boolean getActivo() {
        return activo;
    }

    public void setActivo(Boolean activo) {
        this.activo = activo;
    }
    
    
}
