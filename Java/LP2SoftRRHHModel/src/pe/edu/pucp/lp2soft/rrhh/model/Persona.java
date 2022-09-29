
package pe.edu.pucp.lp2soft.rrhh.model;
import java.util.ArrayList;
import java.util.Date;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.OrdenDeCompra;

public class Persona {
    private int idPersona;
    private TipoDeDocumento tipoDeDocumento;
    private String numDeDocumento;  
    private String nombre;
    private String apellido;
    private Date fechaDeNacimiento;
    private String telefono;
    private String direccion;
    private String email;
    private Boolean activo;
    private ArrayList<OrdenDeCompra> ordenesDeCompra;

    public int getIdPersona() {
        return idPersona;
    }

    public Boolean getActivo() {
        return activo;
    }

    public void setActivo(Boolean activo) {
        this.activo = activo;
    }
        
    public void setIdPersona(int idPersona) {
        this.idPersona = idPersona;
    }
    
    //Constructor vacio
    public Persona(){}
    
    public Persona(TipoDeDocumento tipoDeDocumento, String numDeDocumento, String nombre, String apellido, Date fechaDeNacimiento, String telefono, String direccion, String email,Boolean activo) {
        this.tipoDeDocumento = tipoDeDocumento;
        this.numDeDocumento = numDeDocumento;
        this.nombre = nombre;
        this.apellido = apellido;
        this.fechaDeNacimiento = fechaDeNacimiento;
        this.telefono = telefono;
        this.direccion = direccion;
        this.email = email;
        this.activo = activo;
    }

    public TipoDeDocumento getTipoDeDocumento() {
        return tipoDeDocumento;
    }

    public void setTipoDeDocumento(TipoDeDocumento tipoDeDocumento) {
        this.tipoDeDocumento = tipoDeDocumento;
    }

    public String getNumDeDocumento() {
        return numDeDocumento;
    }

    public void setNumDeDocumento(String numDeDocumento) {
        this.numDeDocumento = numDeDocumento;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public Date getFechaDeNacimiento() {
        return fechaDeNacimiento;
    }

    public void setFechaDeNacimiento(Date fechaDeNacimiento) {
        this.fechaDeNacimiento = fechaDeNacimiento;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public ArrayList<OrdenDeCompra> getOrdenesDeCompra() {
        return ordenesDeCompra;
    }

    public void setOrdenesDeCompra(ArrayList<OrdenDeCompra> ordenesDeCompra) {
        this.ordenesDeCompra = ordenesDeCompra;
    }
}
