
package pe.edu.pucp.lp2soft.gestclientes.model;
import java.util.ArrayList;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.OrdenDeCompra;



public abstract class Cliente implements CConsultable{
    private int idCliente;
    private String categoria;
    private Boolean activo;
    private ArrayList<OrdenDeCompra> ordenesCompras;

    public Boolean getActivo() {
        return activo;
    }

    public void setActivo(Boolean activo) {
        this.activo = activo;
    }
    
    public Cliente(){}
    
    public Cliente(String categoria, Boolean activo) {
        this.categoria = categoria;
        this.activo = activo;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }
    
    public int getIdCliente() {
        return idCliente;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public ArrayList<OrdenDeCompra> getOrdenesCompras() {
        return ordenesCompras;
    }

    public void setOrdenesCompras(ArrayList<OrdenDeCompra> ordenesCompras) {
        this.ordenesCompras = ordenesCompras;
    }
}
