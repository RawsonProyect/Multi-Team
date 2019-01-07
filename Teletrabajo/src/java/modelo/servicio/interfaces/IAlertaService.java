/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.servicio.interfaces;

import java.util.List;
import javax.management.InstanceNotFoundException;
import modelo.entidades.Alerta;

/**
 *
 * @author Ignacio
 */
public interface IAlertaService {

    Alerta encontrarPorId(int id) throws InstanceNotFoundException;
    void guardarAlerta(Alerta alerta);
    List<Alerta> listarAlerta();
    List<Alerta> listarAlertasOrder(String p);
    
}
