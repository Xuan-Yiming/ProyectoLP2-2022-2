package pe.edu.pucp.lp2soft.gestclientes.model;
import pe.edu.pucp.lp2soft.enums.Categoria;

public class Empresa extends Cliente {
    private String RUC;
    private String razonSocial;
    private String direccion;

    public Empresa(String RUC, String razonSocial, String direccion, int idCliente, Categoria categoria, Boolean activo) {
        super(idCliente, categoria, activo);
        this.RUC = RUC;
        this.razonSocial = razonSocial;
        this.direccion = direccion;
    }

    public Empresa() {
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
