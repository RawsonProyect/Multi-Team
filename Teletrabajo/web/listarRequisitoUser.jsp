<%-- 
    Document   : requisito
    Created on : 04-ene-2019, 10:43:32
    Author     : Fer
--%>

<%@page import="java.util.Date"%>
<%@page import="modelo.entidades.Informe"%>
<%@page import="modelo.entidades.Archivo"%>
<%@page import="modelo.entidades.Requisito"%>
<%@page import="java.util.Iterator"%>

<%@page import="java.util.List"%>

<!-- TABLA PROYECTO -->


<section class="section">
    <div class="container mt-100">

        <h1 class="text-center">Requisito</h1>

    </div>
</section>
<!-- TABLA PROYECTO -->
<section>

    <div class="table-responsive-sm">


        <br>
        <br>
        <table class="table table-hover">
            <thead class="bg-light">
                <tr>
                    <th class="text-center">ID</th>
                    <th class="text-center">ID PRIORIDAD</th>
                  
                    <th class="text-center">ID PROYECTO</th>
                    <th class="text-center">FECHA</th>
                    <th class="text-center">RUTA</th>

                </tr>
            </thead>
            <% List<Requisito> listRequisitos = (List<Requisito>)session.getAttribute("listaRequisitoUserID");
                for(int i = 0; i < listRequisitos.size(); i++)
                {
                    Requisito req = listRequisitos.get(i);
                    int id = req.getIdRequisito();
                    int idPr = req.getPrioridad().getIdPrioridad();
                    int idU = req.getUsuario().getIdUsuario();
                    int idP = req.getProyecto().getIdProyecto();
                    Date fecha = req.getFecha();
                    String ruta = req.getRuta();

            %>
            <tbody>
                <tr>
                    <td class="text-center"><%=id%></td>
                    <td class="text-center"><%=idPr%></td>
                 
                    <td class="text-center"><%=idP%></td>
                    <td class="text-center"><%=fecha%></td>
                    <td class="text-center"><%=ruta%></td>

                     
                    </td>
                </tr>
                <%}%>
            </tbody>
        </table>

    </div>
</section>
<footer class="bg-light text-dark">
    <div class="container">
        <div class="row">


            <div class="col-md-12 text-md-center">

                <p class="pt-1 text-muted">&copy; Rawson BPO 2018</p>
            </div>
        </div>
    </div>
</footer>
