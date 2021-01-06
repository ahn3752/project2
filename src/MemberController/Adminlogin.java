package MemberController;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.memberDAO;
import util.CookieUtil;


@WebServlet("/admin/Admin.do")
public class Adminlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		request.getRequestDispatcher("/admin/index.jsp").forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("admin_id");
		String pw = request.getParameter("admin_pw");
		memberDAO dao = new memberDAO();
		
		Map<String, String> memberMap = dao.adminMember(id, pw);
		if(memberMap.get("id")!=null){
			//로그인 성공시 세션영역에 아래 속성을 저장한다.
						
		 HttpSession session = request.getSession();

			session.setAttribute("USER_ID", memberMap.get("id")); 
			session.setAttribute("USER_PW", memberMap.get("pass"));
			session.setAttribute("USER_NAME", memberMap.get("name"));
			request.getRequestDispatcher("/admin/index.jsp")
			.forward(request, response);
	}else {
		request.setAttribute("ERROR_MSG", "회원이 아닙니다");
	}

}
}
	
	
	
	
	
