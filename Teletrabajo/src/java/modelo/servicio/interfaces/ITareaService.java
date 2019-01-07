/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.servicio.interfaces;

import java.util.List;
import javax.management.InstanceNotFoundException;
import modelo.entidades.Tarea;

/**
 *
 * @author Ignacio
 */
public interface ITareaService {

    Tarea encontrarPorId(int id) throws InstanceNotFoundException;
    void guardarTarea(Tarea tarea);
    List<Tarea> listarTareas();
    List<Tarea> listarTareasOrder(String p);
    List<Tarea> listarTareasUsuario(int id) throws InstanceNotFoundException;
    
}
