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
			<div style="width: 90%;" class="container px-4 px-lg-5 mt-5">
				<h3>���� ��</h3>
				<br/> <br/> 
				<p style="color:#f82d24;">*��� ���Ǵ� ������ ���� 48�ð��� ������ ���� �亯�� �Ǿ���մϴ�.</p>
				<font color="gray">
					���Ǹ� ���Ƿ� ������ ��� �������� �߻��� �� �ֽ��ϴ�. ���� ��û�� ���� ���� ��� ������ �����Ͻʽÿ�.
				</font>
				<hr />
				<div align="center" style="overflow:auto;">
					<!--  ȸ�� ���� ���� -->
					<table style="width:100%;">
						<tr>
							<td colspan="1" align="center" style="background-color:#E6E6E6;">����</td>
							<td colspan="3">${map.QNA_TITLE }</td>
						</tr>
						<tr>
							<td align="center" style="background-color:#E6E6E6;">�ۼ���</td>
							<td>${map.MEMBER_ID }</td>
							<td align="center" style="background-color:#E6E6E6;">�ۼ���</td>
							<td>${map.QNA_DATE }</td>
						</tr>
						<tr>
							<td colspan="4" align="center" style="background-color:#E6E6E6;">����</td>
						</tr>
						<tr style="min-height:100px;">
							<td colspan="4">
								<div class="gdsDes">${map.QNA_CONTENT }</div>
							</td>
						</tr>
					</table>
						<input type="hidden" id="NUM" name="NUM" value="${map.QNA_NUM }">
						<input type="hidden" id="PNUM" name="PNUM" value="${map.QNA_NUM }">
						<c:if test="${empty sub.QNA_NUM }">
							<input type="hidden" id="SNUM" name="SNUM" value="0">
						</c:if>
					 <br>
					<br /> <br />
					<hr />
				</div>
				<!-- ������ �亯 ���� -->
				<c:choose>
				<c:when test="${not empty sub.QNA_NUM }">
					<div>
					
						<!-- ������ �亯 ���� -->
						<br> 
						<table style="width:100%; overflow:auto;">
						<tr>
							<td colspan="1" align="center" style="background-color:#E6E6E6;">����</td>
							<td colspan="3">${sub.QNA_TITLE }</td>
						</tr>
						<tr>
							<td align="center" style="background-color:#E6E6E6;">�ۼ���</td>
							<td>${sub.MEMBER_ID }</td>
							<td align="center" style="background-color:#E6E6E6;">�ۼ���</td>
							<td>${sub.QNA_DATE }</td>
						</tr>
						<tr>
							<td colspan="4" align="center" style="background-color:#E6E6E6;">����</td>
						</tr>
						<tr style="min-height:100px;">
							<td colspan="4">
								<div class="gdsDes">${sub.QNA_CONTENT }</div>
							</td>
						</tr>
					</table>
						<input type="hidden" id="SNUM" name="SNUM" value="${sub.QNA_NUM }">
						<hr />
					</div>
				</c:when>
				
				<c:when test="${empty sub.QNA_NUM && map.QNA_DEL == 0}">
					<form id="replyForm">
						<br/> <br/> <br/>
						<h4>�亯�ϱ�</h4>
						<hr/>
						<table>
							<tr>
								<td colspan="1" align="center" style="background-color:#E6E6E6;">����</td>
								<td colspan="3">
									<input style="width:100%;" type="text" id="TITLE" name="TITLE" value="�亯�Դϴ�."/>
								</td>
							</tr>
							<tr>
							<td colspan="4" align="center" style="background-color:#E6E6E6;">����</td>
						</tr>
						<tr style="min-height:100px;">
							<td colspan="4">
								<textarea style=" width:100%;" id="CONTENT" name="CONTENT" rows="20" cols="100" title="����"></textarea>
							</td>
						</tr>
						</table>
						<input type="hidden" id="ID" name="ID" value="${session_MEM_ID }"/> <!-- �α��� ������ ��������� ������ �� -->
						<input type="hidden" id="PNUM" name="PNUM" value="${map.QNA_NUM }">
						<br/><br/><hr/>
					</form>
				</c:when>
				</c:choose>
				<!-- �ϴ� ��ư ���� -->
				<table align="right">
					<tr>
						<td>
							<button
								class="btn btn-outline-dark" value="list" id="list"
								onclick="location.href = '#this'">���ǳ���</button>&nbsp;&nbsp;&nbsp;
							<c:if test="${empty sub.QNA_PNUM && map.QNA_DEL != 1}">
								<button
									class="btn btn-outline-light" value="reply" id="reply"
									onclick="location.href = '#this'">�亯����</button>&nbsp;&nbsp;&nbsp;</c:if>
							<c:if test="${not empty sub.QNA_PNUM && map.QNA_DEL != 1}">
								<button
									class="btn btn-outline-light" value="modify" id="modify"
									onclick="location.href = '#this'">�亯����</button>&nbsp;&nbsp;&nbsp;</c:if>
							<c:if test="${map.QNA_DEL == 0}">		
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
				fn_openQnAList();
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
				fn_QnAAlert();
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
		
		function fn_deleteQnA(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/QnADelete' />");
			if($("#PNUM").val()){
				comSubmit.addParam("SNUM", $("#SNUM").val());
			}else if(!$("#PNUM").val){
				comSubmit.addParam("SNUM", 0); 
				//���������� �۹�ȣ�� ���� 0�� �ƴ� ��츦 �Ǵ��ؼ� �۵��ϹǷ� ������ ���۰��� 1�̾���ϰ� DB�� �۹�ȣ 0���� �������� �ʾƾ���
				//������ �����ϸ� �۹�ȣ�� 0�� ���� �����ϸ� �Ķ���Ͱ��� �޾ƿ��� ���ϹǷ� ������ �߸� �������� ����
			}
			comSubmit.addParam("NUM", $("#NUM").val());
			comSubmit.submit();
		}
		
		function fn_openModifyFrom(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/QnAModifyForm' />");
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
					fn_replyQnA();
			}
		
		function fn_QnAAlert(){
			if(!confirm("���ǰ� ����ó�� �˴ϴ�. ����Ͻðڽ��ϱ�?")){
				alert("������ ��ҵǾ����ϴ�.");
				return false;
			}else{
				alert("���ǰ� �����Ǿ����ϴ�.");
				fn_deleteQnA();
			}
		}
		
	</script>
</body>
</html>
