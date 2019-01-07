/*
 To change this license header, choose License Headers in Project Properties.
 To change this template file, choose Tools | Templates
 and open the template in the editor.
 */
package modelo.servicios;

import modelo.servicio.interfaces.ITipoPermisoService;
import java.util.ArrayList;
import modelo.daos.implementacion.TipoPermisoDao;
import modelo.entidades.Tipopermiso;
import modelo.excepciones.DuplicateInstance;
import modelo.excepciones.InstanceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


/**
 * Implementa los servicios necesarios para trabajar tipos de permisos en la base de datos
 */
  @Service
  @Component

 @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
public class TipoPermisoService implements ITipoPermisoService
{
    @Autowired
    TipoPermisoDao tipopermisodao;
    
    @Override
    public ArrayList<Tipopermiso> listarTipopermisos() throws InstanceException
    {
         try
        {
          return  (ArrayList)tipopermisodao.findAll();
           
        }
        catch(Exception e)
        {
            throw new InstanceException();
        }
    }
    @Override
    public Tipopermiso obtenerTipopermisoPorID(int id) throws InstanceException
    {
        try
        {
          return tipopermisodao.findbyId(id);
           
        }
        catch(Exception e)
        {
            throw new InstanceException();
        }
    }
    @Override
     @Transactional(propagation = Propagation.REQUIRED,readOnly = false)
    public void insertarTipopermiso(Tipopermiso tipo) throws DuplicateInstance,InstanceException
    {
        try
        {
          tipopermisodao.save(tipo);
           
        }
        catch(Exception e)
        {
            throw new InstanceException();
        }
    }
    @Override
     @Transactional(propagation = Propagation.REQUIRED,readOnly = false)
    public void actualizarTipopermiso(Tipopermiso tipo) throws DuplicateInstance,InstanceException
    {
         try
        {
         tipopermisodao.update(tipo);
           
        }
        catch(Exception e)
        {
            throw new InstanceException();
        }
    }
    @Override
     @Transactional(propagation = Propagation.REQUIRED,readOnly = false)
    public void eliminarTipopermiso(int id) throws InstanceException
    {
       try
        {
        tipopermisodao.remove(obtenerTipopermisoPorID(id));
           
        }
        catch(Exception e)
        {
            throw new InstanceException();
        }
    }
   
}
