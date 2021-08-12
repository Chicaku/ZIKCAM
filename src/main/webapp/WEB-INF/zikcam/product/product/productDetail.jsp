<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

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
.gdsDes2 img { max-width:400px; max-height:300px; width:auto; height:auto; }
.gdsDes img { max-width:128px; max-height:94px; width:auto; height:auto; }
</style>
    </head>
    <body>
    	<input type="hidden" id="prodNum" value="${map.PROD_NUM}" />
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6">
                    	<div style="padding:10px;">
                    		<div class="gdsDes2">${map.PROD_THUMB}</div>
                    	</div> 
                    	<div style="padding:10px;">
	                    	<%-- <c:forEach items="${map}" var="row"> --%>
	                    		<div class="gdsDes">${map.PROD_SUB}</div>
	                    	<%-- </c:forEach> --%>
                    	</div>
                    </div>
                    <div class="col-md-6">
                        <h1 class="display-5 fw-bolder" id="prod_name">${map.PROD_NAME}</h1>
                        <div class="fs-5 mb-5">
                            <span><fmt:formatNumber value="${map.PROD_PRICE}" pattern="#,###"/> 원</span>
                        </div>
                        <div class="fs-5 mb-5">
                            <span><font color="red">남은 수량 ${map.PROD_STOCK} 개</font></span>
                        </div>
                        <div class="d-flex">
                            <input class="form-control text-center me-3" id="inputQuantity" type="num" value="1" style="max-width: 3rem" />
                            <button class="btn btn-outline-dark flex-shrink-0" type="button" id="goCart">
                                <i class="bi-cart-fill me-1"></i>
                                장바구니
                            </button>&nbsp;&nbsp;&nbsp;
                            <button class="btn btn-outline-danger" type="button" style="font-weight:bold; color:white; background-color: #dc3545;">
                                바로구매
                            </button>
                        </div>
                    </div>
                </div>
                <br/><br/><br/><br/>
                
                <div class="row gx-4 gx-lg-5 align-items-center">
                	<table class="table">
                		<tr align="center" valign="middle" height="50">
                			<td style="background-color:#a2b7cd" id="detail" width="33%"><b>상품 상세설명</b></td>
                			<td style="background-color:#a6dd28" id="pq" width="33%"><b>상품 문의</b></td>
                			<td style="background-color:#ffcf03" id="review" width="33%"><b>상품 후기</b></td>
                		</tr>
                	</table>
                </div>
                
                <div class="row gx-4 gx-lg-5 align-items-center" id="subdiv">
                	${map.PROD_CONTEXT}
                </div>
            </div>
        </section>
    <script>
	    $(document).ready(function(){
	    	
	    	// 상세설명 클릭
	    	$("#detail").on('click', function(e) {
	    		e.preventDefault();
	    		$("#subdiv").focus();
	    	});
	    	
	    	// 상품 후기 클릭
	    	$("td#review").on('click', function() {
	    		$("#subdiv").html("<c:forEach items='${list2}' var='list2'>" +
	    			"<table class='table'>" + 
						"<tr style='background-color:#ffcf03'>" +
							"<td width='30%'>${list2.MEMBER_ID} 님</td>" +
							"<td width='40%' align='right'>${list2.REVIEW_LIKE} 점</td>" +
							"<td width='40%' align='right'>${list2.REVIEW_DATE}</td>" +
						"</tr>" +
						"<tr>" +
							"<td colspan='3'><b>${list2.REVIEW_TITLE}</b></td>" +
						"</tr>" +
						"<tr>" +
							"<td colspan='3'>${list2.REVIEW_CONTENT}</td>" +
						"</tr>" +	
					"</table>" + 
					"</c:forEach>");
	    	})
	    	
	    	// 상품 문의 클릭
	    	$("td#pq").on('click', function() {
	    		$("#subdiv").html("<c:forEach items='${list3}' var='list3'>" +
		    			"<table class='table'>" + 
							"<tr style='background-color:#a6dd28'>" +
								"<td width='30%'>${list3.MEMBER_ID} 님</td>" +
								"<td width='70%' align='right'>${list3.PQ_DATE}</td>" +
							"</tr>" +
							"<tr>" +
								"<td colspan='2'><b>${list3.PQ_TITLE}</b></td>" +
							"</tr>" +
							"<tr>" +
								"<td colspan='2'>${list3.PQ_CONTENT}</td>" +
							"</tr>" +	
						"<c:if test='${not empty list3.RE_DATE}'>" + 
							"<tr>" +
								"<td>Re: ${list3.RE_CONTENT}</td>" +
								"<td align='right'>${list3.RE_DATE}</td>" +
							"</tr>" +	
							"</table>" + 
						"</c:if>" +
						"</c:forEach>");
	    	})
	    	
	    	// 장바구니 클릭
	    	$("#goCart").on('click', function() {
	    		var member_id = 'member01';
	    		console.log($("#inputQuantity").val());
	    		
	    		$.ajax({
	    			type: "POST",
	    			url:"<c:url value='/prod/insertCart'/>",
	    			data:{MEMBER_ID:member_id, PROD_NUM:$("#prodNum").val(),
	    				PROD_COUNT:$("#inputQuantity").val(), CART_RENTAL:'0'},
	    			success: function(data){
	    				location.href="../myPage/myCartList";
	    			},
	    			error:function(request, error) {

	    			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

	    			}
	            });
	    	})
	    });
	</script>
    </body>
</html>
