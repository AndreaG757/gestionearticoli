<%@page import="java.text.SimpleDateFormat"%>
<%@page import="it.gestionearticolijspservletjpamaven.model.Articolo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<jsp:include page="../header.jsp" />
<link href="./assets/css/global.css" rel="stylesheet">

<title>Elimina Articolo</title>

</head>

<body>

	<jsp:include page="../navbar.jsp" />

	
	<main role="main" class="container">

		<div class='card'>
		    <div class='card-header'>
		        Visualizza dettaglio
		    </div>
		    <% Articolo articoloInPagina = (Articolo)request.getAttribute("articolo_delete"); %>
		
		    <div class='card-body'>
		    	<dl class="row">
				  <dt class="col-sm-3 text-right">Codice</dt>
				  <dd class="col-sm-9"><%=articoloInPagina.getCodice() %></dd>
		    	</dl>
		    	
		    	<dl class="row">
				  <dt class="col-sm-3 text-right">Descrizione:</dt>
				  <dd class="col-sm-9"><%=articoloInPagina.getDescrizione() %></dd>
		    	</dl>
		    	
		    	<dl class="row">
				  <dt class="col-sm-3 text-right">Prezzo:</dt>
				  <dd class="col-sm-9"><%=articoloInPagina.getPrezzo() %></dd>
		    	</dl>
		    	
		    	<dl class="row">
				  <dt class="col-sm-3 text-right">Data di Arrivo:</dt>
				  <dd class="col-sm-9"><%=articoloInPagina.getDataArrivo()!=null? new SimpleDateFormat("dd/MM/yyyy").format(articoloInPagina.getDataArrivo()):"N.D."  %></dd>
		    	</dl>
		    	
		    </div>
		    
		    <div class='card-footer'>
		        <form action="ExecuteDeleteArticoloServlet" method="post">
			        <a href="ListArticoliServlet" class='btn btn-outline-secondary' style='width:7em;'>
			            <i class='fa fa-chevron-left'></i> Indietro
			        </a>
			        <input type="hidden" name="idDeleteInput" value="<%=articoloInPagina.getId() %>">
		        	<button type="submit" name="submit" value="submit" id="submit" class="btn btn-danger" style='width:7em;'>Elimina</button>
		        </form>
		    </div>
		</div>	
		
	</main>
	
	<jsp:include page="../footer.jsp" />

</body>
</html>