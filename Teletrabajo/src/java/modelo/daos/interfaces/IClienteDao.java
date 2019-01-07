package modelo.daos.interfaces;

/*
 To change this license header, choose License Headers in Project Properties.
 To change this template file, choose Tools | Templates
 and open the template in the editor.
 */
import java.util.List;
import modelo.daos.interfaces.IGenericDao;
import modelo.entidades.Cliente;
import modelo.excepciones.InstanceException;

/**
 *
 * @author LUCIA
 */
public interface IClienteDao extends IGenericDao<Cliente, Integer> {

    public List<Cliente> getByParameter(String parameter, String value) throws InstanceException;
}
