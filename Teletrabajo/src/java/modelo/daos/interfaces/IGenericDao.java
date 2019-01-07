/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.daos.interfaces;

import java.io.Serializable;
import java.util.List;
import javax.management.InstanceNotFoundException;

/**
 *
 * @author LUCIA
 */
public interface IGenericDao<E, PK extends Serializable> {

    public void save(E entity);

    public void update(E entity);

    public E findbyId(PK id) throws InstanceNotFoundException;

    public boolean exist(PK id);

    public List<E> findAll();


    public void remove(E entity);
    
    public List findAllOrderBy(String p);
}
