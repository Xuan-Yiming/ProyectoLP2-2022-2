package pe.edu.pucp.lp2soft.gestclientes.dao;

import java.util.ArrayList;
import pe.edu.pucp.lp2soft.gestclientes.model.PersonaNatural;

public interface PersonaNaturalDAO {
    int insertar(PersonaNatural personaNatural);
    int modificar(PersonaNatural personaNatural);
    int eliminar(int idCliente);    //DEVUELVE
    ArrayList<PersonaNatural> listarTodas();
    ArrayList<PersonaNatural> listarPorDocumentoNombre(String docNombre);
}
