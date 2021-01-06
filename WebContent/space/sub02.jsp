<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/global_head.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		
		td{

            vertical-align: top;
            border:1px solid #e7e7e7;
		}
		tr{
		
		}
		
		.cal_top{
			width: 1000px;
		
		}
	</style>
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
 


function Calendar() {
	 var nMonth = new Date(today.getFullYear(), today.getMonth(), 1);  
	 var lastDate = new Date(today.getFullYear(), today.getMonth()+1, 0); 
	 var tblCalendar = document.getElementById("calendar");     
	 var tblCalendarYM = document.getElementById("calendarYM");   
	 tblCalendarYM.innerHTML = today.getFullYear() + "년 " + (today.getMonth() + 1) + "월";  



	 while (tblCalendar.rows.length > 2) {
	  tblCalendar.deleteRow(tblCalendar.rows.length - 1);
	 }
	 var row = null;
	 row = tblCalendar.insertRow();
	 var cnt = 0;
	
	 for (i=0; i<nMonth.getDay(); i++) {
	  cell = row.insertCell();
	  cnt = cnt + 1;
	 }
	 
	 for (i=1; i<=37; i++) { 
	  cell = row.insertCell();

		cell.style.height="100px"
		if(i<=lastDate.getDate()){
	
			cell.innerHTML = i;
		
			
		}
	  cnt = cnt + 1;
	  if (cnt%7 == 0)
	   row = calendar.insertRow();
	 }
	 
/* 	 for (i=1; i<=37; i++) { 
		if(today.getFullYear() == postdate.substring(0,4) &&
				(today.getMonth()+1) == postdate.substring(5,7) &&
				cell.innerHTML == postdate.substring(8,10)){
			if(i<=lastDate.getDate()){
				
				cell.innerHTML += title;
			
				
			}
		}	 */
	

	}
 
</script>
</head>
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
					<img src="../images/space/sub02_title.gif" alt="프로그램일정" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;열린공간&nbsp;>&nbsp;프로그램일정<p>
				</div>
	      		
					<table width="800px" cellpadding="0" cellspacing="0" border="0" style="border-color:#e7e7e7;">
					
					 <tr>
					     <td style="text-align:center;"><label onclick="prev()"><</label></td>
					        <td colspan="5" align="center" id="calendarYM">yyyy년 m월</td>
					        <td style="text-align:center;"><label onclick="next()">></label></td>
					    </tr>
					    </table>
					   
					  
				
					    <table width = "800px" border="1" id="calendar">
					
					   <tr>
							<td height="30px" style="text-align:center; vertical-align: middle;">
							<img src="../images/day01.gif" alt="S" width="x"/></td>
							<td height="30px" style="text-align:center; vertical-align: middle;">
							<img src="../images/day02.gif" alt="M" /></td>
							<td height="30px" style="text-align:center; vertical-align: middle;">
							<img src="../images/day03.gif" alt="T" /></td>
							<td height="30px" style="text-align:center; vertical-align: middle;">
							<img src="../images/day04.gif" alt="W" /></td>
							<td height="30px" style="text-align:center; vertical-align: middle;">
							<img src="../images/day05.gif" alt="T" /></td>
							<td height="30px" style="text-align:center; vertical-align: middle;">
							<img src="../images/day06.gif" alt="F" /></td>
							<td height="30px" style="text-align:center; vertical-align: middle;">
							<img src="../images/day07.gif" alt="S" /></td>
						</tr>
					
						<c:forEach items="${List}" var="bdto">
						
						
					      </c:forEach>
					<td><script language="javascript" type="text/javascript">
			
							Calendar();
						</script>
							</td>
					 </table>
				
				</div>	
			</div>
			</div>
		
<div class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	

	<%@ include file="../include/footer.jsp" %>
	</center>
 </body>
</html>