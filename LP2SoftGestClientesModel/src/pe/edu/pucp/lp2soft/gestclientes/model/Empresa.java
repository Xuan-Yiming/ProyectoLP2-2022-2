
package pe.edu.pucp.lp2soft.gestclientes.model;
public class Empresa extends Cliente {
    private int RUC;
    private String razonSocial;
    private String direccion;


    public Empresa(String categoria,int RUC, String razonSocial, String direccion) {
        super(categoria);
        this.RUC = RUC;
        this.razonSocial = razonSocial;
        this.direccion = direccion;
    }

    
    
    public int getRUC() {
        return RUC;
    }

    public void setRUC(int RUC) {
        this.RUC = RUC;
    }

    public String getRazonSocial() {
        return razonSocial;
    }

    public void setRazonSocial(String razonSocial) {
        this.razonSocial = razonSocial;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }


    
    
    
}
