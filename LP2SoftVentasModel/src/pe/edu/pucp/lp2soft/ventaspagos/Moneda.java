package pe.edu.pucp.lp2soft.ventaspagos;

import java.util.ArrayList;

public class Moneda {
    private int id;
    private String nombre;
    private String abreviatura;
    private ArrayList<TipoDeCambio> cambios;

    public Moneda(int id, String nombre, String abreviatura) {
        this.id = id;
        this.nombre = nombre;
        this.abreviatura = abreviatura;
    }

    public Moneda() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
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
