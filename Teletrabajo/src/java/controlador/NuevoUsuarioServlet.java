/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.entidades.Usuario;
import modelo.excepciones.DuplicateInstance;
import modelo.excepciones.InstanceException;
import modelo.servicios.UsuarioService;
import modelo.servicio.interfaces.IUsuarioService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Carga la lista de usuarios y redirecciona a nuevoUsuario.jsp
 * Crea un objeto usuario y lo añade a la base de datos
 */
public class NuevoUsuarioServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NuevoUsuarioServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NuevoUsuarioServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        IUsuarioService usuarioservice = ctx.getBean(IUsuarioService.class);
        List<Usuario> listaUsuarios = null;
        try {
            listaUsuarios = usuarioservice.getUsuarios();
        } catch (InstanceException ex) {
            Logger.getLogger(NuevoUsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getSession().setAttribute("listaUsuariios", listaUsuarios);
        response.sendRedirect("nuevoUsuario.jsp");
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        IUsuarioService usuarioservice = ctx.getBean(IUsuarioService.class);
        String nombre = (String) request.getParameter("userName");
        String login = (String) request.getParameter("userLogin");
        String pass = (String) request.getParameter("pass");
        String pass2 = (String) request.getParameter("pass2");
        String mail = (String) request.getParameter("mail");
        String dni = (String) request.getParameter("dni");
        Usuario u = new Usuario(nombre, dni, pass, mail, login);
        try {
            usuarioservice.insertarUsuario(u);
        } catch (DuplicateInstance | InstanceException ex) {
            Logger.getLogger(NuevoUsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect("ListarUsuariosServlet");
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
