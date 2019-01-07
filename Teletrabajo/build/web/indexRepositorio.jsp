<%-- 
    Document   : indexInicio
    Created on : 17-dic-2018, 21:26:49
    Author     : LUCIA
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.entidades.Proyecto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.entidades.Tipoalerta"%>

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
                $('#tabla').DataTable();
            });

            $('#myTable').DataTable({
                responsive: true
            });
        </script>
    </head>

    <body>
        <form action="InicioServlet" method="get">

            <% Object proyectoName = session.getAttribute("proyectoName");%>
            <div class="wrapper">
                <!-- Sidebar  -->
                <nav id="sidebar">
                    <div class="sidebar-header">
                        <h3><img src="img/LOGO-RAWSONBPO-9.png" height="70"  alt="Rawson BPO logo"/></h3>
                        <strong><img src="img/LOGO-R-1.png" height="70"  alt="Rawson BPO logo"/></strong>

                    </div>


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
                                        <a class="nav-link" href="chat.jsp">Chat</a>
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
                    <jsp:include page="<%= "repositorio.jsp"%>" />
                </div>
            </div>
            <div class="line"></div>
            <!-- Bootstrap JS -->
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

            <script src="js/js.js"></script>

        </form>
    </body>
</html>
