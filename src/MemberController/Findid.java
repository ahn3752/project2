package MemberController;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.memberDAO;


@WebServlet("/member/Findid.do")
public class Findid extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");

		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		String a = "a";
		
		memberDAO mdao = new memberDAO();
	
		
		Map<String, String> id = mdao.findId(name,email); 
	
		request.setAttribute("a", "a");
		request.setAttribute("id", id.get("id"));
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/member/id_pw.jsp");
		dispatcher.forward(request, response);

		
	}

}
