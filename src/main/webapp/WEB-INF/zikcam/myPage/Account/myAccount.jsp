<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />

</head>
<body>

	<!-- Content -->

	<main>
		<section class="py-5">
			<div class="container px-4 px-lg-5 mt-5">
				<h2>ȸ������</h2>
				<br /> <br /> <br />
				<hr />

				<div>
					<div align="center">

						<table style="width: 90%;">
							<tr>
								<td>�⺻����</td>
								<td><div align="right">
										���� ���
										<button>�ǹ�</button>
									</div></td>
							</tr>
							<tr bgcolor="#212926"
								style="color: white; border-collapse: collapse; outline: 0; border: 0;">
								<td style="width: 30%">����</td>
								<td style="width: 70%">��</td>
							</tr>
							<c:forEach items="${list }" var="row">
								<tr>
									<td>���̵�</td>
									<td>${row.MEMBER_ID }
										<c:set var="MEMBER_ID" value="${row.MEMBER_ID }" />
									</td>
								</tr>
								<tr>
									<td>��й�ȣ</td>
									<td><c:forEach var="password" begin="1"
											end="${fn:length(row.MEMBER_PW) }">
											*
											</c:forEach></td>

								</tr>
								<tr>
									<td>�̸���</td>
									<td>${row.MEMBER_EMAIL }</td>

								</tr>
								<tr>
									<td>�̸�</td>
									<td>${row.MEMBER_NAME }</td>

								</tr>
								<tr>
									<td>�ֹι�ȣ</td>
									<td>${fn:substring(row.MEMBER_JUMIN,0,8) }<c:forEach
											var="jumin" begin="1" end="6">
											*
											</c:forEach>

									</td>
								</tr>
								<tr>
									<td>�ּ�</td>
									<td>${row.MEMBER_ZONCODE }
										<button
											style="outline: 0; border: 0; border-radius: 6px; width: 30%; background-color: black; color: white;"
											value="findzipcode">���� ��ȣ</button>
									</td>
								</tr>
								<tr>
									<td></td>
									<td>${row.MEMBER_ADDRESS1 }</td>
								</tr>
								<tr>
									<td></td>
									<td>${row.MEMBER_ADDRESS2 }</td>
								</tr>
								<tr>
									<td>�ڵ��� ��ȣ</td>
									<td>${row.MEMBER_PHONE1 }</td>
								</tr>
								<tr>
									<td>�� ��ȣ</td>
									<td>${row.MEMBER_PHONE2 }</td>
								</tr>
							</c:forEach>
						</table>
						<br /> <br />
						<hr />
						<div align="right">
							<button
								style="outline: 0; border: 0; border-radius: 6px; width: 160px; height: 40px; background-color: black; color: white;"
								value="updatemem">ȸ��Ż��</button>
							<a href="../myPage/myAccountPwCheck?MEMBER_ID=${MEMBER_ID }">
							<input type="hidden" name="MEMBER_ID" value="${MEMBER_ID }">
							<button
									style="outline: 0; border: 0; border-radius: 6px; width: 160px; height: 40px; background-color: black; color: white;"
									value="updatemem">ȸ������ ����</button></a>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>

</body>
</html>


