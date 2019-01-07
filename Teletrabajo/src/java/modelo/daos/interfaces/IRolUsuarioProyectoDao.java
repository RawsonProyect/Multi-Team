package modelo.daos.interfaces;

import java.util.List;
import modelo.entidades.RolUsuarioProyecto;
import modelo.entidades.RolUsuarioProyectoId;
import modelo.entidades.Usuario;
import modelo.excepciones.InstanceException;

/**
 *
 * @author Ignacio
 */
public interface IRolUsuarioProyectoDao extends IGenericDao<RolUsuarioProyecto, RolUsuarioProyectoId> {

    public List<RolUsuarioProyecto> getByParameter(String parameter, String value) throws InstanceException;
    public List<RolUsuarioProyecto> getByUser(Usuario u) throws InstanceException;    
    
}
