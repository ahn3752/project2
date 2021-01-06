<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../common/bootstrap4.5.3/css/bootstrap.css" />
<script src="../common/jquery/jquery-3.5.1.js"></script>
<style type="text/css">
td {
 width: 60px;
 height: 60px;
 text-align: center;
 font-size: 20px;
 font-family: 바탕;
 border:2px solid #000000;
 border-radius:8px;
}
 
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
 
 
<title>Calender</title>
 
<script language="javascript" type="text/javascript">

var today = new Date();

function prev(){
	
	today = new date(today.getFullYear(), today.getMonth() - 1, today.getDate());
	
}

function next(){
	today = new date(today.getFullYear(), today.getMonth() + 1, today.getDate());
	
}

function Calendar() {// 현재 달fur
	 var nMonth = new Date(today.getFullYear(), today.getMonth(), 1);  // 이번 달의 첫째 날
	 var lastDate = new Date(today.getFullYear(), today.getMonth()+1, 0); // 이번 달의 마지막 날
	 var tblCalendar = document.getElementById("calendar");     // 테이블 달력을 만들 테이블
	 var tblCalendarYM = document.getElementById("calendarYM");    // yyyy년 m월 출력할 곳
	 tblCalendarYM.innerHTML = today.getFullYear() + "년 " + (today.getMonth() + 1) + "월";  // yyyy년 m월 출력
	// 기존 테이블에 뿌려진 줄, 칸 삭제
}
 
</script>
 
</head>
<body>
<table id="calendar" boarder="3" align="center">
 <tr>
     <td><label onclick="prevCalendar()"><</label></td>
        <td colspan="5" align="center" id="calendarYM">yyyy년 m월</td>
        <td><label onclick="nextCalendar()">>
           
        </label></td>
    </tr>
    <tr>
     <td align="center">일</td>
     <td align="center">월</td>
     <td align="center">화</td>
     <td align="center">수</td>
     <td align="center">목</td>
     <td align="center">금</td>
     <td align="center">토</td>
   </tr>
 
 
</table>
<script language="javascript" type="text/javascript">
buildCalendar();
</script>
</body>
</html>