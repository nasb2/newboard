<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="isLogined" value="${not empty sessionScope.id}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/common.css">

<title>회원가입하기</title>
</head>
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
<div class="page-title">회원가입</div>
	<form id="frm">
		<div class="form-group">
		<label for="exampleInputId">아이디</label>
			<input type="text" id="id" name="id" class="form-control" placeholder="아이디를 입력해주세요.">
		</div>
		<div class="form-group">
		<label for="exampleInputPwd">비밀번호</label>
			<input type="text" id="pwd" name="pwd" class="form-control" placeholder="비밀번호를 입력해주세요.">
		</div>
		<div class="form-group">
		<label for="exampleInputName">이름</label>
			<input type="text" id="name" name="name" class="form-control" placeholder="이름을 입력해주세요.">
  		</div><br>
		<button type="button" id="joinBtn" class="btn btn-primary">회원가입</button>
		<button type="button" id="homeBtn" class="btn btn-success">홈으로</button>
	</form>
	
<script>

	// 회원가입 버튼
	$("#joinBtn").on("click", function() {
		// 입력란 널체크
		if($("#id").val() == null || $("#id").val() == "") {
			alert("아이디를 입력해주세요.");
			return;
		} else if($("#pwd").val() == null || $("#pwd").val() == "") {
			alert("비밀번호를 입력해주세요.");
			return;
		} else if($("#name").val() == null || $("#name").val() == "") {
			alert("이름을 입력해주세요.");
			return;
		}
		fn_submit();
	});
	
	// 홈으로 버튼
	$("#homeBtn").on("click", function() {
		location.href = "/";
	});
	
	
	function fn_submit() {
		var id = $("input[name=id]").val();
		var pwd = $("input[name=pwd]").val();
		var name = $("input[name=name]").val();
		
		$.ajax({
			type: "POST",
			url: "/join.do",
			/* headers: {"content-type": "application/json"}, // @RequestParam 일때 이거 넣으면 에러남 stringify도 뺄것 */
            data: {
            	"id"   : id,
            	"pwd"  : pwd, 
            	"name" : name, 
            	},
            dataType: "json",
            success: function (data) {
            	if(data.result == 'success') {
            		alert("성공");
            	}
            	
            	location.href = "/list.do";
            },
            error: function (data) {
                alert(data.result);
            }
        }); // $.ajax()
		
	}
</script>

<!-- <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
 -->    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<body>
</body>
</html>