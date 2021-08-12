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
	<main>

		<section class="py-5">
			<div class="container px-4 px-lg-5 mt-5">
				<c:forEach items="${list }" var="list">
					<h4>
						${list.TITLE }<br />
					</h4>
						${list.MEMBER_ID } | ${list.CDATE }

						<hr />
					<!-- 						�̹��� ���� -->
					<div style="text-align: center">
						<img src="dsdasdsadsa.jog" width="40%" height="40%">
					</div>
					<!-- 						���� ���� -->
					<br> ${list.CONTENT }
						<hr />
					<br />
					<br />
					<hr />
				</c:forEach>
				<!-- 						�ϴ� ��ư ���� -->
				<table align="right">
					<tr>
						<td><c:choose>
								<c:when test="${empty map.QNA_NUM }">
									<a href="../myPage/myPQModifyForm?PQ_NUM=${map.PQ_NUM }"><button
											style="outline: 0; border: 0; border-radius: 6px; width: 100px; background-color: black; color: white;"
											value="update">���� / ����</button> 
											<input type="hidden" name="MEMBER_ID" id="MEMBER_ID" value="${map.MEMBER_ID }">
											</a>&nbsp;&nbsp;&nbsp;
								</c:when>
								<c:otherwise>
									<a href="../myPage/myQNAModifyForm?QNA_NUM=${map.QNA_NUM }"><button
											style="outline: 0; border: 0; border-radius: 6px; width: 100px; background-color: black; color: white;"
											value="update">���� / ����</button>
											<input type="hidden" name="MEMBER_ID" id="MEMBER_ID" value="${map.MEMBER_ID }">
											</a>
								</c:otherwise>
							</c:choose> <a href="../myPage/myPQList"><button
									style="outline: 0; border: 0; border-radius: 6px; width: 100px; background-color: black; color: white;"
									value="update">�� ����</button></a>&nbsp;&nbsp;&nbsp;
							<button
								style="outline: 0; border: 0; border-radius: 6px; width: 100px; background-color: black; color: white;"
								value="update">��ǰ������</button></td>
					</tr>
				</table>

			</div>
		</section>
	</main>
</body>
</html>
