package pe.edu.pucp.lp2soft.rrhh.model;

public class Vendedor extends Usuario {
    private int cantidadVentas;

    public Vendedor() {
    }

    public int getCantidadVentas() {
        return cantidadVentas;
    }

    public void setCantidadVentas(int cantidadVentas) {
        this.cantidadVentas = cantidadVentas;
    }
    
}
