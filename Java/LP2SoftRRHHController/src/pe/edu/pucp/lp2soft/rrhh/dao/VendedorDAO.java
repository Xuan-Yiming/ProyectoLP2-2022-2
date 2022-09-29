
package pe.edu.pucp.lp2soft.rrhh.dao;

import java.util.ArrayList;
import pe.edu.pucp.lp2soft.rrhh.model.Vendedor;


public interface VendedorDAO {
    public int insertar(Vendedor vendedor);
    public int modificar(Vendedor vendedor);
    public int eliminar(int id_usuario,int cantidadVentas);
    public ArrayList<Vendedor> listarTodos();
}
