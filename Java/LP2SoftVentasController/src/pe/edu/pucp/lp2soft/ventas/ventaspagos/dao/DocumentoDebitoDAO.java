package pe.edu.pucp.lp2soft.ventas.ventaspagos.dao;

import java.util.ArrayList;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.DocumentoDebito;

public interface DocumentoDebitoDAO {
    public int insertar(DocumentoDebito documentoDebito);
    public int modificar(DocumentoDebito documentoDebito);
    public int eliminar(int id);
    public ArrayList<DocumentoDebito> listarTodos();
}
