/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.pucp.lp2soft.gestclientes.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import pe.edu.pucp.lp2soft.gestclientes.dao.ClienteDAO;
import pe.edu.pucp.lp2soft.gestclientes.model.Cliente;

/**
 *
 * @author Jarumy
 */
public class ClienteMySQL implements ClienteDAO{
    private Connection con;
    private CallableStatement cs; //LA QUE SE USA PARA LLAMAR A PROCEDIMIENTOS ALMACENADOS, SE USARA PARA LA TA
    private ResultSet rs;

    @Override
    public int insertar(Cliente cliente) {
        int resultado = 0;
        try{
            //con = DBManager.getInstance().getConnection();
            
            cs = con.prepareCall("{call INSERTAR_CLIENTE(?,?,?,?,?,?,?,?,?)}");
            //cs.registerOutParameter("_id_empleado", java.sql.Types.INTEGER);//REGISTRAMOS EL PARAMETRO DE SALIDA, lo que devuelve
            //EL PARAMETRO DE SALIDA ES EL UNICO QUE SE REGISTRA DE FORMA DIFERENTE
            //LOS DEMAS SE REGISTRAN DEPENDIENDO DEL TIPO DE DATO
            
            
//            cs.setInt("_fid_area", empleado.getArea().getIdArea());
//            cs.setString("_DNI", empleado.getDNI());
//            cs.setString("_nombre", empleado.getNombre());
//            cs.setString("_apellido_paterno", empleado.getApellidoPaterno());
//            cs.setString("_genero", String.valueOf(empleado.getGenero()));  //SOLO UN CHAR
//            cs.setDate("_fecha_nacimiento", new java.sql.Date(empleado.getFechaNacimiento().getTime()));    //PARA FECHAS
//            cs.setString("_cargo", empleado.getCargo());
//            cs.setDouble("_sueldo", empleado.getSueldo());
//            resultado = cs.executeUpdate();
            //****************************************************//
            //****************************************************//
            
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public int modificar(Cliente cliente) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int eliminar(int idCliente) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Cliente> listarTodas() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
