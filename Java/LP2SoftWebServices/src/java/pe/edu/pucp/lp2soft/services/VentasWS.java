package pe.edu.pucp.lp2soft.services;

import java.util.ArrayList;
import java.util.Date;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Almacen;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Producto;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.dao.AlmacenDAO;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.dao.ProductoDAO;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.mysql.AlmacenMySQL;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.mysql.ProductoMySQL;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.TerminoDePago;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.dao.TerminoDePagoDAO;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.mysql.TerminoDePagoMySQL;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Pedido;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.OrdenDeCompra;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.dao.PedidoDAO;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.dao.OrdenDeCompraDAO;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.mysql.PedidoMySQL;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.mysql.OrdenDeCompraMySQL;


@WebService(serviceName = "VentasWS")
public class VentasWS {
    ProductoDAO daoProducto = new ProductoMySQL();
    AlmacenDAO daoAlmacen = new AlmacenMySQL();
    TerminoDePagoDAO daoTerminoPago = new TerminoDePagoMySQL();
    PedidoDAO daoPedido = new PedidoMySQL();
    OrdenDeCompraDAO daoOrdenDeCompra = new OrdenDeCompraMySQL();
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
    /*Gestionar Termino Pago*/
    @WebMethod(operationName = "insertarTerminoPago")
    public int insertarTerminoPago(@WebParam(name = "terminoPago") TerminoDePago terminoPago) {
        int resultado = 0;
        try{
            resultado = daoTerminoPago.insertar(terminoPago);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "modificarTerminoPago")
    public int modificarTerminoPago(@WebParam(name = "terminoPago") TerminoDePago terminoPago) {
        int resultado = 0;
        try{
            resultado = daoTerminoPago.modificar(terminoPago);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "eliminarTerminoPago")
    public int eliminarTerminoPago(@WebParam(name = "terminoPago") int idTerminoPago) {
        int resultado = 0;
        try{
            resultado = daoTerminoPago.eliminar(idTerminoPago);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "listarTerminoPago")
    public ArrayList<TerminoDePago> listarTerminoDePagos() {
        ArrayList<TerminoDePago> terminoPagos = null;
        try{
            terminoPagos = daoTerminoPago.listarTodos();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return terminoPagos;
    }
    
	
    /*Gestionar Pedidos*/
    @WebMethod(operationName = "insertarPedido")
    public int insertarPedido(@WebParam(name = "pedido") Pedido pedido) {
        int resultado = 0;
        try{
            resultado = daoPedido.insertar(pedido);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "modificarPedido")
    public int modificarPedido(@WebParam(name = "pedido") Pedido pedido) {
        int resultado = 0;
        try{
            resultado = daoPedido.modificar(pedido);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "eliminarPedido")
    public int eliminarPedido(@WebParam(name = "pedido") int idPedido) {
        int resultado = 0;
        try{
            resultado = daoPedido.eliminar(idPedido);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "listarPedidos")
    public ArrayList<Pedido> listarPedidos() {
        ArrayList<Pedido> pedidos = null;
        try{
            pedidos = daoPedido.listarTodos();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return pedidos;
    }
    @WebMethod(operationName = "listarPedidosPorOrdenDeCompra")
    public ArrayList<Pedido> listarPedidosPorOrdenDeCompra(@WebParam(name = "idOrdenDeCompra") int idOrdenDeCompra) {
        ArrayList<Pedido> pedidos = null;
        try{
            pedidos = daoPedido.listarPorOrdenDeCompra(idOrdenDeCompra);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return pedidos;
    }
    
    /*Gestionar Ordenes de Compra*/
    @WebMethod(operationName = "insertarOrdenDeCompra")
    public int insertarOrdenDeCompra(@WebParam(name = "ordenDeCompra") OrdenDeCompra ordenDeCompra) {
        int resultado = 0;
        try{
            resultado = daoOrdenDeCompra.insertar(ordenDeCompra);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "modificarOrdenDeCompra")
    public int modificarOrdenDeCompra(@WebParam(name = "ordenDeCompra") OrdenDeCompra ordenDeCompra) {
        int resultado = 0;
        try{
            resultado = daoOrdenDeCompra.modificar(ordenDeCompra);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "eliminarOrdenDeCompra")
    public int eliminarOrdenDeCompra(@WebParam(name = "idOrdenDeCompra") int idOrdenDeCompra) {
        int resultado = 0;
        try{
            resultado = daoOrdenDeCompra.eliminar(idOrdenDeCompra);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "listarOrdenesDeCompra")
    public ArrayList<OrdenDeCompra> listarOrdenesDeCompra() {
        ArrayList<OrdenDeCompra> ordenesDeCompra = null;
        try{
            ordenesDeCompra = daoOrdenDeCompra.listarTodos();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return ordenesDeCompra;
    }
    @WebMethod(operationName = "listarOrdenesDeCompraPorCliente")
    public ArrayList<OrdenDeCompra> listarOrdenesDeCompraPorCliente(@WebParam(name = "idCliente") int idCliente) {
        ArrayList<OrdenDeCompra> ordenesDeCompra = null;
        try{
            ordenesDeCompra = daoOrdenDeCompra.listarPorCliente(idCliente);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return ordenesDeCompra;
    }
    @WebMethod(operationName = "listarOrdenesDeCompraPorFecha")
    public ArrayList<OrdenDeCompra> listarOrdenesDeCompraPorFecha(@WebParam(name = "fecha") Date fecha) {
        ArrayList<OrdenDeCompra> ordenesDeCompra = null;
        try{
            ordenesDeCompra = daoOrdenDeCompra.listarPorFecha(fecha);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return ordenesDeCompra;
    }
    @WebMethod(operationName = "listarOrdenesDeCompraUltimas50")
    public ArrayList<OrdenDeCompra> listarOrdenesDeCompraUltimas50() {
        ArrayList<OrdenDeCompra> ordenesDeCompra = null;
        try{
            ordenesDeCompra = daoOrdenDeCompra.listarUltimas50();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return ordenesDeCompra;
    }
    
}
