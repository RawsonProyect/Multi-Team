package modelo.servicios;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.daos.implementacion.ClienteDao;
import modelo.entidades.Cliente;
import modelo.entidades.Proyecto;
import modelo.entidades.Usuario;
import modelo.excepciones.DuplicateInstance;
import modelo.excepciones.InstanceException;
import modelo.servicio.interfaces.IClienteService;
import modelo.servicio.interfaces.IUsuarioService;
import org.hibernate.HibernateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Implementa los servicios necesarios para trabajar clientes en la base de datos
 */
@Service
@Transactional
public class ClienteService implements IClienteService {

    @Autowired
    ClienteDao clientedao;
    @Autowired
    IUsuarioService usuarioservice;

    @Override
    public void actualizarCliente(Cliente c) throws InstanceException, DuplicateInstance {
        try {
            clientedao.update(c);
        } catch (HibernateException e) {
            e.printStackTrace();
        }
    }
    @Override
    public Cliente obtenerClientePorID(int id) throws InstanceException {
        try {
            return clientedao.findbyId(id);
        } catch (Exception e) {
            throw new InstanceException();
        }
    }
    @Override
    public ArrayList<Cliente> listarClientes() throws InstanceException {
        ArrayList list = null;
        try {
            list = (ArrayList) clientedao.findAll();
        } catch (HibernateException ex) {
            throw new InstanceException();
        }
        return list;
    }
    @Override
    public void eliminarCliente(int id) throws InstanceException {
        try {
            clientedao.remove(clientedao.findbyId(id));
        } catch (Exception ex) {
            throw new InstanceException();
        }
    }
    @Override
    public void asignarUsuario(Cliente c, Usuario u) throws InstanceException {

        try {
            c.getUsuarios().add(u);
            u.getClientes().add(c);
            try {
                actualizarCliente(c);
                usuarioservice.actualizar(u);

            } catch (DuplicateInstance ex) {
                ex.printStackTrace();
            }

        } catch (HibernateException ex) {
            ex.printStackTrace();
        }
    }
    @Override
    public void desasignarUsuario(Cliente c, Usuario u) throws InstanceException {
        try {
            c.getUsuarios().remove(u);
            actualizarCliente(c);
        } catch (HibernateException e) {
            throw new InstanceException();
        } catch (DuplicateInstance ex) {
            Logger.getLogger(ClienteService.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    @Override
    public void asignarProyecto(Cliente c, Proyecto p) throws InstanceException {
        try {
            c.getProyectos().add(p);
        } catch (HibernateException e) {
            throw new InstanceException();
        }
    }
    @Override
    public void desasignarProyecto(Cliente c, Proyecto p) throws InstanceException {
        try {
            c.getProyectos().remove(p);
        } catch (HibernateException e) {
            throw new InstanceException();
        }
    }
    @Override
    public void insertarCliente(Cliente c) throws InstanceException, DuplicateInstance {
        try {
            if ((clientedao.getByParameter("cif", c.getCif())).size() != 0 || clientedao.exist(c.getIdCliente())) {
                throw new DuplicateInstance();
            }
            clientedao.save(c);
        } catch (HibernateException e) {
            throw new InstanceException();
        }
    }
    @Override
    public Set ClienteUsuarios(Cliente c) throws InstanceException {
        try {

            return c.getUsuarios();
        } catch (HibernateException e) {
            throw new InstanceException();
        }
    }
    @Override
    public boolean ClienteTieneUsuario(Cliente c, Usuario u) throws InstanceException {
        Cliente cliente = obtenerClientePorID(c.getIdCliente());
        Iterator it = cliente.getUsuarios().iterator();
        boolean existe = false;
        while (it.hasNext()) {
            Usuario user = (Usuario) it.next();
            if (u.getIdUsuario() == user.getIdUsuario()) {
                existe = true;
            }
        }
        return existe;
    }
    @Override
    public ArrayList<Cliente> ClientePorCif(String cif) throws InstanceException {
        try {

            return (ArrayList) clientedao.getByParameter("cif", cif);
        } catch (HibernateException e) {
            throw new InstanceException();
        }
    }
}
