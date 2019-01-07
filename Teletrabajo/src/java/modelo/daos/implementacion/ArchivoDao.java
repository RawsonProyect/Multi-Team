package modelo.daos.implementacion;




import modelo.daos.interfaces.IArchivoDao;
import modelo.entidades.Archivo;
import org.springframework.stereotype.Repository;

/**
 * Implementa el Dao Genérico para el tipo de entidad Archivo
 */
@Repository
public class ArchivoDao extends GenericDao<Archivo,Integer> implements IArchivoDao
{


}
