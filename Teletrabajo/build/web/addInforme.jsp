
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" href="img/favicon.ico">
        <title>Agregar Archivo</title>
    </head>
    <body>
        <div class="container">
            <div class="col-lg-6">
             <h1>Agregar Informe</h1>
           
             <form  name="formArchivo" method="post" action="ArchivoServlet">
                 <input type="hidden" name="enviar" value="agregarInforme">
          <br>
           <br>
            Ruta<br>
            <input type="text" id="textRuta" name="textRuta"> <br>
            <br>
        
        
            <input type="submit" name="enviar" id="enviar" value="Añadir" disabled> <br>
        </form>
            </div>

        </div>
    </body>
</html>
