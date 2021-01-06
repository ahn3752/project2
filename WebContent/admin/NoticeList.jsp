<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../common/bootstrap4.5.3/css/bootstrap.css" />
<script src="../common/jquery/jquery-3.5.1.js"></script>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin - Tables</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">

</head>
<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="index.html">Start Bootstrap</a>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
      <i class="fas fa-bars"></i>
    </button>

    <!-- Navbar Search -->
    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
 
    </form>

    <!-- Navbar -->
    <%
			//로그인 되었는지 확인하기 위해 세션영역에서 속성을 가져온다.
			if(session.getAttribute("USER_ID")==null){//로그인 전 상태..
			%>
    <ul class="navbar-nav ml-auto ml-md-0">
  
         <a class="nav-link" href="login.jsp" style="color:gray;">
      	 <i class="fas fa-fw fa-table"></i>
      	 <span style="color:gray;">Login</span></a>

      	<% }else{%>

         <a class="nav-link" style="color:gray;" href="../admin/Admin.do">
      	 <i class="fas fa-fw fa-table"></i>
      	 <span style="color:gray;">Logout</span></a>


    </ul>
		<%
					}
				%>
  </nav>

  <div id="wrapper">

    <%@ include file = "../include/admin.jsp" %>


    <div id="content-wrapper">

      <div class="container-fluid">

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
          </li>
          
                
        </ol>
        
		
		
        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
         <%if(request.getParameter("flag").equals("free")){%>
            <i class="fas fa-table"></i>자유게시판 관리
         <%}else if(request.getParameter("flag").equals("notice")) { %>
            <i class="fas fa-table"></i>공지사항 관리
         <%}else if(request.getParameter("flag").equals("info")) { %>
            <i class="fas fa-table"></i>정보자료실 관리
         <%}else if(request.getParameter("flag").equals("emp")) { %>
            <i class="fas fa-table"></i>직원자료실 관리
         <%}else if(request.getParameter("flag").equals("pro")) { %>
            <i class="fas fa-table"></i>보호자게시판 관리
            <%} %>       
              <a class = "btn btn-primary float-right" href="NoticeWrite.jsp?flag=<%=request.getParameter("flag") %>">글쓰기</a>
          </div>
            
          <div class="card-body">
          
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
  		<th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회수</th>
         <%
        if(!(request.getParameter("flag").equals("free"))){
        %>
        <th>첨부</th>
        <%} %>
        <th>수정</th>
        <th>삭제</th>
                </thead>
                <tbody>
  		 <c:forEach items="${List}" var="bdto" varStatus="loop">
      <tr>
        <td>${map.totalCount - (((map.nowPage-1) * map.pageSize)+loop.index) }</td>
        <td>${bdto.title}</td>
        <td>${bdto.id}</td>
        <td>${bdto.postdate}</td>
        <th>${bdto.visitcount}</th>
         <%
        if(!(request.getParameter("flag").equals("free"))){
        %>
        <th>${bdto.attachedfile }</th>
         <%} %>
        <th><a href="../admin/admin.modify?flag=${map.flag }&idx=${bdto.idx }&nowPage=${map.nowPage }">수정</a></th>
        <th><a href="../admin/admin.delete?flag=${map.flag }&idx=${bdto.idx}">삭제</a></th>
      </tr>
      </c:forEach>
         
                </tbody>
                
              </table>
		</div>
            </div>
            
          <div class="card-footer small text-muted"></div>
        </div>

        <p class="small text-center text-muted my-5">

        </p>

      </div>
      <!-- /.container-fluid -->

      <!-- Sticky Footer -->
      <footer class="sticky-footer">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright © Your Website 2019</span>
          </div>
        </div>
      </footer>

    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  
  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugin JavaScript-->
  <script src="vendor/datatables/jquery.dataTables.js"></script>
  <script src="vendor/datatables/dataTables.bootstrap4.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin.min.js"></script>

  <!-- Demo scripts for this page-->
  <script src="js/demo/datatables-demo.js"></script>

</body>
</html>