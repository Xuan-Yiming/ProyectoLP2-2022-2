package pe.edu.pucp.lp2soft.main;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import pe.edu.pucp.lp2soft.gestclientes.dao.EmpresaDAO;
import pe.edu.pucp.lp2soft.gestclientes.dao.PersonaNaturalDAO;
import pe.edu.pucp.lp2soft.gestclientes.model.Empresa;
import pe.edu.pucp.lp2soft.gestclientes.model.PersonaNatural;
import pe.edu.pucp.lp2soft.gestclientes.mysql.EmpresaMySQL;
import pe.edu.pucp.lp2soft.gestclientes.mysql.PersonaNaturalMySQL;
import pe.edu.pucp.lp2soft.rrhh.model.TipoDeDocumento;

public class Principal {
    public static void main(String[] args) throws Exception{
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        
        //Creamos un dao de conexión con Empresa
        EmpresaDAO daoEmpresa = new EmpresaMySQL();
        //Creamos objetos Empresa
        Empresa empresa1 = new Empresa("---","20552103816","AGROLIGHT PERU S.A.C.","Av. Universitaria 2354");
        Empresa empresa2 = new Empresa("---","20489456412","D'AROMAS E.I.R.L","El Rimac, Breña 15083");
        //INSERTAR EMPRESA
        int resultado1 = daoEmpresa.insertar(empresa1);
        int resultado2 = daoEmpresa.insertar(empresa2);
        if(resultado1 == 1 && resultado2 == 1){
            System.out.println("Se ha insertado con éxito a:" );
            System.out.println(empresa1.getRazonSocial());
            System.out.println(empresa2.getRazonSocial());
        }
        else
            System.out.println("El insert ha fallado...");
        //LISTAR EMPRESAS
        ArrayList<Empresa> empresas = daoEmpresa.listarTodas();
        for(Empresa empresa : empresas){
            System.out.println(empresa.getIdCliente()+ " " + 
                    empresa.getCategoria()+ " " + 
                    empresa.getRUC()+ " " +
                    empresa.getRazonSocial());
        }
        //MODIFICAR EMPRESA
        empresa1.setCategoria("VIP");
        daoEmpresa.modificar(empresa1);
        //ELIMINAR EMPRESA
        resultado1 = daoEmpresa.eliminar(empresa1.getIdCliente());
        if(resultado1 == 1)
            System.out.println("Se ha eliminado correctamente a: " + empresa1.getRazonSocial());
   
        //Creamos un dao de conexión con Persona Natural
        PersonaNaturalDAO daoPersonaNatural = new PersonaNaturalMySQL();
        //Creamos objetos PersonaNatural
        PersonaNatural personaNatural1 = new PersonaNatural("---",TipoDeDocumento.DNI,"76438713","Mario","Martinez",sdf.parse("10-03-1988"),"989752835","Av. Venezuela 452","mario88@gmail.com");
        PersonaNatural personaNatural2 = new PersonaNatural("---",TipoDeDocumento.Pasaporte,"ZAB00254","Sophia","Carbajales",sdf.parse("25-11-1995"),"989778455","Av. Jose Granda 154","sophia25@gmail.com");
        //INSERTAR PERSONA NATURAL
        resultado1 = daoPersonaNatural.insertar(personaNatural1);
        resultado2 = daoPersonaNatural.insertar(personaNatural2);
        if(resultado1 == 1 && resultado2 == 1){
            System.out.println("Se ha insertado con éxito a:" );
            System.out.println(personaNatural1.getNombre()+" "+personaNatural1.getApellido());
            System.out.println(personaNatural2.getNombre()+" "+personaNatural2.getApellido());
        }
        else
            System.out.println("El insert ha fallado...");
        //LISTAR PERSONA NATURAL
        ArrayList<PersonaNatural> personasNaturales = daoPersonaNatural.listarTodas();
        for(PersonaNatural personaNatural : personasNaturales){
            System.out.println(personaNatural.getIdCliente()+ " " + 
                    personaNatural.getCategoria()+ " " + 
                    personaNatural.getTipoDeDocumento()+ " : " +
                    personaNatural.getNumDeDocumento()+ " " +
                    personaNatural.getNombre()+ " " +
                    personaNatural.getApellido());
        }
        //MODIFICAR PERSONA NATURAL
        personaNatural1.setCategoria("NUEVO");
        daoPersonaNatural.modificar(personaNatural1);
        //ELIMINAR PERSONA NATURAL
        resultado1 = daoPersonaNatural.eliminar(personaNatural1.getIdCliente());
        if(resultado1 == 1)
            System.out.println("Se ha eliminado correctamente a: " + personaNatural1.getNombre()+" "+personaNatural1.getApellido());
    
    }
    
}
