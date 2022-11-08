package pe.edu.pucp.lp2soft.ventas.ventaspagos;
import java.util.ArrayList;

public class Moneda {
    private int idMoneda;
    private String nombre;
    private String abreviatura;
    private ArrayList<TipoDeCambio> cambios;
    private Boolean activo;

    public Moneda() {
    }

    public int getIdMoneda() {
        return idMoneda;
    }

    public void setIdMoneda(int idMoneda) {
        this.idMoneda = idMoneda;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getAbreviatura() {
        return abreviatura;
    }

    public void setAbreviatura(String abreviatura) {
        this.abreviatura = abreviatura;
    }

    public ArrayList<TipoDeCambio> getCambios() {
        return cambios;
    }

    public void setCambios(ArrayList<TipoDeCambio> cambios) {
        this.cambios = cambios;
    }

    public Boolean getActivo() {
        return activo;
    }

    public void setActivo(Boolean activo) {
        this.activo = activo;
    }

    
}
