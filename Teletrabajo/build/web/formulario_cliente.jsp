<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="modelo.entidades.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.entidades.Cliente"%>
<!DOCTYPE html>
<html>

    <head>


        <!-- <script defer src="js/registrar_usuario.js"></script> -->

        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Rawson BPO</title>
        <!--<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css" />-->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/stylet1.css">
        <link href="_componentesExternos/datatables/media/css/dataTables.bootstrap.min.css" rel='stylesheet' />	
        <link href="_componentesExternos/datatables.bootstrap.css" rel="stylesheet"/>


        <title>Rawson BPO</title>


        <!-- Bootstrap CSS CDN -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <!-- Our Custom CSS -->
        <link rel="stylesheet" href="css/style.css">

        <!-- Font Awesome JS -->
        <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>


    </head>

    <link rel="shortcut icon" href="img/favicon.ico">
    <body>

        <div class="wrapper">
            <!-- Sidebar  -->
            <nav id="sidebar">
                <div class="sidebar-header">
                    <img src="img/LOGO-RAWSONBPO-9.png" height="70"  alt=""/>
                </div>
                <ul class="list-unstyled components">
                    <li>
                        <a href="#tareaSubmenu" data-toggle="collapse" aria-expanded="false">
                            <i class="glyphicon glyphicon-list"></i>
                            Tareas
                        </a>
                    </li>
                    <li>
                        <a href="#requisitosSubmenu" data-toggle="collapse" aria-expanded="false">
                            <i class="glyphicon glyphicon-list"></i>
                            Requisitos
                        </a>
                    </li>
                    <li>
                        <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false">
                            <i class="glyphicon glyphicon-duplicate"></i>
                            Informes
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="glyphicon glyphicon-cloud"></i>
                            Repositorio
                        </a>
                    </li>
                    <li>
                        <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false">
                            <i class="glyphicon glyphicon-flag"></i>
                            Alertas
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="ListarProyectosServlet">
                            <i class="glyphicon glyphicon-duplicate"></i>
                            Proyectos
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="ListarUsuariosServlet">
                            <i class="glyphicon glyphicon-user"></i>
                            Usuarios
                        </a>

                    </li>
                    <li>
                        <a class="nav-link" href="ClienteServlet">
                            <i class="glyphicon glyphicon-briefcase"></i>
                            Clientes
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
                                    <a class="nav-link" href="ListarProyectosServlet">Proyectos</a>
                                </li>
                                <li class="nav-item active">
                                    <a class="nav-link" href="ClienteServlet">Clientes</a>
                                </li>
                                <li class="nav-item active">
                                    <a class="nav-link" href="ListarUsuariosServlet">Usuarios</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="chat.html">Chat</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Cuenta</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Salir</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <!--formulario-->
                <div class="container ">
                    <div class="signup-form-container">
                        <% Cliente cliente = (Cliente) session.getAttribute("cliente");
                            String cif = cliente.getCif();
                            String nombre = cliente.getNombre();
                            request.setAttribute("nombre", nombre);
                        %>
                        <form class="form-inline" role=form" method="post" action="FormClienteServlet">
                            <div class="form-group mx-sm-3 mb-2 input-group ">
                                <div class="input-group-addon "><span class="glyphicon glyphicon-user"></span></div>
                                <input id="cif" name="cif" type="text" class="form-control" placeholder="Cif"  value= <%=cif%> >
                            </div>
                            <div class="form-group mx-sm-3 mb-2 input-group ">
                                <div class="input-group-addon "><span class="glyphicon glyphicon-user"></span></div>
                                <input id="nom" name="nombre" type="text" class="form-control" placeholder="Nombre" value= <%=nombre%>>
                            </div>
                            <!-- <div class="form-group mx-sm-3 input-group "> -->
                            <button id="adicionar" type="button" class="btn btn-info"
                                    data-toggle="dropdown">asignar usuario <span class="caret"></span>
                            </button>
                            <ul id ="menu" class="dropdown-menu" role="menu">
                                <% ArrayList<Usuario> usuarios = (ArrayList<Usuario>) session.getAttribute("usuarios");
                                    Usuario user = null;
                                    for (int a = 0; a < usuarios.size(); a++) {
                                        user = usuarios.get(a);
                                        int id = user.getIdUsuario();
                                        String nom = user.getNombre();
                                        String dni = user.getDni();
                                        String login = user.getLogin();
                                        String mail = user.getEmail();
                                %>
                                <li id="'<%=id%>'" onclick="userTabla('<%=id%>', '<%=nom%>', '<%=dni%>', '<%=login%>', '<%=mail%>')">
                                    <a  class="glyphicon glyphicon-user" name="usuario"  value = <%=user%> > <%=user%></a>
                                </li>
                                <li class="divider"></li>
                                    <%}%>
                            </ul>
                            <!-- </div> -->
                            <script type="text/javascript">
                                function userTabla(id, nombre, dni, login, mail) {
                                    //     document.getElementById("tablita").innerHTML += "<tr><td style='visibility:hidden; '>" + id + "</td><td>" + dni + "</td><td>" + nombre + "</td><td>" + login + "</td><td>" + mail + "</td><td><input type='button' class='borrar' onclick='borrar(this)'; value='Eliminar'/></td></tr>";
                                    document.getElementById("tablita").innerHTML += "<tr><td style='visibility:hidden; '>" + id + "</td><td>" + dni + "</td><td>" + nombre + "</td><td>" + login + "</td><td>" + mail + "</td><td><a class='ico iemail' onclick='borrar(this)';><i class='far fa-trash-alt fa-2x' style ='margin-right:10px'></i></a></td></tr>";
                                }
                                function recorrerTabla() {
                                    var table = document.getElementById("mytab");
                                    document.getElementById("liTab").value = "";
                                    var tds = table.getElementsByTagName("td");
                                    var textos;
                                    for (var i = 0; i < tds.length; i++) {
                                        if (i % 6 == 0) {
                                            document.getElementById("liTab").value += tds[i].textContent + ":";
                                        }
                                    }
                                }
                            </script>
                            <input type="hidden" id="liTab" name="liTab" value=""></input>
                    </div>
                    <!--termina formulario-->
                </div>
                <!--tabla de cliente-->
                <br/>
                <section>
                    <div class="container-fluid">
                        <div class="col-md-9">
                            <div class="table-responsive-md">
                                <table id="mytab"  class="table table-hover">
                                    <thead class="bg-light ">
                                        <tr>
                                            <th style='visibility:hidden;' name="id"></th>
                                            <th name="dni">Dni/Cif</th>
                                            <th name="nombre">Nombre</th>
                                            <th name="login">Login</th>
                                            <th name="login">EMail</th>
                                            <th name="eliminar">Eliminar</th>
                                        </tr> 
                                        <%
                                            try {
                                                Set<Usuario> clienteUsuarios = (Set<Usuario>) request.getSession().getAttribute("clienteUsuarios");
                                                Iterator it = clienteUsuarios.iterator();
                                                while (it.hasNext()) {
                                                    Usuario clienteusuario = ((Usuario) it.next());

                                        %>
                                        <tr>
                                            <td style='visibility:hidden;' ><%= clienteusuario.getIdUsuario().toString().trim()%></td>
                                            <td><%= clienteusuario.getDni().toString().trim()%></td>
                                            <td><%= clienteusuario.getNombre().toString().trim()%></td>
                                            <td><%= clienteusuario.getLogin().toString().trim()%></td>
                                            <td><%= clienteusuario.getEmail().toString().trim()%></td>
                                            <td>
                                                <a class='ico iemail' onclick='borrar(this)'>
                                                    <i class='far fa-trash-alt fa-2x' style ='margin-right:10px'></i>
                                                </a>
                                                <!--
                                                <input type='button' onclick='borrar(this)' class='borrar' value='Eliminar'/>
                                                -->
                                            </td>
                                        </tr>
                                        <% }
                                            } catch (Exception e) {
                                            }%>
                                    </thead>
                                    <tbody id="tablita">
                                    </tbody>
                                </table>
                            </div>
                        </div></div>
                </section>
                <div class="form-group mx-sm-3 input-group ">  
                    <button id="registro"  onclick="recorrerTabla()" type="submit" value="Submit Button" class="btn btn-info mb-2"><span >Registrar</span></button></div>
                </form>
                <div class="line"></div>
            </div>
        </div>
        <script>
            function borrar(r) {
                var i = r.parentNode.parentNode.rowIndex;
                document.getElementById("mytab").deleteRow(i);
            }
        </script> 

        <!-- jQuery CDN - Slim version (=without AJAX) -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <!-- Popper.JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
        <!-- Bootstrap JS -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

        <script src="js/js.js"></script>
        <!--<script src="bootstrap/js/bootstrap.min.js"></script>-->
        <!--<script src="assets/jquery-1.11.2.min.js"></script>
        <script src="assets/jquery.validate.min.js"></script>-->
        <!-- javascript/jquery validations will be here  -->

    </body>
</html>