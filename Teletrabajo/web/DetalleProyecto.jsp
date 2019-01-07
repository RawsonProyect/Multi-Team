<%-- 
    Document   : DetalleProyecto
    Created on : 27-dic-2018, 11:51:47
    Author     : LUCIA
--%>

<%@page import="java.lang.String"%>
<%@page import="modelo.entidades.Informe"%>
<%@page import="modelo.entidades.Alerta"%>
<%@page import="java.util.Set"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="modelo.entidades.Requisito"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <title>Rawson BPO</title>
        <!-- Font Awesome JS -->
        <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">


        <!--<link rel="stylesheet" href="css/bootstrap.css">-->
        <!-- Bootstrap CSS CDN -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <!-- Our Custom CSS -->
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/styleacordeon.css">

        <!--datatables css-->
        <link rel="stylesheet" href="css/dataTables.bootstrap4.min.css">
        <!--<link rel="stylesheet" href="css/bootstrap.css">-->

        <!--datatables js -->

        <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
        <script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="js/dataTables.bootstrap4.min.js"></script>

        <link rel="shortcut icon" href="img/favicon.ico">

        <script type="text/javascript">
            $(document).ready(function () {
                $('table.display').DataTable();
            });

        </script>

    </head>

    <body>
        <div class="wrapper">
            <!-- Sidebar  -->
            <nav id="sidebar">
                <div class="sidebar-header">
                    <h3><img src="img/LOGO-RAWSONBPO-9.png" height="70"  alt="Rawson BPO logo"/></h3>
                    <strong><img src="img/LOGO-R-1.png" height="70"  alt="Rawson BPO logo"/></strong>
                </div>

                <ul class="list-unstyled components">
                    <li>
                        <a href="EnlaceCrearRequisitoServlet?opcion=requisito">
                            <i class="glyphicon glyphicon-briefcase"></i>
                            Crear Requisito 
                        </a>
                    </li>

                    <li >
                        <a href="EnlaceCrearRequisitoServlet?opcion=incidencia">
                            <i class="glyphicon glyphicon-duplicate"></i>
                            Crear Incidencia
                        </a>
                    </li>

                    <li>
                        <a href="indexRepositorio.jsp">
                            <i class="glyphicon glyphicon-cloud"></i>
                            Repositorio
                        </a>
                    </li>

                    <li >
                        <a href="creaAlerta.jsp">
                            <i class="glyphicon glyphicon-flag"></i>
                            Crear Alerta
                        </a>
                    </li>
                </ul>
            </nav>


            <!-- Page Content  -->
            <div id="content">
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <div class="container-fluid">

                        <button type="button" id="sidebarCollapse" class="btn btn-info">
                            <i class="glyphicon glyphicon-list"></i>
                        </button>

                        <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <i class="fas fa-align-justify"></i>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="nav navbar-nav ml-auto">
                                <li class="nav-item active">
                                    <a class="nav-link" href="indexProyectos.jsp">Proyectos</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Chat</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link " data-toggle="dropdown" href="#" role="button" >Idioma</a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="#">Inglés</a>
                                        <a class="dropdown-item" href="#">Francés</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link " data-toggle="dropdown" href="perfil.jsp" role="button" >Perfil</a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="perfil.jsp">Ver perfil</a>
                                        <a class="dropdown-item" href="log.jsp" onclick="<%request.getSession(false);%>">Cerrar sesión</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>

                <!-- ACORDEON -->

                <% String nombreProyecto = (String) session.getAttribute("Proyecto");%>
                <div class="row">
                    <div class="col-5">
                    </div>
                    <div class="col form-group row col-5">
                        <p class="proy"><%=nombreProyecto%></p>
                    </div>
                    <div class="col-2">
                    </div>
                </div>

                <!-- CABECERA REQUISITOS -->   

                <div class="col-md-12">
                    <div class="panel-group" id="accordion9" role="tablist" aria-multiselectable="true">
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingOne9">
                                <h4 class="panel-title text-left">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion9" href="#collapseOne9" aria-expanded="true" aria-controls="collapseOne9">
                                        Requisitos
                                    </a>
                                </h4>
                            </div>

                            <!-- TABLA REQUISITOS -->

                            <div id="collapseOne9" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne9">
                                <div class="table-responsive-sm">
                                    <table id="tablaRequisitos" class="display table table-hover" style="width:100%">
                                        <thead class="bg-light">
                                            <tr>
                                                <th>Id</th>
                                                <th>Estado</th>
                                                <th>Fecha</th>
                                                <th>Prioridad</th>
                                                <th>Descripción</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% List<Requisito> listaRequisitos = (List<Requisito>) session.getAttribute("listaRequisitos");
                                                for (int i = 0; i < listaRequisitos.size(); i++) {
                                                    Requisito requisito = listaRequisitos.get(i);
                                                    int id = requisito.getIdRequisito();
                                                    boolean finalizado = requisito.isFinalizado();
                                                    String estado = (finalizado ? "FINALIZADO" : "EN CURSO");
                                                    Date fecha = requisito.getFecha();
                                                    String fechaS = "";
                                                    if (fecha != null) {
                                                        fechaS = new SimpleDateFormat("dd/MM/yyyy").format(fecha).toString();
                                                    } else {
                                                        fechaS = "No establecida";
                                                    }
                                                    String prioridad = requisito.getPrioridad().getNombre();
                                                    String ruta = requisito.getRuta();
                                            %>

                                            <tr>
                                                <th><%=id%></th>
                                                <td><%=estado%></td>
                                                <td><%=fechaS%></td>
                                                <td><%=prioridad%></td>
                                                <td>
                                                    <a href="<%=ruta%>">
                                                        <i class="fas fa-download"></i>
                                                    </a>
                                                </td>
                                            </tr>

                                            <%}%>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <!-- CABECERA INCIDENCIAS -->

                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingThree9">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion9" href="#collapseFour9" aria-expanded="false" aria-controls="collapseThree9">
                                        Incidencias
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseFour9" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree9">

                                <!-- TABLA INCIDENCIAS -->

                                <div class="table-responsive-sm">
                                    <table id="tablaIncidencias" class="display table table-hover" style="width:100%">
                                        <thead class="bg-light">
                                            <tr>
                                                <th>Id</th>
                                                <th>Estado</th>
                                                <th>Fecha</th>
                                                <th>Prioridad</th>
                                                <th>Descripción</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% List<Requisito> listaIncidencia = (List<Requisito>) session.getAttribute("listaIncidencias");
                                                for (int i = 0; i < listaIncidencia.size(); i++) {
                                                    Requisito incidencia = listaIncidencia.get(i);
                                                    int id = incidencia.getIdRequisito();
                                                    boolean finalizado = incidencia.isFinalizado();
                                                    String estado = (finalizado ? "FINALIZADO" : "EN CURSO");
                                                    Date fecha = incidencia.getFecha();
                                                    String fechaS = "";
                                                    if (fecha != null) {
                                                        fechaS = new SimpleDateFormat("dd/MM/yyyy").format(fecha).toString();
                                                    } else {
                                                        fechaS = "No establecida";
                                                    }
                                                    String prioridad = incidencia.getPrioridad().getNombre();
                                                    String ruta = incidencia.getRuta();
                                            %>

                                            <tr>
                                                <th><%=id%></th>
                                                <td><%=estado%></td>
                                                <td><%=fechaS%></td>
                                                <td><%=prioridad%></td>
                                                <td>
                                                    <a href="<%=ruta%>">
                                                        <i class="fas fa-download"></i>
                                                    </a>
                                                </td>
                                            </tr>

                                            <%}%>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <!-- CABECERA ALERTAS -->

                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingThree9">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion9" href="#collapseThree9" aria-expanded="false" aria-controls="collapseThree9">
                                        Alertas
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseThree9" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree9">

                                <!-- TABLA ALERTAS -->

                                <div class="table-responsive-sm">
                                    <table id="tablaAlertas" class="display table table-hover" style="width:100%">
                                        <thead class="bg-light">
                                            <tr>
                                                <th>Descripción</th> <!--no mbre e id-->
                                                <th>Tarea</th>
                                                <th>Tipo</th>
                                                <th>Fecha</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                Set<Alerta> conjuntoAlerta = (Set<Alerta>) session.getAttribute("conjuntoAlerta");
                                                for (Alerta a : conjuntoAlerta) {
                                                    String descripcion = a.getDescripcion();
                                                    String tarea = a.getTarea().getDescripcion();
                                                    String tipo = a.getTipoalerta().getTipoAlerta();
                                                    Date fecha = a.getFecha();
                                                    String fechaS = "";
                                                    SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
                                                    if (fecha != null) {
                                                        fechaS = new SimpleDateFormat("dd/MM/yyyy").format(fecha).toString();
                                                    } else {
                                                        fechaS = "No establecida";
                                                    }
                                            %>

                                            <tr>
                                                <th><%=descripcion%></th>
                                                <td><%=tarea%></td>
                                                <td><%=tipo%></td>
                                                <td><%=fechaS%></td>
                                            </tr>

                                            <%}%>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <!-- CABECERA INFORMES -->

                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingTwo9">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion9" href="#collapseTwo9" aria-expanded="false" aria-controls="collapseTwo9">
                                        Informes
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseTwo9" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo9">

                                <!-- TABLA INFORMES -->

                                <div class="table-responsive-sm">
                                    <table id="tablaInformes" class="display table table-hover" style="width:100%">

                                        <thead class="bg-light">
                                            <tr>
                                                <th>Id</th>
                                                <th>Fecha</th>
                                                <th>Autor</th>
                                                <th>Descarga</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                Set<Informe> conjuntoInformes = (Set<Informe>) session.getAttribute("conjuntoInformes");
                                                for (Informe i : conjuntoInformes) {
                                                    int id = i.getIdInforme();
                                                    Date fecha = i.getFecha();
                                                    String fechaS = "";
                                                    if (fecha != null) {
                                                        fechaS = new SimpleDateFormat("dd/MM/yyyy").format(fecha).toString();
                                                    } else {
                                                        fechaS = "No establecida";
                                                    }
                                                    String autor = i.getUsuario().getNombre();
                                                    String ruta = i.getRutaInforme();
                                            %>

                                            <tr>
                                                <th><%=id%></th>
                                                <td><%=fechaS%></td>
                                                <td><%=autor%></td>
                                                <td>
                                                    <a href="<%=ruta%>">
                                                        <i class="fas fa-download"></i>
                                                    </a>
                                                </td>
                                            </tr>

                                            <%}%>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="line"></div>

        <!-- Bootstrap JS -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

        <script src="js/js.js"></script>

    </body>
</html>
