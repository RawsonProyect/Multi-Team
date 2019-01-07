package modelo.daos.implementacion;


import modelo.daos.interfaces.ITipoAlertaDao;
import modelo.entidades.Tipoalerta;
import org.springframework.stereotype.Repository;

/**
 * Implementa el Dao Genérico para el tipo de entidad TipoAlerta
 */
@Repository
public class TipoAlertaDao extends GenericDao <Tipoalerta,Integer> implements ITipoAlertaDao{
    
}
