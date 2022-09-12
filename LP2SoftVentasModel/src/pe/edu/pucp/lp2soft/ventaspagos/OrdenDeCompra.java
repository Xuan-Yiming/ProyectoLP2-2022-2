
package pe.edu.pucp.lp2soft.ventaspagos;
import java.util.ArrayList;
import java.util.Date;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Pedido;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Reclamo;


public class OrdenDeCompra{
    private static int correlativo = 1;
    private int id;
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
    
    public OrdenDeCompra(double monto,Moneda moneda,
            String direccionDeEntrega,FormaDeEntrega formaDeEntrega,Date fechaDeCompra,
            Date fechaDeEntrega,boolean cancelado){
        this.monto = monto;
        this.moneda = moneda;
        this.direccionDeEntrega = direccionDeEntrega;
        this.formaDeEntrega = formaDeEntrega;
        this.fechaDeCompra = fechaDeCompra;
        this.fechaDeEntrega = fechaDeEntrega;
        this.pagado = cancelado;
        this.id = correlativo;
        correlativo++;
    }

    public boolean isPagado() {
        return pagado;
    }

    public void setPagado(boolean pagado) {
        this.pagado = pagado;
    }

    public int getId() {
        return id;
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
