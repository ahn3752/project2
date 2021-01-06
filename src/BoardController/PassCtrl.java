package BoardController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.boardDAO;



@WebServlet("*.pass")
public class PassCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("../space/sub03_password.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = request.getRequestURI();
		url = url.substring(url.lastIndexOf('/')+1, url.lastIndexOf('.'));
		
		String idx = request.getParameter("idx");
		String mode = request.getParameter("mode");
		String pass = request.getParameter("pass");
		String flag = request.getParameter("flag");
		
		//패스워드 검증을 위해 model호출
		boardDAO bdao = new boardDAO();
		boolean isCorrect = bdao.isCorrectPassword(pass,idx);
		bdao.close();
		
		//패스워드 검증 결과를 request 영역에 저장
		request.setAttribute("PASS_CORRECT", isCorrect);
		request.setAttribute("flag", flag);
		request.setAttribute("url", url);

		request.getRequestDispatcher("../space/PassMessage.jsp").forward(request, response);
	}

}
