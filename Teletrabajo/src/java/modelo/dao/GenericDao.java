/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;
import javax.management.InstanceNotFoundException;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author LUCIA
 */


public class GenericDao<E, PK extends Serializable> implements IGenericDao<E, PK> {

    private Class<E> entityClass;
    
    @Autowired
    private SessionFactory sessionFactory;

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    protected Session getSession() {

        return sessionFactory.getCurrentSession();

    }

    public GenericDao() {
        entityClass = (Class<E>) ((ParameterizedType) getClass()
                .getGenericSuperclass()).getActualTypeArguments()[0];

    }

    @Override
    public void save(E entity) {

        try {
            getSession().save(entity);

        } catch (HibernateException e) {
            throw new HibernateException(e);
        }

    }

    @Override
    public void update(Object entity) {
        try {
            getSession().update(entity);

        } catch (HibernateException e) {
            throw new HibernateException(e);
        }

    }

    @Override
    public boolean exist(Serializable id) {
        return getSession().createCriteria(entityClass).add(Restrictions.idEq(id)).setProjection(Projections.id()).uniqueResult() != null;
    }

   
    @Override
    public List findAll() {
        try {
            return getSession().createCriteria(this.entityClass).list();
        } catch (HibernateException e) {
            throw new HibernateException(e);
        }

    }

    @Override
    public void remove(E entity) {
        getSession().delete(entity);

    }

    @Override
    public E findbyId(PK id) throws InstanceNotFoundException {

        E entidad = (E) getSession().get(entityClass, id);
        if (entidad == null) {
            throw new InstanceNotFoundException();
        }
        return entidad;

    }

}
