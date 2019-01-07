/*
 To change this license header, choose License Headers in Project Properties.
 To change this template file, choose Tools | Templates
 and open the template in the editor.
 */
package modelo.daos.implementacion;

import java.util.ArrayList;
import java.util.List;
import modelo.daos.interfaces.IProyectoDao;
import modelo.entidades.Proyecto;
import modelo.entidades.RolUsuarioProyecto;
import modelo.entidades.Usuario;
import modelo.excepciones.InstanceException;
import org.hibernate.HibernateException;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

/**
 * Implementa el Dao Genérico para el tipo de entidad Proyecto
 */
@Repository
public class ProyectoDao extends GenericDao<Proyecto, Integer> implements IProyectoDao {

    public List<Proyecto> getByParameter(String parameter, String value) throws InstanceException {
        return (List<Proyecto>) getSession().createCriteria(Proyecto.class).add(Restrictions.like(parameter, value)).list();
    }
    public List<Proyecto> getProyectosPorUsuario(int idUsuario) {
        try {
            Usuario usuario = (Usuario) getSession().createCriteria(Usuario.class).add(Restrictions.eq("idUsuario", idUsuario)).uniqueResult();
            List<RolUsuarioProyecto> proyectosUsuarioRol = (List<RolUsuarioProyecto>) getSession().createCriteria(RolUsuarioProyecto.class).add(Restrictions.eq("usuario", usuario)).list();
            List proyectos = new ArrayList();
            for (RolUsuarioProyecto rup : proyectosUsuarioRol) {
                int idProyecto = rup.getId().getIdProyecto();
                Proyecto p = (Proyecto) getSession().createCriteria(Proyecto.class).add(Restrictions.eq("idProyecto", idProyecto)).uniqueResult();
                proyectos.add(p);
            }

            return proyectos;
        } catch (HibernateException e) {
            throw new HibernateException(e);
        }

    }

    public List<Proyecto> getProyectosPorUsuario2(int idUsuario) {
        try {
            Usuario usuario = (Usuario) getSession().createCriteria(Usuario.class).add(Restrictions.eq("idUsuario", idUsuario)).uniqueResult();
            List<RolUsuarioProyecto> proyectosUsuarioRol = (List<RolUsuarioProyecto>) usuario.getRolUsuarioProyectos();
            List proyectos = new ArrayList();
            for (RolUsuarioProyecto rup : proyectosUsuarioRol) {
                proyectos.add(rup.getProyecto());
            }
            return proyectos;
        } catch (HibernateException e) {
            throw new HibernateException(e);
        }

    }
}
