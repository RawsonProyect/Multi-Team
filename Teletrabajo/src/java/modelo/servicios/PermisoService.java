/*
 To change this license header, choose License Headers in Project Properties.
 To change this template file, choose Tools | Templates
 and open the template in the editor.
 */
package modelo.servicios;

import modelo.servicio.interfaces.IPermisoService;
import java.util.ArrayList;
import modelo.daos.implementacion.PermisoDao;
import modelo.entidades.Permiso;
import modelo.excepciones.DuplicateInstance;
import modelo.excepciones.InstanceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 * Implementa los servicios necesarios para trabajar permisos en la base de datos
 */
@Service
 @Transactional(propagation=Propagation.SUPPORTS,readOnly =true)

public class PermisoService implements IPermisoService
{
   @Autowired
   PermisoDao permisodao;
 
    public ArrayList<Permiso> listarPermisos() throws InstanceException
    {
        try
        {
            return (ArrayList)permisodao.findAll();
        }
        catch(Exception e)
        {
            throw new InstanceException();
        }
    }
    @Override
    public Permiso obtenerPermisoPorID(int id) throws InstanceException
    {
        try
        {
          return  permisodao.findbyId(id);
           
        }
        catch(Exception e)
        {
            throw new InstanceException();
        }
    }
    @Override
     @Transactional(propagation=Propagation.REQUIRED ,readOnly =false)
    public void insertarPermiso(Permiso p) throws DuplicateInstance,InstanceException
    {
         try
        {
            permisodao.save(p);
           
        }
        catch(Exception e)
        {
            throw new InstanceException();
        }
      
    }
    @Override
     @Transactional(propagation=Propagation.REQUIRED ,readOnly =false)
    public void actualizarPermiso(Permiso p) throws DuplicateInstance,InstanceException
    {
       try
        {
         permisodao.update(p);
           
        }
        catch(Exception e)
        {
            throw new InstanceException();
        }
    }
    @Override
     @Transactional(propagation=Propagation.REQUIRED ,readOnly =false)
    public void eliminarPermiso(int id) throws InstanceException
    {
        try
        {
          permisodao.remove(obtenerPermisoPorID(id));
           
        }
        catch(Exception e)
        {
            throw new InstanceException();
        }
    }

}
