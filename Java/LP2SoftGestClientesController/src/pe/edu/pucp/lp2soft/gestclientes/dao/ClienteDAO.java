package pe.edu.pucp.lp2soft.gestclientes.dao;

import java.util.ArrayList;
import pe.edu.pucp.lp2soft.gestclientes.model.Cliente;

public interface ClienteDAO {
    int insertar(Cliente cliente);
    int modificar(Cliente cliente);
    int eliminar(int idCliente);
    ArrayList<Cliente> listarTodos();
    public ArrayList<Cliente> listarPorDocumentoNombre(String docNombre);
}
