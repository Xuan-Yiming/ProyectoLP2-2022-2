package pe.edu.pucp.lp2soft.services;

import java.util.ArrayList;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import pe.edu.pucp.lp2soft.rrhh.dao.UsuarioDAO;
import pe.edu.pucp.lp2soft.rrhh.model.Administrador;
import pe.edu.pucp.lp2soft.rrhh.model.SupervisorDeAlmacen;
import pe.edu.pucp.lp2soft.rrhh.model.Usuario;
import pe.edu.pucp.lp2soft.rrhh.model.Vendedor;
import pe.edu.pucp.lp2soft.rrhh.mysql.UsuarioMySQL;

@WebService(serviceName = "RRHHWS")
public class RRHHWS {
    UsuarioDAO daoUsuario = new UsuarioMySQL();
    
    /*Gestionar Adminisrador*/
    @WebMethod(operationName = "insertarAdministrador")
    public int insertarAdministrador(@WebParam(name = "administrador") Administrador administrador) {
        int resultado = 0;
        try{
            resultado = daoUsuario.insertarUsuario(administrador);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "modificarAdministrador")
    public int modificarAdministrador(@WebParam(name = "administrador") Administrador administrador) {
        int resultado = 0;
        try{
            resultado = daoUsuario.modificarUsuario(administrador);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }

    /*Gestionar Vendedor*/
    @WebMethod(operationName = "insertarVendedor")
    public int insertarVendedor(@WebParam(name = "vendedor") Vendedor vendedor) {
        int resultado = 0;
        try{
            resultado = daoUsuario.insertarUsuario(vendedor);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "modificarVendedor")
    public int modificarVendedor(@WebParam(name = "vendedor") Vendedor vendedor) {
        int resultado = 0;
        try{
            resultado = daoUsuario.modificarUsuario(vendedor);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }

    /*Gestionar Supervisor de almacen*/
    @WebMethod(operationName = "insertarSupervisor")
    public int insertarSupervisor(@WebParam(name = "supervisor") SupervisorDeAlmacen supervisor) {
        int resultado = 0;
        try{
            resultado = daoUsuario.insertarUsuario(supervisor);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "modificarSupervisor")
    public int modificarSupervisor(@WebParam(name = "supervisor") SupervisorDeAlmacen supervisor) {
        int resultado = 0;
        try{
            resultado = daoUsuario.modificarUsuario(supervisor);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
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
            usuarios = daoUsuario.listarTodos();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return usuarios;
    }
    
    @WebMethod(operationName = "listarUsuarioPorDocumentoNombre")
    public ArrayList<Usuario> listarUsuarioPorDocumentoNombre(@WebParam(name = "docNombre") String docNombre) {
        ArrayList<Usuario> usuarios = null;
        try{
            usuarios = daoUsuario.listarPorDocumentoNombre(docNombre);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return usuarios;
    }
    
    @WebMethod(operationName = "eliminarUsuario")
    public int eliminarUsuario(
            @WebParam(name = "cuentaUsuario")
            Usuario cuentaUsuario) {        
        int result = 0;
        try{
             result = daoUsuario.eliminarUsuario(cuentaUsuario.getIdUsuario());             
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        
        return result;
    }
}
