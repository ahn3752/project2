<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
				<div>
	<div class="row mt-3 mr-1">
	<table class="table table-bordered table-striped">
		
		<!-- 
			파일 업로드 위해서는 반드시 enctype을 선언해야한다. 해당 선언문장이 없으면
			파일은 서버로 전송되지 않는다.
		  -->
		<form name="writeFrm" method="post" action="../space/free.pass?flag=<%=request.getParameter("flag") %>" 
			onsubmit="return checkValidate(this);">
		
		<!-- 
		패스워드 검증을 위해 idx, mode는 웹서버로 전송되어야 하므로
		hidden폼에 값을 저장해야한다.
		  -->	
		<input type = "hidden" name="idx" value="${param.idx }"/>
		<input type = "hidden" name="mode" value="${param.mode }"/>
		
		<colgroup>
			<col width="20%"/>
			<col width="*"/>
		</colgroup>
		<tbody>
			
			<tr>
				<th class="text-center" 
					style="vertical-align:middle;">패스워드</th>
				<td>
					<input type="password" class="form-control" name="pass"
						style="width:200px;"/>
				</td>
			</tr>
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
			</div>
			<%@ include file="../include/quick.jsp" %>
		</div>
	
	
		<%@ include file="../include/footer.jsp" %>
		</center>
 </body>
</html>