package controlador;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.entidades.Cliente;
import modelo.entidades.Usuario;
import modelo.servicio.interfaces.IClienteService;
import modelo.servicio.interfaces.IUsuarioService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Crea un cliente y le asigna usuarios
 */
public class FormClienteServlet extends HttpServlet {

    static int id = 0;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     *
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     *
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        IClienteService clienteservice = ctx.getBean(IClienteService.class);
        IUsuarioService usuarioservice = ctx.getBean(IUsuarioService.class);
        ClienteController controlador = new ClienteController();

        try {
            id = 0;
            Cliente c = null;
            //Id recibido de la vista listaClientes al pinchar sobre un cliente
            id = Integer.parseInt(request.getParameter("id"));
            if (id != 0) {
                c = clienteservice.obtenerClientePorID(id);
                ArrayList usuarios = usuarioservice.getUsuarios();
                Set usuariosCliente = c.getUsuarios();
                request.getSession().setAttribute("cliente", c);
                request.getSession().setAttribute("clienteUsuarios", usuariosCliente);
                request.getSession().setAttribute("usuarios", controlador.usuariosNoAssig(clienteservice, usuarioservice, c));

            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        response.sendRedirect("formulario_cliente.jsp");
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     *
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        IClienteService clienteservice = ctx.getBean(IClienteService.class);
        IUsuarioService usuarioservice = ctx.getBean(IUsuarioService.class);
        Cliente c = null;
        try {
            String nombreCLiente = (String) request.getParameter("nombre");
            String cifCliente = (String) request.getParameter("cif");
            if (id == 0) {
                Cliente cliente = new Cliente();
                cliente.setNombre(nombreCLiente);
                cliente.setCif(cifCliente);
                clienteservice.insertarCliente(cliente);
                c = clienteservice.ClientePorCif(cifCliente).get(0);
            } else {
                c = clienteservice.obtenerClientePorID(id);
                c.setNombre(nombreCLiente);
            }
            if (!request.getParameter("liTab").isEmpty()) {
                String[] listaUsuarios = ((String) request.getParameter("liTab")).split(":");
                Set conjuntoUsuarios = new HashSet();
                for (String usuario : listaUsuarios) {
                    Usuario us = usuarioservice.obtenerPorId(Integer.parseInt(usuario));
                    conjuntoUsuarios.add(us);
                }
                c.setUsuarios(conjuntoUsuarios);
                clienteservice.actualizarCliente(c);
                Iterator it = conjuntoUsuarios.iterator();
                while (it.hasNext()) {
                    Usuario u = (Usuario) it.next();
                    if (!clienteservice.ClienteTieneUsuario(c, u)) {
                        u.getClientes().add(c);
                        usuarioservice.actualizar(u);
                    } else {
                        clienteservice.desasignarUsuario(c, u);
                    }
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        response.sendRedirect("FormClienteServlet?id=" + c.getIdCliente());
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
