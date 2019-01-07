
<%@page import="java.util.Date"%>
<%@page import="modelo.entidades.Informe"%>
<%@page import="modelo.entidades.Archivo"%>
<%@page import="java.util.Iterator"%>

<%@page import="java.util.List"%>

<!-- TABLA PROYECTO -->


<section class="section">
    <div class="container mt-100">

        <h1 class="text-center">Informe</h1>

    </div>
</section>
<!-- TABLA PROYECTO -->
<section>

    <div class="table-responsive-sm">

        <a class="btn btn-success" href="home.jsp?p=addInforme">Agregar Nuevo</a> 
        <br>
        <br>
        <table class="table table-hover">
            <thead class="bg-light">
                <tr>
                    <th class="text-center">ID</th>
                    <th class="text-center">RUTA</th>
                    <th class="text-center">FECHA</th>
                    <th class="text-center">USUARIO</th>


                </tr>
            </thead>
            <% List<Informe> listInformes = (List<Informe>)session.getAttribute("listaInforme");
                for(int i = 0; i < listInformes.size(); i++)
                {
                    Informe info = listInformes.get(i);
                    int id = info.getIdInforme();
                    String ruta = info.getRutaInforme();
                    Date fecha = info.getFecha();
                    int user = info.getUsuario().getIdUsuario();

            %>
            <tbody>
                <tr>
                    <td class="text-center"><%=id%></td>
                    <td class="text-center"><%=ruta%></td>
                    <td class="text-center"><%=fecha%></td>
                    <td class="text-center"><%=user%></td>


                    <td class="text-center">
                        <a class="btn btn-warning" href="#">Editar</a>
                        <a class="btn btn-danger" href="#">Remove</a>
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
