package modelo.daos.implementacion;

/*
 To change this license header, choose License Headers in Project Properties.
 To change this template file, choose Tools | Templates
 and open the template in the editor.
 */
import java.util.List;
import modelo.daos.interfaces.IRolUsuarioProyectoDao;
import modelo.entidades.RolUsuarioProyecto;
import modelo.entidades.RolUsuarioProyectoId;
import modelo.entidades.Usuario;
import modelo.excepciones.InstanceException;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

/**
 * Implementa el Dao Genérico para el tipo de entidad entre Rol, Usuario y Proyecto
 */
@Repository
public class RolUsuarioProyectoDao extends GenericDao<RolUsuarioProyecto, RolUsuarioProyectoId> implements IRolUsuarioProyectoDao {

    @Override
    public List<RolUsuarioProyecto> getByParameter(String parameter, String value) throws InstanceException {
        return (List<RolUsuarioProyecto>) getSession().createCriteria(RolUsuarioProyecto.class).add(Restrictions.like(parameter, value)).list();
    }
    @Override
    public List<RolUsuarioProyecto> getByUser(Usuario u) throws InstanceException {
        return (List<RolUsuarioProyecto>) getSession().createCriteria(RolUsuarioProyecto.class).add(Restrictions.like("usuario", u)).list();
    }
}
