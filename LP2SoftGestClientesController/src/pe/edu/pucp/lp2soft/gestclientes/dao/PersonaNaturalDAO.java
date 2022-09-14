/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.pucp.lp2soft.gestclientes.dao;

import java.util.ArrayList;
import pe.edu.pucp.lp2soft.gestclientes.model.PersonaNatural;

/**
 *
 * @author Jarumy
 */
public interface PersonaNaturalDAO {
    int insertar(PersonaNatural personaNatural);
    int modificar(PersonaNatural personaNatural);
    int eliminar(int idCliente);    //DEVUELVE
    ArrayList<PersonaNatural> listarTodas();
}
