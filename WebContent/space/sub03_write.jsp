<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<form action="../space/free.write?flag=<%=request.getParameter("flag") %>" method="post" enctype="multipart/form-data">
<%
System.out.println("확인용");
System.out.println(request.getParameter("flag"));
%>

<table class="table table-bordered">
<colgroup>
	<col width="20%"/>
	<col width="*"/>
</colgroup>
<tbody>
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">작성자</th>
		<td>
			<input type="hidden" class="form-control" 
				name = "id" style="width:100px;" value="<%=session.getAttribute("USER_ID")%>" /><%=session.getAttribute("USER_ID") %>
		</td>
	</tr>
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">패스워드</th>
		<td>
			<input type="password" class="form-control" 
				name="pass" style="width:200px;" />
		</td>
	</tr>
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">제목</th>
		<td>
			<input type="text" class="form-control" name="title"/>
		</td>
	</tr>
	
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">내용</th>
		<td>
			<textarea rows="10" class="form-control" name="content"></textarea>
		</td>
	</tr>

	    <%
        if(!(request.getParameter("flag").equals("free"))){
        %>
        
	 <tr>
			<th class="text-center"
				style="vertical-align:middle;">첨부파일</th>
			<td>
				<input type="file" class="form-control" name="attachedfile" />
			</td>
		</tr>
		<%} %>
</tbody>
</table>

<div class="row text-center" style="">
	<!-- 각종 버튼 부분 -->
	
	<button type="submit" class="btn btn-danger">전송하기</button>
	<button type="reset" class="btn">Reset</button>
	<button type="button" class="btn btn-warning" 
		onclick="location.href='../space/free.list?flag=${param.flag }';">리스트보기</button>
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