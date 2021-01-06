package BoardController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.boardDAO;
import util.FileUtil;


@WebServlet("*.download")
public class DownloadCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String filename = request.getParameter("filename");
		String idx = request.getParameter("idx");
		
		/*
		 방법 1 : 서버에 저장된 파일명 그대로 다운로드.
		 	파일명을 변경할 필요가 없으므로 파일명에 관련한 파라미터는 1개만 있다.
		 */
		//FileUtil.download(req, resp, "/Upload", filename);
		
		/*
		 방법 2 : 서버에 저장된 파일을 다운로드 할때는 원본파일명으로 변경하여 다운로드 한다.
		 	이때는 저장된 파일명과 원본파일명이 각각 테이블에 저장되어 있어야 한다. 여기서는
		 	파일명 변경에 대해서만 확인해본다.
		 	FileUtil.download(request객체, response객체, 디렉토리명, 서버에저장된파일명, 원본파일명);
		 	
		 */
		FileUtil.download(request, response, "/Upload", filename, "원본파일명.jpg");
		
		
		
		//DAO생성 및 파일다운로드 카운트 증가
		boardDAO bdao = new boardDAO();
		bdao.downCountPlus(idx);
		bdao.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
