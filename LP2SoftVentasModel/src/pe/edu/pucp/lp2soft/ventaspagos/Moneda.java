package pe.edu.pucp.lp2soft.ventaspagos;

import java.util.ArrayList;

public class Moneda {
    private String nombre;
    private String abreviatura;
    private ArrayList<TipoDeCambio> cambios;
    
    
    public Moneda(String nombre, String abreviatura) {
        this.nombre = nombre;
        this.abreviatura = abreviatura;
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
