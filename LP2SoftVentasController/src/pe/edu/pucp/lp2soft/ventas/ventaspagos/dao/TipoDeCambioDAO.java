/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package pe.edu.pucp.lp2soft.ventas.ventaspagos.dao;

import java.util.ArrayList;
import pe.edu.pucp.lp2soft.ventaspagos.TipoDeCambio;

/**
 *
 * @author xuany
 */
public interface TipoDeCambioDAO {
    public int insertar(TipoDeCambio tipoDeCambio);
    public int modificar(TipoDeCambio tipoDeCambio);
    public int eliminar(int id);
    public ArrayList<TipoDeCambio> listarTodos();
}
