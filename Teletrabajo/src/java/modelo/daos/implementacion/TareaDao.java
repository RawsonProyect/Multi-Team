package modelo.daos.implementacion;


import java.util.List;
import javax.management.InstanceNotFoundException;
import modelo.daos.interfaces.ITareaDao;
import modelo.entidades.Tarea;
import modelo.excepciones.InstanceException;
import org.hibernate.HibernateException;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

/**
 * Implementa el Dao Genérico para el tipo de entidad Tarea
 */
@Repository
public class TareaDao extends GenericDao <Tarea ,Integer> implements ITareaDao{

    @Override
    public List<Tarea> getByParameter(String parameter,String value) throws InstanceException
    {
        return (List<Tarea>)getSession().createCriteria(Tarea.class).add(Restrictions.like(parameter,value)).list();
    }

    public List<Tarea> findAllByID(int id) throws InstanceNotFoundException
    {
        try
        {
            return (List<Tarea>)getSession().createCriteria(Tarea.class).add(Restrictions.like("idUsuario",id)).list();
        }
        catch(HibernateException e)
        {
            throw new HibernateException(e);
        }
    }
    
}
