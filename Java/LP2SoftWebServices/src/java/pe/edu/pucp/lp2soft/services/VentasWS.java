package pe.edu.pucp.lp2soft.services;

import java.util.ArrayList;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Almacen;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Producto;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.dao.AlmacenDAO;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.dao.ProductoDAO;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.mysql.AlmacenMySQL;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.mysql.ProductoMySQL;

@WebService(serviceName = "VentasWS")
public class VentasWS {
    ProductoDAO daoProducto = new ProductoMySQL();
    AlmacenDAO daoAlmacen = new AlmacenMySQL();
    
    /*Gestionar Productos*/
    @WebMethod(operationName = "insertarProducto")
    public int insertarProducto(@WebParam(name = "producto") Producto producto) {
        int resultado = 0;
        try{
            resultado = daoProducto.insertar(producto);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "modificarProducto")
    public int modificarProducto(@WebParam(name = "producto") Producto producto) {
        int resultado = 0;
        try{
            resultado = daoProducto.modificar(producto);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "eliminarProducto")
    public int eliminarProducto(@WebParam(name = "producto") int idProducto) {
        int resultado = 0;
        try{
            resultado = daoProducto.eliminar(idProducto);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "listarProductos")
    public ArrayList<Producto> listarProductos() {
        ArrayList<Producto> productos = null;
        try{
            productos = daoProducto.listarTodos();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return productos;
    }
    @WebMethod(operationName = "listarProductosPorNombre")
    public ArrayList<Producto> listarProductosPorNombre(@WebParam(name = "nombre") String nombre) {
        ArrayList<Producto> productos = null;
        try{
            productos = daoProducto.listarPorNombre(nombre);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return productos;
    }
    /*Gestionar Almacen*/
    @WebMethod(operationName = "insertarAlmacen")
    public int insertarAlmacen(@WebParam(name = "almacen") Almacen almacen) {
        int resultado = 0;
        try{
            resultado = daoAlmacen.insertar(almacen);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "modificarAlmacen")
    public int modificarAlmacen(@WebParam(name = "almacen") Almacen almacen) {
        int resultado = 0;
        try{
            resultado = daoAlmacen.modificar(almacen);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "eliminarAlmacen")
    public int eliminarAlmacen(@WebParam(name = "almacen") int idAlmacen) {
        int resultado = 0;
        try{
            resultado = daoAlmacen.eliminar(idAlmacen);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "listarAlmacen")
    public ArrayList<Almacen> listarAlmacen() {
        ArrayList<Almacen> almacenes = null;
        try{
            almacenes = daoAlmacen.listarTodos();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return almacenes;
    }
    @WebMethod(operationName = "listarAlmacenPorNombre")
    public ArrayList<Almacen> listarAlmacenPorNombre(@WebParam(name = "nombre") String nombre) {
        ArrayList<Almacen> almacenes = null;
        try{
            almacenes = daoAlmacen.listarPorNombre(nombre);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return almacenes;
    }
}
