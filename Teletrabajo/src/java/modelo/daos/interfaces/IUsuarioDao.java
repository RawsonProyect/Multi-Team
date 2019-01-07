package modelo.daos.interfaces;

/*
 To change this license header, choose License Headers in Project Properties.
 To change this template file, choose Tools | Templates
 and open the template in the editor.
 */
import java.util.List;
import modelo.entidades.Usuario;
import modelo.excepciones.InstanceException;

/**
 *
 * @author LUCIA
 */
public interface IUsuarioDao extends IGenericDao<Usuario, Integer> {

    public List<Usuario> getByParameter(String parameter, String value) throws InstanceException;
}
