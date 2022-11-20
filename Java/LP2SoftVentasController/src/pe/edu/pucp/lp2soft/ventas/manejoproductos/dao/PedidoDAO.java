package pe.edu.pucp.lp2soft.ventas.manejoproductos.dao;

import java.util.ArrayList;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Pedido;

public interface PedidoDAO {
    public int insertar(Pedido pedido);
    public int eliminar(int id);
    public ArrayList<Pedido> listarPedidosPorIdOrdenDeCompra(int id_ordenDeCompra);
}
