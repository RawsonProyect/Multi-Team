package modelo.servicios;

import modelo.servicio.interfaces.ITareaService;
import java.util.List;
import javax.management.InstanceNotFoundException;
import modelo.daos.implementacion.TareaDao;
import modelo.entidades.Tarea;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Implementa los servicios necesarios para trabajar tareas en la base de datos
 */
@Transactional
@Service
public class TareaService implements ITareaService
{

    @Autowired
    private TareaDao daoTarea;

    @Override
    public List<Tarea> listarTareas()
    {
        return daoTarea.findAll();
    }

    @Override
    public Tarea encontrarPorId(int id) throws InstanceNotFoundException
    {
        return daoTarea.findbyId(id);
    }

    @Override
    public void guardarTarea(Tarea tarea)
    {
        daoTarea.save(tarea);
    }

    @Override
   public List<Tarea> listarTareasOrder(String p)
    {
        return daoTarea.findAllOrderBy(p);
    
    }
   
    @Override
    public List<Tarea> listarTareasUsuario(int id) throws InstanceNotFoundException{
        
        return daoTarea.findAllByID(id);
        
    }

}
