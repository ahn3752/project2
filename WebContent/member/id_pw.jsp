<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="../common/jquery/jquery-3.5.1.js"></script>

 <body>
	<center>
	<div id="wrap">
		<%@ include file="../include/top.jsp" %>

		<img src="../images/member/sub_image.jpg" id="main_visual" />

		<div class="contents_box">
			<div class="left_contents">
				<%@ include file = "../include/member_leftmenu.jsp" %>
			</div>
			<div class="right_contents">
				<div class="top_title">
					<img src="../images/member/id_pw_title.gif" alt="" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;멤버쉽&nbsp;>&nbsp;아이디/비밀번호찾기<p>
				</div>
				<div class="idpw_box">
					<div class="id_box">
				<form action="../member/Findid.do" method="post">
						<ul>
							<li><input type="text" name="name" value="" class="login_input01" /></li>
							<li><input type="text" name="email" value="" class="login_input01" /></li>
						</ul>
						
						<a href="javascript:check();"><input type="image" onclick="submit" src="../images/member/id_btn01.gif" class="id_btn" /></a>
						</form>
						<a href="/project2/member/join01.jsp"><img src="../images/login_btn03.gif" class="id_btn02" /></a>
					</div>
					<div class="pw_box">
					<form action="../member/Findpw.do" method="post">
						<ul>
							<li><input type="text" name="id" value="" class="login_input01" /></li>
							<li><input type="text" name="name" value="" class="login_input01" /></li>
							<li><input type="text" name="email" value="" class="login_input01" /></li>
						</ul>
						<a href=""><input type="image" onclick="submit" src="../images/member/id_btn01.gif" class="pw_btn" /></a>
						</form>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	

	<%@ include file="../include/footer.jsp" %>
	
		<c:if test="${id==null and a!=null}">
 	<script type="text/javascript">
 	alert("존재하는 회원이 없습니다.")
 	</script>
 	</c:if>
	<c:if test="${id!=null and a!=null}">
	<script type="text/javascript">
 	window.alert("회원님의 id는 ${id} 입니다")
 	</script>
	</c:if>

	</center>
		
 </body>
</html>
