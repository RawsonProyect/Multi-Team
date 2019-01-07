/*
 To change this license header, choose License Headers in Project Properties.
 To change this template file, choose Tools | Templates
 and open the template in the editor.
 */
package modelo.servicio.interfaces;

import java.util.ArrayList;
import modelo.entidades.Tipopermiso;
import modelo.excepciones.DuplicateInstance;
import modelo.excepciones.InstanceException;



/**

 @author Arlen
 */

public interface ITipoPermisoService
{
     public ArrayList<Tipopermiso>listarTipopermisos()throws InstanceException;
    public Tipopermiso obtenerTipopermisoPorID(int id)throws InstanceException;
    public void insertarTipopermiso(Tipopermiso c)throws DuplicateInstance,InstanceException;
    public void actualizarTipopermiso(Tipopermiso c)throws DuplicateInstance,InstanceException;
    public void eliminarTipopermiso(int id)throws InstanceException;
}
