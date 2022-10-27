package pe.edu.pucp.lp2soft.ventas.ventaspagos.dao;
import java.util.ArrayList;
import java.util.Date;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.OrdenDeCompra;


public interface OrdenDeCompraDAO {
    public int insertar(OrdenDeCompra ordenDeCompra);
    public int modificar(OrdenDeCompra ordenDeCompra);
    public int eliminar(int id);
    public ArrayList<OrdenDeCompra> listarTodos();
	public ArrayList<OrdenDeCompra> listarPorCliente(int idCliente);
	public ArrayList<OrdenDeCompra> listarPorFecha(Date fecha);
	public ArrayList<OrdenDeCompra> listarUltimas50();
}
