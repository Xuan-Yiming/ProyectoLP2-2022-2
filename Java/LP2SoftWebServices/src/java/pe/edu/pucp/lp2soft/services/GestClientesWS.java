package pe.edu.pucp.lp2soft.services;

import java.util.ArrayList;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

import pe.edu.pucp.lp2soft.gestclientes.model.Cliente;
import pe.edu.pucp.lp2soft.gestclientes.model.Empresa;
import pe.edu.pucp.lp2soft.gestclientes.model.PersonaNatural;

import pe.edu.pucp.lp2soft.gestclientes.dao.ClienteDAO;
import pe.edu.pucp.lp2soft.gestclientes.mysql.ClienteMySQL;

@WebService(serviceName = "GestClientesWS")
public class GestClientesWS {
    ClienteDAO daoCliente = new ClienteMySQL();
    
    /*Gestionar Empresa*/
    @WebMethod(operationName = "insertarEmpresa")
    public int insertarEmpresa(@WebParam(name = "empresa") Empresa empresa) {
        int resultado = 0;
        try{
            resultado = daoCliente.insertar(empresa);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "modificarEmpresa")
    public int modificarEmpresa(@WebParam(name = "empresa") Empresa empresa) {
        int resultado = 0;
        try{
            resultado = daoCliente.modificar(empresa);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "eliminarCliente")
    public int eliminarEmpresa(@WebParam(name = "idCliente") int idCliente) {
        int resultado = 0;
        try{
            resultado = daoCliente.eliminar(idCliente);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }

    /*Gestionar Persona Natural*/
    @WebMethod(operationName = "insertarPersonaNatural")
    public int insertarPersonaNatural(@WebParam(name = "personaNatural") PersonaNatural personaNatural) {
        int resultado = 0;
        try{
            resultado = daoCliente.insertar(personaNatural);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "modificarPersonaNatural")
    public int modificarPersonaNatural(@WebParam(name = "personaNatural") PersonaNatural personaNatural) {
        int resultado = 0;
        try{
            resultado = daoCliente.modificar(personaNatural);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }

    @WebMethod(operationName = "listarClientes")
    public ArrayList<Cliente> listarClientes(){
        ArrayList<Cliente> clientes = new ArrayList<>();
        try{
            clientes = daoCliente.listarTodos();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return clientes;
    }
    @WebMethod(operationName = "listarPorDocumentoNombre")
    public ArrayList<Cliente> listarPorDocumentoNombre(@WebParam(name = "docNombre") String docNombre) {
        ArrayList<Cliente> clientes;
        try{
            clientes = daoCliente.listarPorDocumentoNombre(docNombre);
            return clientes;
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }
}
