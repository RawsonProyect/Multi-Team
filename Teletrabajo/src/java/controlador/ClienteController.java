/*
 To change this license header, choose License Headers in Project Properties.
 To change this template file, choose Tools | Templates
 and open the template in the editor.
 */
package controlador;

import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.entidades.Cliente;
import modelo.entidades.Usuario;
import modelo.excepciones.InstanceException;
import modelo.servicios.ClienteService;
import modelo.servicios.UsuarioService;
import modelo.servicio.interfaces.IClienteService;
import modelo.servicio.interfaces.IUsuarioService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 
 */
public class ClienteController
{
    @Autowired
    UsuarioService usuarioservice;
    @Autowired
    ClienteService clienteservice;
    public ArrayList<Usuario> usuariosNoAssig(Cliente c)
    {
        ArrayList<Usuario> usuarios = new ArrayList<>();
        try
        {
            while(c.getUsuarios().iterator().hasNext())
            {
                Usuario clienteUser = (Usuario)c.getUsuarios().iterator().next();
                for(Usuario u : usuarioservice.getUsuarios())
                {
                    if(u.getIdUsuario() != clienteUser.getIdUsuario())
                    {
                        usuarios.add(u);
                    }
                }
            }
        }
        catch(InstanceException ex)
        {
            Logger.getLogger(ClienteController.class.getName()).log(Level.SEVERE,null,ex);
        }
        return usuarios;
    }
    public ArrayList<Usuario> usuariosNoAssig(IClienteService clienteservice,IUsuarioService usuarioservice,Cliente cliente) throws InstanceException
    {
        return usuarioservice.getUsuarios();
    }

}
