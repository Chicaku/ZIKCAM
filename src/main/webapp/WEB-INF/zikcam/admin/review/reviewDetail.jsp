<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<style type="text/css">
.gdsDes img { max-width:600px; max-height:500px; width:auto; height:auto; }
</style>
</head>
<body>
	<main>
		<section class="py-5">
			<div class="container px-4 px-lg-5 mt-5">
				<h4>${map.REVIEW_TITLE }<br />
				</h4>
				${map.MEMBER_ID } | ${map.REVIEW_DATE } |
				<c:forEach var="like" begin="1" end="5">
					<c:choose>
						<c:when test="${map.REVIEW_LIKE >= like }">
															★
														</c:when>
						<c:otherwise>
															☆
														</c:otherwise>
					</c:choose>
				</c:forEach>

				<hr />
				<div style="text-align: center">
					<img src="dsdasdsadsa.jog" width="40%" height="40%">
					<div class="gdsDes">${map.REVIEW_CONTENT }</div>
				</div>
				<br>

				<hr />

				<!-- 						하단 버튼 -->
				<table align="right">
					<tr>
						<td><a href="../admin/reviewList"><button
									class="btn"
									style="outline: 0; border: 0; border-radius: 6px; width: 100px; background-color: black; color: white;"
									value="update">목록으로</button></a>&nbsp;&nbsp;&nbsp;
					</tr>
				</table>

			</div>
		</section>
	</main>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
</body>
</html>
