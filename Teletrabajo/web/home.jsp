<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">


        <title>Rawson BPO</title>


        <!-- Bootstrap CSS CDN -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <!-- Our Custom CSS -->
        <link rel="stylesheet" href="css/style.css">

        <!-- Font Awesome JS -->
        <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
        <!-- jQuery CDN - Slim version (=without AJAX) -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <!-- Popper.JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
        <!-- Bootstrap JS -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

        <script src="js/js.js"></script>

    </head>

    <link rel="shortcut icon" href="img/favicon.ico">
    <body>

        <div class="wrapper">
            <!-- Sidebar  -->
            <nav id="sidebar">
                <div class="sidebar-header">
                    <h3><img src="img/LOGO-RAWSONBPO-9.png" height="70"  alt=""/></h3>
                    <strong><img src="img/LOGO-R-1.png" height="70"  alt=""/></strong>
                </div>

                <ul class="list-unstyled components">

                    <li>
                        <a href="#tareaSubmenu" data-toggle="collapse" aria-expanded="false">
                            <i class="glyphicon glyphicon-paperclip"></i>
                            Tareas
                        </a>
                        <ul class="collapse list-unstyled" id="tareaSubmenu">
                            <li><a href="home.jsp?p=listarTareaTotal">Todos las tareas</a></li>
                            <li><a href="home.jsp?p=listarTareaFecha">Tareas por fecha inicio</a></li>
                            <li><a href="home.jsp?p=listarTareaPadre">Tareas por tarea padre</a></li>
                        </ul>
                    </li>

                    <li>

                        <a href="#requisitosSubmenu" data-toggle="collapse" aria-expanded="false">
                            <i class="glyphicon glyphicon-briefcase"></i>
                            Requisitos
                        </a>
                        <ul class="collapse list-unstyled" id="requisitosSubmenu">
                            <li><a href="home.jsp?p=listarRequisitoTotal">Todos los requisitos</a></li>
                            <li><a <a href="home.jsp?p=listarRequisitoFecha">Requisito por Fecha</a></li>
                            <li><a <a href="home.jsp?p=listarRequisitoUser">Tus requisitos</a></li>


                        </ul>
                    </li>

                    <li>

                        <a href="#informesSubmenu"  data-toggle="collapse" aria-expanded="false">
                            <i class="glyphicon glyphicon-duplicate"></i>
                            Informes
                        </a>
                        <ul class="collapse list-unstyled" id="informesSubmenu">

                            <li><a href="home.jsp?p=listarInformeTotal">Todos los informes</a></li>
                            <li><a <a href="home.jsp?p=listarInformeFecha">Tus informes por Fecha</a></li>
                            <li><a href="home.jsp?p=listarInformeUsuario">Tus Informes Por ID</a></li>
                        </ul>
                    </li>

                    <li>
                        <a href="home.jsp?p=repositorio">
                            <i class="glyphicon glyphicon-cloud"></i>

                            Repositorio
                        </a>
                    </li>

                    <li >
                        <a href="#alertasSubmenu" data-toggle="collapse" aria-expanded="false">
                            <i class="glyphicon glyphicon-flag"></i>
                            Alertas
                        </a>
                        <ul class="collapse list-unstyled" id="alertasSubmenu">

                            <li><a href="home.jsp?p=listarAlertaTotal">Todas las tareas</a></li>
                            <li><a href="home.jsp?p=listarAlertaFecha">Tareas por fecha</a></li>

                        </ul>
                    </li>

                </ul>

                <ul class="list-unstyled CTAs">

                    <li><a href="" class="article"><i class=""></i></a></li>
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

                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="nav navbar-nav ml-auto">
                                <li class="nav-item active">
                                    <a class="nav-link" href="home.jsp?p=proyectos">Proyectos</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Chat</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Cuenta</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="log.jsp" onclick="<%request.getSession(false);%>">Salir</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>


                <!-- TABLA  -->


                <div  class="table-responsive-sm">

                      <%
                        if(request.getParameter("p") != null)
                        {
                            String p = request.getParameter("p");
                    %>    

                    <jsp:include page="<%= p + ".jsp"%>" />

                    <%    }

                    %>

                </div>
                      <div  class="table-responsive-sm">

                    <%
                        if(request.getParameter("p") == null)
                        {
                            String p = request.getParameter("p");
                    %>    

                    <jsp:include page="<%= "proyectos.jsp"%>" />

                    <%    }

                    %>
                </div>

            </div>

    </body>

</html>