package pe.edu.pucp.lp2soft.ventas.manejoproductos;
import java.util.Date;
import java.util.ArrayList;

public class Reclamo {
    private int id;//numero de reclamo
    private Date fecha;
    private boolean atendido;
    private String justificacion;
    private ArrayList <Devolucion> devoluciones;

    public Reclamo(int id, Date fecha, boolean atendido, String justificacion) {
        this.id = id;
        this.fecha = fecha;
        this.atendido = atendido;
        this.justificacion = justificacion;
    }
   


    public Reclamo() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public String getJustificacion() {
        return justificacion;
    }

    public void setJustificacion(String justificacion) {
        this.justificacion = justificacion;
    }

    public ArrayList <Devolucion> getDevoluciones() {
        return devoluciones;
    }

    public void setDevoluciones(ArrayList <Devolucion> devoluciones) {
        this.devoluciones = devoluciones;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public boolean isAtendido() {
        return atendido;
    }

    public void setAtendido(boolean atendido) {
        this.atendido = atendido;
    }

    //metodos
    void resolverReclamo(int atendido){
        
    }
    void mostrarReclamo(){
        
    }
}
