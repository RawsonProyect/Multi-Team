
<%@page import="java.util.Date"%>
<%@page import="modelo.entidades.Tarea"%>
<%@page import="modelo.entidades.Archivo"%>
<%@page import="java.util.Iterator"%>

<%@page import="java.util.List"%>

<!-- TABLA PROYECTO -->


<section class="section">
    <div class="container mt-100">

        <h1 class="text-center">Tarea</h1>

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

                    <th class="text-center">ID PADRE</th>
                    <th class="text-center">DESCRIPCION</th>

                    <th class="text-center">FECHA INCIO</th>
                    <th class="text-center">FECHA FINALIZACION</th>
                    <th class="text-center">ID REQUISITO</th>



                </tr>
            </thead>
            <% List<Tarea> listTareas = (List<Tarea>)session.getAttribute("listaTarea");
                for(int i = 0; i < listTareas.size(); i++)
                {
                    Tarea tarea = listTareas.get(i);
                    int id = tarea.getIdTarea();
                    int idR = tarea.getRequisito().getIdRequisito();
                    String Descripcion = tarea.getDescripcion();
                    Date ffr = tarea.getFfr();
                    Date fir = tarea.getFir();
                    int idPadre = tarea.getTarea().getIdTarea();

            %>
            <tbody>
                <tr>
                    <td class="text-center"><%=id%></td>
                    <td class="text-center"><%=idPadre%></td>

                    <td class="text-center"><%=Descripcion%></td>
                    <td class="text-center"><%=fir%></td>
                    <td class="text-center"><%=ffr%></td>
                    <td class="text-center"><%=idR%></td>

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
