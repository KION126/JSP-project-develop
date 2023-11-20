<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="comment" items="${commentInfoList}">
		<div class="row comment">
			<div class="col-1">
				<img src="./image/icon/myPage.png" alt="myPage" style="height: 45px; margin: 0 10px;">
			</div>
			<div class="col-9" style="padding: 0">
				<h5 class="commentUserName-h5">${comment.userName }</h5>
				<h5 class="commentDate-h5">${comment.commentDate }</h5>
				<h5 class="commentContent-h5">${comment.commentContent }</h5>
			</div>
			<c:if test="${userID eq comment.userID}">
				<button class="comment-modify" onclick="commentModifyConfirm('${userID}', ${classID }, ${boardID }, ${currentPage }, ${comment.commentID }, '${comment.commentContent }')">수정</button>
				<button class="comment-delete" onclick="commentDelete('${userID}', ${classID }, ${boardID }, ${comment.commentID })">삭제</button>
			</c:if>
		</div>
	</c:forEach>
	<div class="pagination">
		<nav class="pagination-nav" aria-label="Page navigation example">
			<ul class="pagination">
				<%-- 이전 링크 --%>
				<li class="page-item ${currentPage < 2 ? 'disabled' : ''}"><a class="page-link" href="javascript:comment('${userID}',${classID },${boardID },${currentPage - 1 })">이전</a></li> <%-- 페이지 번호 링크 --%>
				<c:forEach var="i" begin="1" end="${totalPages}">
					<li class="page-item ${i == currentPage ? 'active' : ''}"><a class="page-link" href="javascript:comment('${userID}',${classID },${boardID },${i })">${i }</a></li>
				</c:forEach>

				<%-- 다음 링크 --%>
				<li class="page-item ${currentPage > totalPages-1 ? 'disabled' : ''}"><a class="page-link" href="javascript:comment('${userID}',${classID },${boardID },${currentPage + 1 })">다음</a></li>
			</ul>
		</nav>
	</div>
	<script src="./js/commentModifyConfirm.js" /></script>
	<script src="./js/commentDelete.js" /></script>
	<script src="./js/comment.js" /></script>
</body>
</html>