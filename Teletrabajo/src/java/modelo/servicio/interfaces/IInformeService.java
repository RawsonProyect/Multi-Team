/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.servicio.interfaces;

import java.util.List;
import javax.management.InstanceNotFoundException;
import modelo.entidades.Informe;

/**
 *
 * @author Ignacio
 */
public interface IInformeService {

    Informe encontrarPorId(int id) throws InstanceNotFoundException;
    void guardarInforme(Informe informe);
    List<Informe> listarInformes();
    List<Informe> listarInformesOrder(String p);
    
}
