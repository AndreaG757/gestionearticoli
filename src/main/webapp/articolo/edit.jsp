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

<title>Modifica Articolo</title>

</head>
<body>

	<jsp:include page="../navbar.jsp" />

	<% Articolo articoloInModifica = (Articolo) request.getAttribute("modifica_attribute"); %>
		
		<main role="main" class="container">
	
			<div class="alert alert-danger alert-dismissible fade show ${errorMessage==null?'d-none': ''}" role="alert">
			  ${errorMessage}
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
			    <span aria-hidden="true">&times;</span>
			  </button>
			</div>
			
			<div class='card'>
			    <div class='card-header'>
			        <h5>Inserisci nuovo elemento</h5> 
			    </div>
			    <div class='card-body'>
	
					<h6 class="card-title">I campi con <span class="text-danger">*</span> sono obbligatori</h6>
	
						<form method="post" action="ExecuteEditArticoloServlet" novalidate="novalidate">
						
							<div class="form-row">
								<div class="form-group col-md-6">
								
									<label>Codice <span class="text-danger">*</span></label>
									<input type="text" name="codice" id="codice" class="form-control" 
									value="<%= articoloInModifica.getCodice()!=null?articoloInModifica.getCodice():"" %>" placeholder="Inserire il codice da modificare" required>
								
								</div>
								
								<div class="form-group col-md-6">
								
									<label>Descrizione <span class="text-danger">*</span></label>
									<input type="text" name="descrizione" id="descrizione" class="form-control" 
									value="<%= articoloInModifica.getDescrizione()!=null?articoloInModifica.getDescrizione():"" %>" placeholder="Inserire la descrizione da modificare" required>
								
								</div>
							</div>
							
							<div class="form-row">	
								<div class="form-group col-md-6">
								
									<label>Prezzo <span class="text-danger">*</span></label>
									<input type="number" class="form-control" name="prezzo" id="prezzo" 
									value="<%= articoloInModifica.getPrezzo()!=null?articoloInModifica.getPrezzo():"" %>" placeholder="Inserire il prezzo da modificare"  required>
									
								</div>
								<div class="form-group col-md-3">
								
									<label>Data di Arrivo<span class="text-danger">*</span></label>
		                     		<input class="form-control" id="dataArrivo" type="date" placeholder="dd/MM/yy"
		                         	title="formato : gg/mm/aaaa" value="<%= articoloInModifica.getDataArrivo()!=null?new SimpleDateFormat("yyyy-MM-dd").format(articoloInModifica.getDataArrivo()):"" %>" name="dataArrivo" required>
		                         	
								</div>
								
							</div>
								
							<a href="ListArticoliServlet" class='btn btn-outline-secondary' style='width:7em;'>
			           			<i class='fa fa-chevron-left'></i> Indietro
			      			</a>
							<button type="submit" name="submit" value="submit" id="submit" class="btn btn-primary" style='width:7em;'>Modifica</button>
			      			<input type="hidden" name="idEditInput" value="<%=articoloInModifica.getId() %>">
						
						</form>
			    
				<!-- end card-body -->			   
			    </div>
			</div>	
	
	
	<!-- end container -->	
	</main>
				
		<jsp:include page="../footer.jsp" />	

</body>
</html>