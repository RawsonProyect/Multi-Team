package controlador;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.management.InstanceNotFoundException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.entidades.Alerta;
import modelo.entidades.Informe;
import modelo.entidades.Proyecto;
import modelo.entidades.Requisito;
import modelo.entidades.Tarea;
import modelo.servicio.interfaces.IAlertaService;
import modelo.servicio.interfaces.IEntidadesService;
import modelo.servicio.interfaces.IInformeService;
import modelo.servicio.interfaces.IRequisitoService;
import modelo.servicio.interfaces.ITareaService;
import modelo.servicios.AlertaService;
import modelo.servicios.EntidadesService;
import modelo.servicios.InformeService;
import modelo.servicios.RequisitoService;
import modelo.servicios.TareaService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Realiza todas las acciones necesarias para un usuario desarrollador
 */
public class T3Servlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            listarInformes(request, response);
            listarAlertas(request, response);
            listarRequisitos(request, response);
            listarTareas(request, response);
            listarProyectos(request, response);
            response.sendRedirect("home.jsp");
            processRequest(request, response);
        } catch (InstanceNotFoundException ex) {
            Logger.getLogger(T3Servlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    protected void listarInformes(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, InstanceNotFoundException {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        IInformeService servicio = ctx.getBean(IInformeService.class);
        List<Informe> listaInforme = servicio.listarInformes();
        List<Informe> listaInformePorFecha = servicio.listarInformesOrder("fecha");
        List<Informe> listaInformePorID = servicio.listarInformesOrder("idInforme");
        List<Informe> listaInformeUserID = new ArrayList<>();
        List<Informe> listaInformeUserFecha = new ArrayList<>();
        int idUser = 2;
        for (Informe informe : listaInformePorFecha) {
            if (informe.getUsuario().getIdUsuario() == idUser) {
                listaInformeUserID.add(informe);
            }
        }
        for (Informe informe : listaInformePorID) {
            if (informe.getUsuario().getIdUsuario() == idUser) {
                listaInformeUserFecha.add(informe);
            }
        }
        request.getSession().setAttribute("listaInforme", listaInforme);
        request.getSession().setAttribute("listaInformeUserID", listaInformeUserID);
        request.getSession().setAttribute("listaInformeUserFecha", listaInformeUserFecha);

    }

    protected void listarProyectos(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, InstanceNotFoundException {
        ApplicationContext ct = new ClassPathXmlApplicationContext("applicationContext.xml");
//        ProyectoService servicio = ct.getBean(ProyectoService.class);
//        List<Proyecto> listaProyectos = servicio.listarProyectos();
//        request.getSession().setAttribute("listaProyectos",listaProyectos);
        IEntidadesService servicio = ct.getBean(IEntidadesService.class);
        List<Proyecto> listaProyectos = servicio.listarProyectosPorUsuario(Integer.parseInt(request.getSession().getAttribute("idUsuario").toString()));
        request.getSession().setAttribute("listaProyectos", listaProyectos);
    }

    protected void listarAlertas(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, InstanceNotFoundException {
        ApplicationContext ct = new ClassPathXmlApplicationContext("applicationContext.xml");
        IAlertaService servicioa = ct.getBean(IAlertaService.class);
        List<Alerta> listaAlertaPorFecha = servicioa.listarAlertasOrder("fecha");
        List<Alerta> listaAlertaPorID = servicioa.listarAlertasOrder("idAlerta");
        request.getSession().setAttribute("listaAlertaPorFecha", listaAlertaPorFecha);
        request.getSession().setAttribute("listaAlertaPorID", listaAlertaPorID);
    }

    protected void listarRequisitos(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, InstanceNotFoundException {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        IRequisitoService servicio = ctx.getBean(IRequisitoService.class);
        List<Requisito> listaRequisito = servicio.listarRequisitos();
        List<Requisito> listaRequisitoPorFecha = servicio.listarRequisitosOrder("fecha");
        List<Requisito> listaRequisitoUserID = new ArrayList<>();
        int idUser = 2;
        for (Requisito requisito : listaRequisito) {
            if (requisito.getUsuario().getIdUsuario() == idUser) {
                listaRequisitoUserID.add(requisito);
            }
        }
        request.getSession().setAttribute("listaRequisito", listaRequisito);
        request.getSession().setAttribute("listaRequisitoPorFecha", listaRequisitoPorFecha);
        request.getSession().setAttribute("listaRequisitoUserID", listaRequisitoUserID);
    }

    protected void listarTareas(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, InstanceNotFoundException {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        ITareaService servicio = ctx.getBean(ITareaService.class);
        List<Tarea> listaTarea = servicio.listarTareas();
        List<Tarea> listaTareaPorFecha = servicio.listarTareasOrder("fir");
        List<Tarea> listaTareaPorPadre = servicio.listarTareasOrder("tarea");
        request.getSession().setAttribute("listaTarea", listaTarea);
        request.getSession().setAttribute("listaTareaPorPadre", listaTareaPorPadre);
        request.getSession().setAttribute("listaTareaPorFecha", listaTareaPorFecha);
    }

}
