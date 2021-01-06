<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../common/bootstrap4.5.3/css/bootstrap.css" />
<script src="../common/jquery/jquery-3.5.1.js"></script>
</head>
<body>
 <!-- Sidebar -->
    <ul class="sidebar navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span>
        </a>
        </li>
    <%
			if(session.getAttribute("USER_ID")!=null && session.getAttribute("USER_ID").equals("admin")){

			%>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="../admin/list.do">
          <i class="fas fa-fw fa-table"></i>
          <span>회원관리</span></a>
           </li>
           <li class="nav-item">
        <a class="nav-link" href="admin.list?flag=notice">
          <i class="fas fa-fw fa-table"></i>
          <span>공지사항 관리</span></a>
           </li>
           <li class="nav-item">
        <a class="nav-link" href="admin.list?flag=free">
          <i class="fas fa-fw fa-table"></i>
          <span>자유게시판 관리</span></a>
           </li>
             <li class="nav-item">
        <a class="nav-link" href="admin.list?flag=info">
          <i class="fas fa-fw fa-table"></i>
          <span>정보자료실 관리</span></a>
           </li>
             <li class="nav-item">
        <a class="nav-link" href="admin.list?flag=emp">
          <i class="fas fa-fw fa-table"></i>
          <span>직원자료실 관리</span></a>
           </li>
             <li class="nav-item">
        <a class="nav-link" href="admin.list?flag=pro">
          <i class="fas fa-fw fa-table"></i>
          <span>보호자 게시판 관리</span></a>
           </li>
             <li class="nav-item">
        <a class="nav-link" href="admin.list?flag=image">
          <i class="fas fa-fw fa-table"></i>
          <span>사진 게시판 관리</span></a>
           </li>
          <%
					}
				%>
    </ul>
</body>
</html>