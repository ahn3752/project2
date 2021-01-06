package BoardController;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.boardDAO;
import model.boardDTO;
import util.PagingUtil;

@WebServlet("*.list")
public class BoardListCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String url = request.getRequestURI();
		url = url.substring(url.lastIndexOf('/')+1, url.lastIndexOf('.'));
		
		String flag = request.getParameter("flag");
	      
		
		boardDAO bdao = new boardDAO();
		Map param = new HashMap();
	      String addQueryString = "";
	      
	      //검색어 관련 파라미터 처리
	      String searchColumn = request.getParameter("searchColumn");
	      String searchWord = request.getParameter("searchWord");
	      if(searchColumn!=null) {
	    	  //검색어가 있는 경우 파라미터를 Map에 저장하고, 쿼리스트링을 만들어준다.
	         addQueryString = String.format("searchColumn=%s&searchWord=%s&",flag, searchColumn, searchWord);
	         param.put("Column", searchColumn); //전체 레코드수를 map에 저장
	         param.put("Word", searchWord);
	      }
	      
	      param.put("flag", flag);
		//테이블의 전체 레코드수를 카운트
	      int totalRecordCount = bdao.getTotalRecordCount(param);
	      //전체 레코드수를 Map에 저장한다. 차후 View로 전달한다.
	      param.put("totalCount", totalRecordCount);
	      
	      ////////////////페이지 처리 추가부분 start//////////////////////
	      /*
	       web.xml의 컨텍스트 초기화 파라미터를 서블릿에서 가져오기 위해 application내장객체를
	            메소드를 통해 얻어와서 값을 얻어온다.
	      */
	      //페이지수 계산을 위한 페이지설정값 가져오기
	      ServletContext application = this.getServletContext();
	      int pageSize= Integer.parseInt(application.getInitParameter("PAGE_SIZE"));
	      int blockPage = Integer.parseInt(application.getInitParameter("BLOCK_PAGE"));
	
	      //전체 페이지수를 계산한다.
	      int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
	      System.out.println("전체 레코드수:"+totalRecordCount);
	      System.out.println("전체페이지수:"+totalPage);
	      
	      //현재 페이지번호를 설정한다. 최초진입시에는 무조건 1로 설정한다.
	      int nowPage = (request.getParameter("nowPage")==null || 
	    		  request.getParameter("nowPage").equals("")) ? 
	    				  1 : Integer.parseInt(request.getParameter("nowPage"));
	      
	      //한페이지에 출력할 게시물의 구간을 정하기 위해 start,end값 계산
	      int start = (nowPage-1) * pageSize;
	      int end = pageSize;
	      
	      //Map 컬렉션에 데이터 저장
	      param.put("start", start);
	      param.put("end", end);
	      param.put("totalPage", totalPage);
	      param.put("nowPage", nowPage);
	      param.put("totalCount", totalRecordCount);
	      param.put("pageSize", pageSize);
	      
	      String pagingTxt = PagingUtil.pagingTxt(totalRecordCount, pageSize, blockPage, nowPage, "../"+url+"/"+url+".list?flag="+flag+addQueryString);
	      param.put("pagingTxt", pagingTxt);
	      ////////////////페이지 처리 추가부분 end////////////////////////
		
		
		if(url.equals("admin")) {
		List<boardDTO> list = bdao.selectList(param);
		
		request.setAttribute("test", "매핑확인용");
	    request.setAttribute("map", param);
		request.setAttribute("List", list);
		}
		
		else {
		List<boardDTO> list = bdao.freeList(param);
		
		request.setAttribute("test", "매핑확인용");
	    request.setAttribute("map", param);
		request.setAttribute("List", list);
		request.setAttribute("flag", flag);
		request.setAttribute("url", url);
	
		}
		bdao.close();
	      

		if(url.equals("free")) {
			if(flag.equals("free") || flag.equals("notice") || flag.equals("info"))
		request.getRequestDispatcher("../space/sub03.jsp").forward(request, response);
			else if(flag.equals("image")) {
				request.getRequestDispatcher("../space/sub04.jsp").forward(request, response);
			}
			else {
				request.getRequestDispatcher("../community/comlist.jsp").forward(request, response);
			}
			
		
		}

		else if(url.equals("admin")) {
			request.getRequestDispatcher("../admin/NoticeList.jsp").forward(request, response);

			}
		else if(url.equals("date")) {
			request.getRequestDispatcher("../space/sub02.jsp").forward(request, response);

			}
		

		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	

}
