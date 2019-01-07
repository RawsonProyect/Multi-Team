package controlador;

import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.management.InstanceNotFoundException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.entidades.Cliente;
import modelo.entidades.Informe;
import modelo.entidades.Proyecto;
import modelo.entidades.Requisito;
import modelo.entidades.Tarea;
import modelo.excepciones.InstanceException;
import modelo.servicio.interfaces.IEntidadesService;
import modelo.servicios.EntidadesService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Carga las listas de las tareas, requisitos, clientes, alertas e informes de un proyecto.
 * Redirecciona a mostrarProyecto.jsp
 */
public class MostrarProyectoServlet extends HttpServlet {

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
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        IEntidadesService servicio = ctx.getBean(IEntidadesService.class);
        String id = (String) request.getParameter("idProyecto");
        Set<Tarea> conjuntoAlertas = new HashSet();
        Set<Informe> conjuntoInformes = new HashSet();
        Proyecto proyecto = null;
        try {
            proyecto = servicio.obtenerPorId(Integer.valueOf(id));

        } catch (InstanceNotFoundException ex) {
            Logger.getLogger(InicioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        List<Requisito> listaRequisitos = null;
        try {
            listaRequisitos = servicio.listarRequisitosProyecto(proyecto);
        } catch (InstanceException ex) {
            Logger.getLogger(MostrarProyectoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        for (int i = 0; i < listaRequisitos.size(); i++) {
            Requisito requisito = listaRequisitos.get(i);
            Set<Tarea> tareas = requisito.getTareas();

            for (Tarea t : tareas) {
                conjuntoAlertas.addAll(t.getAlertas());
                conjuntoInformes.addAll(t.getInformes());
            }
        }
        List<Cliente> listaClientes = servicio.listarClientes();

        request.getSession().setAttribute("proyecto", proyecto);
        request.getSession().setAttribute("listaRequisitos", listaRequisitos);
        request.getSession().setAttribute("listaClientes", listaClientes);
        request.getSession().setAttribute("conjuntoAlerta", conjuntoAlertas);
        request.getSession().setAttribute("conjuntoInformes", conjuntoInformes);
        response.sendRedirect("mostrarProyecto.jsp");
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
        IEntidadesService servicio = ctx.getBean(IEntidadesService.class);
        String id = (String) request.getParameter("idProyecto");
        Set<Tarea> conjuntoAlertas = new HashSet();
        Set<Informe> conjuntoInformes = new HashSet();
        Proyecto proyecto = null;
        try {
            proyecto = servicio.obtenerPorId(Integer.valueOf(id));

        } catch (InstanceNotFoundException ex) {
            Logger.getLogger(InicioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        List<Requisito> listaRequisitos = null;
        try {
            listaRequisitos = servicio.listarRequisitosProyecto(proyecto);
        } catch (InstanceException ex) {
            Logger.getLogger(MostrarProyectoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        for (int i = 0; i < listaRequisitos.size(); i++) {
            Requisito requisito = listaRequisitos.get(i);
            Set<Tarea> tareas = requisito.getTareas();

            for (Tarea t : tareas) {
                conjuntoAlertas.addAll(t.getAlertas());
                conjuntoInformes.addAll(t.getInformes());
            }
        }
        List<Cliente> listaClientes = servicio.listarClientes();

        request.getSession().setAttribute("proyecto", proyecto);
        request.getSession().setAttribute("listaRequisitos", listaRequisitos);
        request.getSession().setAttribute("listaClientes", listaClientes);
        request.getSession().setAttribute("conjuntoAlerta", conjuntoAlertas);
        request.getSession().setAttribute("conjuntoInformes", conjuntoInformes);
        response.sendRedirect("mostrarProyecto.jsp");
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
