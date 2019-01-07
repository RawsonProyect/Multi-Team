/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.servicio.interfaces;

import java.util.List;
import javax.management.InstanceNotFoundException;
import modelo.entidades.Requisito;

/**
 *
 * @author Ignacio
 */
public interface IRequisitoService {

    Requisito encontrarPorId(int id) throws InstanceNotFoundException;
    void guardarRequisito(Requisito requisito);
    List<Requisito> listarRequisitos();
    List<Requisito> listarRequisitosOrder(String p);
    
}
