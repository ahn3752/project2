<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="smtp.SMTPAuth"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
request.setCharacterEncoding("UTF-8");
//메일발송을 위한 객체 생성
SMTPAuth smtp = new SMTPAuth();

String mailContents = ""
	+"<table border=1>"
	+"<tr>"
	+"	<td>"+"비밀번호는"+request.getAttribute("password")+"입니다."+"</td>"
	+"</tr>"

	+"</table>";
	
System.out.println(request.getAttribute("password"));
System.out.println(request.getAttribute("id"));
System.out.println(request.getAttribute("email"));

//메일을 보내기 위한 여러가지 폼값을 Map컬렉션에 저장
Map<String,String> emailContent = new HashMap<String,String>();
emailContent.put("from","sonic375@naver.com");
emailContent.put("to",request.getParameter("email"));
emailContent.put("subject",request.getAttribute("id")+"님의 비밀번호 입니다.");
//emailContent.put("content",request.getParameter("content"));
emailContent.put("content", mailContents);

System.out.println(request.getAttribute("content"));
//내용이 null값이 아니라면 이메일 발송

	boolean emailResult = smtp.emailSending(emailContent);
	if(emailResult==true){
		System.out.println("true");
		out.print("메일발송성공");
	}
	else{
		System.out.println("true");
		out.print("메일발송실패");
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

</body>

</html>