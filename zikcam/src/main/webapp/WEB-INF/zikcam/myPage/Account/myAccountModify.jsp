<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
</head>
<body>
	<%@ include file="/WEB-INF/include/include-header.jspf"%>
			<main>
				<section class="py-5">
					<div class="container px-4 px-lg-5 mt-5">
						<h2>ȸ������</h2>
						<br/>
						<br/>
						<br/>
						<hr/>
						
						<div>
							<div align="center">
							<form id="frm">
								<input type="hidden" id="MEMBER_NUM" name="MEMBER_NUM" value="${map.MEMBER_NUM }">
								<table style="width:90%;">
									<tr>
										<td>�⺻����</td>
										<td><div align ="right">���� ��� <button>�ǹ�</button></div></td>
									</tr>
									<tr bgcolor="#212926" style="color:white; border-collapse:collapse; outline:0; border:0;">
										<td style="width:30%">����</td>
										<td style="width:70%">��</td>
									</tr>
									<tr>
										<td>���̵�</td>
										<td><input type="text" id="MEMBER_ID" name="MEMBER_ID" value="${map.MEMBER_ID }" style="width : 100%"></td>
									</tr>
									<tr>
										<td>��й�ȣ</td>
										<td>
										<input type="password" id="MEMBER_PW" name="MEMBER_PW" value="${map.MEMBER_PW }" style="width : 100%"></td>
										</td>
									</tr>
									<tr>
										<td>�̸���</td>
										<td>
										<input type="text" id="MEMBER_EMAIL" name="MEMBER_EMAIL" value="${map.MEMBER_EMAIL }" style="width : 100%" >
										</td>
									</tr>
									<tr>
										<td>�̸�</td>
										<td>
										${map.MEMBER_NAME }
										</td>
									</tr>
									<tr>
										<td>�ֹι�ȣ</td>
										<td>
										${fn:substring(map.MEMBER_JUMIN,0,8) }
										<c:forEach
											var="jumin" begin="1" end="6">
											*
											</c:forEach>
										</td>
									</tr>
									<tr>
										<td>�ּ�</td>
										<td>
										<input type="text" id="MEMBER_ZONCODE" name="MEMBER_ZONCODE" value="${map.MEMBER_ZONCODE }" style="width : 40%;">
											<button 
										style="outline:0; border:0;  border-radius: 6px; width: 30%; background-color:black; color:white;" 
										value="findzipcode">�ּ� �˻�</button>
										</td>
									</tr>
									<tr>
										<td></td>
										<td>
										<input type="text" id="MEMBER_ADDRESS1" name="MEMBER_ADDRESS1" value="${map.MEMBER_ADDRESS1 }" style="width : 100%" >
										</td>
									</tr>
									<tr>
										<td></td>
										<td>
										<input type="text" id="MEMBER_ADDRESS2" name="MEMBER_ADDRESS2" value="${map.MEMBER_ADDRESS2 }" style="width : 100%">
										</td>
									</tr>
									<tr>
										<td>�ڵ��� ��ȣ</td>
										<td><input type="text" id="MEMBER_PHONE1" name="MEMBER_PHONE1" value="${map.MEMBER_PHONE1 }" style="width : 100%"></td>
									</tr>
									<tr>
										<td>�� ��ȣ</td>
										<td><input type="text" id="MEMBER_PHONE2" name="MEMBER_PHONE2" value="${map.MEMBER_PHONE2 } " style="width : 100%"></td>
									</tr>
								</table>
							</form>
								<br/>
								<br/>
								<hr/>
								<div align="right">
								<a href="#this" id="modify"><button 
										style="outline:0; border:0;  border-radius: 6px; width: 160px; height:40px; background-color:black; color:white;" 
										value="updatemem">���� �Ϸ�</button></a>
								</div>
							</div>
						</div>
					</div>
				</section>
			</main>
			
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#modify").on("click", function(e) { //������� ��ư 
				e.preventDefault();
				fn_updateAccount();
			});
		});
		function fn_updateAccount() {
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='../myPage/myAccountModify' />");
			comSubmit.submit();
		}
	</script>
</body>
</html>