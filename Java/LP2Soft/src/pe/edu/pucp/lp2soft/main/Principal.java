   package pe.edu.pucp.lp2soft.main;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
   
//import pe.edu.pucp.lp2soft.gestclientes.dao.ClienteDAO;
//
//import pe.edu.pucp.lp2soft.gestclientes.model.PersonaNatural;
//import pe.edu.pucp.lp2soft.gestclientes.mysql.ClienteMySQL;
//   
//import pe.edu.pucp.lp2soft.enums.Categoria;
//import pe.edu.pucp.lp2soft.rrhh.model.TipoDeDocumento;
//import pe.edu.pucp.lp2soft.rrhh.dao.UsuarioDAO;
//import pe.edu.pucp.lp2soft.rrhh.model.Administrador;
//import pe.edu.pucp.lp2soft.rrhh.mysql.UsuarioMySQL;
//import pe.edu.pucp.lp2soft.rrhh.model.Sexo;
//import pe.edu.pucp.lp2soft.gestclientes.model.Area;
import pe.edu.pucp.lp2soft.rrhh.model.SupervisorDeAlmacen;
//import pe.edu.pucp.lp2soft.rrhh.model.Usuario;
//import pe.edu.pucp.lp2soft.rrhh.model.Vendedor;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Almacen;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Producto;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.Stock;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.dao.AlmacenDAO;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.dao.ProductoDAO;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.dao.StockDAO;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.mysql.AlmacenMySQL;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.mysql.ProductoMySQL;
import pe.edu.pucp.lp2soft.ventas.manejoproductos.mysql.StockMySQL;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.Moneda;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.TipoDeCambio;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.dao.MonedaDAO;
import pe.edu.pucp.lp2soft.ventas.ventaspagos.mysql.MonedaMySQL;
public class Principal {
    public static void main(String[] args) throws Exception{
        Date date = new Date(); 
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

        MonedaDAO daoMoneda = new MonedaMySQL();

          ArrayList<Moneda> monedas = new ArrayList<Moneda>();
          monedas=daoMoneda.listarMonedaUltimoTipoDeCambio();

          for(Moneda moneda : monedas){
            ArrayList<TipoDeCambio> tiposDeCambio = new ArrayList<TipoDeCambio>();
            tiposDeCambio= moneda.getCambios();

            System.out.println(moneda.getIdMoneda()+ " " + 
                    moneda.getNombre()+ " " + 
                    moneda.getAbreviatura()+ " : " 
                    );

            for(TipoDeCambio tipoDeCambio : tiposDeCambio){
                System.out.println(tipoDeCambio.getFecha()+ " " + 
                    tipoDeCambio.getCambio());
            }

        }
        
        //daoStock.modificar(s, 1);

        
        //daoProducto.modificar(p);
//        
//        ArrayList<Producto> ps = new ArrayList<Producto>();
//        ps = daoProducto.listarPorNombre("");
//        
//        for(Producto pr : ps){
//            System.out.println(pr.getNombre());
//        }
//        UsuarioDAO daocliente = new UsuarioMySQL();
        
//        p.setActivo(true);
//        p.setApellido("Xuan");
//
//        p.setDireccion("san isidro");
//        p.setEmail("yxuan@pucp.edu.pe");
//         
//        p.setFechaDeNacimiento(date);
//        p.setNombre("yiming");
//        p.setNumDeDocumento("20190768");
//        p.setSexo(Sexo.Masculino);
//        p.setTelefono("933754567");
//        p.setTipoDeDocumento(TipoDeDocumento.CE);
        //p.setCantidadVentas(100);
        
        //p.setArea(Area.Sistemas);

//        p.setUsername("almacen");
//        p.setPassword("123456");
//        p.setFechaIngreso(date);       
//        p.setFotoPerfil(null);
        
        
        
        //daocliente.modificarUsuario(p);
        //ArrayList<Usuario> u = daocliente.listarPorDocumentoNombre("");
        //Administrador a = (Administrador) daocliente.verificar(p);
        //System.out.println(a);
        
//        //Creamos un dao de conexión con Empresa
//        EmpresaDAO daoEmpresa = new EmpresaMySQL();
//        //Creamos objetos Empresa
//        Empresa empresa1 = new Empresa("Cat1",true,"42492414144","LAIVE PERU S.A.C.","Av. Universitaria 2354");
//        Empresa empresa2 = new Empresa("Cat2",true,"20489456412","D'AROMAS E.I.R.L","El Rimac, Breña 15083");
//       
//        
//        
//        //INSERTAR EMPRESA
//        resultado1 = daoEmpresa.insertar(empresa1);
//        resultado2 = daoEmpresa.insertar(empresa2);
//        if(resultado1==1 && resultado2==1){
//            System.out.println("Se ha insertado con éxito a empresa: " + empresa1.getRazonSocial() );
//            System.out.println("Se ha insertado con éxito a empresa: " + empresa2.getRazonSocial() ); 
//        }
//        else
//            System.out.println("El insert Empresa ha fallado...");
//        
//        //LISTAR EMPRESAS
//        ArrayList<Empresa> empresas = daoEmpresa.listarTodas();
//        for(Empresa empresa : empresas){
//            System.out.println(empresa.getIdCliente()+ " " + 
//                    empresa.getCategoria()+ " " + 
//                    empresa.getRUC()+ " " +
//                    empresa.getRazonSocial());
//        }
//        
//        
//        //MODIFICAR EMPRESA
//        empresa1.setCategoria("catA");
//        daoEmpresa.modificar(empresa1);
//        
//        //ELIMINAR EMPRESA
//        resultado1 = daoEmpresa.eliminar(empresa1.getIdCliente());
//        if(resultado1 == 1)
//            System.out.println("Se ha eliminado correctamente a: " + empresa1.getRazonSocial());
//   
//        System.out.println("##################################################################################");
//        
//        //###########################################################################################################################################
//        
//        //Creamos un dao de conexión con Persona Natural
//        PersonaNaturalDAO daoPersonaNatural = new PersonaNaturalMySQL();
//        //Creamos objetos PersonaNatural
//        PersonaNatural personaNatural1 = new PersonaNatural("Cat1",true,TipoDeDocumento.DNI,"12346457","Jose","Olaya",sdf.parse("10-03-1988"),"989752835","Av. Venezuela 452","jose88@gmail.com");
//        PersonaNatural personaNatural2 = new PersonaNatural("Cat2",true,TipoDeDocumento.Pasaporte,"ZAB00254","Sophia","Carbajales",sdf.parse("25-11-1995"),"989778455","Av. Jose Granda 154","sophia25@gmail.com");
//        
//        //INSERTAR PERSONA NATURAL
//        resultado1 = daoPersonaNatural.insertar(personaNatural1);
//        resultado2 = daoPersonaNatural.insertar(personaNatural2);
//        if(resultado1 == 1 && resultado2 == 1){
//            System.out.println("Se ha insertado con éxito a persona natural: " + personaNatural1.getNombre() );
//            System.out.println("Se ha insertado con éxito a persona natural: " + personaNatural2.getNombre() );
//        }
//        else
//            System.out.println("El insert Persona Natural ha fallado...");
//        
//        //LISTAR PERSONA NATURAL
//        ArrayList<PersonaNatural> personasNaturales = daoPersonaNatural.listarTodas();
//        for(PersonaNatural personaNatural : personasNaturales){
//            System.out.println(personaNatural.getIdCliente()+ " " + 
//                    personaNatural.getCategoria()+ " " + 
//                    personaNatural.getTipoDeDocumento()+ " : " +
//                    personaNatural.getNumDeDocumento()+ " " +
//                    personaNatural.getNombre()+ " " +
//                    personaNatural.getApellido());
//        }
//        
//        //MODIFICAR PERSONA NATURAL
//        personaNatural1.setCategoria("CatA");
//        daoPersonaNatural.modificar(personaNatural1);
//        
//        //ELIMINAR PERSONA NATURAL
//        resultado1 = daoPersonaNatural.eliminar(personaNatural1.getIdCliente());
//        if(resultado1 == 1)
//            System.out.println("Se ha eliminado correctamente a: " + personaNatural1.getNombre()+" "+personaNatural1.getApellido());
//          
//        System.out.println("##################################################################################");
//        
//        //###########################################################################################################################################
////        
//        //Creamos un dao de conexión con Vendedor
//        VendedorDAO daoVendedor = new VendedorMySQL();
//        //Creamos objetos Vendedor
//        Vendedor vendedor1 = new Vendedor(TipoDeDocumento.DNI, "73849281", "Joel", "Aquino",sdf.parse("10-03-1998"),"989111135","Av. Arequipa 112", "jkl123@gmail.com", true,"jaq1998","contrasena17", sdf.parse("10-03-2022"),0);
//        Vendedor vendedor2 = new Vendedor(TipoDeDocumento.DNI, "73849281", "Joel", "Aquino",sdf.parse("10-03-1998"),"989111135","Av. Arequipa 112", "jkl123@gmail.com", true,"jaq1998","contrasena17", sdf.parse("10-03-2022"),0);
//        
//        //INSERTAR VENDEDOR
//        resultado1 = daoVendedor.insertar(vendedor1);
//        resultado2 = daoVendedor.insertar(vendedor2);
//        if(resultado1 == 1 && resultado2 == 1){
//            System.out.println("Se ha insertado con éxito a vendedor: " + vendedor1.getNombre() );
//            System.out.println("Se ha insertado con éxito a vendedor: " + vendedor2.getNombre() );
//        }
//        else
//            System.out.println("El insert Vendedor ha fallado...");
//        
//        //LISTAR VENDEDOR
//        ArrayList<Vendedor> vendedores = daoVendedor.listarTodos();
//        for(Vendedor vendedor : vendedores){
//            System.out.println(vendedor.getIdUsuario()+ " " + 
//                    vendedor.getCantidadVentas()+ " " + 
//                    vendedor.getPassword()+ " : " +
//                    vendedor.getUsername()+ " " +
//                    vendedor.getFechaIngreso()+ " " +
//                    vendedor.getTipoDeDocumento()+ " "+
//                    vendedor.getNumDeDocumento()+ " "+
//                    vendedor.getNombre()+" "+
//                    vendedor.getApellido()+" "+
//                    vendedor.getFechaDeNacimiento()+" "+
//                    vendedor.getTelefono()+" "+
//                    vendedor.getDireccion()+" "+
//                    vendedor.getEmail()+" ");
//        }
//        
//        //MODIFICAR VENDEDOR
//        vendedor1.setCantidadVentas(3);
//        daoVendedor.modificar(vendedor1);
//        
//        //ELIMINAR VENDEDOR
//        resultado1 = daoVendedor.eliminar(vendedor1.getIdUsuario(),vendedor1.getCantidadVentas());
//        if(resultado1 == 1)
//            System.out.println("Se ha eliminado correctamente a: " + vendedor1.getNombre()+" "+vendedor1.getApellido());
//        
//        System.out.println("##################################################################################");
//        
//
//        //###########################################################################################################################################
        
        //Creamos un dao de conexión con Administrador
//        AdministradorDAO daoAdministrador = new AdministradorMySQL();
        //Creamos objetos Administrador
//        Administrador admin1 = new Administrador(TipoDeDocumento.Pasaporte, "P1200254", "Pedro", "Aquino",sdf.parse("10-03-1998"),"987771135","Av. Castillo 182", "jkl123@gmail.com", true,"jaq1998","contrasena17", sdf.parse("10-03-2022"), "RECURSOS HUMANOS");
        //Administrador admin2 = new Administrador(TipoDeDocumento.DNI, "74623938", "Juana", "Galvez",sdf.parse("10-10-1988"),"987234561","Av. Arequipa 112", "juana123@gmail.com", true,"jgalvez1","pollo17", sdf.parse("15-09-2022"), "FINANZAS");
        
        //INSERTAR ADMINISTRADOR
//        resultado1 = daoAdministrador.insertar(admin1);
//        resultado2 = daoAdministrador.insertar(admin2);
//        if(resultado1 == 1 && resultado2 == 1){
//            System.out.println("Se ha insertado con éxito a administrador: " + admin1.getNombre());
//            System.out.println("Se ha insertado con éxito a administrador: " + admin2.getNombre());
//        }
//        else
//            System.out.println("El insert Administrador ha fallado...");
//        
//        //LISTAR ADMINISTRADORES
//    UsuarioDAO daoUsuario = new UsuarioMySQL();
//        ArrayList<Usuario> usuarios = daoUsuario.listarPorDocumentoNombre("");
//        for(Usuario usuario : usuarios){
//            System.out.println(usuario.getIdUsuario()+ " " + 
//                    usuario.getTipoDeDocumento()+ " : " +
//                    usuario.getNumDeDocumento()+ " " +
//                    usuario.getNombre()+ " " +
//                    usuario.getApellido()+ " " +
//                    usuario.getUsername());
//        }
//        

//        admin1.setTipoDeDocumento(TipoDeDocumento.DNI);
//        //MODIFICAR ADMINISTRADOR
//        admin1.setArea("LOGISTICA");
//        daoAdministrador.modificar(admin1);
        
        
        
//        //ELIMINAR ADMINISTRADOR
//        resultado1 = daoAdministrador.eliminar(admin1.getIdUsuario(), admin1.getArea());
//        if(resultado1 == 1)
//            System.out.println("Se ha eliminado correctamente a: " + admin1.getNombre()+" "+admin1.getApellido()+"("+ admin1.getArea() +")");
//        
//        System.out.println("##################################################################################");
//        
//        //###########################################################################################################################################
//        
//        //Creamos un dao de conexión con Almacen
//        AlmacenDAO daoalmacen = new AlmacenMySQL();
//        //Creo Almacen
//        
//        Almacen almacen1 = new Almacen("Joyas Almacen","PUCP");
//        Almacen almacen2 = new Almacen("Almacen Secundario","PUCP");
//        
//        //INSERTAR alamcen
//        resultado1 = daoalmacen.insertar(almacen1);
//        resultado2 = daoalmacen.insertar(almacen2);
//        if(resultado1 == 1 && resultado2 == 1){
//            System.out.println("Se ha insertado con éxito a almacen: " + almacen1.getNombre() );
//            System.out.println("Se ha insertado con éxito a almacen: " + almacen2.getNombre() );
//        }
//        else
//            System.out.println("El insert Almacen ha fallado...");
//        
//        //LISTAR super
//        ArrayList<Almacen> almacenes = daoalmacen.listarTodos();
//        for(Almacen almacen : almacenes){
//            System.out.println(almacen.getId()+ " " + 
//                    almacen.getNombre()+" "+
//                    almacen.getDireccion());
//        }
//        
//        //MODIFICAR almacen
//        almacen1.setDireccion("PLaza San Miguel");
//        daoalmacen.modificar(almacen1);
//        
//        //ELIMINAR almacen
//        resultado1 = daoalmacen.eliminar(almacen1.getId());
//        if(resultado1 == 1)
//            System.out.println("Se ha eliminado correctamente a: " + almacen1.getNombre()+" "+almacen1.getDireccion());
//        
//        System.out.println("##################################################################################");
//        
//        //###########################################################################################################################################
////        
////        
//        //Creamos un dao de conexión con Supervisor de Almacen
//        SupervisorDeAlmacenDAO daosuper = new SupervisorDeAlmacenMySQL();
//        //Creamos objetos supervisor
//        
//        SupervisorDeAlmacen super1 = new SupervisorDeAlmacen(TipoDeDocumento.DNI, "74263764", "Yiming", "Xuan",sdf.parse("10-03-2000"),"989111135","Av. Arequipa 112", "jkl123@gmail.com", true,"jaq1998","contrasena17", sdf.parse("10-03-2022"),almacen2);
//        SupervisorDeAlmacen super2 = new SupervisorDeAlmacen(TipoDeDocumento.DNI, "73849281", "Joel", "Aquino",sdf.parse("10-03-1998"),"989111135","Av. Arequipa 112", "jkl123@gmail.com", true,"jaq1998","contrasena17", sdf.parse("10-03-2022"),almacen2);
//        
//        //INSERTAR super
//        resultado1 = daosuper.insertar(super1);
//        resultado2 = daosuper.insertar(super2);
//        if(resultado1 == 1 && resultado2 == 1){
//            System.out.println("Se ha insertado con éxito a supervisor de almacen: " + super1.getNombre() );
//            System.out.println("Se ha insertado con éxito a supervisor de almacen: " + super2.getNombre() );
//        }
//        else
//            System.out.println("El insert supervisor ha fallado...");
//        
//        //LISTAR super
//        ArrayList<SupervisorDeAlmacen> supervisores = daosuper.listarTodos();
//        for(SupervisorDeAlmacen supervisor : supervisores){
//            System.out.println(supervisor.getIdUsuario()+ " " + 
//                    supervisor.getNombre()+" "+
//                    supervisor.getApellido()+" "+
//                    supervisor.getTelefono()+" "+
//                    supervisor.getDireccion()+" "+
//                    supervisor.getEmail()+" "+
//                    supervisor.getFechaDeNacimiento()+" "+
//                    supervisor.getTipoDeDocumento()+ " "+
//                    supervisor.getNumDeDocumento()+ " "+
//                    supervisor.getUsername()+ " " +
//                    supervisor.getPassword()+ " : " +
//                    supervisor.getFechaIngreso()+ " " +
//                    supervisor.getAlmacen().getId());
//        }
//        
//        //MODIFICAR SUPERVISOR
//        super1.setEmail("a20180824@pucp.edu.pe");
//        daosuper.modificar(super1);
//        
//        //ELIMINAR supervisor
//        resultado1 = daosuper.eliminar(super1.getIdUsuario(),super1.getAlmacen().getId());
//        if(resultado1 == 1)
//            System.out.println("Se ha eliminado correctamente a: " + super1.getNombre()+" "+super1.getApellido());
//        
//        
//        System.out.println("##################################################################################");
//        
//        //###########################################################################################################################################
//        
//        //        //Creamos un dao de conexión con Producto
//        ProductoDAO daoproducto = new ProductoMySQL();
//        //Creo producto 
//        
//        Producto producto1 = new Producto(almacen1.getId(),"2204", "Sabana", 15.2, 16,sdf.parse("10-03-2000"));
//        Producto producto2 = new Producto(almacen1.getId(),"2205", "Almohada",8.9, 9.6,sdf.parse("15-03-1998"));
//        
//        //INSERTAR producto
//        resultado1 = daoproducto.insertar(producto1);
//        resultado2 = daoproducto.insertar(producto2);
//        if(resultado1 == 1 && resultado2 == 1){
//            System.out.println("Se ha insertado con éxito al producto: " + producto1.getNombre() );
//            System.out.println("Se ha insertado con éxito al producto: " + producto2.getNombre() );
//        }
//        else
//            System.out.println("El insert producto ha fallado...");
//        
//        //LISTAR super
//        ArrayList<Producto> productos = daoproducto.listarTodos();
//        for(Producto producto : productos){
//            System.out.println(producto.getId()+ " " + 
//                    producto.getIdAlamcen()+" "+
//                    producto.getCodigoLote()+" "+
//                    producto.getNombre()+" "+
//                    producto.getPrecio()+" "+
//                    producto.getFechaDeIngreso()+" "+
//                    producto.isDevuelto());
//        }
//        
//        //MODIFICAR producto
//        producto1.setNombre("Sabana blanca");
//        daoproducto.modificar(producto1);
//        
//        //ELIMINAR supervisor
//        resultado1 = daoproducto.eliminar(producto1.getId());
//        if(resultado1 == 1)
//            System.out.println("Se ha eliminado correctamente a: " + producto1.getNombre()+" "+producto1.getCodigoLote());
//
//        System.out.println("##################################################################################");
//       
//        //###########################################################################################################################################
//        
//        
//        //Creamos un dao de conexión con Moneda
//        MonedaDAO daoMoneda = new MonedaMySQL();
//        //Creamos objetos Moneda     
//        
//        Moneda mon1 = new Moneda("Soles peruanos", "PEN",true);
//        Moneda mon2 = new Moneda("Dolares americanos", "DOL",true);
//        
//        //INSERTAR MONEDA
//        resultado1 = daoMoneda.insertar(mon1);
//        resultado2 = daoMoneda.insertar(mon2);
//        if(resultado1 == 1 && resultado2 == 1){
//            System.out.println("Se ha insertado con éxito moneda: " + mon1.getNombre());
//            System.out.println("Se ha insertado con éxito moneda: " + mon2.getNombre());
//        }
//        else
//            System.out.println("El insert Moneda ha fallado...");
//        
//        //LISTAR MONEDA
//        ArrayList<Moneda> monedas = daoMoneda.listarTodos();
//        for(Moneda moneda : monedas){
//            System.out.println(moneda.getId()+ " " + 
//                    moneda.getNombre()+ " " +
//                    moneda.getAbreviatura());           
//        }
//        
//        //MODIFICAR MONEDA
//        mon1.setAbreviatura("SOL");
//        daoMoneda.modificar(mon1);
//        
//        //ELIMINAR MONEDA
//        resultado1 = daoMoneda.eliminar(mon2.getId());
//        if(resultado1 == 1)
//            System.out.println("Se ha eliminado correctamente a: " + mon2.getId());
//
//        System.out.println("##################################################################################");
//
//        
//
//        //###########################################################################################################################################
//        
//        //Creamos un dao de conexión con OrdenDeCompra
//        OrdenDeCompraDAO daoOrdenDeCompra = new OrdenDeCompraMySQL();
//        //Creamos objetos OrdenDeCompra     
//        
//        OrdenDeCompra orden1 = new OrdenDeCompra(empresa1.getIdCliente(), vendedor1.getIdUsuario(), 2000, mon1,
//            "Alameda Huaylas", FormaDeEntrega.EnAlmacen , sdf.parse("10-01-2022"), sdf.parse("10-12-2022"),
//            false, true);
//        
//        OrdenDeCompra orden2 = new OrdenDeCompra(empresa2.getIdCliente(), vendedor2.getIdUsuario(), 4000, mon1,
//            "Av Peruanos", FormaDeEntrega.ADestino , sdf.parse("15-01-2022"), sdf.parse("16-12-2022"),
//            false, true);
//        
//        //INSERTAR OrdenDeCompra
//        resultado1 = daoOrdenDeCompra.insertar(orden1);
//        resultado2 = daoOrdenDeCompra.insertar(orden2);
//        if(resultado1 == 1 && resultado2 == 1){
//            System.out.println("Se ha insertado con éxito la orden de compra: " + orden1.getId());
//            System.out.println("Se ha insertado con éxito la orden de compra: " + orden2.getId());
//        }
//        else
//            System.out.println("El insert OrdenDeCompra ha fallado...");
//        
//        //LISTAR OrdenDeCompra
//        ArrayList<OrdenDeCompra> ordenesDeCompra = daoOrdenDeCompra.listarTodos();
//        for(OrdenDeCompra ordenDeCompra : ordenesDeCompra){
//            System.out.println(ordenDeCompra.getId()+ " " + 
//                    ordenDeCompra.getFormaDeEntrega()+ " " +
//                    ordenDeCompra.getMonto());           
//        }
//        
//        //MODIFICAR OrdenDeCompra
//        orden1.setMonto(5000.5);
//        daoOrdenDeCompra.modificar(orden1);
//        
//        //ELIMINAR OrdenDeCompra
//        resultado1 = daoOrdenDeCompra.eliminar(orden1.getId());
//        if(resultado1 == 1)
//            System.out.println("Se ha eliminado correctamente a: " + orden1.getId());
//        
//        System.out.println("##################################################################################");
//
// //###########################################################################################################################################
//
////        //Creamos un dao de conexión con pedido
////        PedidoDAO daopedido = new PedidoMySQL();
////        //Creo producto 
////        
////        Pedido pedido1 = new Pedido(producto1.getId(),orden1.getId(), 0.3);
////        Pedido pedido2 = new Pedido(producto1.getId(),orden2.getId(), 0.3);
////        
////        //INSERTAR pedido
////        resultado1 = daopedido.insertar(pedido1);
////        resultado2 = daopedido.insertar(pedido2);
////        if(resultado1 == 1 && resultado2 == 1){
////            System.out.println("Se ha insertado con éxito a: " + pedido1.getId());
////            System.out.println("Se ha insertado con éxito a: " + pedido2.getId());
////        }
////        else
////            System.out.println("El insert producto ha fallado...");
////        
////        //LISTAR pedido
////        ArrayList<Pedido> pedidos = daopedido.listarTodos();
////        for(Pedido pedido : pedidos){
////            System.out.println(pedido.getId()+ " " + 
////                    pedido.getIdProducto()+" "+
////                    pedido.getIdOrdenDeCompra()+" "+
////                    pedido.getDescuento());
////        }
////        
////        //MODIFICAR pedido
////        pedido1.setDescuento(0.98);
////        daopedido.modificar(pedido1);
////        
////        //ELIMINAR pedido
////        resultado1 = daopedido.eliminar(pedido1.getId());
////        if(resultado1 == 1)
////            System.out.println("Se ha eliminado correctamente a: " + pedido1.getId());
////
////        System.out.println("##################################################################################");
//
//        //###########################################################################################################################################
//        
//        //Creamos un dao de conexión con TerminoDePago
//        TerminoDePagoDAO daoTerminoDePago = new TerminoDePagoMySQL();
//        //Creamos objetos TerminoDePago
//        
//        TerminoDePago termPago1 = new TerminoDePago(sdf.parse("15-01-2022"), 1, 200, true);
//        TerminoDePago termPago2 = new TerminoDePago(sdf.parse("15-10-2022"), 2, 500, true);
//  
//        //INSERTAR TERMINO DE PAGO
//        resultado1 = daoTerminoDePago.insertar(termPago1);
//        resultado2 = daoTerminoDePago.insertar(termPago2);
//        if(resultado1 == 1 && resultado2 == 1){
//            System.out.println("Se ha insertado con éxito el termino de pago: " + termPago1.getId());
//            System.out.println("Se ha insertado con éxito el termino de pago: " + termPago2.getId());
//        }
//        else
//            System.out.println("El insert Documento de Credito ha fallado...");
//        
//        //LISTAR TERMINO DE PAGO
//        ArrayList<TerminoDePago> terminosDePago = daoTerminoDePago.listarTodos();
//        for(TerminoDePago terminoDePago : terminosDePago){
//            System.out.println(terminoDePago.getId()+ " " + 
//                    terminoDePago.getNumeroCuota()+ " " +
//                    terminoDePago.getMontoCuota());           
//        }
//        
//        //MODIFICAR TERMINO DE PAGO
//        termPago1.setMontoCuota(700);
//        daoTerminoDePago.modificar(termPago1);
//        
//        //ELIMINAR TERMINO DE PAGO
//        resultado1 = daoTerminoDePago.eliminar(termPago2.getId());
//        if(resultado1 == 1)
//            System.out.println("Se ha eliminado correctamente a: " + termPago2.getId());
//
//        System.out.println("##################################################################################");
//    
//          //###########################################################################################################################################
//        
//        //Creamos un dao de conexión con DocumentoDebito
//        DocumentoDebitoDAO daoDocumentoDebito = new DocumentoDebitoMySQL();
//        //Creamos objetos DocumentoDebito
//        
//        DocumentoDebito docDeb1 = new DocumentoDebito(orden1.getId(), sdf.parse("15-01-2022"), sdf.parse("15-01-2023"), 5.4, 500,
//            mon1, 200, false, termPago1, true);
//        DocumentoDebito docDeb2 = new DocumentoDebito(orden1.getId(), sdf.parse("15-01-2021"), sdf.parse("15-10-2023"), 2.4, 150,
//            mon1, 250, false, termPago1, true);
//
//  
//        //INSERTAR DOCUMENTODEBITO
//        resultado1 = daoDocumentoDebito.insertar(docDeb1);
//        resultado2 = daoDocumentoDebito.insertar(docDeb2);
//        if(resultado1 == 1 && resultado2 == 1){
//            System.out.println("Se ha insertado con éxito al doc debito: " + docDeb1.getId());
//            System.out.println("Se ha insertado con éxito al doc debito: " + docDeb2.getId());
//        }
//        else
//            System.out.println("El insert Documento de DEBITO ha fallado...");
//        
//        //LISTAR DOCUMENTODEBITO
//        ArrayList<DocumentoDebito> documentosDebito = daoDocumentoDebito.listarTodos();
//        for(DocumentoDebito documentoDebito : documentosDebito){
//            System.out.println(documentoDebito.getId()+ " " + 
//                    documentoDebito.getIdOrdenDeCompra()+ " " +
//                    documentoDebito.getMonto());           
//        }
//        
//        //MODIFICAR DOCUMENTODEBITO
//        docDeb1.setMonto(700);
//        daoDocumentoDebito.modificar(docDeb1);
//        
////        //ELIMINAR DOCUMENTODEBITO
//        resultado1 = daoDocumentoDebito.eliminar(docDeb2.getId());
//        if(resultado1 == 1)
//            System.out.println("Se ha eliminado correctamente a: " + docDeb2.getId());
//
//        System.out.println("##################################################################################");
//        
//
////        //###########################################################################################################################################
////        
//        //Creamos un dao de conexión con DocumentoCredito
//        DocumentoCreditoDAO daoDocumentoCredito = new DocumentoCreditoMySQL();
//        //Creamos objetos DocumentoCredito
//        
//        DocumentoCredito docCred1 = new DocumentoCredito(orden1.getId(), docDeb1.getId(), sdf.parse("10-03-2022"), sdf.parse("10-03-2023"), 300, mon1, false, true);
//        DocumentoCredito docCred2 = new DocumentoCredito(orden1.getId(), docDeb1.getId(), sdf.parse("10-01-2022"), sdf.parse("10-12-2022"), 450, mon1, false, true);
//  
//        //INSERTAR DOCUMENTOCREDITO
//        resultado1 = daoDocumentoCredito.insertar(docCred1);
//        resultado2 = daoDocumentoCredito.insertar(docCred2);
//        if(resultado1 == 1 && resultado2 == 1){
//            System.out.println("Se ha insertado con éxito al doc credito: " + docCred1.getId());
//            System.out.println("Se ha insertado con éxito al doc credito: " + docCred2.getId());
//        }
//        else
//            System.out.println("El insert Documento de Credito ha fallado...");
//        
//        //LISTAR DOCUMENTOCREDITOS
//        ArrayList<DocumentoCredito> documentosCredito = daoDocumentoCredito.listarTodos();
//        for(DocumentoCredito documentoCredito : documentosCredito){
//            System.out.println(documentoCredito.getId()+ " " + 
//                    documentoCredito.getIdOrdenDeCompra()+ " " +
//                    documentoCredito.getMonto());           
//        }
//        
//        //MODIFICAR DOCUMENTOCREDITO
//        docCred1.setMonto(700);
//        daoDocumentoCredito.modificar(docCred1);
//        
////        //ELIMINAR DOCUMENTOCREDITO
//        resultado1 = daoDocumentoCredito.eliminar(docCred1.getId());
//        if(resultado1 == 1)
//            System.out.println("Se ha eliminado correctamente a: " + docCred1.getId());
//          
//        System.out.println("##################################################################################");
//        
//        //   ###########################################################################################################################################
//        
//        //Creamos un dao de conexión con TipoDeCambio
//        TipoDeCambioDAO daoTipoDeCambio = new TipoDeCambioMySQL();
//        //Creamos objetos TipoDeCambio
//        
//        TipoDeCambio tipoc1 = new TipoDeCambio(mon2.getId(), sdf.parse("09-03-2022"), 3.9, true);
//        TipoDeCambio tipoc2 = new TipoDeCambio(mon1.getId(), sdf.parse("10-03-2022"), 0.6, true);
//
//        //INSERTAR TIPODECAMBIO
//        resultado1 = daoTipoDeCambio.insertar(tipoc1);
//        resultado2 = daoTipoDeCambio.insertar(tipoc2);
//        if(resultado1 == 1 && resultado2 == 1){
//            System.out.println("Se ha insertado con éxito al tipo de cambio: " + tipoc1.getId());
//            System.out.println("Se ha insertado con éxito al tipo de cambio: " + tipoc2.getId());
//        }
//        else
//            System.out.println("El insert Tipo de Cambio ha fallado...");
//        
//        //LISTAR TIPODECAMBIOS
//        ArrayList<TipoDeCambio> tiposDeCambio = daoTipoDeCambio.listarTodos();
//        for(TipoDeCambio tipoDeCambio : tiposDeCambio){
//            System.out.println(tipoDeCambio.getId()+ " " + 
//                    tipoDeCambio.getIdMoneda()+ " " +
//                    tipoDeCambio.getCambio());           
//        }
//        
//        //MODIFICAR TIPODECAMBIO
//        tipoc1.setCambio(4.6);
//        daoTipoDeCambio.modificar(tipoc1);
//        
////        //ELIMINAR TIPODECAMBIO
//        resultado1 = daoTipoDeCambio.eliminar(tipoc2.getId());
//        if(resultado1 == 1)
//            System.out.println("Se ha eliminado correctamente a: " + tipoc2.getId());
//         
//        System.out.println("##################################################################################");
//
////###########################################################################################################################################
//
//        //Creamos un dao de conexión con pedido
//        PedidoDAO daopedido = new PedidoMySQL();
//        //Creo producto 
//        
//        Pedido pedido1 = new Pedido(producto2.getId(),orden2.getId(), 0.3);
//        Pedido pedido2 = new Pedido(producto2.getId(),orden2.getId(), 0.3);
//        
//        //INSERTAR pedido
//        resultado1 = daopedido.insertar(pedido1);
//        resultado2 = daopedido.insertar(pedido2);
//        if(resultado1 == 1 && resultado2 == 1){
//            System.out.println("Se ha insertado con éxito a pedido: " + pedido1.getId());
//            System.out.println("Se ha insertado con éxito a pedido: " + pedido2.getId());
//        }
//        else
//            System.out.println("El insert producto ha fallado...");
//        
//        //LISTAR pedido
//        ArrayList<Pedido> pedidos = daopedido.listarTodos();
//        for(Pedido pedido : pedidos){
//            System.out.println(pedido.getId()+ " " + 
//                    pedido.getIdProducto()+" "+
//                    pedido.getIdOrdenDeCompra()+" "+
//                    pedido.getDescuento());
//        }
//        
//        //MODIFICAR pedido
//        pedido1.setDescuento(0.98);
//        daopedido.modificar(pedido1);
//        
//        //ELIMINAR pedido
//        resultado1 = daopedido.eliminar(pedido1.getId());
//        if(resultado1 == 1)
//            System.out.println("Se ha eliminado correctamente a: " + pedido1.getId());
//        
//        System.out.println("##################################################################################");
//
// //###########################################################################################################################################
//
//        //Creamos un dao de conexión con reclamo
//        ReclamoDAO daoreclamo = new ReclamoMySQL();
//        
//        //Creo reclamo 
//        Reclamo reclamo1 = new Reclamo(orden2.getId(),sdf.parse("10-02-2022"),"Producto defectuoso");
//        Reclamo reclamo2 = new Reclamo(orden2.getId(),sdf.parse("10-03-2022"),"Producto defectuoso");
//        
//        //INSERTAR reclamo
//        resultado1 = daoreclamo.insertar(reclamo1);
//        resultado2 = daoreclamo.insertar(reclamo2);
//        if(resultado1 == 1 && resultado2 == 1){
//            System.out.println("Se ha insertado con éxito a reclamo: " + reclamo1.getId());
//            System.out.println("Se ha insertado con éxito a reclamo: " + reclamo2.getId());
//        }
//        else
//            System.out.println("El insert reclamo ha fallado...");
//        
//        //LISTAR reclamos
//        ArrayList<Reclamo> reclamos = daoreclamo.listarTodos();
//        for(Reclamo reclamo : reclamos){
//            System.out.println(reclamo.getId()+ " " + 
//                    reclamo.getId()+" "+
//                    reclamo.getIdOrdenDeCompra()+" "+
//                    reclamo.getFecha()+" "+
//                    reclamo.isAtendido()+" "+
//                    reclamo.getJustificacion());
//        }
//        
//        //MODIFICAR reclamo
//        reclamo1.setJustificacion("Producto faltante");
//        daoreclamo.modificar(reclamo1);
//        
//        //ELIMINAR reclamo
//        resultado1 = daoreclamo.eliminar(reclamo1.getId());
//        if(resultado1 == 1)
//            System.out.println("Se ha eliminado correctamente a: " + reclamo1.getId());
//        
//        System.out.println("##################################################################################");
//
//        //###########################################################################################################################################
//
//        //Creamos un dao de conexión con Devolucion
//        DevolucionDAO DaoDevolucion = new DevolucionMySQL();
//        
//        //Creo Devolucion 
//        Devolucion dev1 = new Devolucion(producto1.getId(), reclamo1.getId(), true);
//        Devolucion dev2 = new Devolucion(producto2.getId(), reclamo2.getId(), true);
//
//        
//        //INSERTAR Devolucion
//        resultado1 = DaoDevolucion.insertar(dev1);
//        resultado2 = DaoDevolucion.insertar(dev2);
//        if(resultado1 == 1 && resultado2 == 1){
//            System.out.println("Se ha insertado con éxito a devolucion: " + dev1.getId());
//            System.out.println("Se ha insertado con éxito a devolucion: " + dev2.getId());
//        }
//        else
//            System.out.println("El insert reclamo ha fallado...");
//        
//        //LISTAR Devolucion
//        ArrayList<Devolucion> devoluciones = DaoDevolucion.listarTodos();
//        for(Devolucion devolucion : devoluciones){
//            System.out.println(devolucion.getId()+ " " + 
//                    devolucion.getIdProducto()+" "+
//                    devolucion.getIdReclamo());
//        }
//        
//        //MODIFICAR Devolucion
//        dev1.setIdProducto(producto2.getId());
//        DaoDevolucion.modificar(dev1);
//        
//        //ELIMINAR Devolucion
//        resultado1 = DaoDevolucion.eliminar(dev2.getId());
//        if(resultado1 == 1)
//            System.out.println("Se ha eliminado correctamente a: " + dev2.getId());
//
//        System.out.println("##################################################################################");
//        
    }
    
}
