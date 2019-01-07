package modelo.daos.interfaces;

import java.util.List;
import modelo.entidades.Permiso;
import modelo.excepciones.InstanceException;

/**
 *
 * @author Ignacio
 */
public interface IPermisoDao extends IGenericDao<Permiso, Integer> {

    public List<Permiso> getByParameter(String parameter, String value) throws InstanceException;
}
