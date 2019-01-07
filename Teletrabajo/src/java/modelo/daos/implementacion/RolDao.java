package modelo.daos.implementacion;

/*
 To change this license header, choose License Headers in Project Properties.
 To change this template file, choose Tools | Templates
 and open the template in the editor.
 */

import java.util.List;
import modelo.daos.interfaces.IRolDao;
import modelo.entidades.Rol;
import modelo.excepciones.InstanceException;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

/**
 * Implementa el Dao Genérico para el tipo de entidad Rol
 */
@Repository
public class RolDao extends GenericDao <Rol,Integer> implements IRolDao
{   
    @Override
    public List<Rol> getByParameter(String parameter,String value) throws InstanceException
    {
        return (List<Rol>)  getSession().createCriteria(Rol.class).add( Restrictions.like(parameter,value)).list();
    }
    
}
