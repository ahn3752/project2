package MemberController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.memberDAO;
import model.memberDTO;


@WebServlet("/admin/MemberUpdate.do")
public class MemberUpdate extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		memberDTO mdto = new memberDTO();
		
		if(id!=null) {
			memberDAO mdao = new memberDAO();
			
			mdto = mdao.selectView(id);
			request.setAttribute("mdto",mdto);
			
			request.getRequestDispatcher("/admin/memberUpdate.jsp").forward(request,response);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		memberDTO mdto = new memberDTO();
		
		mdto.setName(request.getParameter("name"));
		mdto.setId(request.getParameter("id"));
		mdto.setPass(request.getParameter("pass"));
		mdto.setHcall(request.getParameter("hcall"));
		mdto.setPhone(request.getParameter("phone"));
		mdto.setEmail(request.getParameter("email"));
		mdto.setAddress(request.getParameter("address"));
		mdto.setGrade(request.getParameter("grade"));
		
		memberDAO mdao = new memberDAO();
		mdao.updateMember(mdto);
		
		response.sendRedirect("../admin/list.do");
	}

}
