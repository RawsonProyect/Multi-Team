package modelo.daos.implementacion;

import java.util.List;
import modelo.daos.interfaces.IPermisoDao;
import modelo.entidades.Permiso;
import modelo.excepciones.InstanceException;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;


/**
 * Implementa el Dao Genérico para el tipo de entidad Permiso
 */
@Repository
public class PermisoDao extends GenericDao<Permiso,Integer> implements IPermisoDao
{

    
    @Override
    public List<Permiso> getByParameter(String parameter,String value) throws InstanceException
    {
         return (List<Permiso>) getSession().createCriteria(Permiso.class).add(Restrictions.like(parameter,value)).list();
    }

}
