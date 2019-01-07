package modelo.daos.interfaces;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.util.List;
import modelo.entidades.Proyecto;
import modelo.entidades.Requisito;
import modelo.excepciones.InstanceException;

/**
 *
 * @author hmia
 */
public interface IRequisitoDao extends IGenericDao<Requisito, Integer> {

    List<Requisito> getByParameter(String parameter, String value) throws InstanceException;
    List<Requisito> getByParameter(String parameter, Proyecto value) throws InstanceException;
}
