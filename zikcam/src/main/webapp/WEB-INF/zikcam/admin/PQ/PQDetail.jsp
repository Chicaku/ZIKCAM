<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<style type="text/css">
.gdsDes img { max-width:600px; max-height:500px; width:auto; height:auto; }
</style>
<body>
	<main>
		<section class="py-5">
			<div style="width:90%;"class="container px-4 px-lg-5 mt-5">
				<h3>���� ��</h3>
				<br/> <br/> 
				<p style="color:#f82d24;">*��� ���Ǵ� ������ ���� 48�ð��� ������ ���� �亯�� �Ǿ���մϴ�.</p>
				<font color="gray">
					���Ǹ� ���Ƿ� ������ ��� �������� �߻��� �� �ֽ��ϴ�. ���� ��û�� ���� ���� ��� ������ �����Ͻʽÿ�.
				</font>
				<hr />
				<div style="overflow: auto;">
					<!--  ȸ�� ���� ���� -->
					<table style="width: 100%;">
						<tr>
							<td colspan="1" align="center" style="background-color: #E6E6E6;">����</td>
							<td colspan="3">${map.PQ_TITLE }</td>
						</tr>
						<tr>
							<td align="center" style="background-color: #E6E6E6;">�ۼ���</td>
							<td>${map.MEMBER_ID }</td>
							<td align="center" style="background-color: #E6E6E6;">�ۼ���</td>
							<td>${map.PQ_DATE }</td>
						</tr>
						<tr>
							<td colspan="4" align="center" style="background-color: #E6E6E6;">����</td>
						</tr>
						<tr style="min-height: 100px;">
							<td colspan="4">
								<div class="gdsDes">${map.PQ_CONTENT }</div>
							</td>
						</tr>
					</table>
						<input type="hidden" id="NUM" name="NUM" value="${map.PQ_NUM }">
						<input type="hidden" id="PNUM" name="PNUM" value="${map.PQ_NUM }">
						<c:if test="${empty sub.PQ_NUM }">
							<input type="hidden" id="SNUM" name="SNUM" value="0">
						</c:if>
					<br> <br /> <br />
					<hr />
				</div>
				<!-- ������ �亯 ���� -->
						<div style="overflow: auto;">
				<c:choose>
					<c:when test="${not empty sub.PQ_NUM }">

							<!-- ������ �亯 ���� -->
							<br>
							<table>
								<tr>
									<td colspan="1" align="center"
										style="background-color: #E6E6E6;">����</td>
									<td colspan="3">${sub.PQ_TITLE }</td>
								</tr>
								<tr>
									<td align="center" style="background-color: #E6E6E6;">�ۼ���</td>
									<td>${sub.MEMBER_ID }</td>
									<td align="center" style="background-color: #E6E6E6;">�ۼ���</td>
									<td>${sub.PQ_DATE }</td>
								</tr>
								<tr>
									<td colspan="4" align="center"
										style="background-color: #E6E6E6;">����</td>
								</tr>
								<tr style="min-height: 100px;">
									<td colspan="4">
										<div class="gdsDes">${sub.PQ_CONTENT }</div>
									</td>
								</tr>
							</table>
							<hr />
					</c:when>

					<c:when test="${empty sub.PQ_NUM && map.PQ_DEL == 0}">
						<form id="replyForm">
							<br /> <br /> <br />
							<h4>�亯�ϱ�</h4>
							<hr />
							<table>
								<tr>
									<td colspan="1" align="center"
										style="background-color: #E6E6E6;">����</td>
									<td colspan="3"><input style="width: 100%;" type="text"
										id="TITLE" name="TITLE" value="�亯�Դϴ�." /></td>
								</tr>
								<tr>
									<td colspan="4" align="center"
										style="background-color: #E6E6E6;">����</td>
								</tr>
								<tr style="min-height: 100px;">
									<td colspan="4"><textarea style="width: 100%;"
											id="CONTENT" name="CONTENT" rows="20" cols="100" title="����"></textarea>
									</td>
								</tr>
							</table>
							<input type="hidden" id="INUM" name="INUM" value="${map.PROD_NUM }">
							<input type="hidden" id="PNUM" name="PNUM" value="${map.PQ_NUM }">
							<input type="hidden" id="ID" name="ID" value="${session_MEM_ID }" />
							<br />
							<br />
							<hr />
						</form>
					</c:when>
				</c:choose>
						</div>

				<!-- �ϴ� ��ư ���� -->
				<table align="right">
					<tr>
						<td>
							<button
								class="btn btn-outline-dark" value="list" id="list"
								onclick="location.href = '#this'">���ǳ���</button>&nbsp;&nbsp;&nbsp;
							<c:if test="${empty sub.PQ_PNUM && map.PQ_DEL != 1}">
								<button
									class="btn btn-outline-light" value="reply" id="reply"
									onclick="location.href = '#this'">�亯����</button>&nbsp;&nbsp;&nbsp;</c:if>
							<c:if test="${not empty sub.PQ_PNUM && map.PQ_DEL != 1}">
								<button
									class="btn btn-outline-light" value="modify" id="modify"
									onclick="location.href = '#this'">�亯����</button>&nbsp;&nbsp;&nbsp;</c:if>
							<c:if test="${map.PQ_DEL == 0}">		
								<button
									class="btn btn-outline-alert" value="delete" id="delete"
									onclick="location.href = '#this'">���ǻ���</button>&nbsp;&nbsp;&nbsp;</c:if>
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
				fn_openPQList();
			});
		});
		
		$(document).ready(function() {
			$("#reply").on("click", function(e) {
				e.preventDefault();
				fn_validation();
			});
		});
		
		$(document).ready(function() {
			$("#modify").on("click", function(e) {
				e.preventDefault();
				fn_openModifyFrom();
			});
		});
		
		$(document).ready(function() {
			$("#delete").on("click", function(e) {
				e.preventDefault();
				fn_PQAlert();
			});
		});

		 var ckeditor_config = {
				   resize_enaleb : false,
				   enterMode : CKEDITOR.ENTER_BR,
				   shiftEnterMode : CKEDITOR.ENTER_P,
				   filebrowserUploadUrl : "${pageContext.request.contextPath}/admin/goods/ckUpload"
				 }; 
				 
				 CKEDITOR.replace("CONTENT", ckeditor_config);
		
		function fn_openPQList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/PQList' />");
			comSubmit.submit();
		}
		
		function fn_replyPQ(){
			var comSubmit = new ComSubmit("replyForm");
			comSubmit.setUrl("<c:url value='/admin/PQReply' />");
			comSubmit.submit();
		}
		
		function fn_deletePQ(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/PQDelete' />");
			if($("#PNUM").val()){
				comSubmit.addParam("SNUM", $("#SNUM").val());
			}else if(!$("#PNUM").val){
				comSubmit.addParam("SNUM", 0);					
				//���������� �۹�ȣ�� ���� 0�� �ƴ� ��츦 �Ǵ��ؼ� �۵��ϹǷ� DB�� ������ ���۰��� 1�̾���ϰ� �۹�ȣ 0���� �������� �ʾƾ���
				//������ �����ϸ� �۹�ȣ�� 0�� ���� �����ϸ� �Ķ���Ͱ��� �޾ƿ��� ���ϹǷ� ������ �߸� �������� ����
			}
			comSubmit.addParam("NUM", $("#NUM").val());
			comSubmit.submit();
		}
		
		function fn_openModifyFrom(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/PQModifyForm' />");
			comSubmit.addParam("NUM", $("#SNUM").val());
			comSubmit.submit();
		}
		
		
		function fn_validation(table) { 	   	   
			if(CKEDITOR.instances.CONTENT.getData() == '' 
					|| CKEDITOR.instances.CONTENT.getData().length == 0){
			alert("������ �Է����ּ���.");
			 $("#CONTENT").focus();
				  return false;
				}else if(!$("#TITLE").val()){
					alert("������ �Է����ּ���.");
					 $("#TITLE").focus();
					return false;
				}else if($("#TITLE").val().length >= 33){
					alert("������ 30�� ���Ͽ��� �մϴ�.");
					$("#TITLE").focus();
					return false;
				}else if($("#CONTENT").val().length >= 1200){
					alert("������ 1200�� ���Ͽ��� �մϴ�.");
					$("#CONTENT").focus();
					return false;
				}else
					fn_replyPQ();
			}
		
		function fn_PQAlert(){
			if(!confirm("���ǰ� ����ó�� �˴ϴ�. ����Ͻðڽ��ϱ�?")){
				alert("������ ��ҵǾ����ϴ�.");
				return false;
			}else{
				alert("���ǰ� �����Ǿ����ϴ�.");
				fn_deletePQ();
			}
		}
	</script>
</body>
</html>
