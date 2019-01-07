/*
 To change this license header, choose License Headers in Project Properties.
 To change this template file, choose Tools | Templates
 and open the template in the editor.
 */
package modelo.servicios;

import java.util.ArrayList;
import modelo.daos.implementacion.UsuarioDao;
import modelo.entidades.Usuario;
import modelo.excepciones.DuplicateInstance;
import modelo.excepciones.InstanceException;
import modelo.servicio.interfaces.IUsuarioService;
import org.hibernate.HibernateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Implementa los servicios necesarios para trabajar usuarios en la base de datos
 */
@Service()
@Transactional 
public class UsuarioService implements IUsuarioService
{
    @Autowired
    UsuarioDao usuarioDao;
  
    @Override
    public void insertarUsuario(Usuario u) throws DuplicateInstance,InstanceException
    {
        try
        {
            if((usuarioDao.getByParameter("login",u.getLogin())).size() != 0 || (usuarioDao.getByParameter("email",u.getEmail()).size() != 0 || usuarioDao.exist(u.getIdUsuario())))
            {
                throw new DuplicateInstance();
            }
            usuarioDao.save(u);
        }
        catch(HibernateException e)
        {
            throw new InstanceException();
        }
    }
    @Override
    public void actualizar(Usuario u) throws InstanceException,DuplicateInstance
    {
      
//            if((usuarioDao.getByParameter("login",u.getLogin())).size() != 1 || (usuarioDao.getByParameter("email",u.getEmail()).size() !=1))
//            {
//                throw new DuplicateInstance();
//            }else{
                usuarioDao.update(u);
//            }
       
    }
    @Override
    public Usuario obtenerPorId(int id) throws InstanceException
    {
        try
        {
            return usuarioDao.findbyId(id);
        }
        catch(Exception e)
        {
            throw new InstanceException();
        }
    }
    @Override
    public ArrayList<Usuario> getUsuarios() throws InstanceException
    {
        ArrayList list = null;
        try
        {
            list = (ArrayList)usuarioDao.findAll();
        }
        catch(HibernateException ex)
        {
            new InstanceException();
        }
        return list;
    }
    @Override
    public void eliminarUsuario(Usuario u) throws InstanceException
    {
        try
        {
            usuarioDao.remove(u);
        }
        catch(Exception e)
        {
            throw new InstanceException();
        }
    }
}
