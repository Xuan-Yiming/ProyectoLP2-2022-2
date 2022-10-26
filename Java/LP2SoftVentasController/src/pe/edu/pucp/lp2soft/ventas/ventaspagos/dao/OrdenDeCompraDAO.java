package pe.edu.pucp.lp2soft.ventas.ventaspagos.dao;

import java.util.ArrayList;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.OrdenDeCompra;

public interface OrdenDeCompraDAO {
    public int insertar(OrdenDeCompra ordenDeCompra);
    public int modificar(OrdenDeCompra ordenDeCompra);
    public int eliminar(int id);
    public ArrayList<OrdenDeCompra> listarTodos();
}
