package pe.edu.pucp.lp2soft.gestclientes.model;

import java.util.ArrayList;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.OrdenDeCompra;

public abstract class Cliente{
    private int idCliente;
    private Categoria categoria;
    private Boolean activo;
    private ArrayList<OrdenDeCompra> ordenesCompras;

    public Cliente(int idCliente, Categoria categoria, Boolean activo, ArrayList<OrdenDeCompra> ordenesCompras) {
        this.idCliente = idCliente;
        this.categoria = categoria;
        this.activo = activo;
        this.ordenesCompras = ordenesCompras;
    }

    public Cliente() {
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    public Boolean getActivo() {
        return activo;
    }

    public void setActivo(Boolean activo) {
        this.activo = activo;
    }

    public ArrayList<OrdenDeCompra> getOrdenesCompras() {
        return ordenesCompras;
    }

    public void setOrdenesCompras(ArrayList<OrdenDeCompra> ordenesCompras) {
        this.ordenesCompras = ordenesCompras;
    }
    
    
}
