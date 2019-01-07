package modelo.daos.implementacion;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


;
import modelo.daos.interfaces.IPrioridadDao;
import modelo.entidades.Prioridad;
import modelo.excepciones.InstanceException;
import org.hibernate.HibernateException;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

/**
 * Implementa el Dao Genérico para el tipo de entidad Prioridad
 */
@Repository
public class PrioridadDao extends GenericDao<Prioridad, Integer> implements IPrioridadDao {

        public Prioridad busquedaPorNombre(String nombre) throws InstanceException{
        try{
            System.out.println("prioridad dao: "+nombre);
		return (Prioridad) getSession().createCriteria(Prioridad.class).add(Restrictions.like("nombre",nombre)).uniqueResult();
        }catch(HibernateException e){
            throw new InstanceException();
        }
	}

}
