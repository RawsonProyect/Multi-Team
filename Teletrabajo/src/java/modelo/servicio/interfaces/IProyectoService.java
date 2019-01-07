/*
 To change this license header, choose License Headers in Project Properties.
 To change this template file, choose Tools | Templates
 and open the template in the editor.
 */
package modelo.servicio.interfaces;

import java.util.ArrayList;
import modelo.entidades.Archivo;
import modelo.entidades.Proyecto;
import modelo.entidades.Requisito;
import modelo.excepciones.DuplicateInstance;
import modelo.excepciones.InstanceException;

/**

 @author Arlen
 */
public interface IProyectoService
{
    public ArrayList<Proyecto> listarProyectos() throws InstanceException;
    public Proyecto obtenerProyectoPorID(int id) throws InstanceException;
    public void insertarProyecto(Proyecto p) throws InstanceException,DuplicateInstance;
    public void actualizarProyecto(Proyecto p) throws InstanceException,DuplicateInstance;
    public void eliminarProyectoCliente(int id) throws InstanceException;
    public void asignarRequisito(Proyecto p,Requisito r) throws InstanceException;
    public void desasignarRequisito(Proyecto p,Requisito r) throws InstanceException;
    public void asignarArchivo(Proyecto p,Archivo arch) throws InstanceException;
    public void desasignarArchivo(Proyecto p,Archivo arch) throws InstanceException;

}
