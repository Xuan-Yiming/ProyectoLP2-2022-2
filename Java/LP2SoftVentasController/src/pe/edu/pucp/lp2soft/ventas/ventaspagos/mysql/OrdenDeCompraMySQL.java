package pe.edu.pucp.lp2soft.ventas.ventaspagos.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import pe.edu.pucp.lp2soft.config.DBManager;
import pe.edu.pucp.lp2soft.enums.Categoria;
import pe.edu.pucp.lp2soft.enums.TipoDeDocumento;
import pe.edu.pucp.lp2soft.gestclientes.model.Cliente;
import pe.edu.pucp.lp2soft.gestclientes.model.Empresa;
import pe.edu.pucp.lp2soft.gestclientes.model.PersonaNatural;
import pe.edu.pucp.lp2soft.rrhh.model.Vendedor;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Pedido;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.FormaDeEntrega;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.Moneda;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.dao.OrdenDeCompraDAO;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.OrdenDeCompra;

public class OrdenDeCompraMySQL implements OrdenDeCompraDAO {
    private Connection con;
    private CallableStatement cs;
    private ResultSet rs;

    @Override
    public int insertar(OrdenDeCompra ordenDeCompra) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call INSERTAR_ORDEN_DE_COMPRA(?,?,?,?,?,?,?,?,?,?,?,?)}");
            cs.registerOutParameter("_id_orden_de_compra", java.sql.Types.INTEGER);            
            cs.setInt("_fid_cliente", ordenDeCompra.getCliente().getIdCliente());
            cs.setInt("_fid_vendedor", ordenDeCompra.getVendedor().getIdUsuario());
            cs.setInt("_fid_moneda", ordenDeCompra.getMoneda().getIdMoneda());
            cs.setDouble("_monto", ordenDeCompra.getMonto());
            cs.setString("_direccion_de_entrega", ordenDeCompra.getDireccionDeEntrega());
            cs.setString("_forma_de_entrega", ordenDeCompra.getFormaDeEntrega().name());
            cs.setDate("_fecha_de_compra", new java.sql.Date(ordenDeCompra.getFechaDeCompra().getTime()));
            cs.setDate("_fecha_de_entrega", new java.sql.Date(ordenDeCompra.getFechaDeEntrega().getTime()));
            cs.setDate("_fecha_limite", new java.sql.Date(ordenDeCompra.getFechaLimite().getTime()));
            cs.setBoolean("_pagado", ordenDeCompra.isPagado());
            cs.setBoolean("_activo", ordenDeCompra.getActivo());
            
            cs.executeUpdate();
            ordenDeCompra.setIdOrdenDeCompra(cs.getInt("_id_orden_de_compra"));
            resultado = ordenDeCompra.getIdOrdenDeCompra();
            
            for(Pedido pedido : ordenDeCompra.getPedidos()){
                cs = con.prepareCall("{call INSERTAR_PEDIDO(?,?,?,?,?,?)}");
                cs.registerOutParameter("_id_pedido", java.sql.Types.INTEGER);
                cs.setInt("_fid_orden_de_compra", ordenDeCompra.getIdOrdenDeCompra());
                cs.setInt("_fid_producto", pedido.getProducto().getIdProducto());
                cs.setInt("_cantidad", pedido.getCantidad());
                cs.setDouble("_descuento", pedido.getDescuento());
                cs.setBoolean("_activo", pedido.getActivo());
                cs.executeUpdate();
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{
                con.close();
            }catch(Exception ex){
                System.out.println(ex.getMessage());
            }
        }
        return resultado;
    }

    @Override
    public int eliminar(int id) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call ELIMINAR_ORDEN_DE_COMPRA(?)}");
            cs.setInt("_id_orden_de_compra", id);
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{
                con.close();
            }catch(Exception ex){
                System.out.println(ex.getMessage());
            }
        }
        return resultado;
    }

    @Override
    public ArrayList<OrdenDeCompra> listarTodos() {
        ArrayList<OrdenDeCompra> ordenes = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_ORDEN_DE_COMPRA()}");
            rs = cs.executeQuery();
            while(rs.next()){
                OrdenDeCompra orden = new OrdenDeCompra();
                orden.setIdOrdenDeCompra(rs.getInt("id_orden_de_compra"));
                orden.setFechaDeCompra(rs.getDate("fecha_de_compra"));
                orden.setMoneda(new Moneda());
                orden.getMoneda().setNombre(rs.getString("nombreMoneda"));
                orden.setMonto(rs.getDouble("monto"));      
                ordenes.add(orden);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return ordenes;
    }
	
	@Override
    public ArrayList<OrdenDeCompra> listarPorCliente(int idCliente) {
        ArrayList<OrdenDeCompra> ordenes = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_ORDENES_DE_COMPRA_X_CLIENTE(?)}");
            cs.setInt("_id_cliente",idCliente);
            rs = cs.executeQuery();
            while(rs.next()){
                OrdenDeCompra orden = new OrdenDeCompra();
                orden.setIdOrdenDeCompra(rs.getInt("id_orden_de_compra"));
                orden.setMonto(rs.getDouble("monto"));
                orden.setMoneda(new Moneda());
                orden.getMoneda().setNombre(rs.getString("nombreMoneda"));
                orden.setFechaDeCompra(rs.getDate("fecha_de_compra"));
                orden.setMonto(rs.getInt("monto"));
                if(rs.getString("razon_social") != null){
                    Empresa empresa = new Empresa();
                    empresa.setRazonSocial(rs.getString("razon_social"));
                    orden.setCliente(empresa);
                }
                else{
                    PersonaNatural personaNatural = new PersonaNatural();
                    personaNatural.setNombre(rs.getString("nombrePersonaNatural"));
                    personaNatural.setApellido(rs.getString("apellidoPersonaNatural"));
                    orden.setCliente(personaNatural);
                }
                ordenes.add(orden);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return ordenes;
    }
	
	@Override
    public ArrayList<OrdenDeCompra> listarPorFecha(Date fecha) {
        ArrayList<OrdenDeCompra> ordenes = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_ORDENES_DE_COMPRA_X_FECHA(?)}");
            cs.setDate("_fecha", (java.sql.Date) fecha);
            rs = cs.executeQuery();
            while(rs.next()){
                OrdenDeCompra orden = new OrdenDeCompra();
                orden.setIdOrdenDeCompra(rs.getInt("id_orden_de_compra"));
                orden.setMonto(rs.getDouble("monto"));
                orden.setMoneda(new Moneda());
                orden.getMoneda().setNombre(rs.getString("nombreMoneda"));
                orden.setFechaDeCompra(rs.getDate("fecha_de_compra"));
                orden.setMonto(rs.getInt("monto"));
                if(rs.getString("razon_social") != null){
                    Empresa empresa = new Empresa();
                    empresa.setRazonSocial(rs.getString("razon_social"));
                    orden.setCliente(empresa);
                }
                else{
                    PersonaNatural personaNatural = new PersonaNatural();
                    personaNatural.setNombre(rs.getString("nombrePersonaNatural"));
                    personaNatural.setApellido(rs.getString("apellidoPersonaNatural"));
                    orden.setCliente(personaNatural);
                }     
                ordenes.add(orden);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return ordenes;
    }
	@Override
    public ArrayList<OrdenDeCompra> listarUltimas50() {
        ArrayList<OrdenDeCompra> ordenes = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_ULTIMAS_50_VENTAS()}");
            rs = cs.executeQuery();
            while(rs.next()){
                OrdenDeCompra orden = new OrdenDeCompra();
                orden.setIdOrdenDeCompra(rs.getInt("id_orden_de_compra"));
                orden.setFechaDeCompra(rs.getDate("fecha_de_compra"));
                orden.setFechaDeEntrega(rs.getDate("fecha_de_entrega"));
                orden.setFechaLimite(rs.getDate("fecha_limite"));
                orden.setDireccionDeEntrega(rs.getString("direccion_de_entrega"));
                orden.setFormaDeEntrega(FormaDeEntrega.valueOf(rs.getString("forma_de_entrega")));
                orden.setPagado(rs.getBoolean("pagado"));
                orden.setMoneda(new Moneda());
                orden.getMoneda().setNombre(rs.getString("nombreMoneda"));
                orden.setMonto(rs.getDouble("monto"));
                orden.setVendedor(new Vendedor());
                orden.getVendedor().setIdPersona(rs.getInt("id_persona"));
                orden.getVendedor().setNombre(rs.getString("nombreVendedor"));
                orden.getVendedor().setApellido(rs.getString("apellidoVendedor"));
                if(rs.getString("razon_social") != null){
                    Empresa empresa = new Empresa();
                    empresa.setIdCliente(rs.getInt("id_cliente"));
                    empresa.setCategoria(Categoria.valueOf(rs.getString("categoria")));
                    empresa.setRazonSocial(rs.getString("razon_social"));
                    empresa.setRUC(rs.getString("RUC"));
                    orden.setCliente(empresa);
                }
                else{
                    PersonaNatural personaNatural = new PersonaNatural();
                    personaNatural.setIdCliente(rs.getInt("id_cliente"));
                    personaNatural.setCategoria(Categoria.valueOf(rs.getString("categoria")));
                    personaNatural.setNumDeDocumento(rs.getString("numero_de_documento"));
                    personaNatural.setTipoDeDocumento(TipoDeDocumento.valueOf(rs.getString("tipo_de_documento")));
                    personaNatural.setNombre(rs.getString("nombrePersonaNatural"));
                    personaNatural.setApellido(rs.getString("apellidoPersonaNatural"));
                    personaNatural.setTelefono(rs.getString("telefono"));
                    orden.setCliente(personaNatural);
                }
                ordenes.add(orden);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{rs.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return ordenes;
    }
	
}
