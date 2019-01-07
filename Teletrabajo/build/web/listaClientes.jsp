

<%@page import="modelo.entidades.Cliente"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/stylet1.css">
        <link href="_componentesExternos/datatables/media/css/dataTables.bootstrap.min.css" rel='stylesheet' />	
        <link href="_componentesExternos/datatables.bootstrap.css" rel="stylesheet"/>



        <title>Rawson BPO</title>


        <!-- Bootstrap CSS CDN -->
        <script type="text/javascript" src="_componentesExternos/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="_componentesExternos/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="_componentesExternos/dataTables.bootstrap.js"></script>
        <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>

        <!-- Our Custom CSS -->

        <link rel="shortcut icon" href="img/favicon.ico">
        <!-- Font Awesome JS -->

        <script type="text/javascript" charset="utf-8">

            $(document).ready(function () {

                $('#tabla_clientes').dataTable({

                    "oLanguage": {
                        "sProcessing": "Procesando...",
                        "sLengthMenu": "Mostrar _MENU_ registros",
                        "sZeroRecords": "No se encontraron resultados",
                        "sEmptyTable": "Ningún dato disponible en esta tabla",
                        "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                        "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                        "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
                        "sInfoPostFix": "",
                        "sSearch": "Buscar:",
                        "sUrl": "",
                        "sInfoThousands": ",",
                        "sLoadingRecords": "Cargando...",
                        "oPaginate": {
                            "sFirst": "Primero",
                            "sLast": "Último",
                            "sNext": "Siguiente",
                            "sPrevious": "Anterior"
                        },
                        "oAria": {
                            "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                            "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                        }
                    },
                    "oinfo": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",

                    "lengthMenu": [[3, 5, 7, -1], [3, 5, 7, "Todos"]]

                });
                $('[data-toggle="tooltip"]').tooltip();

            });
        </script> 
        <link rel="shortcut icon" href="img/favicon.ico">
    </head>


    <body>
        <header></header>
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
                                    <a class="nav-link" href="log.jsp" onclick="<%request.getSession(false);%>">Salir</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <section>
                    <div class ="container">	
                        <div class ="col-md-10">

                            <table id="tabla_clientes" class="table table-striped table-bordered table-hover" cellspacing="0" width="100%"  >

                                <legend class ="title">Lista de Clientes</legend>

                                <thead>
                                    <tr> 
                                        <th scope="col">Cif</th>
                                        <th scope="col">Nombre</th>

                                    </tr>
                                </thead>
                                <tbody >
                                    <% ArrayList<Cliente> list = (ArrayList<Cliente>) session.getAttribute("lista");
                                        for (Cliente c : list) {
                                            int id = c.getIdCliente();
                                            String cif = c.getCif();
                                            String nombre = c.getNombre();

                                    %>
                                    <tr class ="tabla_color">
                                        <th class="align-left" scope="row"><a class="icoiemail" href="FormClienteServlet?id=<%=id%>"><%=cif%></th>                                   

                                        <th> <a class="icoiemail"  href ="FormClienteServlet?id=<%=id%>" ><%=nombre%></th>									  				   
                                    </tr>

                                    <%}%>
                                </tbody>

                            </table>

                            <div class="col-md-8 col-xs-8 col-md-offset-4" style="padding-top: 20px;">

                                <div class="btn-group" role="group" aria-label="Basic example">
                                    <form action="#" method="post">
                                        <input type="submit" class="btn btn-success btn-sm enabled" value="A&ntilde;adir Cliente">				
                                    </form>
                                </div>
                            </div>
                        </div>
                        </br>


                </section>
            </div>
        </div>
    </div>
</body>

</html>