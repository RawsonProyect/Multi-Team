/*
 To change this license header, choose License Headers in Project Properties.
 To change this template file, choose Tools | Templates
 and open the template in the editor.
 */
package modelo.servicio.interfaces;

import java.util.ArrayList;
import modelo.entidades.Usuario;
import modelo.excepciones.DuplicateInstance;
import modelo.excepciones.InstanceException;



/**

 @author Arlen
 */
public interface IUsuarioService
{
    public void insertarUsuario(Usuario u)throws DuplicateInstance, InstanceException;
    public void actualizar(Usuario u) throws InstanceException, DuplicateInstance;
    public Usuario obtenerPorId(int id) throws InstanceException;
    public ArrayList<Usuario> getUsuarios()throws InstanceException ;  
    public void eliminarUsuario(Usuario u) throws InstanceException;
}
