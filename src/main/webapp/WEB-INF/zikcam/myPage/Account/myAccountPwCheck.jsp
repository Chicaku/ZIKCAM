<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<body>

	<main>
		<section class="py-5">
			<div class="container px-4 px-lg-5 mt-5">
				<h2>ȸ������ Ȯ��</h2>
				<br /> <br />
				<hr />
				<br> <br>
				<div>
					<div align="center">

						<table align="center" style="width: 50%;">
							<tr>
								<td>���̵�</td>
								<td><c:out value="${map.MEMBER_ID }" /></td>
							</tr>
							<tr>
								<td>�н�����</td>
								<td><input type="password" width="100px" style="width: 80%"></td>
							</tr>
						</table>
						<br /> <br />
						<hr />
						<div align="center">
							<a href="../myPage/myAccountModifyForm"><button
									style="outline: 0; border: 0; border-radius: 6px; width: 160px; height: 40px; background-color: black; color: white;"
									value="updatemem" onclick="fsubmit();">Ȯ��</button></a>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
	
	$(document).ready(function() {
         var pw = $("#password")[0].value;
         if(pw==null || pw==''){
            alert("��� ��ȣ�� �ٸ��ϴ� �ٽ� �õ����ּ���.);
            return false;
         }
         myform.submit();
	}
	</script>
</body>
</html>