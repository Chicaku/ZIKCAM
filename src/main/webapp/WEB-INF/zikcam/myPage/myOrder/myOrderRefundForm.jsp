<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
</head>
<body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container px-4 px-lg-5">
			<img src="/first/resources/images/zikcam_black.png" alt="ZikCam_Logo" width="130"
				height="30">
		</div>
	</nav>
	
	<hr>
	
	<table align="center" style="text-align : center;">
		<tr>
			<td colspan="2" ><img src="/first/resources/images/CampGround_2.jpg" width="200" height="120"></td>
			<th colspan="2" style="width : 200px;"> 상품명 : 아이리쉬 텐트</th>
		</tr>
		<tr>
			<td><input type="radio" name="refund">상태 불량</td>
			<td><input type="radio" name="refund">단순 변심</td>
			<td><input type="radio" name="refund">주문 실수</td>
			<td><input type="radio" name="refund">기 타</td>
		</tr>
		<tr>
			<td colspan="4"><textarea cols="60" rows="3" style="resize : none;" placeholder="기타 선택시 입력해주세요"></textarea></td>
		</tr>
		<tr>
			<td colspan="2"><button
										style="outline: 0; border: 0; border-radius: 6px; width: 140px; background-color: gray; color: white;"
										value="update">교환신청</button></td>
			<td colspan="2"><button
										style="outline: 0; border: 0; border-radius: 6px; width: 140px; background-color: gray; color: white;"
										value="update">반품신청</button></td>
		</tr>
	</table>
	
</body>
</html>
