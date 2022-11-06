package pe.edu.pucp.lp2soft.ventas.ventaspagos.dao;

import java.util.ArrayList;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.TerminoDePago;

public interface TerminoDePagoDAO {
    public int insertar(TerminoDePago terminoDePago);
    public int modificar(TerminoDePago terminoDePago);
    public int eliminar(int id);
    public ArrayList<TerminoDePago> listarTodos();
}
