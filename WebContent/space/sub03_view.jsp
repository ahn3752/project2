<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/isLogin.jsp" %>
 <body>
	<center>
	<div id="wrap">
		<%@ include file="../include/top.jsp" %>
	<%@ include file= "../include/side.jsp" %>
			<div class="right_contents">
				<div class="top_title">
					<%@ include file = "../include/freeboard.jsp" %>
	<%@ include file = "../include/communityboard.jsp" %>
				</div>
				<div>

<form enctype="multipart/form-data">
<table class="table table-bordered">
<colgroup>
	<col width="20%"/>
	<col width="30%"/>
	<col width="20%"/>
	<col width="*"/>
</colgroup>
<tbody>
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">작성자</th>
		<td>
			${bdto.id}
		</td>
		<th class="text-center" 
			style="vertical-align:middle;">작성일</th>
		<td>
			${bdto.postdate }
		</td>
	</tr>
		<tr><th class="text-center table-active align-middle">다운로드수</th>
		<td>${bdto.downcount }</td>
		<th class="text-center" style="vertical-align:middle;">조회수</th>
		<td>${bdto.visitcount }</td>
	</tr>
		<tr>
		<th class="text-center" 
			style="vertical-align:middle;">제목</th>
		<td colspan="3">
			${bdto.title }
		</td>
	
	</tr>
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">내용</th>
		<td colspan="3">
			${bdto.content }
		</td>
	</tr>
	   <%
        if(!(request.getParameter("flag").equals("free"))){
        %>
	<tr>
			<th class="text-center table-active align-middle">첨부파일</th>
			<td colspan="3">
				<c:if test="${not empty bdto.attachedfile }">
					${bdto.attachedfile}
				<a href="../space/free.download?filename=${bdto.attachedfile }&idx=${bdto.idx}">
					[다운로드]
				</a>
			</c:if>
			</td>
		</tr>
		<%} %>				
</tbody>
</table>

<div class="row text-center" style="">
	<c:if test="${param.flag != 'notice'}">

	<!-- 각종 버튼 부분 -->
	<button type="button" class="btn btn-primary"
	onclick="location.href='../space/free.pass?flag=${param.flag }&mode=edit&idx=${param.idx}&nowPage=${param.nowPage}&searchColumn=${param.searchColumn }&searchWord=${param.searchWord}';">
	수정하기</button>
	<button type="button" class="btn btn-success"
	onclick="location.href='../space/free.pass?flag=${param.flag }&mode=delete&idx=${param.idx}&nowPage=${param.nowPage}&searchColumn=${param.searchColumn }&searchWord=${param.searchWord}';">삭제하기</button>	
	</c:if>
	
	<button type="button" class="btn btn-warning" 
		onclick="location.href='../space/free.list?flag=${param.flag }'">리스트보기</button>
</div>
</form> 

				</div>
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>


	<%@ include file="../include/footer.jsp" %>
	</center>
 </body>
</html>