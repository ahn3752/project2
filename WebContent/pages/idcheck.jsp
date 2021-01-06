<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID CHECK</title>
<script src="../common/jquery/jquery-3.5.1.js"></script>
<script type="text/javascript">
function cancel(){
	self.close();
}
</script>
</head>
<body>
	<center>
	<form>
	<h2>아이디 중복 확인</h2>
	<c:if test="${result==1}">

 		${id}는 중복되었습니다.<br/><br/>
 		<input type="button" value="닫기" class="cancel" onclick="cancel()">
 	</c:if>
 	<c:if test="${result==0}">
 		${id}는 사용 가능합니다.<br/><br/>
	<input type="button" value="사용" class="cancel" onclick="cancel()">
 	</c:if>
 	</form>
	</center>
</body>
</html>