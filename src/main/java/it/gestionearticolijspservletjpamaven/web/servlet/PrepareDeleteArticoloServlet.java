package it.gestionearticolijspservletjpamaven.web.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.gestionearticolijspservletjpamaven.model.Articolo;
import it.gestionearticolijspservletjpamaven.service.MyServiceFactory;

@WebServlet("/PrepareDeleteArticoloServlet")
public class PrepareDeleteArticoloServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    public PrepareDeleteArticoloServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String idParameter = request.getParameter("idArticolo");
		
		try {
			
			Articolo articolo = MyServiceFactory.getArticoloServiceInstance().caricaSingoloElemento(Long.parseLong(idParameter));
			request.setAttribute("articolo_delete", articolo);
			RequestDispatcher rd = request.getRequestDispatcher("/articolo/delete.jsp");
			rd.forward(request, response);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			request.setAttribute("errorMessage", "Attenzione si è verificato un errore.");
			request.getRequestDispatcher("/articolo/insert.jsp").forward(request, response);
			return;
			
		}
		
	}

}
