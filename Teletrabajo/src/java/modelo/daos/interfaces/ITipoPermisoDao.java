package modelo.daos.interfaces;

/*
 To change this license header, choose License Headers in Project Properties.
 To change this template file, choose Tools | Templates
 and open the template in the editor.
 */
import java.util.List;
import modelo.entidades.Tipopermiso;
import modelo.excepciones.InstanceException;

/**
 *
 * @author Arlen
 */
public interface ITipoPermisoDao extends IGenericDao<Tipopermiso, Integer> {

    public List<Tipopermiso> getByParameter(String parameter, String value) throws InstanceException;
}
