package modelo.daos.interfaces;


import java.util.List;
import modelo.entidades.Rol;
import modelo.excepciones.InstanceException;

/**
 *
 * @author Ignacio
 */
public interface IRolDao extends IGenericDao<Rol,Integer>{
 public List<Rol> getByParameter(String parameter, String value) throws InstanceException;

}
