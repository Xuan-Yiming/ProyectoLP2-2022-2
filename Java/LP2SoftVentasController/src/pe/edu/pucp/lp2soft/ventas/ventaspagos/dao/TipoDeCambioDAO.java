package pe.edu.pucp.lp2soft.ventas.ventaspagos.dao;

import java.util.ArrayList;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.TipoDeCambio;

public interface TipoDeCambioDAO {
    public int insertar(TipoDeCambio tipoDeCambio);
    public int modificar(TipoDeCambio tipoDeCambio);
    public int eliminar(int id);
    public ArrayList<TipoDeCambio> listarTodos();
}
