package modelo.daos.implementacion;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.util.List;
import modelo.daos.interfaces.IRequisitoDao;
import modelo.entidades.Proyecto;
import modelo.entidades.Requisito;
import modelo.excepciones.InstanceException;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

/**
 * Implementa el Dao Genérico para el tipo de entidad Requisito
 */
@Repository
public class RequisitoDao extends GenericDao<Requisito, Integer> implements IRequisitoDao {

    @Override
    public List<Requisito> getByParameter(String parameter, String value) throws InstanceException {
        return (List<Requisito>) getSession().createCriteria(Requisito.class).add(Restrictions.like(parameter, value)).list();
    }
    
    @Override
    public List<Requisito> getByParameter(String parameter, Proyecto value) throws InstanceException {
        return (List<Requisito>) getSession().createCriteria(Requisito.class).add(Restrictions.like(parameter, value)).list();
    }
}
