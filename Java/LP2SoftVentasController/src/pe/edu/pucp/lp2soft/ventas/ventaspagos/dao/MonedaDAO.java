package pe.edu.pucp.lp2soft.ventas.ventaspagos.dao;

import java.util.ArrayList;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.Moneda;

public interface MonedaDAO {
    public int insertar(Moneda moneda);
    public int modificar(Moneda moneda);
    public int eliminar(int id);
    public ArrayList<Moneda> listarTodos();
}
