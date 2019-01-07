
<%@page import="modelo.entidades.Proyecto"%>
<%@page import="java.util.Date"%>
<%@page import="modelo.entidades.Informe"%>
<%@page import="modelo.entidades.Archivo"%>
<%@page import="java.util.Iterator"%>

<%@page import="java.util.List"%>

<!-- TABLA PROYECTO -->


<section class="section">
    <div class="container mt-100">

        <h1 class="text-center">Proyectos</h1>

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
                    <th class="text-center">NOMBRE</th>
                    <th class="text-center">CLIENTE</th>
                    <th class="text-center">ESTADO</th>
                    <th class="text-center">FECHA INICIO</th>
                    <th class="text-center">FECHA FINALIZACION</th>



                </tr>
            </thead>
            <% List<Proyecto> listProyectos = (List<Proyecto>)session.getAttribute("listaProyectos");
                for(int i = 0; i < listProyectos.size(); i++)
                {
                    Proyecto pro = listProyectos.get(i);
                    int id = pro.getIdProyecto();
                    int idC = pro.getCliente().getIdCliente();
                    String nombre = pro.getNombre();
                    boolean estado = pro.isEstado();
                    String estadoString = "";
                    if(estado=false)estadoString="Finalizado";
                    else estadoString="En curso";
                    Date fi = pro.getFip();
                    Date ff = pro.getFfp();

            %>
            <tbody>
                <tr>
                    <td class="text-center"><%=id%></td>
                    <td class="text-center"><%=nombre%></td>
                    <td class="text-center"><%=idC%></td>
                    <td class="text-center"><%=estadoString%></td>
                    <td class="text-center"><%=fi%></td>
                    <td class="text-center"><%=ff%></td>


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
