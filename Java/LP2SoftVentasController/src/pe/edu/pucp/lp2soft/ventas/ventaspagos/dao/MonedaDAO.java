package pe.edu.pucp.lp2soft.ventas.ventaspagos.dao;

import java.util.ArrayList;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.Moneda;

public interface MonedaDAO {
    
    public int insertarMoneda(Moneda moneda);
    public int modificarMoneda(Moneda moneda);
    public int eliminarMoneda(int id);
    public ArrayList<Moneda> listarMonedaXNombre(String nombre);
    public int buscarMoneda (String nombre);
    public ArrayList<Moneda> listarTodos();
    public ArrayList<Moneda> listarMonedaUltimoTipoDeCambio();
    public void actualizarTipoDeCambio();
}
