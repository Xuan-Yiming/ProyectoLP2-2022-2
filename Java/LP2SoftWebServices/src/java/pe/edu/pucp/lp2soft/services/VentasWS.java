package pe.edu.pucp.lp2soft.services;

import java.util.ArrayList;
import java.util.Date;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import pe.edu.pucp.lp2soft.rrhh.dao.SupervisorDeAlmacenDAO;
import pe.edu.pucp.lp2soft.rrhh.model.SupervisorDeAlmacen;
import pe.edu.pucp.lp2soft.rrhh.mysql.SupervisorDeAlmacenMySQL;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Almacen;
<<<<<<< HEAD
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Pedido;
=======
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Devolucion;
>>>>>>> 5571f3f43f131e48c46d65f50e6194fdc066c615
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Producto;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Reclamo;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Stock;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.dao.AlmacenDAO;
<<<<<<< HEAD
import pe.edu.pucp.lp2soft.ventas.manejoproductos.dao.PedidoDAO;
=======
import pe.edu.pucp.lp2soft.ventas.manejoproductos.dao.DevolucionDAO;
>>>>>>> 5571f3f43f131e48c46d65f50e6194fdc066c615
import pe.edu.pucp.lp2soft.ventas.manejoproductos.dao.ProductoDAO;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.dao.ReclamoDAO;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.dao.StockDAO;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.mysql.AlmacenMySQL;
<<<<<<< HEAD
import pe.edu.pucp.lp2soft.ventas.manejoproductos.mysql.PedidoMySQL;
=======
import pe.edu.pucp.lp2soft.ventas.manejoproductos.mysql.DevolucionMySQL;
>>>>>>> 5571f3f43f131e48c46d65f50e6194fdc066c615
import pe.edu.pucp.lp2soft.ventas.manejoproductos.mysql.ProductoMySQL;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.mysql.ReclamoMySQL;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.mysql.StockMySQL;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.Moneda;
<<<<<<< HEAD
import pe.edu.pucp.lp2soft.ventas.ventaspagos.OrdenDeCompra;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.dao.MonedaDAO;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.dao.OrdenDeCompraDAO;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.mysql.MonedaMySQL;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.mysql.OrdenDeCompraMySQL;
=======
import pe.edu.pucp.lp2soft.ventas.ventaspagos.TipoDeCambio;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.dao.MonedaDAO;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.dao.TipoDeCambioDAO;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.mysql.MonedaMySQL;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.mysql.TipoDeCambioMySQL;
>>>>>>> 5571f3f43f131e48c46d65f50e6194fdc066c615


@WebService(serviceName = "VentasWS")
public class VentasWS {
    ProductoDAO daoProducto = new ProductoMySQL();
    AlmacenDAO daoAlmacen = new AlmacenMySQL();
    StockDAO daoStock = new StockMySQL();
    MonedaDAO daoMoneda = new MonedaMySQL();
<<<<<<< HEAD
    SupervisorDeAlmacenDAO daoSupervisor = new SupervisorDeAlmacenMySQL();
=======
    TipoDeCambioDAO daoTipoDeCambio = new TipoDeCambioMySQL();
    SupervisorDeAlmacenDAO daoSupervisor = new SupervisorDeAlmacenMySQL();
    ReclamoDAO daoReclamo = new ReclamoMySQL();
    DevolucionDAO daoDevolucion = new DevolucionMySQL();
>>>>>>> 5571f3f43f131e48c46d65f50e6194fdc066c615
//    TerminoDePagoDAO daoTerminoPago = new TerminoDePagoMySQL();
    PedidoDAO daoPedido = new PedidoMySQL();
    OrdenDeCompraDAO daoOrdenDeCompra = new OrdenDeCompraMySQL();
    
        
    @WebMethod(operationName = "listarSupervisores")
    public ArrayList<SupervisorDeAlmacen> listarSupervisores() {        
        ArrayList<SupervisorDeAlmacen> supervisores = new ArrayList<SupervisorDeAlmacen>();
        try{
             supervisores = daoSupervisor.listarTodos();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        
        return supervisores;
    }
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
    @WebMethod(operationName = "buscarProductoPorID")
    public Producto buscarProductoPorID(@WebParam(name = "idProducto") int idProducto) {
        Producto productos = null;
        try{
            productos = daoProducto.buscar(idProducto);
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
    @WebMethod(operationName = "insertarStock")
    public int insertarStock(@WebParam(name = "stock") Stock stock,
                            @WebParam(name = "idAlmacen") int idAlmacen) {
        int resultado = 0;
        try{
            resultado = daoStock.insertar(stock, idAlmacen);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }

    @WebMethod(operationName = "modificarStock")
    public int modificarStock(@WebParam(name = "stock") Stock stock, 
                            @WebParam(name = "idAlmacen") int idAlmacen) {
        int resultado = 0;
        try{
            resultado = daoStock.modificar(stock, idAlmacen);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "eliminarStock")
    public int eliminarStock(@WebParam(name = "idProducto") int idProducto, 
                            @WebParam(name = "idAlmacen") int idAlmacen) {
        int resultado = 0;
        try{
            resultado = daoStock.eliminar(idAlmacen, idProducto);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "listarStockPorIdAlmacen")
    public ArrayList<Stock> listarPorAlmacen(@WebParam(name = "idAlmacen") int idAlmacen) {
        ArrayList<Stock> stocks = new ArrayList<Stock>();
        try{
            stocks = daoStock.listarPorAlmacen(idAlmacen);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return stocks;
    }
    
    @WebMethod(operationName = "listarStockPorIdAlmacenYNombre")
    public ArrayList<Stock> listarStockPorIdAlmacenYNombre(@WebParam(name = "idAlmacen") int idAlmacen,
                                                            @WebParam(name = "nombre") String nombre) {
        ArrayList<Stock> stocks = new ArrayList<Stock>();
        try{
            stocks = daoStock.listarPorAlmacenYNombre(idAlmacen, nombre);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return stocks;
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
    public int eliminarAlmacen(@WebParam(name = "almacen") Almacen almacen) {
        int resultado = 0;
        try{
            resultado = daoAlmacen.eliminar(almacen);
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
    @WebMethod(operationName = "listarMonedas")
    public ArrayList<Moneda> listarMonedas() {        
        ArrayList<Moneda> monedas = new ArrayList<Moneda>();
        try{
             monedas = daoMoneda.listarTodos();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        
        return monedas;
    }
//    /*Gestionar Termino Pago*/
//    @WebMethod(operationName = "insertarTerminoPago")
//    public int insertarTerminoPago(@WebParam(name = "terminoPago") TerminoDePago terminoPago) {
//        int resultado = 0;
//        try{
//            resultado = daoTerminoPago.insertar(terminoPago);
//        }catch(Exception ex){
//            System.out.println(ex.getMessage());
//        }
//        return resultado;
//    }
//    
//    @WebMethod(operationName = "modificarTerminoPago")
//    public int modificarTerminoPago(@WebParam(name = "terminoPago") TerminoDePago terminoPago) {
//        int resultado = 0;
//        try{
//            resultado = daoTerminoPago.modificar(terminoPago);
//        }catch(Exception ex){
//            System.out.println(ex.getMessage());
//        }
//        return resultado;
//    }
//    @WebMethod(operationName = "eliminarTerminoPago")
//    public int eliminarTerminoPago(@WebParam(name = "terminoPago") int idTerminoPago) {
//        int resultado = 0;
//        try{
//            resultado = daoTerminoPago.eliminar(idTerminoPago);
//        }catch(Exception ex){
//            System.out.println(ex.getMessage());
//        }
//        return resultado;
//    }
//    @WebMethod(operationName = "listarTerminoPago")
//    public ArrayList<TerminoDePago> listarTerminoDePagos() {
//        ArrayList<TerminoDePago> terminoPagos = null;
//        try{
//            terminoPagos = daoTerminoPago.listarTodos();
//        }catch(Exception ex){
//            System.out.println(ex.getMessage());
//        }
//        return terminoPagos;
//    }
    
	
//    /*Gestionar Pedidos*/
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
//    @WebMethod(operationName = "listarPedidos")
//    public ArrayList<Pedido> listarPedidos() {
//        ArrayList<Pedido> pedidos = null;
//        try{
//            pedidos = daoPedido.listarTodos();
//        }catch(Exception ex){
//            System.out.println(ex.getMessage());
//        }
//        return pedidos;
//    }
//    @WebMethod(operationName = "listarPedidosPorOrdenDeCompra")
//    public ArrayList<Pedido> listarPedidosPorOrdenDeCompra(@WebParam(name = "idOrdenDeCompra") int idOrdenDeCompra) {
//        ArrayList<Pedido> pedidos = null;
//        try{
//            pedidos = daoPedido.listarPorOrdenDeCompra(idOrdenDeCompra);
//        }catch(Exception ex){
//            System.out.println(ex.getMessage());
//        }
//        return pedidos;
//    }
//    
//    /*Gestionar Ordenes de Compra*/
<<<<<<< HEAD
    @WebMethod(operationName = "insertarOrdenDeCompra")
    public int insertarOrdenDeCompra(@WebParam(name = "ordenDeCompra") OrdenDeCompra ordenDeCompra, @WebParam(name = "idCliente") int idCliente) {
        int resultado = 0;
        try{
            resultado = daoOrdenDeCompra.insertar(ordenDeCompra,idCliente);
=======
//    @WebMethod(operationName = "insertarOrdenDeCompra")
//    public int insertarOrdenDeCompra(@WebParam(name = "ordenDeCompra") OrdenDeCompra ordenDeCompra) {
//        int resultado = 0;
//        try{
//            resultado = daoOrdenDeCompra.insertar(ordenDeCompra);
//        }catch(Exception ex){
//            System.out.println(ex.getMessage());
//        }
//        return resultado;
//    }
//    @WebMethod(operationName = "modificarOrdenDeCompra")
//    public int modificarOrdenDeCompra(@WebParam(name = "ordenDeCompra") OrdenDeCompra ordenDeCompra) {
//        int resultado = 0;
//        try{
//            resultado = daoOrdenDeCompra.modificar(ordenDeCompra);
//        }catch(Exception ex){
//            System.out.println(ex.getMessage());
//        }
//        return resultado;
//    }
//    @WebMethod(operationName = "eliminarOrdenDeCompra")
//    public int eliminarOrdenDeCompra(@WebParam(name = "idOrdenDeCompra") int idOrdenDeCompra) {
//        int resultado = 0;
//        try{
//            resultado = daoOrdenDeCompra.eliminar(idOrdenDeCompra);
//        }catch(Exception ex){
//            System.out.println(ex.getMessage());
//        }
//        return resultado;
//    }
//    @WebMethod(operationName = "listarOrdenesDeCompra")
//    public ArrayList<OrdenDeCompra> listarOrdenesDeCompra() {
//        ArrayList<OrdenDeCompra> ordenesDeCompra = null;
//        try{
//            ordenesDeCompra = daoOrdenDeCompra.listarTodos();
//        }catch(Exception ex){
//            System.out.println(ex.getMessage());
//        }
//        return ordenesDeCompra;
//    }
//    @WebMethod(operationName = "listarOrdenesDeCompraPorCliente")
//    public ArrayList<OrdenDeCompra> listarOrdenesDeCompraPorCliente(@WebParam(name = "idCliente") int idCliente) {
//        ArrayList<OrdenDeCompra> ordenesDeCompra = null;
//        try{
//            ordenesDeCompra = daoOrdenDeCompra.listarPorCliente(idCliente);
//        }catch(Exception ex){
//            System.out.println(ex.getMessage());
//        }
//        return ordenesDeCompra;
//    }
//    @WebMethod(operationName = "listarOrdenesDeCompraPorFecha")
//    public ArrayList<OrdenDeCompra> listarOrdenesDeCompraPorFecha(@WebParam(name = "fecha") Date fecha) {
//        ArrayList<OrdenDeCompra> ordenesDeCompra = null;
//        try{
//            ordenesDeCompra = daoOrdenDeCompra.listarPorFecha(fecha);
//        }catch(Exception ex){
//            System.out.println(ex.getMessage());
//        }
//        return ordenesDeCompra;
//    }
//    @WebMethod(operationName = "listarOrdenesDeCompraUltimas50")
//    public ArrayList<OrdenDeCompra> listarOrdenesDeCompraUltimas50() {
//        ArrayList<OrdenDeCompra> ordenesDeCompra = null;
//        try{
//            ordenesDeCompra = daoOrdenDeCompra.listarUltimas50();
//        }catch(Exception ex){
//            System.out.println(ex.getMessage());
//        }
//        return ordenesDeCompra;
//    }
//    
    //Gestionar Moneda//
    @WebMethod(operationName = "insertarMoneda")
    public int insertarMoneda(@WebParam(name = "moneda") Moneda moneda) {
        int resultado = 0;
        try{
            resultado = daoMoneda.insertarMoneda(moneda);
>>>>>>> 5571f3f43f131e48c46d65f50e6194fdc066c615
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
<<<<<<< HEAD
    @WebMethod(operationName = "modificarOrdenDeCompra")
    public int modificarOrdenDeCompra(@WebParam(name = "ordenDeCompra") OrdenDeCompra ordenDeCompra) {
        int resultado = 0;
        try{
            resultado = daoOrdenDeCompra.modificar(ordenDeCompra);
=======
    @WebMethod(operationName = "modificarMoneda")
    public int modificarMoneda(@WebParam(name = "moneda")Moneda moneda){
        int resultado = 0;
        try{
            resultado = daoMoneda.modificarMoneda(moneda);
>>>>>>> 5571f3f43f131e48c46d65f50e6194fdc066c615
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
<<<<<<< HEAD
    @WebMethod(operationName = "eliminarOrdenDeCompra")
    public int eliminarOrdenDeCompra(@WebParam(name = "idOrdenDeCompra") int idOrdenDeCompra) {
        int resultado = 0;
        try{
            resultado = daoOrdenDeCompra.eliminar(idOrdenDeCompra);
=======
    @WebMethod(operationName = "eliminarMoneda")
    public int eliminarMoneda(@WebParam(name = "producto") int id) {
        int resultado = 0;
        try{
            resultado = daoMoneda.eliminarMoneda(id);
>>>>>>> 5571f3f43f131e48c46d65f50e6194fdc066c615
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
<<<<<<< HEAD
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
    
=======
    
    @WebMethod(operationName = "listarMonedaXNombre")
    public ArrayList<Moneda> listarMonedaXNombre(@WebParam(name = "nombre") String nombre) {
        ArrayList<Moneda> monedas = new ArrayList<Moneda>();
        try{
            monedas = daoMoneda.listarMonedaXNombre(nombre);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return monedas;
    }
    
    //Gestionar tipo de cambio//
    
    @WebMethod(operationName = "insertarTipoDeCambio")
    public int insertarTipoDeCambio(@WebParam(name = "tipoDeCambio")TipoDeCambio tipoDeCambio){
        int resultado = 0;
        try{
            resultado = daoTipoDeCambio.insertarTipoDeCambio(tipoDeCambio);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "modificarTipoDeCambio")
    public int modificarTipoDeCambio(@WebParam(name = "tipoDeCambio")TipoDeCambio tipoDeCambio){
        int resultado = 0;
        try{
            resultado = daoTipoDeCambio.modificarTipoDeCambio(tipoDeCambio);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "eliminarTipoDeCambio")
    public int eliminarTipoDeCambio(@WebParam(name = "tipoDeCambio") int id) {
        int resultado = 0;
        try{
            resultado = daoTipoDeCambio.eliminarTipoDeCambio(id);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "listarTipoDeCambioXNombre")
    public ArrayList<TipoDeCambio> listarTipoDeCambioXNombre(@WebParam(name = "nombre") String nombre) {
        ArrayList<TipoDeCambio> tiposDeCambio = new ArrayList<TipoDeCambio>();
        try{
            tiposDeCambio = daoTipoDeCambio.listarTipoDeCambioXNombre(nombre);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return tiposDeCambio;
    }
    
    
    //GESTIONAR RECLAMO//
    @WebMethod(operationName = "insertarReclamo")
    public int insertarReclamo(@WebParam(name = "reclamo")Reclamo reclamo){
        int resultado = 0;
        try{
            resultado = daoReclamo.insertarReclamo(reclamo);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "modificarReclamo")
    public int modificarReclamo(@WebParam(name = "reclamo")Reclamo reclamo){
        int resultado = 0;
        try{
            resultado = daoReclamo.modificarReclamo(reclamo);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "eliminarReclamo")
    public int eliminarReclamo(@WebParam(name = "reclamo") int id) {
        int resultado = 0;
        try{
            resultado = daoReclamo.eliminarReclamo(id);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "listarReclamoxOrden")
    public ArrayList<Reclamo> listarReclamoxOrden(@WebParam(name = "IdOrden") int IdOrden) {
        ArrayList<Reclamo> reclamos = new ArrayList<Reclamo>();
        try{
            reclamos = daoReclamo.listarReclamoxOrden(IdOrden);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return reclamos;
    }
    
    @WebMethod(operationName = "listarReclamoTodos")
    public ArrayList<Reclamo> listarReclamoTodos() {
        ArrayList<Reclamo> reclamos = new ArrayList<Reclamo>();
        try{
            reclamos = daoReclamo.listarReclamoTodos();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return reclamos;
    }
    
    //Gestionar devolución//
    @WebMethod(operationName = "insertarDevolucion")
    public int insertarDevolucion(@WebParam(name = "devolucion")Devolucion devolucion){
        int resultado = 0;
        try{
            resultado = daoDevolucion.insertarDevolucion(devolucion);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "modificarDevolucion")
    public int modificarDevolucion(@WebParam(name = "devolucion")Devolucion devolucion){
        int resultado = 0;
        try{
            resultado = daoDevolucion.modificarDevolucion(devolucion);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "eliminarDevolucion")
    public int eliminarDevolucion(@WebParam(name = "devolucion") int id) {
        int resultado = 0;
        try{
            resultado = daoDevolucion.eliminarDevolucion(id);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "listarDevolucionXReclamo")
    public ArrayList<Devolucion> listarDevolucionXReclamo(@WebParam(name = "idReclamo") int idReclamo) {
        ArrayList<Devolucion> devoluciones = new ArrayList<Devolucion>();
        try{
            devoluciones = daoDevolucion.listarDevolucionXReclamo(idReclamo);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return devoluciones;
    }
    
    @WebMethod(operationName = "listarTodosDevolucion")
    public ArrayList<Devolucion> listarTodosDevolucion() {
        ArrayList<Devolucion> devoluciones = new ArrayList<Devolucion>();
        try{
            devoluciones = daoDevolucion.listarTodosDevolucion();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return devoluciones;
    }
>>>>>>> 5571f3f43f131e48c46d65f50e6194fdc066c615
}

