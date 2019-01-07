package modelo.servicios;

import modelo.servicio.interfaces.IRequisitoService;
import java.util.List;
import javax.management.InstanceNotFoundException;
import modelo.daos.implementacion.RequisitoDao;
import modelo.entidades.Requisito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Implementa los servicios necesarios para trabajar requisitos en la base de datos
 */
@Transactional
@Service
public class RequisitoService implements IRequisitoService
{

    @Autowired
    private RequisitoDao daoRequisito;

    @Override
    public List<Requisito> listarRequisitos()
    {
        return daoRequisito.findAll();
    }

    @Override
    public Requisito encontrarPorId(int id) throws InstanceNotFoundException
    {
        return daoRequisito.findbyId(id);
    }

    @Override
    public void guardarRequisito(Requisito requisito)
    {
        daoRequisito.save(requisito);
    }

    @Override
   public List<Requisito> listarRequisitosOrder(String p)
    {
        return daoRequisito.findAllOrderBy(p);
    }
   


}
