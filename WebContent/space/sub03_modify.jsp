<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/isLogin.jsp" %>
 <body>
 <script>
	function checkValidate(fm){
		
		if(fm.pass.value==""){
			alert("비밀번호를 입력하세요."); 
			fm.pass.focus(); 
			return false; 
		}
	}
</script>
<center>
	<div id="wrap">
		<%@ include file="../include/top.jsp" %>
	<%@ include file= "../include/side.jsp" %>
			<div class="right_contents">
				<div class="top_title">
					<%@ include file = "../include/freeboard.jsp" %>
	<%@ include file = "../include/communityboard.jsp" %>
				</div>
				<div class="row mt-3 mr-1">
	<table class="table table-bordered table-striped">
	
	<!-- 
		파일 업로드 위해서는 반드시 enctype을 선언해야한다. 해당 선언문장이 없으면
		파일은 서버로 전송되지 않는다.
	  -->
	<form name="writeFrm" method="post" action="../space/free.modify?flag=${param.flag }" 
		onsubmit="return checkValidate(this);" enctype="multipart/form-data">
		
	<input type="hidden" name="idx" value="${dto.idx }" />
	<input type="hidden" name="nowPage" value="${param.nowPage }" />
	<input type="hidden" name="originalfile" value="${dto.attachedfile }" />
	<!--
		기존에 등록한 파일 이 있는 경우 수정시 파일을 첨부하지 않으면 기존 파일을 유지해야 하므로
		별도의 hidden폼이 필요하다.
		즉, 새로운 파일을 등록하면 새로운 값으로 업데이트 하고, 파일을 등록하지 않으면 기존 파일명으로
		데이터를 유지하게 된다.
	  -->
	
	
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tbody>
		 <tr>
			<th class="text-center align-middle">작성자</th>
			<td>
				<input type="text" class="form-control"	name="id"
				 style="width:100px;" value="${dto.id }"/>
			</td>
		</tr>
		<tr>
			<th class="text-center" 
				style="vertical-align:middle;">패스워드</th>
			<td>
				<input type="password" class="form-control" name="pass"
				 style="width:200px;" value="${dto.pass }"/>
			</td>
		</tr>
		<tr>
			<th class="text-center"
				style="vertical-align:middle;">제목</th>
			<td>
				<input type="text" class="form-control" name="title" value="${dto.title }"/>
			</td>
		</tr>
		<tr>
			<th class="text-center"
				style="vertical-align:middle;">내용</th>
			<td>
				<textarea rows="10" 
					class="form-control" name="content">${dto.content }</textarea>
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
</div>
<div class="row mb-3">
	<div class="col text-right">		
		<button type="submit" class="btn btn-danger">전송하기</button>
		<button type="reset" class="btn btn-dark">Reset</button>
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