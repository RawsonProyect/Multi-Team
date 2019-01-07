package modelo.daos.implementacion;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import modelo.daos.interfaces.IMensajeDao;
import modelo.entidades.Mensaje;
import org.springframework.stereotype.Repository;

/**
 * Implementa el Dao Genérico para el tipo de entidad Mensaje
 */
@Repository
public class MensajeDao extends GenericDao<Mensaje, Integer> implements IMensajeDao {

}
