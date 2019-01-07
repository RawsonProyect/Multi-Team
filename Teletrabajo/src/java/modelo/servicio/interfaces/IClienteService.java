package modelo.servicio.interfaces;

import java.util.ArrayList;
import java.util.Set;
import modelo.entidades.Cliente;
import modelo.entidades.Proyecto;
import modelo.entidades.Usuario;
import modelo.excepciones.DuplicateInstance;
import modelo.excepciones.InstanceException;

/**
 *
 * @author Arlen
 */
public interface IClienteService {

    public ArrayList<Cliente> listarClientes() throws InstanceException;
    public Cliente obtenerClientePorID(int id) throws InstanceException;
    public void insertarCliente(Cliente c) throws DuplicateInstance, InstanceException;
    public void actualizarCliente(Cliente c) throws DuplicateInstance, InstanceException;
    public void eliminarCliente(int id) throws InstanceException;
    public void asignarUsuario(Cliente c, Usuario u) throws InstanceException;
    public void desasignarUsuario(Cliente c, Usuario u) throws InstanceException;
    public void asignarProyecto(Cliente c, Proyecto p) throws InstanceException;
    public void desasignarProyecto(Cliente c, Proyecto p) throws InstanceException;
    public Set ClienteUsuarios(Cliente c) throws InstanceException;
    public boolean ClienteTieneUsuario(Cliente c, Usuario u) throws InstanceException;
    public ArrayList<Cliente> ClientePorCif(String cif) throws InstanceException;
}
