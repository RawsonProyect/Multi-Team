package modelo.servicios;

import modelo.servicio.interfaces.IInformeService;
import java.util.List;
import javax.management.InstanceNotFoundException;
import modelo.entidades.Informe;
import modelo.daos.implementacion.InformeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Implementa los servicios necesarios para trabajar informes en la base de datos
 */
@Transactional
@Service
public class InformeService implements IInformeService
{

    @Autowired
    private InformeDao daoInforme;

    @Override
    public List<Informe> listarInformes()
    {
        return daoInforme.findAll();
    }

    @Override
    public Informe encontrarPorId(int id) throws InstanceNotFoundException
    {
        return daoInforme.findbyId(id);
    }

    @Override
    public void guardarInforme(Informe informe)
    {
        daoInforme.save(informe);
    }

    @Override
   public List<Informe> listarInformesOrder(String p)
    {
        return daoInforme.findAllOrderBy(p);
    }
   

}
