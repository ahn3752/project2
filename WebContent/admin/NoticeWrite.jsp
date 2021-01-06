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
<script>
	/* 연습문제] 글쓰기 폼에 빈값이 있는경우 서버로 전송되지
			않도록 아래 validate()함수를 완성하시오.
			모든 값이 입력되었다면 WriteProc.jsp로 
			submit되어야 한다.
	*/
	function checkValidate(fm){
		if(fm.name.value==""){
			alert("작성자의 이름을 입력하세요/"); 
			fm.name.focus(); 
			return false; 
		}
		if(fm.pass.value==""){
			alert("비밀번호를 입력하세요."); 
			fm.pass.focus(); 
			return false; 
		}
		if(fm.title.value==""){
			alert("제목을 입력하세요."); 
			fm.title.focus(); 
			return false; 
		}
		if(fm.content.value==""){
			alert("내용을 입력하세요."); 
			fm.content.focus(); 
			return false;
		}
	}
</script>
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
			if(session.getAttribute("USER_ID")==null || !(session.getAttribute("USER_ID").equals("admin"))){//로그인 전 상태..
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
          <li class="breadcrumb-item active">FreeboardWrite</li>
        </ol>
        
		<form action="../space/admin.write?flag=${param.flag }" method="post" onsubmit="return checkValidate(this);" 
		enctype="multipart/form-data">
<table class="table table-bordered">
<colgroup>
	<col width="20%"/>
	<col width="*"/>
</colgroup>
<tbody>
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">작성자</th>
		<td>
			<input type="hidden" class="form-control" 
				name = "id" style="width:100px;" value="<%=session.getAttribute("USER_ID")%>" /><%=session.getAttribute("USER_ID") %>
		</td>
	</tr>
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">패스워드</th>
		<td>
			<input type="text" class="form-control" 
				name="pass" style="width:200px;" />
		</td>
	</tr>
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">제목</th>
		<td>
			<input type="text" class="form-control" name="title"/>
		</td>
	</tr>
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">내용</th>
		<td>
			<textarea rows="10" class="form-control" name="content"></textarea>
		</td>
	</tr>
	  <%
        if(!(request.getParameter("flag").equals("free"))){
        %>
	 <tr>
			<th class="text-center"
				style="vertical-align:middle;">첨부파일</th>
			<td>
				<input type="file" class="form-control" name="attachedfile" />
			</td>
		</tr>
		   <%} %>
</tbody>
</table>

<div class="row text-center float-right" style="">
	<!-- 각종 버튼 부분 -->
	
	<button type="submit" class="btn btn-danger">전송하기</button>
	<button type="reset" class="btn">Reset</button>
	<button type="button" class="btn btn-warning" 
		onclick="location.href='ListSkin.jsp';">리스트보기</button>
</div>
</form> 

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