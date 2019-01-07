package modelo.servicios;

import java.util.ArrayList;
import java.util.List;
import javax.management.InstanceNotFoundException;
import modelo.daos.implementacion.ProyectoDao;
import modelo.daos.interfaces.IProyectoDao;
import modelo.entidades.Archivo;
import modelo.entidades.Proyecto;
import modelo.entidades.Requisito;
import modelo.excepciones.DuplicateInstance;
import modelo.excepciones.InstanceException;
import modelo.servicio.interfaces.IProyectoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Implementa los servicios necesarios para trabajar proyectos en la base de datos
 */
@Transactional
@Service
public class ProyectoService implements IProyectoService {

    @Autowired
    private ProyectoDao daoProyecto;
    @Autowired
    IProyectoDao proyectodao;

    @Override
    public ArrayList<Proyecto> listarProyectos() throws InstanceException {
        try {
            return (ArrayList) proyectodao.findAll();
        } catch (Exception e) {
            throw new InstanceException();
        }
    }
    public Proyecto encontrarPorId(int id) throws InstanceNotFoundException {
        return daoProyecto.findbyId(id);
    }
    public void guardarProyecto(Proyecto proyecto) {
        daoProyecto.save(proyecto);
    }
    public List<Proyecto> listarProyectoesOrder(String p) {
        return daoProyecto.findAllOrderBy(p);
    }
    @Override
    public Proyecto obtenerProyectoPorID(int id) throws InstanceException {
        try {
            return proyectodao.findbyId(id);
        } catch (Exception e) {
            throw new InstanceException();
        }
    }
    @Override
    public void insertarProyecto(Proyecto p) throws InstanceException, DuplicateInstance {
        try {
            proyectodao.save(p);
        } catch (Exception e) {
            throw new InstanceException();
        }
    }
    @Override
    public void actualizarProyecto(Proyecto p) throws InstanceException, DuplicateInstance {
        try {
            proyectodao.update(p);
        } catch (Exception e) {
            throw new InstanceException();
        }
    }
    @Override
    public void eliminarProyectoCliente(int id) throws InstanceException {
        try {
            proyectodao.remove(obtenerProyectoPorID(id));
        } catch (Exception e) {
            throw new InstanceException();
        }
    }
    @Override
    public void asignarRequisito(Proyecto p, Requisito r) throws InstanceException {
        p.getRequisitos().add(r);
    }
    @Override
    public void desasignarRequisito(Proyecto p, Requisito r) throws InstanceException {
        try {
            p.getRequisitos().remove(r);
        } catch (Exception e) {
            throw new InstanceException();
        }
    }
    @Override
    public void asignarArchivo(Proyecto p, Archivo arch) throws InstanceException {
        try {
            p.getArchivos().add(arch);
        } catch (Exception e) {
            throw new InstanceException();
        }
    }
    @Override
    public void desasignarArchivo(Proyecto p, Archivo arch) throws InstanceException {
        try {
            p.getArchivos().remove(arch);
        } catch (Exception e) {
            throw new InstanceException();
        }
    }

}
