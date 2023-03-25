<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<c:set var="isLogined" value="${not empty sessionScope.id}"/>
<html>
<head>
	<title>로그인</title>
</head>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/common.css">

<%--내비게이션--%>
<nav>
	<ul class="nav justify-content-center">
	  <li class="nav-item">
	    <a class="nav-link active" href="/">홈으로</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="/list.do">게시판</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="/login.go">${isLogined? '로그아웃' : '로그인'}</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="/join.go">${isLogined? '' : '회원가입'}</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link">${sessionScope.id}${isLogined?'님':''}</a>
	  </li>
	</ul>
</nav>

<body class="container">
<div class="page-title">로그인</div>
	<form>
	  <div class="form-group">
	    <label for="exampleInputId">아이디</label>
	    <input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력해주세요.">
	  </div>
	  <div class="form-group">
	    <label for="exampleInputPassword">비밀번호</label>
	    <input type="password" class="form-control" id="pwd" name="pwd" placeholder="비밀번호를 입력해주세요.">
	  </div><br>
	  <button type="button" id="loginBtn" class="btn btn-primary">로그인</button>
	  <button type="button" id="joinBtn" class="btn btn-success">회원가입</button>
	</form>
	
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
 
 	<script>
	 	$("#joinBtn").on("click", function() {
			location.href = "/join.go";
		})
	 	
 		$("#loginBtn").on("click", function() {
 			
 			// 입력란 널체크
 			if($("#id").val() == null || $("#id").val() == "") {
 				alert("아이디를 입력해주세요.");
 				return;
 			} else if($("#pwd").val() == null || $("#pwd").val() == "") {
 				alert("비밀번호를 입력해주세요.");
 				return;
 			}
 			
 			fn_login();
 		})
 		
 		function fn_login() {
 			var id = $("input[name=id]").val();
 			var pwd = $("input[name=pwd]").val();
 			
 			$.ajax({
 				type: "POST",
 				url: "/login.do",
 				data: {
 					"id" : id,
 					"pwd": pwd
 				},
 				dataType: "text",
 				success: function (data) {
 					if(data == "NONMEMBER") {
 						alert("회원이 아닙니다.");
 					}
 					if(data == "LOGIN_FAILED") {
 						alert("아이디 또는 패스워드를 확인해주세요.");
 					}
 					if(data == "LOGIN_SUCCESS") {
 						//alert("로그인 성공");
 						location.href = "/list.do";
 					}
 		
 				},
 				error: function () {
 					alert("죄송합니다. 다시 시도해주세요.");
 				}
 			}); // $.ajax()
 			
 		}
 	
 	</script>
 
</body>
</html>
