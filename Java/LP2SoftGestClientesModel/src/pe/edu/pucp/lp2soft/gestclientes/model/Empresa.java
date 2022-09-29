
package pe.edu.pucp.lp2soft.gestclientes.model;
public class Empresa extends Cliente {
    private String RUC;
    private String razonSocial;
    private String direccion;

    public Empresa(){}
    
    public Empresa(String categoria, Boolean activo,String RUC, String razonSocial, String direccion) {
        super(categoria,activo);
        this.RUC = RUC;
        this.razonSocial = razonSocial;
        this.direccion = direccion;
    }

    public String getRUC() {
        return RUC;
    }

    public void setRUC(String RUC) {
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
