package modelo.servicio.interfaces;

import java.util.ArrayList;
import javax.management.InstanceNotFoundException;
import modelo.entidades.Permiso;
import modelo.entidades.Rol;
import modelo.excepciones.DuplicateInstance;
import modelo.excepciones.InstanceException;



/**

 @author Arlen
 */
public interface IRolService
{
    public void insertarRol(Rol r) throws DuplicateInstance, InstanceException;
    public void actualizarRol(Rol r) throws InstanceException;
    public Rol obtenerRolPorId(int id) throws InstanceNotFoundException;
    public ArrayList<Rol> getRoles() throws InstanceException;
    public void asignarPermisoaRol(Rol r, Permiso p)throws InstanceNotFoundException, InstanceException;
    public void desasignarPermisoaRol(Rol r, Permiso p)throws InstanceNotFoundException, InstanceException;
}
