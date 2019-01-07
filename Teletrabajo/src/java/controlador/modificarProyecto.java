package controlador;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.management.InstanceNotFoundException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.entidades.Cliente;
import modelo.entidades.Proyecto;
import modelo.servicio.interfaces.IEntidadesService;
import modelo.servicios.EntidadesService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Carga un proyecto, lo modifica con los datos del formulario y lo guarda en la base de datos
 */
public class modificarProyecto extends HttpServlet {

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
        Proyecto proyecto = null;
        Cliente cliente = null;
        try {
            int idProyecto = Integer.parseInt(request.getParameter("idProyecto"));
            proyecto = servicio.obtenerPorId(idProyecto);
            int idCliente = Integer.parseInt(request.getParameter("idCliente"));
            cliente = servicio.obtenerClientePorId(idCliente);
        } catch (InstanceNotFoundException ex) {
            System.out.println(ex.getMessage());
            // Página de error
        }
        String fip = (String) request.getParameter("FechaIniPr");
        String ffp = (String) request.getParameter("FechaFinPr");
        String fir = (String) request.getParameter("FechaIni");
        String ffr = (String) request.getParameter("FechaFin");
        String nombreProyecto = (String) request.getParameter("Proy_Name");
        Date dFip = null;
        Date dFfp = null;
        Date dFir = null;
        Date dFfr = null;
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        if (proyecto != null) {
            if (fip != null && !fip.equalsIgnoreCase("Sin Determinar")) {
                try {
                    dFip = sdf.parse(fip);
                    proyecto.setFip(dFip);
                } catch (ParseException ex) {
                    Logger.getLogger(modificarProyecto.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (ffp != null && !ffp.equalsIgnoreCase("Sin Determinar")) {
                try {
                    dFfp = sdf.parse(ffp);
                    proyecto.setFfp(dFfp);
                } catch (ParseException ex) {
                    Logger.getLogger(modificarProyecto.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (fir != null && !fir.equalsIgnoreCase("Sin Determinar")) {
                try {
                    dFir = sdf.parse(fir);
                    proyecto.setFir(dFir);
                } catch (ParseException ex) {
                    Logger.getLogger(modificarProyecto.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (ffr != null && !ffr.equalsIgnoreCase("Sin Determinar")) {
                try {
                    dFfr = sdf.parse(ffr);
                    proyecto.setFfr(dFfr);
                } catch (ParseException ex) {
                    Logger.getLogger(modificarProyecto.class.getName()).log(Level.SEVERE, null, ex);
                }                System.out.println("DFFR = " + dFfr);
            }
            if (cliente != null) {
                proyecto.setCliente(cliente);
            }
            proyecto.setNombre(nombreProyecto);
            servicio.actualizarProyecto(proyecto);
        }
        response.sendRedirect("ListarProyectosServlet");
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
