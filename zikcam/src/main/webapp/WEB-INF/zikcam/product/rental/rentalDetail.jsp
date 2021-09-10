<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<!-- <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Z</title>
Favicon
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
Bootstrap icons
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
Core theme CSS (includes Bootstrap)
<link href="css/styles.css" rel="stylesheet" /> -->
<style type="text/css">
.gdsDes2 img {
	max-width: 100%;
	max-height: 100%;
	width: auto;
	height: auto;
}

.gdsDes img {
	max-width: 128px;
	max-height: 94px;
	width: auto;
	height: auto;
}
.center { 
				position: absolute; /* */
				left: 50%;
				top: 50%;
				transform: translate(-50%, -50%);
				width: 48%;
				height: 59%; 
				}
</style>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<body>
	<input type="hidden" id="prodNum" value="${map.PROD_NUM}" />
	<section class="py-5">
	<h1 align="center">대여 일정</h1>
		<div class="text" align="center">
	        <label for="start"><font color="black">대여 시작일 :&nbsp;</font></label>
			<input type="date" id="start_date" name="start_date" value="${start_date}"
			       min="2021-01-01" max="2021-12-31" disabled>
					&nbsp;&nbsp;
			<label for="end"><font color="black">대여 종료일 :&nbsp;</font></label>
	 		<input type="date" id="end_date" name="end_date" value="${end_date}"
			       min="2021-01-01" max="2021-12-31" disabled>
		</div>
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center">
				<div class="col-md-6">
					<div style="padding: 10px;">
						<div class="gdsDes2">${map.PROD_THUMB}/></div>
					</div>
					<div style="padding: 10px;">
						<%-- <c:forEach items="${map}" var="row"> --%>
						<div class="gdsDes">${map.PROD_SUB}</div>
						<%-- </c:forEach> --%>
					</div> 
				</div>
				 
				<div class="col-md-6">
					<h1 class="display-5 fw-bolder" id="prod_name">${map.PROD_NAME}</h1>
					<div class="fs-5 mb-5">
                            <span>하루 당 <fmt:formatNumber value="${map.PROD_RPRICE}" pattern="#,###"/> 원</span>
                        </div>
                        <div class="fs-5 mb-5">
                        	
                            
                        </div>  
                        <div class="fs-5 mb-5">
                        	<c:set var="check" value="${map.PROD_RSTOCK}"/>
                            <span><font color="red">남은 수량 ${check} 개</font></span>
                        </div>  
					<div class="d-flex"> 
						<input type="hidden" id="member_id" name="member_id" value="${session_MEM_ID}">
						<input type='hidden' id='PROD_COUNT' value="1">
        				<input type='hidden' id='CART_RENTAL' value="0">
						<input class="form-control text-center me-3" id="inputQuantity"
							type="num" value="1" style="max-width: 3rem" />
						<button class="btn btn-outline-dark flex-shrink-0" type="button"
							id="goCart">
							<i class="bi-cart-fill me-1"></i> 장바구니
						</button>
						
						&nbsp;&nbsp;&nbsp;
						
					</div>
					<br>
					
					<c:if test="${map.WISH_ACC == 'N'}">
						<br>
						찜 : <img type="button" id='insertWish' onclick="" border='0' width='30' height='30' src='../resources/images/emptyHeart.png' />&nbsp;조회수 : ${map.PROD_HITCOUNT}
					</c:if>
					
					
					<c:if test="${map.WISH_ACC == 'Y'}">
						<br>
						찜 : <img type="button" id='deleteWish' onclick="" border='0' width='30' height='30' src='../resources/images/fullHeart.png' />&nbsp;조회수 : ${map.PROD_HITCOUNT}
					</c:if>
					
				</div> 
			</div>
			<br />
			<br />
			<br />
			<br />

			<div class="row gx-4 gx-lg-5 align-items-center">
				<table class="table">
					<tr align="center" valign="middle" height="50">
						<td style="background-color: #a2b7cd" width="33%">
							<button class="btn btn-primary" id="detail" type="submit"
								style="background-color: #a2b7cd; width: 100%; height: 100%;">
								<b>상품 상세설명</b>
							</button>
						</td>
						<td style="background-color: #a6dd28" width="33%">
							<button class="btn btn-primary" name="sortType" value="pq"
								type="submit"
								style="background-color: #a6dd28; width: 100%; height: 100%;">
								<b>상품 문의</b>
							</button>
						</td>
						<td style="background-color: #ffcf03" width="33%">
							<button class="btn btn-primary active" name="sortType"
								value="review" type="submit"
								style="background-color: #ffcf03; width: 100%; height: 100%;">
								<b>상품 후기</b>
							</button>
						</td>
					</tr>
					<tr>
						<td colspan="3"></td>
					</tr>  
				</table> 
				<input type="hidden" id="formSortType" name="formSortType"
					value="${formSortType }">
				<div  id="subdiv"
					align="center" ><div class="gdsDes2"> ${map.PROD_CONTEXT}</div>
					</div>
			</div>
			<div class="page_nation">
					<div id="PAGE_NAVI" align="center"></div>
					<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
				</div>
			
    
		</div> 
	</section> 
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		var prodNum = $("#prodNum").val();

		$(document).ready(function() {
			
					$("#insertWish").on("click", function(e){ //찜하기 버튼
						
						$.ajax({
			   				 url : '../prod/insertWish', 
			   	              type : "get", 
			   	              data : {"PROD_NUM" : prodNum},
			   	              success : function(data){
			   	            	fn_openInsertWish();
			   	              },
			   	              error : function(data){
			   	            	 alert('error');
			   	                 
			   	              }
			   				})
					});
					 
					$("#deleteWish").on("click", function(e){ //찜삭제 버튼
						 
						$.ajax({
			   				 url : '../prod/deleteWish', 
			   	              type : "get", 
			   	              data : {"PROD_NUM" : prodNum},
			   	              success : function(data){ 
			   	            	fn_deleteWish();
			   	              },
			   	              error : function(data){
			   	            	 alert('error');
			   	                
			   	              }
			   				})
					});
					
					// 상세설명 클릭
					$("#detail").on('click', function(e) {
						e.preventDefault(); 
						location.reload();
					});

					$("button[name=sortType]").on('click', function() {

						var sortType = $(this).val();

						if (sortType == 'pq') {
							$('#sortType').val('PQ');
							$('#formSortType').val('PQ');
						} else if (sortType == 'review') {
							$('#sortType').val('REVIEW');
							$('#formSortType').val('REVIEW');
						}

						$.ajax({
							url : '../prod/prodQR',
							type : "get",
							data : {
								"sortType" : sortType,
								"PROD_NUM" : prodNum
							},
							success : function(data) {
								console.log(sortType);

								fn_selectQRList(1);

							},
							error : function(data) {
								alert('error');

							}
						})

					});

					// 장바구니 클릭
					$("#goCart").on(
							'click',
							function() {
								console.log($("#inputQuantity").val());

								$.ajax({
									type : "GET",
									url : "<c:url value='/prod/insertCart'/>",
									data : {
										MEMBER_ID : $("#member_id").val(),
										PROD_NUM : $("#prodNum").val(),
										PROD_COUNT : $("#inputQuantity").val(),
										CART_RENTAL : '1'
									},
									success : function(data) {
										location.href = "../myPage/myCartList";
									},
									error : function(request, error) {

										console.log("code:" + request.status
												+ "\n" + "message:"
												+ request.responseText + "\n"
												+ "error:" + error);

									}
								});
							})
							
							
				});

		function fn_selectQRList(pageNo) {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='../prod/prodQR' />");
			comAjax.setCallback("fn_selectQRListCallback");
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 15);
			comAjax.addParam("sortType", $('#formSortType').val());
			comAjax.addParam("PROD_NUM", prodNum);
			comAjax.ajax();
		}

		function fn_selectQRListCallback(data) {
			var total = data.TOTAL;
			var body = $("#subdiv");
			// 			alert(JSON.stringify(data));
			body.empty();

			if (total == 0) {
				var str = "<tr>" + "<td colspan='5'>조회된 결과가 없습니다.</td>"
						+ "</tr>";
				body.append(str);
			} else {
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					recordCount : 15,
					totalCount : total,
					eventName : "fn_selectQRList"
				};
				gfn_renderPaging(params);

				var str = "";
				str += "<table class='table table-hover' style='width: 90%; text-align: center;'>"
						+ "<tr bgcolor='#212926' style='color: white; border-collapse: collapse; outline: 0; border: 0;'>"
						+ "<th style='width: 10%;'>글 번호</th>"
						+ "<th style='width: 20%;'>제목</th>"
						+ "<th style='width: 25%'>내용</th>"
				if ($('#formSortType').val() == 'PQ') {
					str += "<th style='width: 15%;'>답변상태</th>"
				} else {
					str += "<th style='width: 15%;'>평점</th>"
				}
				str += "<th style='width: 30%;'>작성일</th>" + "</tr>"

				$
						.each(
								data.list,
								function(key, value) {

									if (value.LISTTYPE == 'PQ') {
										str += "<tr onClick=\"location.href='../myPage/myPQDetail?PQ_NUM="
												+ value.NUM
												+ "'\">"
												+ "<td>"
												+ value.RNUM
												+ " <input type='hidden' id='PQ_NUM' " + "value='" + value.NUM +"'>"
												+ "</td>"
									} else {
										str += "<tr onClick=\"location.href='../myPage/myReviewDetail?REVIEW_NUM="
												+ value.REVIEW_NUM
												+ "'\">"
												+ "<td>"
												+ value.RNUM
												+ "<input type='hidden' id='REVIEW_NUM' value='" + value.REVIEW_NUM + "'>"
												+ "</td>"
									}
									str += "<td>" + value.TITLE + "</td>"
											+ "<td>"
											+ value.CONTENT.substring(0, 10)
											+ "...</td>" + "<td>";

									if (value.LISTTYPE == 'PQ') {
										if (value.REPLY == '0') {
											str += "X";
										} else {
											str += "O";
										}
									} else {
										for (var test = 1; test <= 5; test++) {
											if (value.REVIEW_LIKE >= test) {
												str += "★";
											} else {
												str += "☆";
											}
										}
									}

									str += "</td>" + "<td>" + value.CDATE
											+ "</td>" + "</tr>";
								});
				str += "</table>"
					+"<div align='right'>"
					+"<a href='./writeProdQR?PROD_NUM="+ ${map.PROD_NUM} + "&sortType="+ $('#formSortType').val() +"'>"
					+"<button style='outline: 0; border: 0; border-radius: 6px; width: 140px; background-color: black; color: white;'>작성하러 가기</button>"
					+"</a></div>"
				body.append(str);
			}
		}
		
		function fn_openInsertWish(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='../prod/insertWish' />");
			comSubmit.addParam("PROD_NUM", $("#prodNum").val());
			comSubmit.submit();
		}
		
		
		function fn_deleteWish(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='../prod/deleteWish' />");
			comSubmit.addParam("PROD_NUM", $("#prodNum").val());
			comSubmit.submit(); 
			
		}
	</script>
</body>
</html>
