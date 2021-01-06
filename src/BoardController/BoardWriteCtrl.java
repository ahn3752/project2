package BoardController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import model.boardDAO;
import model.boardDTO;
import util.FileUtil;



@WebServlet("*.write")
public class BoardWriteCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
	

		String url = request.getRequestURI();
		url = url.substring(url.lastIndexOf('/')+1, url.lastIndexOf('.'));
		String flag = request.getParameter("flag");
		
		MultipartRequest mr = FileUtil.upload(request, request.getServletContext().getRealPath("/Upload"));
		
		int sucOrFail;

		if(mr != null) {
		
			String id = mr.getParameter("id");
			String title = mr.getParameter("pass");
			String pass = mr.getParameter("title");
			String content = mr.getParameter("content");
			//서버에 저장된 실제파일명을 가져온다.
			String attachedfile = mr.getFilesystemName("attachedfile");	
			
		boardDTO bdto = new boardDTO(); 
		
		bdto.setId(id);

		bdto.setPass(title);
		bdto.setTitle(pass);
		bdto.setContent(content);
		bdto.setAttachedfile(attachedfile);
		bdto.setFlag(flag);
		boardDAO bdao = new boardDAO();
		sucOrFail = bdao.insertboard(bdto); 
		
		if(url.equals("free")) {
			if(flag.equals("image")) {
				response.sendRedirect("../space/free.list?flag="+flag);
			}else {
				response.sendRedirect("../space/free.list?flag="+flag);
			}

		}
		else if(url.equals("admin")) {
			response.sendRedirect("../admin/admin.list?flag="+flag);
			}

		}
	
	}

}
