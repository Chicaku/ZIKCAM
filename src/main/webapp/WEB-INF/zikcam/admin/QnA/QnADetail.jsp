<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
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
				<h3>문의 상세</h3>
				<br/> <br/> <hr />
				<div style="width: 90%; overflow:auto;">
					<!--  회원 문의 영역 -->
					<table style="width:100%;">
						<tr style="border-bottom:0.1em gray solid;">
							<td>제목: ${map.QNA_TITLE }
							</td>
						</tr>
						<tr style="border-bottom:0.1em gray solid;">
							<td>작성자: ${map.MEMBER_ID } | 작성일: ${map.QNA_DATE }</td>
						</tr>
						<tr>
							<td>
							<div class="gdsDes">${map.QNA_CONTENT }</div>
							</td>
						</tr>
					</table>
					 <br>
					<br /> <br />
					<hr />
				</div>
				<!-- 관리자 답변 영역 -->
				<c:choose>
				<c:when test="${not empty sub.QNA_NUM }">
					<div style="width: 90%; overflow:auto;">
					
						<!-- 관리자 답변 내용 -->
						<br> 
						<table style="width:100%;">
							<tr style="border-bottom:0.1em gray solid;">
								<td>제목: ${sub.QNA_TITLE }
							</tr>
							<tr style="border-bottom:0.1em gray solid;">
								<td>작성자: ${sub.MEMBER_ID } | 작성일: ${sub.QNA_DATE }
								</td>
							</tr>
							<tr>
								<td>
								<div class="gdsDes">${sub.QNA_CONTENT }</div>
								</td>
							</tr>
						</table>
						<hr />
					</div>
				</c:when>
				
				<c:when test="${empty sub.QNA_NUM }">
					<form style="width:90%;" id="replyForm">
						<br/> <br/> <br/>
						<h4>답변하기</h4>
						<hr/>
						제목<input type="text" id="TITLE" name="TITLE" value="답변입니다."/>
						<br/> <br/> <hr/>
						내용
						<br/>
						<textarea style=" width:100%;" id="CONTENT" name="CONTENT" rows="20" cols="100" title="내용"></textarea>
						<input type="hidden" id="PNUM" name="PNUM" value="${map.QNA_NUM }">
						<input type="hidden" id="ID" name="ID" value="kth1436"/> <!-- 로그인 로직이 만들어지고 수정할 것 -->
						<br/><br/><hr/>
					</form>
				</c:when>
				</c:choose>
				
				<!-- 하단 버튼 영역 -->
				<table align="right">
					<tr>
						<td>
							<button
								style="outline: 0; border: 0; border-radius: 6px; width: 100px; background-color: black; color: white;"
								class="btn" value="list" id="list"
								onclick="location.href = '#this'">문의내역</button>&nbsp;&nbsp;&nbsp;
							<c:if test="${empty sub.QNA_PNUM }">
								<button
									style="outline: 0; border: 0; border-radius: 6px; width: 100px; background-color: black; color: white;"
									class="btn" value="reply" id="reply"
									onclick="location.href = '#this'">답변쓰기</button>&nbsp;&nbsp;&nbsp;</c:if>
						</td>
					</tr>
				</table>
				<br/> <br/> <br/>
			</div>
		</section>
	</main>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#list").on("click", function(e) {
				e.preventDefault();
				fn_openQnAList();
			});
		});
		
		$(document).ready(function() {
			$("#reply").on("click", function(e) {
				e.preventDefault();
				fn_replyQnA();
			});
		});
		
		var ckeditor_config = {
				   resize_enaleb : false,
				   enterMode : CKEDITOR.ENTER_BR,
				   shiftEnterMode : CKEDITOR.ENTER_P,
				   filebrowserUploadUrl : "${pageContext.request.contextPath}/admin/goods/ckUpload"
				 }; 
				 
				 CKEDITOR.replace("CONTENT", ckeditor_config);

		function fn_openQnAList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/QnAList' />");
			comSubmit.submit();
		}
		
		function fn_replyQnA(){
			var comSubmit = new ComSubmit("replyForm");
			comSubmit.setUrl("<c:url value='/admin/QnAReply' />");
			comSubmit.submit();
		}
	</script>
</body>
</html>
