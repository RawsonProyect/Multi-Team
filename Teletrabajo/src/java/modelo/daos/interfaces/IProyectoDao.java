package modelo.daos.interfaces;

import java.util.List;
import modelo.entidades.Proyecto;
import modelo.excepciones.InstanceException;

/*
 To change this license header, choose License Headers in Project Properties.
 To change this template file, choose Tools | Templates
 and open the template in the editor.
 */

public interface IProyectoDao extends IGenericDao<Proyecto,Integer>
{
    public List<Proyecto> getByParameter(String parameter, String value) throws InstanceException;
    
}
