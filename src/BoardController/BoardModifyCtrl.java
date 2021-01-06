package BoardController;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.oreilly.servlet.MultipartRequest;

import model.boardDAO;
import model.boardDTO;

import util.FileUtil;



@WebServlet("*.modify")
public class BoardModifyCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String url = request.getRequestURI();
		url = url.substring(url.lastIndexOf('/')+1, url.lastIndexOf('.'));
		System.out.println(url);
		String flag = request.getParameter("flag");
		
		String idx = request.getParameter("idx");

		boardDAO dao = new boardDAO();
		
		//수정폼을 구성하기 위해 게시물의 내용을 가져온다.
		boardDTO dto = dao.selectView(idx);
		request.setAttribute("dto", dto);
		request.setAttribute("flag", flag);
		
		
		if(url.equals("free")) {
		request.getRequestDispatcher("../space/sub03_modify.jsp").forward(request,response);
		}
		else if(url.equals("admin")) {
			request.getRequestDispatcher("/admin/NoticeModify.jsp").forward(request,response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getRequestURI();
		url = url.substring(url.lastIndexOf('/')+1, url.lastIndexOf('.'));
		System.out.println(url);
		
		String flag = request.getParameter("flag");

		request.setCharacterEncoding("UTF-8");
		
		//첨부파일 업로드
		MultipartRequest mr = FileUtil.upload(request, request.getServletContext().getRealPath("/Upload"));
		
		int sucOrFail;
		
		//멀티파트 객체가 정상적으로 생성되면 나머지 폼값을 받아온다.
		if(mr!=null) {
			String idx = mr.getParameter("idx");
			String nowPage = mr.getParameter("nowPage");
			//첨부파일의 수정을 위해 hidden폼으로 작성한 기본파일명을 받는다.
			String originalfile = mr.getParameter("originalfile");
			
			//수정처리후 상세보기 페이지로 이동해야 하므로 영역에 속성을 저장한다.
			request.setAttribute("idx", idx);
			request.setAttribute("nowPage", nowPage);
			
			String id = mr.getParameter("id");
			String title = mr.getParameter("title");
			String content = mr.getParameter("content");
			String pass = mr.getParameter("pass");
			
			/*
			 수정폼에서 첨부한 파일이 있다면 기존파일은 삭제해야하고, 
			 없다면 기존파일명으로 유지해야 한다. 
			 */
			String attachedfile = mr.getFilesystemName("attachedfile");
			
			if(attachedfile==null) {
				attachedfile = originalfile;
			}
			
			boardDTO dto = new boardDTO();
			dto.setAttachedfile(attachedfile);
			dto.setContent(content);
			dto.setTitle(title);
			dto.setId(id);
			dto.setPass(pass);
			dto.setIdx(idx);
			
			boardDAO bdao = new boardDAO();
			sucOrFail = bdao.boardupdate(dto);
			
			/*
			 레코드의 update가 성공이고 동시에 새로운 파일이 업로드 되었다면 기존의 파일은 삭제처리 한다.
			 첨부한 파일이 없다면 기존파일은 유지된다. 
			 
			 */
			if(sucOrFail==1 && mr.getFilesystemName("attachedfile")!=null)
			{
				FileUtil.deleteFile(request, "/Upload", originalfile);
			}
			bdao.close();
		}
		else {
			sucOrFail = -1;
		}
		
		//수정처리 이후에는 상세보기 페이지로 이동한다.
		request.setAttribute("SUC_FAIL", sucOrFail);
		request.setAttribute("WHEREIS", "UPDATE");
		if(url.equals("free")) {
			request.getRequestDispatcher("../space/Message.jsp?flag="+flag+"").forward(request, response);
			}
			else if(url.equals("admin")) {
				response.sendRedirect("../admin/admin.list?flag="+flag+"");
			}
	
		
		
	}

}
