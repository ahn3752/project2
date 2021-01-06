package BoardController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.boardDAO;
import model.boardDTO;
import model.memberDAO;
import model.memberDTO;



@WebServlet("*.adminM")
public class AdminModifyCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String url = request.getRequestURI();
		url = url.substring(url.lastIndexOf('/')+1, url.lastIndexOf('.'));

		

		request.setCharacterEncoding("UTF-8");
		String idx = request.getParameter("idx");

		boardDTO bdto = new boardDTO();
		
		if(idx!=null) {
			boardDAO bdao = new boardDAO();
			
			bdto = bdao.selectView(idx);
			request.setAttribute("bdto",bdto);
			if(url.equals("admin")) {
				request.getRequestDispatcher("/admin/FreeModify.jsp").forward(request,response);
				}
			else if(url.equals("notice")) {
				request.getRequestDispatcher("/admin/NoticeModify.jsp").forward(request,response);
				}

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String url = request.getRequestURI();
		url = url.substring(url.lastIndexOf('/')+1, url.lastIndexOf('.'));
		
		request.setCharacterEncoding("UTF-8");
		boardDTO bdto = new boardDTO();
		
		bdto.setIdx(request.getParameter("idx"));
		bdto.setId(request.getParameter("id"));
		bdto.setTitle(request.getParameter("title"));
		bdto.setPostdate(request.getParameter("postdate"));
		bdto.setVisitcount(request.getParameter("visitcount"));
		bdto.setContent(request.getParameter("content"));
		bdto.setPass(request.getParameter("pass"));
		
		boardDAO bdao = new boardDAO();
		bdao.boardupdate(bdto);
		bdao.close();
	
		if(url.equals("admin")) {
		response.sendRedirect("../admin/admin.list?flag=free");
		}
		else if(url.equals("notice")) {
		response.sendRedirect("../admin/notice.list?flag=notice");
		}
	}

}
