package BoardController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.boardDAO;
import model.boardDTO;


@WebServlet("*.view")
public class BoardViewCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				//게시물의 일련번호
				String url = request.getRequestURI();
				url = url.substring(url.lastIndexOf('/')+1, url.lastIndexOf('.'));
				System.out.println(url);
				String flag= request.getParameter("flag");
				String idx =request.getParameter("idx");
				
				boardDAO bdao = new boardDAO();
				
				//일련번호에 해당하는 출력할 게시물을 가져온다
				boardDTO bdto = bdao.selectView(idx);
				//조회수를 증가시킨다.
				bdao.updateVisitCount(idx);
				
				//게시물의 줄바꿈 처리를 위해 replace()를 사용한다.
				bdto.setContent(bdto.getContent().replaceAll("\r\n", "<br/>"));
				//커넥션풀에 객체 반납
				bdao.close();
				
				//request영역에 DTO객체 저장
				request.setAttribute("bdto", bdto);
				if(url.equals("free")) {
				request.getRequestDispatcher("../space/sub03_view.jsp?flag"+flag+"").forward(request, response);
				}
				else if(url.equals("admin")) {
					request.getRequestDispatcher("../admin/FreeModify.jsp").forward(request, response);
					}
				else if(url.equals("notice")) {
					request.getRequestDispatcher("../admin/NoticeModify.jsp").forward(request, response);
					}
			
	}

}
