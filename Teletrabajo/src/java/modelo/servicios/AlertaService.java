package modelo.servicios;

import modelo.servicio.interfaces.IAlertaService;
import java.util.List;
import javax.management.InstanceNotFoundException;
import modelo.daos.implementacion.AlertaDao;
import modelo.entidades.Alerta;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Implementa los servicios necesarios para trabajar alertas en la base de datos
 */
@Transactional
@Service
public class AlertaService implements IAlertaService
{

    @Autowired
    private AlertaDao daoAlerta;

    @Override
    public List<Alerta> listarAlerta()
    {
        return daoAlerta.findAll();
    }

    @Override
    public Alerta encontrarPorId(int id) throws InstanceNotFoundException
    {
        return daoAlerta.findbyId(id);
    }

    @Override
    public void guardarAlerta(Alerta alerta)
    {
        daoAlerta.save(alerta);
    }

    @Override
   public List<Alerta> listarAlertasOrder(String p)
    {
        return daoAlerta.findAllOrderBy(p);
    }

}
