
<%@page import="modelo.entidades.Cliente"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.entidades.Requisito"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="modelo.entidades.Proyecto"%>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="_componentesExternos/datatables/media/css/dataTables.bootstrap.min.css" rel='stylesheet' />	
        <link href="_componentesExternos/datatables.bootstrap.css" rel="stylesheet"/>
        <link href="_componentesExternos/datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet"/>
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.1/themes/base/jquery-ui.css" />
        <link rel="stylesheet" href="_componentesExternos/datepicker/css/bootstrap-datepicker3.css"/>
        <link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />

        <link rel="stylesheet" href="css/stylet1.css">

        <title>Rawson BPO</title>

        <!-- Bootstrap CSS CDN -->

        <script type="text/javascript" src="_componentesExternos/jquery-2.1.1.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js" integrity="sha256-0YPKAwZP7Mp3ALMRVB2i8GXeEndvCq3eSl/WsAl1Ryk=" crossorigin="anonymous"></script>
        <script type="text/javascript" src="_componentesExternos/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="_componentesExternos/dataTables.bootstrap.js"></script>
        <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>


        <link rel="shortcut icon" href="img/favicon.ico">
        <!-- Font Awesome JS -->

        <script type="text/javascript" charset="utf-8">

            $(function () {
                $(".datepicker").datepicker({
                    closeText: 'Cerrar',
                    prevText: '< Ant',
                    nextText: 'Sig >',
                    currentText: 'Hoy',
                    monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
                    monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
                    dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
                    dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mié', 'Juv', 'Vie', 'Sáb'],
                    dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sá'],
                    weekHeader: 'Sm',
                    dateFormat: 'dd/mm/yy',
                    firstDay: 1,
                    isRTL: false,
                    showMonthAfterYear: false,
                    yearSuffix: ''
                });

            });
            $(document).ready(function () {

                $('#tabla_proyectos').dataTable({
                    "responsive": true,

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
                <div class="col-md-8 order-md-3">
                    <section> 
                        <% Proyecto proyecto = (Proyecto) session.getAttribute("proyecto");
                            String nombre = proyecto.getNombre();
                            Cliente cliente = proyecto.getCliente();
                            String nombreCliente = cliente.getNombre();
                            Date fip = proyecto.getFip();
                            Date ffp = proyecto.getFfp();
                            Date fir = proyecto.getFir();
                            Date ffr = proyecto.getFfr();
                            String fechaIP = "Sin Determinar";
                            String fechaFP = "Sin Determinar";
                            String fechaIR = "Sin Determinar";
                            String fechaFR = "Sin Determinar";
                            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/YYYY");
                            if (fip != null) {
                                fechaIP = sdf.format(fip);
                            }
                            if (ffp != null) {
                                fechaFP = sdf.format(ffp);
                            }
                            if (fir != null) {
                                fechaIR = sdf.format(fir);
                            }
                            if (ffr != null) {
                                fechaFR = sdf.format(ffr);
                            }
                            int idProyecto = proyecto.getIdProyecto();
                            int idCliente = cliente.getIdCliente();
                            List<Cliente> listaClientes = (List<Cliente>) session.getAttribute("listaClientes");
                        %>
                        <legend class ="title">Editar Proyecto</legend>                        
                        <form action="modificarProyecto" method="post" id="modificar">
                            <div class="row">
                                <input type="hidden" id="idProyecto" name="idProyecto" value="<%=idProyecto%>" form="modificar">
                                <% System.out.println("ID Proyecto: " + idProyecto);%>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <label for="Proy_Name">Nombre Proyecto:</label>
                                    <input type="text" class=" custom-select-lg mb-7" name="Proy_Name" id="Proy_Name" placeholder="" value="<%=nombre%>" required form="modificar">
                                   <!-- <input type="text" class="form-control coloreado" id="Proy_Name" placeholder="" value="<%=nombre%>" required>
                                    -->
                                </div>
                                <div class="col" >
                                    <label for="Proy_Name">Nombre Cliente:</label>
                                    <!-- 
                                        <input type="text" class="form-control coloreado" value="<%=nombreCliente%>">                                
                                    -->
                                    <select name="idCliente" name="Proy_Name" class="custom-select custom-select-lg mb-7" form="modificar">
                                        <option value="<%=idCliente%>"><%=nombreCliente%></option>
                                        <%
                                            int idC;
                                            String nombreC;
                                            for (Cliente c : listaClientes) {
                                                nombreC = c.getNombre();
                                                idC = c.getIdCliente();
                                                if (idC != idCliente) {
                                        %>
                                        <option value="<%=idC%>"><%=nombreC%></option>
                                        <%}
                                            }%>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <label for="FechaIni">Fecha de inicio Prevista:</label>
                                    <div id="fecha" name="FechaIni" class="input-group date"data-provide="datepicker">
                                        <input type="text" name="FechaIniPr" id ="FechaIniPr" value="<%=fechaIP%>" class="form-control datepicker" form="modificar">
                                    </div>
                                </div>
                                <div class="col">
                                    <label for="FechaFin">Fecha de fin Prevista:</label>
                                    <div class="input-group date" data-provide="datepicker">
                                        <input type="text" name="FechaFinPr" id ="FechaFinPr" value="<%=fechaFP%>" class="form-control datepicker" form="modificar">
                                    </div>
                                </div>	
                            </div>		 
                            <div class="row">
                                <div class="col">
                                    <label for="FechaIni">Fecha de inicio Real:</label>
                                    <div class="input-group date" id ="datapicker"data-provide="datepicker">
                                        <input type="text" name="FechaIni" id ="FechaIni" value="<%=fechaIR%>" class="form-control datepicker" form="modificar">
                                    </div>
                                </div>
                                <div class="col">
                                    <label for="FechaFin">Fecha de fin Real:</label>
                                    <div class="input-group date" data-provide="datepicker">
                                        <input type="text" name="FechaFin" id ="FechaFin" value="<%=fechaFR%>" class="form-control datepicker" form="modificar">
                                    </div>    
                                </div>
                            </div>
                            <div class="panel-body" style="padding: 0;">
                                <div class="table-responsive" style="width: 130%">
                                    <table align="center" id="tabla_proyectos" class="table table-striped table-hover dt-responsive" cellspacing="0" width="100%"   >
                                        <legend class ="title">Requisitos</legend>
                                        <thead class="thead-light">
                                            <tr> 
                                                <th scope="col">Fecha</th>
                                                <th scope="col">Tipo</th>
                                                <th scope="col">Estado</th>
                                                <th scope="col">N� de Tareas</th>
                                                <th scope="col">Ruta</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% List<Requisito> listaRequisitos = (List<Requisito>) session.getAttribute("listaRequisitos");
                                                for (int i = 0; i < listaRequisitos.size(); i++) {
                                                    Requisito requisito = listaRequisitos.get(i);
                                                    int id = requisito.getIdRequisito();
                                                    Date fecha = requisito.getFecha();
                                                    SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
                                                    String fechaS = format.format(fecha);
                                                    String tipo = "Requisito";
                                                    if (requisito.isEsIncidencia()) {
                                                        tipo = "Incidencia";
                                                    }
                                                    boolean finalizado = requisito.isFinalizado();
                                                    String estado = (finalizado ? "FINALIZADO" : "EN CURSO");
                                                    String ruta = requisito.getRuta();
                                                    int tareas = requisito.getTareas().size();

                                            %>
                                            <tr class ="tabla_color">
                                                <td><%=fechaS%></td>
                                                <!-- <td style="text-align: center;"class="form-check">
                                                    <input class="form-check-input" type="checkbox" value="" id="incidencia" checked disabled>
                                                </td> -->
                                                <td ><%=tipo%></td>
                                                <!-- <td style="text-align: center;"class="form-check">
                                                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck1" checked disabled>
                                                </td>-->
                                                <td ><%=estado%></td>
                                                <td ><%=tareas%></td>
                                                <td ><%=ruta%></td>
                                            </tr>

                                            <%}%>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                    </section>  
                    <div class="col-md-8 col-xs-8 col-md-offset-4" style="padding-top: 20px;">

                        <div class="btn-group" role="group" aria-label="Basic example">
                            <input type="submit" class="btn btn-success btn-sm enabled" value="Guardar">
                            <a href="#" class="btn btn-secondary btn-sm enabled" role="button">A�adir Requisito</a>
                            <a href="#" class="btn btn-warning btn-sm enabled" role="button">Finalizar Proyecto</a>
                            <a href="ListarProyectosServlet" class="btn btn-danger btn-sm enabled" role="button">Cancelar</a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
    </body>

</html>