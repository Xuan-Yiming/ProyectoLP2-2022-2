package pe.edu.pucp.lp2soft.ventas.ventaspagos.dao;

import java.util.ArrayList;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.DocumentoCredito;

public interface DocumentoCreditoDAO {
    public int insertar(DocumentoCredito documentoCredito);
    public int modificar(DocumentoCredito documentoCredito);
    public int eliminar(int id);
    public ArrayList<DocumentoCredito> listarTodos();
}
