
package pe.edu.pucp.lp2soft.gestclientes.model;
/xdddddd
import java.util.ArrayList;
import pe.edu.pucp.lp2soft.ventaspagos.OrdenDeCompra;


public abstract class Cliente implements CConsultable{
    private static int correlativo = 1; //OBS
    private int idCliente;
    private String categoria;
    private ArrayList<OrdenDeCompra> ordenesCompras;

    public Cliente(String categoria) {
        this.idCliente = correlativo;
        this.categoria = categoria;
        correlativo++;
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
