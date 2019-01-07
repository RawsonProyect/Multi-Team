/*
 To change this license header, choose License Headers in Project Properties.
 To change this template file, choose Tools | Templates
 and open the template in the editor.
 */
package modelo.daos.implementacion;

import java.util.List;
import modelo.daos.interfaces.IClienteDao;
import modelo.entidades.Cliente;
import modelo.excepciones.InstanceException;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

/**
 * Implementa el Dao Genérico para el tipo de entidad Cliente
 */
@Repository()
public class ClienteDao extends GenericDao<Cliente, Integer> implements IClienteDao {

    @Override
    public List<Cliente> getByParameter(String parameter, String value) throws InstanceException {
        return (List<Cliente>) getSession().createCriteria(Cliente.class).add(Restrictions.like(parameter, value)).list();
    }

}
