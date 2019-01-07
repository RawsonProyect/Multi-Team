/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.util.ArrayList;
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
import modelo.entidades.Informe;
import modelo.entidades.Proyecto;
import modelo.entidades.Requisito;
import modelo.entidades.Alerta;
import modelo.entidades.Tarea;
import modelo.servicio.interfaces.IEntidadesService;
import modelo.servicios.EntidadesService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Carga la lista de proyectos a partir del id de usuario que se ha logueado
 */
public class InicioServlet extends HttpServlet {

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
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        IEntidadesService servicio = ctx.getBean(IEntidadesService.class);
        Integer idProyecto = Integer.valueOf(request.getParameter("idProyecto"));


        Set<Alerta> conjuntoAlertas = new HashSet();
        Set<Informe> conjuntoInformes = new HashSet();
        Proyecto proyecto = new Proyecto();
        try {
            proyecto = servicio.obtenerPorId(idProyecto);

        } catch (InstanceNotFoundException ex) {
            Logger.getLogger(InicioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getSession().setAttribute("idProyecto", String.valueOf(idProyecto));
        List<Requisito> listaTodosRequisitos = servicio.listarTodosRequisitosPorIdProyecto(idProyecto);
        List<Requisito> listaIncidencias = new ArrayList<>();
        List<Requisito> listaRequisitos = new ArrayList<>();

        for (int i = 0; i < listaTodosRequisitos.size(); i++) {
            Requisito requisito = listaTodosRequisitos.get(i);
            if (requisito.isEsIncidencia()) {
                listaIncidencias.add(requisito);
            } else {
                listaRequisitos.add(requisito);
            }
            Set<Tarea> tareas = requisito.getTareas();

            for (Tarea t : tareas) {
                conjuntoAlertas.addAll(t.getAlertas());
                conjuntoInformes.addAll(t.getInformes());
            }
        }

        request.getSession().setAttribute("listaRequisitos", listaRequisitos);
        request.getSession().setAttribute("listaIncidencias", listaIncidencias);
        request.getSession().setAttribute("conjuntoAlerta", conjuntoAlertas);
        request.getSession().setAttribute("conjuntoInformes", conjuntoInformes);
        request.getSession().setAttribute("Proyecto", proyecto.getNombre());
        response.sendRedirect("DetalleProyecto.jsp");

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
        List<Proyecto> lista = servicio.listarProyectosPorUsuario(1);
        request.getSession().setAttribute("lista", lista);
        response.sendRedirect("indexProyectos.jsp");
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
