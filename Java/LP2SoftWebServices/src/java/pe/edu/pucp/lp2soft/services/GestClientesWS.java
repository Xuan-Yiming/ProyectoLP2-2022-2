package pe.edu.pucp.lp2soft.services;

import java.util.ArrayList;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import pe.edu.pucp.lp2soft.gestclientes.dao.ClienteDAO;
import pe.edu.pucp.lp2soft.gestclientes.dao.EmpresaDAO;
import pe.edu.pucp.lp2soft.gestclientes.dao.PersonaNaturalDAO;
import pe.edu.pucp.lp2soft.gestclientes.model.Cliente;
import pe.edu.pucp.lp2soft.gestclientes.model.Empresa;
import pe.edu.pucp.lp2soft.gestclientes.model.PersonaNatural;
import pe.edu.pucp.lp2soft.gestclientes.mysql.ClienteMySQL;
import pe.edu.pucp.lp2soft.gestclientes.mysql.EmpresaMySQL;
import pe.edu.pucp.lp2soft.gestclientes.mysql.PersonaNaturalMySQL;

@WebService(serviceName = "GestClientesWS")
public class GestClientesWS {
    EmpresaDAO daoEmpresa = new EmpresaMySQL();
    PersonaNaturalDAO daoPersonaNatural = new PersonaNaturalMySQL();
    ClienteDAO daoCliente = new ClienteMySQL();
    
    /*Gestionar Empresa*/
    @WebMethod(operationName = "insertarEmpresa")
    public int insertarEmpresa(@WebParam(name = "empresa") Empresa empresa) {
        int resultado = 0;
        try{
            resultado = daoEmpresa.insertar(empresa);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "modificarEmpresa")
    public int modificarEmpresa(@WebParam(name = "empresa") Empresa empresa) {
        int resultado = 0;
        try{
            resultado = daoEmpresa.modificar(empresa);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "eliminarEmpresa")
    public int eliminarEmpresa(@WebParam(name = "empresa") int idCliente) {
        int resultado = 0;
        try{
            resultado = daoEmpresa.eliminar(idCliente);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "listarEmpresas")
    public ArrayList<Empresa> listarEmpresas() {
        ArrayList<Empresa> empresas = null;
        try{
            empresas = daoEmpresa.listarTodas();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return empresas;
    }
    @WebMethod(operationName = "listarEmpresasPorRUCNombre")
    public ArrayList<Empresa> listarEmpresasPorRUCNombre(@WebParam(name = "rucNombre") String rucNombre) {
        ArrayList<Empresa> empresas = null;
        try{
            empresas = daoEmpresa.listarPorRUCNombre(rucNombre);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return empresas;
    }
    /*Gestionar Persona Natural*/
    @WebMethod(operationName = "insertarPersonaNatural")
    public int insertarPersonaNatural(@WebParam(name = "personaNatural") PersonaNatural personaNatural) {
        int resultado = 0;
        try{
            resultado = daoPersonaNatural.insertar(personaNatural);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "modificarPersonaNatural")
    public int modificarPersonaNatural(@WebParam(name = "personaNatural") PersonaNatural personaNatural) {
        int resultado = 0;
        try{
            resultado = daoPersonaNatural.modificar(personaNatural);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "eliminarPersonaNatural")
    public int eliminarPersonaNatural(@WebParam(name = "personaNatural") int idCliente) {
        int resultado = 0;
        try{
            resultado = daoPersonaNatural.eliminar(idCliente);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "listarPersonasNaturales")
    public ArrayList<PersonaNatural> listarPersonasNaturales() {
        ArrayList<PersonaNatural> personasNaturales = null;
        try{
            personasNaturales = daoPersonaNatural.listarTodas();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return personasNaturales;
    }
    @WebMethod(operationName = "listarPersonasNaturalesPorDocumentoNombre")
    public ArrayList<PersonaNatural> listarPersonasNaturalesPorDocumentoNombre(@WebParam(name = "docNombre") String docNombre) {
        ArrayList<PersonaNatural> personasNaturales = null;
        try{
            personasNaturales = daoPersonaNatural.listarPorDocumentoNombre(docNombre);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return personasNaturales;
    }
    @WebMethod(operationName = "listarClientes")
    public ArrayList<Cliente> listarClientes(){
        ArrayList<Cliente> clientes = new ArrayList<>();
        try{
            clientes = daoCliente.listarClientes();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return clientes;
    }
    @WebMethod(operationName = "listarPorDocumentoNombre")
    public ArrayList<Cliente> listarPorDocumentoNombre(@WebParam(name = "docNombre") String docNombre) {
        ArrayList<Cliente> clientes = null;
        try{
            clientes = daoCliente.listarPorDocumentoNombre(docNombre);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return clientes;
    }
}
