package pe.edu.pucp.lp2soft.ventas.ventaspagos.dao;

import java.util.ArrayList;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.TipoDeCambio;

public interface TipoDeCambioDAO {
    public int insertarTipoDeCambio(TipoDeCambio tipoDeCambio);
    public int modificarTipoDeCambio(TipoDeCambio tipoDeCambio);
    public int eliminarTipoDeCambio(int id);
    public ArrayList<TipoDeCambio> listarTipoDeCambioXNombre(String nombre);
}
