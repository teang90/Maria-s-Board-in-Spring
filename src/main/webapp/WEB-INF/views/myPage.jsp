<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${member_id}님의 페이지</title>
<link href="${pageContext.request.contextPath}/resources/bootstraps/template/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet">

<!-- Bootstrap core JavaScript -->
<%-- <script src="${pageContext.request.contextPath}/resources/bootstraps/template/vendor/jquery/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/bootstraps/template/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> 
--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>

<style type="text/css">
body {
	background-color: 1f1f1f;
}

</style>
<script type="text/javascript">

	function withdraw() {
		if ('${member_id}' == 'visitior')  {
			alert("visitor아이디는 탈퇴가 불가능합니다.");
			return ;
		}
		
		var chck_confirm= confirm("정말 탈퇴하시겠습니까?");
		if (!chck_confirm) {
			return ;
		}
		location.href="withdraw.do?member_id=${member_id}";
	}

</script>
</head>
<body>
	<jsp:include page="include/navigation.jsp?member_id=${member_id}"/>
	 
	
	
	<h3 style="margin-top: 100px; margin-bottom:20px; text-align: center;"> ${member_id}님의 페이지</h3>
	<hr style="color: 050505">
	
	<div class="container">
	<b>[${member_id}] 님이 작성하신 게시글</b>
	<div style="height:300px ; overflow: auto;">
	<table class="table table-sm table-hover">
	<thead> 
		<tr>
			<th width="10%">No</th> 
			<th width="30%">제목</th> 
			<th width="30%">작성일</th> 
			<th width="15%">추천수</th> 
			<th width="15%">조회수</th> 
		</tr>
	</thead>
	<tbody>
		<c:if test="${!empty members_board}">
		<c:forEach var="k" items="${members_board}" varStatus="cnt" >
		<tr>
			<td>${cnt.count} </td>
			<td><a href="oneBoard.do?board_pk=${k.board_pk}&cPage=1"> ${k.board_title} </a></td>
			<td>${k.board_date.substring(0, 10)} </td>
			<td>${k.board_recommendation} </td>
			<td>${k.board_hit} </td>
		</tr>
		</c:forEach>
		</c:if>
		<c:if test="${empty members_board}">
			<tr>
				<td colspan="5" style="text-align: center;">작성하신 게시물이 없습니다.</td>			
			</tr>
		</c:if>
	</tbody>
	</table>
	</div>
	</div>
	<br style="margin-bottom: 100px;">
	
	
	
	<div class="container">
	<div> <b>[${member_id}]님이 작성하신 댓글</b> </div>
	<div style="height: 300px; overflow: auto;">
	<table class="table table-sm table-hover">
	<thead> 
		<tr>
			<th width="10%">No</th> 
			<th width="30%">작성내용</th> 
			<th width="40%">작성일</th> 
			<th width="20%">추천수</th> 
		</tr>
	</thead>
	<tbody>
		<c:if test="${!empty members_answer}">
		<c:forEach var="t" items="${members_answer}" varStatus="cnt" >
		<tr>
			<td>${cnt.count} </td>
			<td><a href="oneBoard.do?board_pk=${t.answer_bd_pk}&cPage=1"> ${t.answer_content} </a></td>
			<td>${t.answer_date} </td>
			<td>${t.answer_recommendation} </td>
		</tr>
		</c:forEach>
		</c:if>
		<c:if test="${empty members_answer}">
			<tr>
				<td colspan="3" style="text-align: center;">작성하신 답글이 없습니다.</td>			
			</tr>
		</c:if>
	</tbody>
	</table>
	</div>
	</div>
	<br>
		
	<p class="container">
	<button id="withdraw" onclick="javascript:withdraw()" 
		class="btn btn-primary" style="width: 1000px; text-align: center;"> 회원가입 탈퇴하기 </button></p>

	<jsp:include page="include/footer.jsp"/>
	<br>
</body>
</html>