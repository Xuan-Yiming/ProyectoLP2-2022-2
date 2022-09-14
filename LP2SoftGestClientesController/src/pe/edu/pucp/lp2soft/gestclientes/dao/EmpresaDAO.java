/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.pucp.lp2soft.gestclientes.dao;

import java.util.ArrayList;
import pe.edu.pucp.lp2soft.gestclientes.model.Empresa;

/**
 *
 * @author Jarumy
 */
public interface EmpresaDAO {
    int insertar(Empresa empresa);
    int modificar(Empresa empresa);
    int eliminar(int idCliente);    //DEVUELVE
    ArrayList<Empresa> listarTodas();
}
