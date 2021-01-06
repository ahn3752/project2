package MainController;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.boardDAO;
import model.boardDTO;



@WebServlet("*.main")
public class MainCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			
		boardDAO bdao = new boardDAO();
		List<boardDTO> list = bdao.mainBoard();

		request.setAttribute("List", list);
		

		RequestDispatcher dis = request.getRequestDispatcher("../main/main.jsp");
		dis.forward(request, response);
	}



}
