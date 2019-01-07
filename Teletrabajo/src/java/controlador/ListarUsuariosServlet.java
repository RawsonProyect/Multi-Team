package controlador;

import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.entidades.Usuario;
import modelo.excepciones.InstanceException;
import modelo.servicio.interfaces.IUsuarioService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Carga los usuarios de la base de datos y los guarda como atributo en la sesión
 * Redirecciona a listaUsuarios.jsp
 */
public class ListarUsuariosServlet extends HttpServlet {

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
//        response.setContentType("text/html;charset=UTF-8");
//        try(PrintWriter out = response.getWriter())
//        {
//            String g = request.getParameter("accion");
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet UsuarioServlet</title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<p>" + g + "</p>");
//            out.println("<h1>Servlet UsuarioServlet at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }

        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        IUsuarioService usuarioservice = ctx.getBean(IUsuarioService.class);
        ArrayList<Usuario> lista = null;
        try {
            lista = usuarioservice.getUsuarios();
        } catch (InstanceException ex) {
            Logger.getLogger(ListarUsuariosServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getSession().setAttribute("lista", lista);
        response.sendRedirect("listaUsuarios.jsp");
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
        IUsuarioService usuarioservice = ctx.getBean(IUsuarioService.class);
        ArrayList<Usuario> lista = null;
        try {
            lista = usuarioservice.getUsuarios();
        } catch (InstanceException ex) {
            Logger.getLogger(ListarUsuariosServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getSession().setAttribute("lista", lista);
        response.sendRedirect("listaUsuarios.jsp");
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
        IUsuarioService usuarioservice = ctx.getBean(IUsuarioService.class);
        ArrayList<Usuario> lista = null;
        try {
            lista = usuarioservice.getUsuarios();
        } catch (InstanceException ex) {
            Logger.getLogger(ListarUsuariosServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getSession().setAttribute("lista", lista);
        response.sendRedirect("listaUsuarios.jsp");
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
