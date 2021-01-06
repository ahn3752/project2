package MemberController;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.memberDAO;
import model.memberDTO;


@WebServlet("/admin/list.do")
public class Memberlist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		memberDAO mdao = new memberDAO();
		List<memberDTO> list = mdao.memberList();

		request.setAttribute("List", list);
		

		RequestDispatcher dis = request.getRequestDispatcher("../admin/member.jsp");
		dis.forward(request, response);
	}



}
