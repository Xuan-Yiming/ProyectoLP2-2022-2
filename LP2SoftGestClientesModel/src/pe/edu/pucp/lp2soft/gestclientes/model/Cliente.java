
package pe.edu.pucp.lp2soft.gestclientes.model;
import java.util.ArrayList;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.OrdenDeCompra;



public abstract class Cliente implements CConsultable{
    private int idCliente;
    private String categoria;
    private ArrayList<OrdenDeCompra> ordenesCompras;
    
    public Cliente(){}
    
    public Cliente(String categoria) {
        this.categoria = categoria;
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
