package it.gestionearticolijspservletjpamaven.web.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.gestionearticolijspservletjpamaven.model.Articolo;
import it.gestionearticolijspservletjpamaven.service.MyServiceFactory;
import it.gestionearticolijspservletjpamaven.utility.UtilityArticoloForm;

@WebServlet("/ExecuteEditArticoloServlet")
public class ExecuteEditArticoloServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    public ExecuteEditArticoloServlet() {
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String idInputParam = request.getParameter("idEditInput");
		String codiceInputParam = request.getParameter("codice");
		String descrizioneInputParam = request.getParameter("descrizione");
		String prezzoInputStringParam = request.getParameter("prezzo");
		String dataArrivoStringParam = request.getParameter("dataArrivo");
		
		Date dataArrivoParsed = UtilityArticoloForm.parseDateArrivoFromString(dataArrivoStringParam);

		if (!UtilityArticoloForm.validateInput(codiceInputParam, descrizioneInputParam, prezzoInputStringParam,
				dataArrivoStringParam) || dataArrivoParsed == null) {
			
			Articolo articoloInstance = new Articolo();
			
			articoloInstance.setId(Long.parseLong(idInputParam));
			articoloInstance.setCodice(codiceInputParam);
			articoloInstance.setDescrizione(descrizioneInputParam);
			if(!prezzoInputStringParam.isEmpty()) 
				articoloInstance.setPrezzo(Integer.parseInt(prezzoInputStringParam));
			articoloInstance.setDataArrivo(dataArrivoParsed);
			
			request.setAttribute("errorMessage", "Attenzione sono presenti errori di validazione");
			request.setAttribute("modifica_attribute", articoloInstance);
			request.getRequestDispatcher("/articolo/edit.jsp").forward(request, response);
			return;
			
		}
		
		Articolo articoloInstance = new Articolo(codiceInputParam, descrizioneInputParam, Integer.parseInt(prezzoInputStringParam),
				dataArrivoParsed);
		articoloInstance.setId(Long.parseLong(idInputParam));
		
		try {
			
			MyServiceFactory.getArticoloServiceInstance().aggiorna(articoloInstance);
			request.setAttribute("listaArticoliAttribute", MyServiceFactory.getArticoloServiceInstance().listAll());
			request.setAttribute("successMessage", "Operazione effettuata con successo");
			
		} catch (Exception e) {
			
			e.printStackTrace();
			request.setAttribute("errorMessage", "Attenzione si è verificato un errore.");
			request.getRequestDispatcher("/articolo/index.jsp").forward(request, response);
			return;
			
		}
		
		request.getRequestDispatcher("/articolo/results.jsp").forward(request, response);
		
	}

}
