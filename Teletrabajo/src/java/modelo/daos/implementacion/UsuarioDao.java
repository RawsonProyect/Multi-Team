package modelo.daos.implementacion;

/*
 To change this license header, choose License Headers in Project Properties.
 To change this template file, choose Tools | Templates
 and open the template in the editor.
 */
import java.util.List;
import modelo.daos.interfaces.IUsuarioDao;
import modelo.entidades.Usuario;
import modelo.excepciones.InstanceException;
import org.hibernate.HibernateException;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

/**
 * Implementa el Dao Genérico para el tipo de entidad Usuario
 */
@Repository
public class UsuarioDao extends GenericDao<Usuario, Integer> implements IUsuarioDao {

    public Usuario busquedaPorLogin(String login) throws InstanceException {
        try {
            return (Usuario) getSession().createCriteria(Usuario.class).add(Restrictions.like("login", login)).uniqueResult();
        } catch (HibernateException e) {
            throw new InstanceException();
        }
    }

    public List<Usuario> getByParameter(String parameter, String value) throws InstanceException {
        return (List<Usuario>) getSession().createCriteria(Usuario.class).add(Restrictions.like(parameter, value)).list();
    }

    public Usuario usuarioLogin(String login, String pass) {
        return (Usuario) getSession().createCriteria(Usuario.class).add(Restrictions.like("login", login, MatchMode.EXACT)).add(Restrictions.ilike("password", pass)).uniqueResult();
    }
    public Usuario usuarioMail(String mail, String pass) {
        return (Usuario) getSession().createCriteria(Usuario.class).add(Restrictions.eq("email", mail)).add(Restrictions.eq("password", pass)).uniqueResult();

    }
}
