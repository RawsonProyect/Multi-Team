<%-- 
    Document   : log
    Created on : 02-ene-2019, 11:47:55
    Author     : NERA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Bootstrap CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- MI CSS -->
        <link href="css/log.css" rel="stylesheet">
        
        <link rel="shortcut icon" href="img/favicon.ico">
        
    </head>
    <body class="text-center" onload="ocultarElemento()">
        <form class="form-signin" action="LoginServlet" method="get"x>
            <img class="mb-4" src="img/logo.png" alt="Rawson BPO logo" width="200" height="75">
            <h1 class="h3 mb-3 font-weight-normal">Acceso</h1>
            <label for="inputEmail" class="sr-only">Email/Login</label>
            <input type="text" id="inputEmail" class="form-control" placeholder="Email" required name="login"autofocus>
            <label for="inputPassword" class="sr-only">Contraseña</label>
            <input type="password" id="inputPassword" class="form-control" placeholder="Contraseña" name="pass" required>
            <%
                if (session.getAttribute("loginCorrecto") != null) {

            %>
            <div class='alert alert-danger' role='alert'>Credenciales incorrectas.</div>
            <%
            }%>


            <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
            <p class="mt-5 mb-3 text-muted">&copy; Rawson BPO 2018</p>
        </form>

    </body>
</html>
