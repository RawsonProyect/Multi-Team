package modelo.daos.implementacion;

/*
 To change this license header, choose License Headers in Project Properties.
 To change this template file, choose Tools | Templates
 and open the template in the editor.
 */
import java.util.List;
import modelo.daos.interfaces.ITipoPermisoDao;
import modelo.entidades.Tipopermiso;
import modelo.excepciones.InstanceException;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

/**
 * Implementa el Dao Genérico para el tipo de entidad TipoPermiso
 */
@Repository
public class TipoPermisoDao extends GenericDao<Tipopermiso, Integer> implements ITipoPermisoDao {

    @Override
    public List<Tipopermiso> getByParameter(String parameter, String value) throws InstanceException {
        return (List<Tipopermiso>) getSession().createCriteria(Tipopermiso.class).add(Restrictions.like(parameter, value)).list();
    }

}
