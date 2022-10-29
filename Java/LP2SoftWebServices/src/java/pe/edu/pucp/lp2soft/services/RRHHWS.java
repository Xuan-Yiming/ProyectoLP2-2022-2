package pe.edu.pucp.lp2soft.services;

import com.oracle.wls.shaded.org.apache.xpath.axes.SubContextList;
import java.util.ArrayList;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import pe.edu.pucp.lp2soft.rrhh.dao.AdministradorDAO;
import pe.edu.pucp.lp2soft.rrhh.dao.SupervisorDeAlmacenDAO;
import pe.edu.pucp.lp2soft.rrhh.dao.VendedorDAO;
import pe.edu.pucp.lp2soft.rrhh.dao.UsuarioDAO;
import pe.edu.pucp.lp2soft.rrhh.model.Administrador;
import pe.edu.pucp.lp2soft.rrhh.model.SupervisorDeAlmacen;
import pe.edu.pucp.lp2soft.rrhh.model.Usuario;
import pe.edu.pucp.lp2soft.rrhh.model.Vendedor;
import pe.edu.pucp.lp2soft.rrhh.mysql.AdministradorMySQL;
import pe.edu.pucp.lp2soft.rrhh.mysql.SupervisorDeAlmacenMySQL;
import pe.edu.pucp.lp2soft.rrhh.mysql.UsuarioMySQL;
import pe.edu.pucp.lp2soft.rrhh.mysql.VendedorMySQL;

@WebService(serviceName = "RRHHWS")
public class RRHHWS {
    AdministradorDAO daoAdministrador = new AdministradorMySQL();
    VendedorDAO daoVendedor = new VendedorMySQL();
    SupervisorDeAlmacenDAO daoSupervisor = new SupervisorDeAlmacenMySQL();
    UsuarioDAO daoUsuario = new UsuarioMySQL();
    
    /*Gestionar Adminisrador*/
    @WebMethod(operationName = "insertarAdministrador")
    public int insertarAdministrador(@WebParam(name = "administrador") Administrador administrador) {
        int resultado = 0;
        try{
            resultado = daoAdministrador.insertar(administrador);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "modificarAdministrador")
    public int modificarAdministrador(@WebParam(name = "administrador") Administrador administrador) {
        int resultado = 0;
        try{
            resultado = daoAdministrador.modificar(administrador);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "eliminarAdministrador")
    public int eliminarAdministrador(@WebParam(name = "administrador") int idUsuario, @WebParam(name = "area") String area) {
        int resultado = 0;
        try{
            resultado = daoAdministrador.eliminar(idUsuario,area);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "listarAdministradores")
    public ArrayList<Administrador> listarAdministradores() {
        ArrayList<Administrador> administradores = null;
        try{
            administradores = daoAdministrador.listarTodos();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return administradores;
    }
    @WebMethod(operationName = "listarAdministradoresPorDocumentoNombre")
    public ArrayList<Administrador> listarAdministradoresPorDocumentoNombre(@WebParam(name = "docNombre") String docNombre) {
        ArrayList<Administrador> administradores = null;
        try{
            administradores = daoAdministrador.listarPorDocumentoNombre(docNombre);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return administradores;
    }
    /*Gestionar Vendedor*/
    @WebMethod(operationName = "insertarVendedor")
    public int insertarVendedor(@WebParam(name = "vendedor") Vendedor vendedor) {
        int resultado = 0;
        try{
            resultado = daoVendedor.insertar(vendedor);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "modificarVendedor")
    public int modificarVendedor(@WebParam(name = "vendedor") Vendedor vendedor) {
        int resultado = 0;
        try{
            resultado = daoVendedor.modificar(vendedor);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "eliminarVendedor")
    public int eliminarVendedor(@WebParam(name = "vendedor") int idUsuario, @WebParam(name = "cantidad") int cantidad) {
        int resultado = 0;
        try{
            resultado = daoVendedor.eliminar(idUsuario,cantidad);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "listarVendedores")
    public ArrayList<Vendedor> listarVendedores() {
        ArrayList<Vendedor> vendedores = null;
        try{
            vendedores = daoVendedor.listarTodos();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return vendedores;
    }
    @WebMethod(operationName = "listarVendedoresPorDocumentoNombre")
    public ArrayList<Vendedor> listarVendedoresPorDocumentoNombre(@WebParam(name = "docNombre") String docNombre) {
        ArrayList<Vendedor> vendedores = null;
        try{
            vendedores = daoVendedor.listarPorDocumentoNombre(docNombre);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return vendedores;
    }
    /*Gestionar Supervisor de almacen*/
    @WebMethod(operationName = "insertarSupervisor")
    public int insertarSupervisor(@WebParam(name = "supervisor") SupervisorDeAlmacen supervisor) {
        int resultado = 0;
        try{
            resultado = daoSupervisor.insertar(supervisor);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "modificarSupervisor")
    public int modificarSupervisor(@WebParam(name = "supervisor") SupervisorDeAlmacen supervisor) {
        int resultado = 0;
        try{
            resultado = daoSupervisor.modificar(supervisor);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "eliminarSupervisor")
    public int eliminarSupervisor(@WebParam(name = "supervisor") int idUsuario, @WebParam(name = "almacen") int idAlmacen) {
        int resultado = 0;
        try{
            resultado = daoSupervisor.eliminar(idUsuario,idAlmacen);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "listarSupervisores")
    public ArrayList<SupervisorDeAlmacen> listarSupervisores() {
        ArrayList<SupervisorDeAlmacen> supervisores = null;
        try{
            supervisores = daoSupervisor.listarTodos();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return supervisores;
    }
    @WebMethod(operationName = "listarSupervisoresPorDocumentoNombre")
    public ArrayList<SupervisorDeAlmacen> listarSupervisoresPorDocumentoNombre(@WebParam(name = "docNombre") String docNombre) {
        ArrayList<SupervisorDeAlmacen> supervisores = null;
        try{
            supervisores = daoSupervisor.listarPorDocumentoNombre(docNombre);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return supervisores;
    }
    
    //Iniciar sesion
    @WebMethod(operationName = "verificarCuentaUsuario")
    public Usuario verificarCuentaUsuario(
            @WebParam(name = "cuentaUsuario")
            Usuario cuentaUsuario) {
        
        try{
             Usuario usuario = daoUsuario.verificar(cuentaUsuario);
             
             return usuario;
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        
        return null;
    }
    @WebMethod(operationName = "listarUsuarios")
    public ArrayList<Usuario> listarUsuarios(){
        ArrayList<Usuario> usuarios =  null;
        try{
            usuarios = daoUsuario.listarUsuarios();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return usuarios;
    }
    
    @WebMethod(operationName = "listarPorDocumentoNombre")
    public ArrayList<Usuario> listarPorDocumentoNombre(@WebParam(name = "docNombre") String docNombre) {
        ArrayList<Usuario> usuarios = null;
        try{
            usuarios = daoUsuario.listarPorDocumentoNombre(docNombre);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return usuarios;
    }
    
    @WebMethod(operationName = "buscarSupervisorPorAlmacen")
    public SupervisorDeAlmacen buscarSupervisorPorAlmacen(@WebParam(name = "id_almacen") int id_almacen) {
        SupervisorDeAlmacen supervisor =new SupervisorDeAlmacen();
        try{
            supervisor = daoSupervisor.buscarPorAlmacen(id_almacen);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return supervisor;
    }
}
