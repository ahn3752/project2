package MemberController;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.memberDAO;
import util.CookieUtil;


@WebServlet("/main/main.do")
public class Mainctrl extends HttpServlet {
	

	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		CookieUtil.makeCookie(request, response, "Login", "", 0);
		request.getRequestDispatcher("../index/index.main").forward(request,response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//폼값받기
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pw");
		String id_save = request.getParameter("id_save");


		System.out.println(id_save);
		//DAO객체생성 및 DB연결
		memberDAO dao = new memberDAO();

		//방법3 : Map 컬렉션에 저장된 회원정보를 통해 세션영역에 저장
		Map<String, String> memberMap = dao.getMemberMap(id, pw);
		if(memberMap.get("id")!=null){
			//로그인 성공시 세션영역에 아래 속성을 저장한다.

			
		 HttpSession session = request.getSession();

			session.setAttribute("USER_ID", memberMap.get("id")); 
			session.setAttribute("USER_PW", memberMap.get("pass"));
			session.setAttribute("USER_NAME", memberMap.get("name"));
			session.setAttribute("grade",  memberMap.get("grade"));

			CookieUtil.makeCookie(request, response, "Login", memberMap.get("id"), 60*60*24);
			
			if(id_save==null){
				//체크해제하면 쿠키를 삭제한다. 
				CookieUtil.makeCookie(request, response, "SaveId", "", 0);		
			}
			else{
				//체크하면 쿠키를 생성한다. 
				CookieUtil.makeCookie(request, response, "SaveId", memberMap.get("id"), 
						60*60*24);
				System.out.println("쿠키생성?");
			}
			response.sendRedirect("../index/index.main");			
			
		}
		else {
			request.setAttribute("ERROR_MSG", "회원이 아닙니다");
			request.getRequestDispatcher("/main/main.jsp")
					.forward(request, response);
		}
			
	}

}
