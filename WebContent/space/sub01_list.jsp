<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>


 <body>
	<center>
	<div id="wrap">
		<%@ include file="../include/top.jsp" %>

		<img src="../images/space/sub_image.jpg" id="main_visual" />

		<div class="contents_box">
			<div class="left_contents">
				<%@ include file = "../include/space_leftmenu.jsp" %>
			</div>
			<div class="right_contents">
				<div class="top_title">
					<img src="../images/space/sub01_title.gif" alt="공지사항" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;열린공간&nbsp;>&nbsp;공지사항<p>
				</div>
				<div>

<div class="row text-right" style="margin-bottom:20px;
		padding-right:50px;">
<!-- 검색부분 -->


	<form class="form-inline">	
	<div class="form-group">
	<input type=hidden name="flag" value="free">
		<select name="searchColumn" class="form-control">
			<option value="title">제목</option>
			<option value="id">작성자</option>
			<option value="content">내용</option>
		</select>
	</div>
	<div class="input-group">
		<input type="text" name="searchWord"  class="form-control"/>
		<div class="input-group-btn">
			<button type="submit" class="btn btn-default">
				<i class="glyphicon glyphicon-search"></i>
			</button>
		</div>
	</div>
</form>	
</div>
				
				  <table class="table table-bordered table-hover table-striped">
    <thead>
      <tr style="background-color: rgb(166, 166, 166);"
		class="text-center text-white">
		
        <th style="width:10%">번호</th>
        <th style="width:35%">제목</th>
        <th style="width:20%">작성자</th>
        <th style="width:15%">작성일</th>
        <th style="width:10%">조회수</th>
         <th style="width:10%">첨부</th>
    
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${List}" var="bdto" varStatus="loop">
      <tr>
        <td width="30px">${map.totalCount - (((map.nowPage-1) * map.pageSize)+loop.index) }</td>
        <td width="30px"><a href="../space/free.view?idx=${bdto.idx }&nowPage=${map.nowPage}&searchColumn=${param.searchColumn }&searchWord=${param.searchWord}">${bdto.title}</td> 
        <td width="30px">${bdto.id}</td>
        <th width="30px">${bdto.postdate}</th>
        <th width="30px">${bdto.visitcount}</th>
        <th width="30px">${bdto.attachedfile}</th>
  
      </tr>
      </c:forEach>
    </tbody>
  </table>
 
		<!-- 페이지번호 부분 -->
<ul>
	<!-- 매개변수 설명
               totalRecordCount : 게시물의 전체 갯수
               pageSize : 한 페이지에 출력할 게시물의 갯수 
               blockPage : 한 블록에 표시할 페이지 번호의 갯수
               nowPage : 현재 페이지 번호
               "BoardList.jsp?" : 해당 게시판의 실행 파일명
               -->
        	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
        	${map.pagingTxt}
</ul>
	
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>


	<%@ include file="../include/footer.jsp" %>
	</center>
 </body>
</html>