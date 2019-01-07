$(function(){
  
  $(".dropdown-menu li a").click(function(){
 
    var usuario = $(this).text();
    var nombre = $("#nom").val();
    var cif = $("#cif").val();
   // $(location).attr("href","FormClienteServlet?array="+array)
    //var icono='<td class="input-group-addon " id="'+Math.round(Math.random()*10+1)+'"><span class="	glyphicon glyphicon-trash"></span></td>';
    var fila='<td class="cif" >'+cif+'</td><td class="nombre">'+nombre+'</td><td class="usuario">'+usuario+'</td><td><button type="button" name="remove" class="btn btn-danger btn_remove">Quitar</button></td>';
  
	  var hilera = document.createElement("tr");
	  hilera.innerHTML=fila;
	  hilera.setAttribute("id","hilera"+Math.round(Math.random()*1000+1));
	  document.getElementById("tablita").appendChild(hilera);
	     //alert(fila);
             
             
  });
  $(document).on('click', '.btn_remove', function (event) {
        event.preventDefault();
        $(this).closest('tr').remove();

  });

});