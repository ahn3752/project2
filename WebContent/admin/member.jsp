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
          <%
					}
				%>
    </ul>


    <div id="content-wrapper">

      <div class="container-fluid">

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
          </li>
          <li class="breadcrumb-item active">Members</li>
        </ol>
		
		
        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>회원관리</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                  <th>아이디</th>
                    <th>비밀번호</th>
                    <th>이름</th>
                    <th>이메일</th>
                    <th>전화번호</th>
                    <th>휴대폰번호</th>
                    <th>주소</th>
                    <th>등급</th>
                    <th>수정</th>
                  </tr>
                </thead>
                <tbody>
       		<c:forEach items="${List}" var="mdto" varStatus="i">
                  <tr>
                    <td>${mdto.id}</td>
                    <td>${mdto.pass}</td>
                    <td>${mdto.name}</td>
                    <td>${mdto.email}</td>
                    <td>${mdto.hcall}</td>
                    <td>${mdto.phone}</td>
                    <td>${mdto.address}</td>
                    <td>${mdto.grade}</td>
                    
                    <td><a href="../admin/MemberUpdate.do?id=${mdto.id}">수정</a></td>
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

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>

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