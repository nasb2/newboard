<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="isLogined" value="${not empty sessionScope.id}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/common.css">
<style>
	.buttons {
		float: right;
	}
</style>

<title>게시판 메인화면</title>
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
	    <a class="nav-link" href="/join.go">회원가입</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="/login.go">${isLogined? '로그아웃' : '로그인'}</a>
	  </li>
	</ul>
</nav>

<body class="container">
	<div class="page-title">기본 게시판</div>
		<table class="table">
			<tr>
				<th id="bno" name="bno">번호</th>
				<th id="title" name="title">제목</th>
				<th id="content" name="content">내용</th>
				<th id="writer" name="writer">작성자</th>
				<th id="regDate" name="regDate">등록일</th>
			</tr>
			<c:forEach var="boardDto" items="${list}">
			<tr>
				<td name="bno"><c:out value="${boardDto.bno}"/></td>
				<td name="title">
					<a href="<c:url value='/read.do?bno=${boardDto.bno}&page=${ph.page}&pageSize=${ph.pageSize}'/>">
	                	<c:out value="${boardDto.title}"/> 
	                </a>
				</td>
				<td name="content"><c:out value="${boardDto.content}"/></td>
				<td name="writer"><c:out value="${boardDto.writer}"/></td>
				<td name="regDate"><fmt:formatDate value="${boardDto.regDate}" pattern="yyyy. MM. dd HH:mm"/></td>
			</tr>
			</c:forEach>
		</table>
		
	<div class="buttons">
   		<button type="button" class="btn btn-primary" id="listBtn">전체 글보기</button>
   		<button type="button" class="btn btn-primary" id="writeBtn">글쓰기</button>
    </div>
		
		
	<nav aria-label="Page navigation example">
  		<ul class="pagination justify-content-center">
  			<c:if test="${ph.showPrev}">
		    	<li class="page-item"><a class="page-link" href="<c:url value='/list.do?page=${ph.beginPage-1}&pageSize=${ph.pageSize}'/>">Previous</a></li>
		    </c:if>
		    <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
			    <li class="page-item"><a class="page-link" href="<c:url value='/list.do?page=${i}&pageSize=${ph.pageSize}'/>">${i}</a></li>
		    </c:forEach>
		    <c:if test="${ph.showNext}">
		    	<li class="page-item"><a class="page-link" href="<c:url value='/list.do?page=${ph.endPage+1}&pageSize=${ph.pageSize}'/>">Next</a></li>
  			</c:if>
  		</ul>
	</nav>
	
	<%-- <!-- 파라미터 TEST -->
	<form id="frm" action="test.do" method="get">
		<input type="text" name="test" value="test"/>
		<input type="text" name="test" value="${ph.endPage}"/>
		<button type="button" id="testBtn">클릭</button>
	</form> --%>
    
    <script>
    	$(document).ready(function() {
    		
    		$("#listBtn").click(function () {
                location.href = '<c:url value="/list.do"/>';
            });
    		
    		$("#writeBtn").click(function () {
    			if(${cookie.id.value eq null}) {
        			alert("로그인 해주세요.");
        			location.href = "/login.go";
        			return;
        		}
    			
                location.href = '<c:url value="/write.go"/>';
            });
    		
    		$("#testBtn").click(function () {
                frm.submit();
            });
    		
    	})
    </script>
    
    
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
 
</body>
</html>