package modelo.servicios;

import modelo.servicio.interfaces.IRolService;
import java.util.ArrayList;
import javax.management.InstanceNotFoundException;
import modelo.daos.implementacion.RolDao;
import modelo.entidades.Permiso;
import modelo.entidades.Rol;
import modelo.excepciones.DuplicateInstance;
import modelo.excepciones.InstanceException;
import org.hibernate.HibernateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 * Implementa los servicios necesarios para trabajar roles en la base de datos
 */
@Service
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class RolService implements IRolService {

    @Autowired
    RolDao roldao;

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void insertarRol(Rol r) throws DuplicateInstance, InstanceException {
        try {
            if (!(roldao.getByParameter("nombre", r.getNombre())).isEmpty()) {
                throw new DuplicateInstance();
            }
            roldao.save(r);
        } catch (HibernateException e) {
            throw new InstanceException();
        }
    }
    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void actualizarRol(Rol r) throws InstanceException {
        try {
            roldao.save(r);
            roldao.update(r);
        } catch (HibernateException e) {
            throw new InstanceException();
        }
    }
    @Override
    public Rol obtenerRolPorId(int id) throws InstanceNotFoundException {
        try {
            return roldao.findbyId(id);
        } catch (Exception e) {
            throw new InstanceNotFoundException();
        }
    }
    @Override
    public ArrayList<Rol> getRoles() throws InstanceException {
        ArrayList list = null;
        try {
            list = (ArrayList) roldao.findAll();
        } catch (HibernateException ex) {
            new InstanceException();
        }
        return list;
    }
    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void asignarPermisoaRol(Rol r, Permiso p) throws InstanceNotFoundException, InstanceException {
        try {
            if ((roldao.findbyId(r.getIdRol())) != null) {
                throw new InstanceNotFoundException();
            }
            r.getPermisos().add(p);
            roldao.save(r);
            roldao.update(r);
        } catch (HibernateException e) {
            throw new InstanceException();
        }
    }
    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void desasignarPermisoaRol(Rol r, Permiso p) throws InstanceNotFoundException, InstanceException {
        try {
            if ((roldao.findbyId(r.getIdRol())) != null) {
                throw new InstanceNotFoundException();
            }
            r.getPermisos().remove(p);
            roldao.save(r);
            roldao.update(r);
        } catch (HibernateException e) {
            throw new InstanceException();
        }
    }

}
