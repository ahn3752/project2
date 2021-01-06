<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<img src="../images/community/left_title.gif" alt="센터소개 Center Introduction" class="left_title" />
<script src="../common/jquery/jquery-3.5.1.js"></script>	

<script>
function rightC(grade){
	
	if(grade == 0){
		location.href = "../space/free.list?flag=emp";
	}
	else{
		alert('권한이 없습니다.');
	}
}
</script>

<!-- ../space/free.list?flag=emp -->

<!-- <object type="application/x-shockwave-flash" data="../swf/submenu06.swf" width="152" height="125">
<param name="wmode" value="transparent" />
</object> -->
<img src="../images/menu/1.jpg" alt="" usemap="#LNB"/>
<map name="LNB">

	<area shape="rect" alt="" title="" coords="10,9,134,44" href="#" id="right" onclick="rightC(<%=session.getAttribute("grade") %>);" target="" />

	<area shape="rect" alt="" title="" coords="10,48,134,86" href="../space/free.list?flag=pro" target="" />
</map>
<ul>
	<li><a href="../community/sub01.jsp">메뉴1</a></li>
	<li><a href="../community/sub02.jsp">메뉴2</a></li>
</ul>
