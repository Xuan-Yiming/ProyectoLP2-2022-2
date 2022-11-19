package pe.edu.pucp.lp2soft.gestclientes.model;
import pe.edu.pucp.lp2soft.enums.Categoria;

public class Cliente{
    private int idCliente;
    private Categoria categoria;
    private Boolean activo;

    public Cliente(int idCliente, Categoria categoria, Boolean activo) {
        this.idCliente = idCliente;
        this.categoria = categoria;
        this.activo = activo;
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
}
