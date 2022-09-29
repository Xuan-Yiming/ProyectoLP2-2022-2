package pe.edu.pucp.lp2soft.ventas.ventaspagos;
import java.util.ArrayList;
import java.util.Date;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Pedido;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Reclamo;


public class OrdenDeCompra{
    private int id;

    private int idCliente;
    private int idVendedor;
    private double monto;
    private Moneda moneda;
    private String direccionDeEntrega;
    private FormaDeEntrega formaDeEntrega;
    private Date fechaDeCompra;
    private Date fechaDeEntrega;
    private boolean pagado;
    private ArrayList<DocumentoDebito> documentosDebito;
    private ArrayList<DocumentoCredito> documentosCredito;
    private ArrayList<Pedido> pedidos;
    private ArrayList<Reclamo> reclamos;
    private Boolean activo;

    public Boolean isActivo() {
        return activo;
    }

    public void setActivo(Boolean activo) {
        this.activo = activo;
    }

    public OrdenDeCompra() {
    }
    
    public OrdenDeCompra(int idCliente, int idVendedor, double monto, Moneda moneda,
            String direccionDeEntrega, FormaDeEntrega formaDeEntrega, Date fechaDeCompra, Date fechaDeEntrega,
            boolean pagado, Boolean activo) {
        this.idCliente = idCliente;
        this.idVendedor = idVendedor;
        this.monto = monto;
        this.moneda = moneda;
        this.direccionDeEntrega = direccionDeEntrega;
        this.formaDeEntrega = formaDeEntrega;
        this.fechaDeCompra = fechaDeCompra;
        this.fechaDeEntrega = fechaDeEntrega;
        this.pagado = pagado;
        this.activo = activo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public int getIdVendedor() {
        return idVendedor;
    }

    public void setIdVendedor(int idVendedor) {
        this.idVendedor = idVendedor;
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
    
    
}
