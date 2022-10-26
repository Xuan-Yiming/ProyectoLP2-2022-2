package pe.edu.pucp.lp2soft.gestclientes.dao;

import java.util.ArrayList;
import pe.edu.pucp.lp2soft.gestclientes.model.Empresa;

public interface EmpresaDAO {
    int insertar(Empresa empresa);
    int modificar(Empresa empresa);
    int eliminar(int idCliente);    //DEVUELVE
    ArrayList<Empresa> listarTodas();
    ArrayList<Empresa> listarPorRUCNombre(String rucNombre);
}
