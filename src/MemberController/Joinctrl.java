package MemberController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.memberDAO;
import model.memberDTO;

@WebServlet("/member/join.do")
public class Joinctrl extends HttpServlet {
      
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		memberDTO mdto = new memberDTO(); 
		
		String [] telarr = {request.getParameter("tel1"),
				request.getParameter("tel2"),
				request.getParameter("tel3")};
		
		String tel="";
		
		for(String string : telarr) {
			tel += string+" ";
		}
		
		String [] moarr = {request.getParameter("mobile1"),
				request.getParameter("mobile2"),
				request.getParameter("mobile3")};
		
		String mobile="";
		
		for(String string : moarr) {
			mobile += string+" ";
		}
		
		String [] emarr = {request.getParameter("mobile1"),
				request.getParameter("mobile2")};
		
		String email="";
		
		for(String string : emarr) {
			email += string+" ";
		}
		
		String [] addarr = {request.getParameter("zip1"),
				request.getParameter("addr1"),
				request.getParameter("addr2"),
		};
		
		String address="";
		
		for(String string : addarr) {
			address += string+" ";
		}
		
		mdto.setName(request.getParameter("name"));
		mdto.setId(request.getParameter("id"));
		String pass1 = request.getParameter("pass1");
		String pass2 = request.getParameter("pass2");
		mdto.setPass(pass1);
		mdto.setHcall(tel);
		mdto.setPhone(mobile);
		mdto.setEmail(email);
		mdto.setAddress(address);

		
		if(pass1.equals(pass2)) {
			//데이터 베이스 객체 생성
			memberDAO mdao = new memberDAO();
			mdao.insertMember(mdto); 

			request.getRequestDispatcher("/main/main.jsp").forward(request,response);
		}else {
			request.getRequestDispatcher("/member/Error.jsp").forward(request,response);
			
		}	
	}

}
















