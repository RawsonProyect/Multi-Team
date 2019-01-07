package modelo.daos.implementacion;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import modelo.daos.interfaces.IChatGrupoDao;
import modelo.entidades.Chatgrupo;
import org.springframework.stereotype.Repository;

/**
 * Implementa el Dao Genérico para el tipo de entidad ChatGrupo
 */
@Repository
public class ChatGrupoDao extends GenericDao<Chatgrupo, Integer> implements IChatGrupoDao {

}
