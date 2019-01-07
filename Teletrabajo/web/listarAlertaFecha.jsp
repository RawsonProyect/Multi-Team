
<%@page import="modelo.entidades.Alerta"%>
<%@page import="java.util.Date"%>
<%@page import="modelo.entidades.Informe"%>
<%@page import="modelo.entidades.Archivo"%>
<%@page import="java.util.Iterator"%>

<%@page import="java.util.List"%>

<!-- TABLA PROYECTO -->


<section class="section">
    <div class="container mt-100">

        <h1 class="text-center">Alerta</h1>

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
                    <th class="text-center">ID TAREA</th>
                    <th class="text-center">ID TIPO ALERTA</th>
                    <th class="text-center">FECHA</th>
                    <th class="text-center">DESCRIPCION</th>


                </tr>
            </thead>
            <% List<Alerta> listAlertas = (List<Alerta>)session.getAttribute("listaAlertaPorFecha");
                for(int i = 0; i < listAlertas.size(); i++)
                {
                    Alerta a = listAlertas.get(i);
                    int id = a.getIdAlerta();
                    int idT = a.getTarea().getIdTarea();
                    int idTA = a.getTipoalerta().getIdTipoAlerta();
                    String descipcion = a.getDescripcion();
                    Date fecha = a.getFecha();

            %>
            <tbody>
                <tr>
                    <td class="text-center"><%=id%></td>
                    <td class="text-center"><%=idT%></td>
                    <td class="text-center"><%=idTA%></td>
                    <td class="text-center"><%=fecha%></td>
                    <td class="text-center"><%=descipcion%></td>


                  
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
