/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.management.InstanceNotFoundException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.entidades.Cliente;
import modelo.entidades.Prioridad;
import modelo.entidades.Proyecto;
import modelo.entidades.Requisito;
import modelo.entidades.Usuario;
import modelo.excepciones.InstanceException;
import modelo.servicio.interfaces.IEntidadesService;
import modelo.servicios.EntidadesService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Recoge los datos del formulario de creaRequisito.jsp y crea un objeto Requisito a partir de ellos.
 * Usando EntidadService.java lo añade a la base de datos
 */
public class CrearRequisitoServlet extends HttpServlet {

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
        IEntidadesService servicio = ctx.getBean(IEntidadesService.class);

        String prioridad = (String) request.getParameter("prioridad");
        String ruta = (String) request.getParameter("file");
        String incidencia = (String) request.getParameter("incidencia");
        String idProyecto = (String) request.getSession().getAttribute("idProyecto");
        boolean esIncidencia = ((incidencia == null) ? false : true);
        String opcion = (String)request.getSession().getAttribute("opcion");

        try {
            Prioridad pri = servicio.obtenerPrioridadNombre(prioridad);
            Proyecto p = servicio.obtenerProyectoId(Integer.valueOf(idProyecto));
            Usuario usuario = servicio.obtenerUsuarioId(1);

            Requisito requisito = new Requisito();

            requisito.setFecha(new Timestamp(System.currentTimeMillis()));
            requisito.setFinalizado(false);
            requisito.setPrioridad(pri);
            requisito.setProyecto(p);
            requisito.setRuta(ruta);
            requisito.setUsuario(usuario);
            if (opcion.equalsIgnoreCase("requisito")) {
                requisito.setEsIncidencia(false);
                List<Requisito> listaRequisitos = servicio.listarTodosRequisitosPorIdProyecto(Integer.valueOf(idProyecto));
                request.getSession().setAttribute("listaRequisitos", listaRequisitos);
            } else {
                requisito.setEsIncidencia(true);
                List<Requisito> listaIncidencias=servicio.listarIncidenciasPorIdProyecto(Integer.valueOf(idProyecto));
                request.getSession().setAttribute("listaIncidencias", listaIncidencias);
            }
            servicio.guardarRequisito(requisito);
            
            
            response.sendRedirect("DetalleProyecto.jsp");

        } catch (InstanceNotFoundException ex) {
            Logger.getLogger(CrearRequisitoServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstanceException ex) {
                  }

        response.setContentType("text/html;charset=UTF-8");
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
