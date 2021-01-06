<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
		
		td{
            text-align: center;
            border:1px solid #e7e7e7;
		}
	</style>

<%
Cookie[] cookies = request.getCookies();

String id = "", save="";

if(cookies!=null){
	
	for(Cookie ck : cookies){
		if(ck.getName().equals("SaveId")){
			save = ck.getValue();
			System.out.println(2222);
			System.out.println("save="+save);
		}			
	}
}
%>   
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>마포구립장애인 직업재활센터</title>
<script src="../common/jquery/jquery-3.5.1.js"></script>
<script language="javascript" type="text/javascript">



var today = new Date(); // 오늘 날짜//지신의 컴퓨터를 기준으로
//today 에 Date객체를 넣어줌 //ex)5일  
function prev() {
 				//yyyy 
 today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
 Calendar(); // 현재 달 
}
 
function next() {
 
 
 today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
 Calendar();
}
 
function Calendar() {// 현재 달fur
 var nMonth = new Date(today.getFullYear(), today.getMonth(), 1);  // 이번 달의 첫째 날
 var lastDate = new Date(today.getFullYear(), today.getMonth()+1, 0); // 이번 달의 마지막 날
 var tblCalendar = document.getElementById("calendar");     // 테이블 달력을 만들 테이블
 var tblCalendarYM = document.getElementById("calendarYM");    // yyyy년 m월 출력할 곳
 tblCalendarYM.innerHTML = today.getFullYear() + "년 " + (today.getMonth() + 1) + "월";  // yyyy년 m월 출력
// 기존 테이블에 뿌려진 줄, 칸 삭제
 
 
 while (tblCalendar.rows.length > 2) {
  tblCalendar.deleteRow(tblCalendar.rows.length - 1);
 }
 var row = null;
 row = tblCalendar.insertRow();
 var cnt = 0;
// 1일이 시작되는 칸을 맞추어 줌
 for (i=0; i<nMonth.getDay(); i++) {
  cell = row.insertCell();
  cnt = cnt + 1;
 }
 
 for (i=1; i<=44; i++) { 
  cell = row.insertCell();

	if(i<=lastDate.getDate()){
  cell.innerHTML = i;
		
	}
  cnt = cnt + 1;
  if (cnt%7 == 0)// 1주일이 7일 이므로
   row = calendar.insertRow();// 줄 추가
 }
 
}
 
</script>
<style type="text/css" media="screen">
@import url("../css/common.css");
@import url("../css/main.css");
@import url("../css/sub.css");
.ellipse{
block :inline-blick; width:240px; text-overflow:ellipsis; white-space:nowrap;overflow:hidden;
}
</style>
</head>
<body>

<center>
	<div id="wrap">
		<%@ include file="../include/top.jsp"%>
		
		<div id="main_visual">
		<a href="/product/sub01.jsp"><img src="../images/main_image_01.jpg" /></a><a href="/product/sub01_02.jsp"><img src="../images/main_image_02.jpg" /></a><a href="/product/sub01_03.jsp"><img src="../images/main_image_03.jpg" /></a><a href="/product/sub02.jsp"><img src="../images/main_image_04.jpg" /></a>
		</div>

		<div class="main_contents">
			<div class="main_con_left">
				<p class="main_title" style="border:0px; margin-bottom:0px;"><img src="../images/main_title01.gif" alt="로그인 LOGIN" /></p>
				<div class="login_box">
			<%
			System.out.println("세션아이디 체크");
			System.out.println(session.getAttribute("USER_ID"));
			//로그인 되었는지 확인하기 위해 세션영역에서 속성을 가져온다.
			if(session.getAttribute("USER_ID")==null){//로그인 전 상태..
			%>
				<form action="../main/main.do" method="post">
					<table cellpadding="0" cellspacing="0" border="0">
						<colgroup>
							<col width="45px" />
							<col width="120px" />
							<col width="55px" />
						</colgroup>
						
						<tr>
							<th><img src="../images/login_tit01.gif" alt="아이디" /></th>
							<td><input type="text" name="user_id" value="<%=(save.length()==0) ? "" : save %>" class="login_input" /></td>
							<td rowspan="2"><input type="image" src="../images/login_btn01.gif" onclick="submit" alt="로그인" /></td>
						</tr>
						<tr>
							<th><img src="../images/login_tit02.gif" alt="패스워드" /></th>
							<td><input type="password" name="user_pw" value="" class="login_input" /></td>
						</tr>
					</table>
						
					<p>
						<input type="checkbox" id="id_save" name="id_save" value="Y" <% if(save.length()!=0){ %>
						checked="checked"<% } %> /><img src="../images/login_tit03.gif" alt="저장" />
						<a href="../member/id_pw.jsp"><img src="../images/login_btn02.gif" alt="아이디/패스워드찾기" /></a>
						<a href="../member/join01.jsp"><img src="../images/login_btn03.gif" alt="회원가입" /></a>
					</p>
					</form>
					<% }else{ //로그인 후 상태 %>
					<!-- 로그인 후 -->
					<p style="padding:10px 0px 10px 10px"><span style="font-weight:bold; color:#333;">${USER_NAME},</span> 반갑습니다.<br />로그인 하셨습니다.</p>
					<p style="text-align:right; padding-right:10px;">
						<a href=""><img src="../images/login_btn04.gif" /></a>
						<a href="../main/main.do"><img src="../images/login_btn05.gif" /></a>
					</p>
					<%
					}
				%>
			
				</div>
			</div>
			<div class="main_con_center">
				<p class="main_title"><img src="../images/main_title02.gif" alt="공지사항 NOTICE" /><a href="/project2/space/sub01.jsp"><img src="../images/more.gif" alt="more" class="more_btn" /></a></p>
				<ul class="main_board_list">
				<%int i = 0; %>
					<c:forEach items="${List}" var="bdto">
					<c:if test="${bdto.flag eq 'notice'}">
					<%
					i++;
					if(i<=4){
					%>
					
					<li class="a"><p><a href="../space/free.list?flag=notice"><div class ="ellipse">${bdto.title }</div></a><span>${bdto.postdate }</span></p></li>
					<%} %>
					</c:if>
					 </c:forEach>
				</ul>
			</div>
			<div class="main_con_right">
				<p class="main_title"><img src="../images/main_title03.gif" alt="자유게시판 FREE BOARD" /><a href="/project2/space/sub03.jsp"><img src="../images/more.gif" alt="more" class="more_btn" /></a></p>
				<ul class="main_board_list">
				<%int j = 0; %>
				<c:forEach items="${List}" var="bdto">
				<c:if test="${bdto.flag eq 'free'}">
					<%
					j++;
					if(j<=4){
					%>
					<li class="a"><p><a href="../space/free.list?flag=free"><div class ="ellipse">${bdto.title }</div></a><span>${bdto.postdate }</span></p></li>
					<%} %>
					 </c:if>
					 </c:forEach>
				</ul>
			</div>
		</div>

		<div class="main_contents">
			<div class="main_con_left">
				<p class="main_title"><img src="../images/main_title04.gif" alt="월간일정 CALENDAR" /></p>
				<img src="../images/main_tel.gif" />
			</div>
			<div class="main_con_center">
				<p class="main_title" style="border:0px; margin-bottom:0px;"><img src="../images/main_title05.gif" alt="월간일정 CALENDAR" /></p>
				<div class="cal_top">
					<table cellpadding="0" cellspacing="0" border="0" style="border-color:#e7e7e7;">
							<colgroup>
							<col width="13px;" />
							<col width="*" />
							<col width="13px;" />
						</colgroup>
					 <tr>
					     <td><label onclick="prev()"><</label></td>
					        <td colspan="5" align="center" id="calendarYM">yyyy년 m월</td>
					        <td><label onclick="next()">></label></td>
					    </tr>
					    </table>
					    </div>
					    <div class="cal_bottom" >
				
					    <table style="margin-left: auto; margin-right: auto; " 
					    width="90%" text-align="center" border="1" id="calendar">
					
					   <tr>
							<td height="20"><img src="../images/day01.gif" alt="S" /></td>
							<td><img src="../images/day02.gif" alt="M" /></td>
							<td><img src="../images/day03.gif" alt="T" /></td>
							<td><img src="../images/day04.gif" alt="W" /></td>
							<td><img src="../images/day05.gif" alt="T" /></td>
							<td><img src="../images/day06.gif" alt="F" /></td>
							<td><img src="../images/day07.gif" alt="S" /></td>
						</tr>
						<tr>
						<td><script language="javascript" type="text/javascript">
					Calendar();
					</script>
					</td>
					</tr>
				
					 </table>
					</div>
				</div>
				
			<div class="main_con_right">
				<p class="main_title"><img src="../images/main_title06.gif" alt="사진게시판 PHOTO BOARD" /><a href="/space/sub04.jsp"><img src="../images/more.gif" alt="more" class="more_btn" /></a></p>
				<ul class="main_photo_list">
				<%int k = 0; %>
				<c:forEach items="${List}" var="bdto">
				<c:if test="${bdto.flag eq 'image'}">
					<%
					k++;
					if(k<=6){
					%>
					<li>
						<dl>
							<dt><a href="../space/free.list?flag=image"> <img alt="" src="../Upload/${bdto.attachedfile}" width="80" height="60"></a></dt>
							<dd><a href="">마포 구립 장애인...</a></dd>
						</dl>
					</li>
					<%} %>
					</c:if>
					</c:forEach>
				
				</ul>
			</div>
		</div>
		<%@ include file="../include/quick.jsp"%>
	</div>

	<%@ include file="../include/footer.jsp"%>
	
</center>
</body>
</html>