<%-- 
    Document   : perfil
    Created on : 02-ene-2019, 13:16:43
    Author     : NERA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Font Awesome JS -->
        <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">

        <!-- Bootstrap CSS CDN -->
        <link rel="stylesheet" href="css/bootstrap.v4.1.0.min.css">
        <link rel="stylesheet" href="css/bootstrap.v3.3.7.min.css">

        <!-- Our Custom CSS -->
        <link rel="stylesheet" href="css/style.css">

        <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
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
                        <a href="creaRequisito.jsp">
                            <i class="fas fa-briefcase"></i>
                            Crear Requisito
                        </a>

                    </li>

                    <li >
                        <a href="creaRequisito.jsp">
                            <i class="far fa-copy"></i>
                            Crear Incidencia
                        </a>
                    </li>

                    <li>
                        <a href="repositorio.jsp">
                            <i class="fas fa-cloud"></i>
                            Repositorio
                        </a>
                    </li>

                    <li>
                        <a href="creaAlerta.jsp">
                            <i class="fas fa-flag"></i>
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
                            <i class="fas fa-list-ul"></i>
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

                <!-- PERFIL -->
                <div class="form-group">
                    <label for="exampleFormControlTextarea1"><p class="crear">Mi Perfil</p></label>

                </div>

                <form>
                    <div class="form-group row">
                        <label for="staticEmail" class="col-sm-2 col-form-label">Email</label>
                        <div class="col-sm-10">
                            <input type="email" readonly class="form-control-plaintext" id="staticEmail" value="miemail@email.com">
                        </div>

                        <label for="staticUsuario" class="col-sm-2 col-form-label">Usuario</label>
                        <div class="col-sm-10">
                            <input type="text" readonly class="form-control-plaintext" id="staticUsuario" value="Miusuario">
                        </div>

                        <label for="staticEmail" class="col-sm-2 col-form-label">Contraseña</label>
                        <div class="col-sm-10">
                            <input type="password" readonly class="form-control-plaintext" id="inputPassword" value="contraseña">
                        </div>
                    </div>
                    <br />
                    <div class="form-group">
                        <label for="exampleFormControlTextarea1"><p class="crear">Cambio de Contraseña</p></label></div>


                    <div class="form-group">
                        <label for="exampleInputPassword1">Contraseña</label>
                        <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Contraseña">
                    </div>

                    <div class="form-group">
                        <label for="exampleInputPassword1">Repite Contraseña</label>
                        <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Contraseña">
                    </div>
                </form>

                <div class="row">
                    <div class="col-4">

                    </div>
                    <div class="col form-group row col-6">


                        <button type="submit" class="btn btn-secondary añadir">Modificar contraseña</button>


                    </div>
                    <div class="col-2">
                        <a href="indexProyectos.jsp"><button type="button" class="btn btn-light">Volver</button></a>

                    </div>
                </div>
            </div></div>


        <!-- Bootstrap JS -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

        <script src="js/js.js"></script>


    </body>
</html>
