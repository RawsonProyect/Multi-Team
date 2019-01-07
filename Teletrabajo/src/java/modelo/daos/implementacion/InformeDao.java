package modelo.daos.implementacion;
/*
 To change this license header, choose License Headers in Project Properties.
 To change this template file, choose Tools | Templates
 and open the template in the editor.
 */

import modelo.daos.implementacion.GenericDao;
import modelo.daos.interfaces.IInformeDao;
import modelo.entidades.Informe;
import org.springframework.stereotype.Repository;

/**
 * Implementa el Dao Genérico para el tipo de entidad Informe
 */
@Repository
public class InformeDao extends GenericDao <Informe,Integer> implements IInformeDao{
   
 
}

 


    
