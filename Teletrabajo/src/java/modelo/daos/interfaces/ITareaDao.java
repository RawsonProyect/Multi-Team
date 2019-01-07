package modelo.daos.interfaces;
import java.util.List;
import modelo.daos.interfaces.IGenericDao;
import modelo.entidades.Tarea;
import modelo.excepciones.InstanceException;
/**
 *
 * @author Fran
 */
public interface ITareaDao extends IGenericDao<Tarea, Integer>{

    public List<Tarea> getByParameter(String parameter,String value) throws InstanceException;
}
