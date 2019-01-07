package modelo.daos.implementacion;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



import modelo.daos.interfaces.IAlertaDao;
import modelo.entidades.Alerta;
import org.springframework.stereotype.Repository;

/**
 * Implementa el Dao Genérico para el tipo de entidad Alerta
 */
@Repository
public class AlertaDao extends GenericDao<Alerta, Integer> implements IAlertaDao {


  
}
