package pe.edu.pucp.lp2soft.ventas.ventaspagos;
import java.util.ArrayList;

public class Moneda {

    private int id;
    private String nombre;
    private String abreviatura;
    private ArrayList<TipoDeCambio> cambios;
    private Boolean activo;

    public Boolean isActivo() {
        return activo;
    }

    public void setActivo(Boolean activo) {
        this.activo = activo;
    }

    public Moneda() {
    }

    public Moneda(String nombre, String abreviatura, Boolean activo) {
        this.nombre = nombre;
        this.abreviatura = abreviatura;
        this.activo = activo;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
    
    
}
