package BoardController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.boardDAO;
import model.boardDTO;
import util.FileUtil;


@WebServlet("*.delete")
public class BoardDeleteCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		String url = request.getRequestURI();
		url = url.substring(url.lastIndexOf('/')+1, url.lastIndexOf('.'));
		String flag = request.getParameter("flag");
		
		String idx = request.getParameter("idx");
		String nowPage = request.getParameter("nowPage");
		request.setAttribute("nowPage", nowPage);
		
		boardDAO dao = new boardDAO();
		//첨부파일 삭제를 위해 기존의 게시물을 가져와서 DTO객체에 저장.
		boardDTO dto = dao.selectView(idx);
		//게시물 삭제
		int sucOrFail = dao.boardDelete(idx);
		if(sucOrFail==1) {
			//게시물 삭제가 완료되었다면 첨부파일도 삭제한다.
			String fileName = dto.getAttachedfile();
			//경로명, 파일명을 전달하여 물리적경로에 저장된 파일을 삭제처리함.
			FileUtil.deleteFile(request, "/Upload", fileName);
		}
		
		//Message.jsp에서 페이지이동 및 알림창을 위한 속성 저장
		request.setAttribute("WHEREIS", "DELETE");
		request.setAttribute("SUC_FAIL", sucOrFail);
		request.setAttribute("flag",flag);
		
		if(url.equals("free")) {
			request.getRequestDispatcher("../space/Message.jsp?").forward(request, response);
			}
		else if(url.equals("admin")) {
			response.sendRedirect("../admin/admin.list?flag="+flag);
			}

	}
}
