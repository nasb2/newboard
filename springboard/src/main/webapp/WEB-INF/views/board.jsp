<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="isLogined" value="${not empty sessionScope.id}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/common.css">

<title>Insert title here</title>
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
	<div class="page-title">게시글보기</div>
		<form>
			<div class="form-group">
				<label for="formGroupExampleInput">글번호</label>
				<input type="text" class="form-control" id="formGroupExampleInput" name="bno" value="${boardDto.bno}" readonly/>	
			</div>
			
			<div class="form-group">
				<label for="formGroupExampleInput">제목</label>
				<input type="text" class="form-control" id="formGroupExampleInput2" name="title" value="${boardDto.title}" readonly/>
			</div>
			
			<div class="form-group">
				<label for="formGroupExampleInput">작성자</label>
				<c:if test="${mode eq 'read'}">
					<input type="text" class="form-control" id="formGroupExampleInput3" name="writer" value="${boardDto.writer}" readonly/>
				</c:if>
				<c:if test="${mode eq 'write'}">
					<input type="text" class="form-control" id="formGroupExampleInput3" name="writer" value="${sessionScope.id}" readonly/>
				</c:if>
			</div>
			
			<div class="form-group">
				<label for="formGroupExampleInput">내용</label>
				<textarea class="form-control" id="formGroupExampleInput4" name="content" rows="10" cols="95" readonly>${boardDto.content}</textarea><br>
			</div>
					
			<button type="button" class="btn btn-primary" id="regBtn">등록</button>
			<button type="button" class="btn btn-warning" id="updateBtn">수정</button>
			<button type="button" class="btn btn-danger" id="delBtn">삭제</button>
			<button type="button" class="btn btn-success" id="listBtn">목록</button>
		
		</form>
	
	<script>
	$(document).ready(function () {
		
		if(${mode == 'read'}) {
			changeModeRead();
		} else {
			changeModeWrite();
		}
	});
	
		// 게시글 등록 버튼
		$("#regBtn").on("click", function() {
		
			// 입력란 널체크
			if($("input[name=title]").val() == null || $("input[name=title]").val() == "") {
				alert("제목을 입력해주세요.");
				return;
			} else if($("textarea[name=comment]").val() == "") {
				alert("내용을 입력해주세요.");
				return;
			}
			
			fn_register();
		})
		
		// 게시글 삭제 버튼
		$("#delBtn").on("click", function() {
			if(${sessionScope.id ne boardDto.writer}) {
    			alert("본인이 작성한 글이 아닙니다.");
    			return;
    		}
			
			fn_delete();
		})
		
		// 게시글 수정 버튼
		$("#updateBtn").on("click", function() {
			
			if(${sessionScope.id ne boardDto.writer}) {
    			alert("본인이 작성한 글이 아닙니다.");
    			return;
			}
			
			if(${sessionScope.id eq boardDto.writer}) {
				$("#updateBtn").attr("id", "updateBtn2").html("수정완료");
				$("#formGroupExampleInput2").attr("readonly", false);
    			$("#formGroupExampleInput4").attr("readonly", false);
    			
    			$("#updateBtn2").on("click", function() {
    				$("#updateBtn2").attr("id", "updateBtn").html("수정");
    				
    				fn_update();

    			});
			}
		})
		
		
		// 목록 버튼
		$("#listBtn").on("click", function() {
			location.href = "/list.do";
		})
		
		
		function fn_update() {
			var bno = $("input[name=bno]").val();
			var title = $("input[name=title]").val();
			var writer = $("input[name=writer]").val();
			var content = $("textarea[name=content]").val();
			
			$.ajax({
                type: "POST",
                url: "/update.do",
                headers: {"content-type": "application/json"},
                data: JSON.stringify({
                	"bno" : bno,
                	"title"  : title, 
                	"writer" : writer, 
                	"content": content
                	}),
                dataType: "json",
                success: function (data) {
                	if(data.result == 'success') {
                		alert("수정 완료되었습니다.");
                	}
                },
                error: function () {
                    alert("죄송합니다. 게시글 수정에 실패했습니다. 다시 확인해주세요.");
                }
            }); // $.ajax()
		}
		
		function fn_register() {
			var title = $("input[name=title]").val();
			var writer = $("input[name=writer]").val();
			var content = $("textarea[name=content]").val();
			
			$.ajax({
                type: "POST",
                url: "/write.do",
                data: {
                	"title"  : title, 
                	"writer" : writer, 
                	"content": content
                	},
                dataType: "json",
                success: function (data) {
                	if(data.result == 'success') {
                		location.href = "/list.do";
                	}
                },
                error: function () {
                    alert("죄송합니다. 게시글 등록에 실패했습니다. 다시 확인해주세요.");
                }
            }); // $.ajax()
		}
		
		function fn_delete() {
			var bno = $("input[name=bno]").val();
			var writer = $("input[name=writer]").val();
			
			$.ajax({
                type: "POST",
                url: "/delete.do",
                data: { 
                	"bno"   : bno,
                	"writer": writer
                	},
                dataType: "text",
                success: function (result) {
                	confirm("삭제하시겠습니까?");
                	if(result == 'success') {
                		location.href='/list.do';
                	}
                },
                error: function () {
                    alert("죄송합니다. 게시글 삭제에 실패했습니다. 다시 확인해주세요.");
                }
            }); // $.ajax()
			
		}
		
		function changeModeWrite() {
	    	$(".page-title").html("게시물 쓰기");
	    	$("#formGroupExampleInput1").attr("readonly", false);
	    	$("#formGroupExampleInput2").attr("readonly", false);
			$("#formGroupExampleInput4").attr("readonly", false);
	        
	        $("#formGroupExampleInput1").val("");
	        $("#formGroupExampleInput4").val("");
	        
	        $("#regBtn").attr("hidden", false);
	        $("#updateBtn").attr("hidden", true);
	        $("#delBtn").attr("hidden", true);
	    }
		
		function changeModeRead() {
			$(".page-title").html("게시물 보기");
			$("#formGroupExampleInput1").attr("readonly", true);
	    	$("#formGroupExampleInput2").attr("readonly", true);
			$("#formGroupExampleInput4").attr("readonly", true);
	        
	        $("#regBtn").attr("hidden", true);
	        $("#updateBtn").attr("hidden", false);
	        $("#delBtn").attr("hidden", false);
		}
		
	</script>


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
 
</body>
</html>