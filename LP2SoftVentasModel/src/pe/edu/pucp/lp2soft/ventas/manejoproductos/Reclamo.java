package pe.edu.pucp.lp2soft.ventas.manejoproductos;
import java.util.Date;
import java.util.ArrayList;

public class Reclamo {
    private static int correlativo=1;
    private int id;//numero de reclamo
    private Date fecha;
    private boolean atendido;
    private String justificacion;
    private ArrayList <Devolucion> devoluciones;
   
    public Reclamo (Date fecha,boolean atendido,String justificacion){
        this.id=correlativo;
        this.fecha=fecha;
        this.atendido=atendido;
        this.justificacion=justificacion;
        correlativo++;
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
