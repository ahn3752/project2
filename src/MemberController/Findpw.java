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
import model.memberDTO;


@WebServlet("/member/Findpw.do")
public class Findpw extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");


		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		
		memberDAO mdao = new memberDAO();
		memberDTO mdto = mdao.findPw(id,name,email);
		request.setAttribute("id", id);
		request.setAttribute("email",email);
		request.setAttribute("password",mdto.getPass());
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/member/EmailSending.jsp");
		dispatcher.forward(request, response);

	}

}











