<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<style type="text/css">
.gdsDes img { max-width:600px; max-height:500px; width:auto; height:auto; }
.gdsDes2 img { max-width: 100px; max-height: 100px;}	
</style>
</head>
<body>
	<main>
		<section class="py-5">
			<div class="container px-4 px-lg-5 mt-5">
				<h3>�ֹ� ����</h3>

				<!-- 					����	���̺� -->

				<table class="table" align="center"
					style="width: 90%; text-align: center;">
					<tr bgcolor="#212926"
						style="color: white; border-collapse: collapse; outline: 0; border: 0;">
						<th colspan="2"><h3>�ֹ����� :
								${orderdetailstatus.ORDER_DATE }</h3></th>
					</tr>
					<tr>
						<th style="width: 15%;">��ۺ�</th>
						<td style="width: 85%">${orderdetailstatus.ORDER_DPRICE }��</td>

					</tr>
					<tr>
						<th rowspan="2">�����</th>
						<td>${orderdetailstatus.ORDER_RCV_ADDRESS1 }</td>
					</tr>
					<tr>
						<td>${orderdetailstatus.ORDER_RCV_ADDRESS2 }</td>
					</tr>

					<tr>
						<th>�ֹ� ��û����</th>
						<td>${orderdetailstatus.ORDER_MEMO }</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<button
								style="outline: 0; border: 0; border-radius: 6px; width: 140px; background-color: black; color: white;"
								value="update" onclick="PopupAPI();">�����ȸ</button>
							<a href="#this" id="deleteall"><button
								style="outline: 0; border: 0; border-radius: 6px; width: 140px; background-color: gray; color: white;"
								value="update">���ų��� ����</button>
								<input type="hidden" id="ORDER_NUM" value="${orderdetailstatus.ORDER_NUM }">
								</a>
						</td>
					</tr>
				</table>

				<br> <br> <br> <br>
				<h4 style="text-align: center">���� ��ǰ</h4>

				<hr />
				<div align="right" style="margin-left: 20px;">
					<a href="#this" id="deletepart"><button class="btn btn-outline-dark"
						style="outline: 1; border: 1; font-size: 0.7em; width: 100px; height: 35px;"
						value="delete">�����׸� ����</button>
						<input type="hidden" name="ORDER_NUM" id="ORDER_NUM" value="${orderdetailstatus.ORDER_NUM }">
						</a>
				</div>
				�ϰ� ����
			
				<table class="table">
					<tr>
						<td colspan="4"><input type="checkbox" id="checkall"></td>
					</tr>
					<c:choose>
						<c:when test="${fn:length(porderdetail) > 0 }">
							<c:forEach items="${porderdetail }" var="row">
								<tr>
									<td rowspan="2"><input type="checkbox" name="cb" id="cb" value="${row.DORDER_NUM }"></td>
									<td rowspan="2" width="15%"><div class="gdsDes2">${row.PROD_THUMB }</div></td>
									<th width="50%">${row.PROD_NAME }</th>
									<td width="20%">
											<font style="color: red;">${row.ORDER_STATUS }</font>
									</td>
									<td rowspan="2"><div align="center"
											style="margin-top: 15px;">
											<c:choose>
											<c:when test="${row.ORDER_STATUS eq '��ۿϷ�'}">
											<button
												style="outline: 0; border: 0; border-radius: 6px; width: 140px; background-color: gray; color: white;"
												value="update" onclick="Popup();">��ȯ / ��ǰ ��û</button>
											<br> <br>
											<button
												style="outline: 0; border: 0; border-radius: 6px; width: 140px; background-color: gray; color: white;"
												value="update">�ı� �ۼ��ϱ�</button>
												</c:when>
												</c:choose>
										</div></td>
								</tr>
								<tr>
								
									<td colspan="2"><div class="gdsDes">�ֹ� �󼼳��� : ${row.PROD_CONTEXT }</div><br /> �ֹ�
										�ݾ� : ${row.PROD_PRICE }��<br /> ���� : ${row.PROD_COUNT }��
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="3">��ϵ� ��ǰ�� �����ϴ�.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table>

				<!-- ------------------------------------------ -->
				<br>
				<h4 style="text-align: center">�뿩 ��ǰ</h4>
				${rentalDate.RENTAL_START }
				<hr />
				<c:if test="${rentalDate.RENTAL_START ne null }">
					<h3>${rentalDate.RENTAL_START }~
						${rentalDate.RENTAL_END }</h3>
				</c:if>
				<hr />
				�ϰ� ����
				<table class="table">
					<tr>
						<td colspan="4"><input type="checkbox" id="rencheckall"></td>
					</tr>
					<c:choose>
						<c:when test="${fn:length(rorderdetail) > 0 }">
							<c:forEach items="${rorderdetail }" var="row">
								<tr>  
									<td rowspan="2"><input type="checkbox" name="rencb" id="rencb" value="${row.DORDER_NUM }"></td>
									<td rowspan="2" width="15%"><div class="gdsDes2">${row.PROD_THUMB }</div></td>
									<th width="50%">${row.PROD_NAME }</th>
									<td width="20%"><c:if
											test="${row.RENTAL_STATUS ne '��� �Ϸ�' }">
											<font style="color: red;">${row.ORDER_STATUS }</font>
										</c:if></td>
									<td rowspan="2"><div align="center"
											style="margin-top: 15px;">
											<c:choose>
											<c:when test="${row.ORDER_STATUS eq '��� �Ϸ�'}">
											<button
												style="outline: 0; border: 0; border-radius: 6px; width: 140px; background-color: gray; color: white;"
												value="update" onclick="Popup();">��ȯ / ��ǰ ��û</button>
												<input type="hidden" id="DORDER_NUM" value="${row.DORDER_NUM}">
											<br> <br>
											<a href="/zikcam/prod/writeProdQR?PROD_NUM=${row.PROD_NUM}&sortType='REVIEW'">
											<button
												style="outline: 0; border: 0; border-radius: 6px; width: 140px; background-color: gray; color: white;"
												value="update">�ı� �ۼ��ϱ�</button>
												</a>
												</c:when>
												<c:when test="${row.ORDER_STATUS eq '�Ա� �����' }">
												<a href="/zikcam/myPage/myOrderRefund?DORDER_NUM=${row.DORDER_NUM}&type=refund&BORDER_NUM=${row.ORDER_NUM }">
												<button
												style="outline: 0; border: 0; border-radius: 6px; width: 140px; background-color: gray; color: white;"
												value="update">�ֹ� ���</button>
												
												</a>
												</c:when>
												</c:choose>
										</div></td>
								</tr>
								<tr>
									<td colspan="2"><div class="gdsDes">�ֹ� �󼼳��� : ${row.PROD_CONTEXT }</div><br /> �ֹ�
										�ݾ� : ${row.PROD_RPRICE }��<br /> ���� : ${row.PROD_COUNT }��
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="3">��ϵ� ��ǰ�� �����ϴ�.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table>

				<hr />
				<!-- 						�� �����ݾ�  -->
				<div align="right">

					<h3>
						�� �����ݾ�(����) <font color="red">${orderdetailstatus.ORDER_PRICE }</font>��
					</h3>
					<a href="#this" id="list"><button
							style="outline: 0; border: 0; border-radius: 6px; width: 100px; background-color: black; color: white;"
							value="update">���</button></a>&nbsp;&nbsp;&nbsp;
				</div>



			</div>
		</section>
	</main>
<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
	
		$(document).ready(function() {
			//�ֻ�� üũ�ڽ� Ŭ��
			$("#checkall").click(function() {
				//Ŭ���Ǿ�����
				if ($("#checkall").prop("checked")) {
					//input�±��� name�� chk�� �±׵��� ã�Ƽ� checked�ɼ��� true�� ����
					$("input[name=cb]").prop("checked", true);
					//Ŭ���� �ȵ�������
				} else {
					//input�±��� name�� chk�� �±׵��� ã�Ƽ� checked�ɼ��� false�� ����
					$("input[name=cb]").prop("checked", false);
				}
			});
			$("#rencheckall").click(function() {
				//Ŭ���Ǿ�����
				if ($("#rencheckall").prop("checked")) {
					//input�±��� name�� chk�� �±׵��� ã�Ƽ� checked�ɼ��� true�� ����
					$("input[name=rencb]").prop("checked", true);
					//Ŭ���� �ȵ�������
				} else {
					//input�±��� name�� chk�� �±׵��� ã�Ƽ� checked�ɼ��� false�� ����
					$("input[name=rencb]").prop("checked", false);
				}
			});
			$("#deletepart").on("click", function(e) { //������� ��ư 
				e.preventDefault();
				fn_deletePart();
			});
			$("#deleteall").on("click", function(e) { //�����ϱ� ��ư
				e.preventDefault();
				fn_deleteAll();
			});
			$("#list").on("click", function(e) { //�����ϱ� ��ư
				e.preventDefault();
				fn_orderList();
			});	
		});
		function fn_deletePart() {
			var comSubmit = new ComSubmit();
			var select_obj = '';
			  
			$('input[id="cb"]:checked').each(function (index) {
	            if (index != 0) {
	                select_obj += ', ';
	            }
	            select_obj += $(this).val();
	        });
			$('input[id="rencb"]:checked').each(function (index) {
	            if (select_obj != 0) {
	                select_obj += ', ';
	            }
	            select_obj += $(this).val();
	        });
	  
			comSubmit.setUrl("<c:url value='../myPage/myOrderDeletePart' />");
			comSubmit.addParam("DORDER_NUM", select_obj);
			comSubmit.addParam("ORDER_NUM", $("#ORDER_NUM").val());
			comSubmit.submit();
		}
		function fn_deleteAll() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='../myPage/myOrderDeleteAll' />");
			comSubmit.addParam("ORDER_NUM", $("#ORDER_NUM").val());
			comSubmit.submit();
		}
		function fn_orderList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='../myPage/myOrderList' />");
			comSubmit.submit();
		}
		
		var url ="../myPage/myOrderRefundForm?DORDER_NUM=" + $('#DORDER_NUM').val();
		function Popup() {
			window.open(url, "a",
					"width=700, height=500, left=100, top=50 , resizable=no");
		}
		function PopupAPI() {
			window.open("https://tracker.delivery/#/kr.cjlogistics/111111111111", "a",
					"width=700, height=500, left=100, top=50 , resizable=no");
		}
	
	</script>
</body>
</html>
