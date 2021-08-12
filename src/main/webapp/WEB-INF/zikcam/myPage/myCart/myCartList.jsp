<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<script src="<c:url value='/resources/js/common.js'/>" charset="utf-8"></script>
</head>
<body>  

			<main>
				<section class="py-5"> 
					<div class="container px-4 px-lg-5 mt-5" style="width:200;">
						<p><h3><b>장바구니</b></h3></p>
						<hr/>
						
						<input type="hidden" id="member_id" value="${MEMBER_ID}"/>
						<input type="hidden" id="rental_start" value="${RENTAL_START}"/>
						<input type="hidden" id="rental_end" value="${RENTAL_END}"/>
						
						<c:choose>
						<c:when test="${list1.size() == 0 and list2.size() == 0}">
						<br/><br/><br/><br/>
						<div>
							<center>
								장바구니가 비었습니다.
								<br/><br/><br/><br/>
								<a href="../prod/main"><button type="button" style="width:200px; height:60px; font-size:20px; font-weight:bold;" class="btn btn-outline-danger">계속 쇼핑하기</button></a>
							</center>
						</div>
						<br/><br/><br/><br/>
						</c:when>
						
						<c:otherwise>
						<br/><br/>
						
						<h5>
							<b>구매 상품</b>&nbsp;&nbsp;
							<button type="button" class="btn btn-outline-dgray active" id="allDelete1"></button>
						</h5>
						
						<hr/>
						
						<div id="purchase">
						<c:choose>
						<c:when test="${list1.size() == 0}">
						<br/><br/><br/><br/>
						<div>
							<center>
								장바구니에 담은 상품이 없습니다.
							</center>
						</div>
						<br/><br/><br/><br/>
						<hr/>
						<br/><br/>
						</c:when>
						<c:otherwise>
							
						<table class="table" id="table1">
							<colgroup>
								<col width="5%" />
								<col width="20%" />
								<col width="45%" />
								<col width="15%" />
								<col width="15%" />
							</colgroup>
							<tr align="center" bgcolor="#212926" style="color: white; border-collapse: collapse; outline: 0; border: 0;">
								<!-- 버튼을 눌렀을때 하단 모든 체크박스 선택 -->
								<td colspan="2" align="left"><input type="checkbox" id="checkAll1">&nbsp;&nbsp;&nbsp;<b>전체 선택</b></td>
								<th colspan="2">상품 정보</th>
								<th>상품 가격</th>
							</tr>
								<c:forEach items="${list1}" var="mylist1">
									<tr valign="middle" id="tr1">
										<td rowspan="2">
											<input type="hidden" name="cartNum" value="${mylist1.CART_NUM}" />
											<input type="hidden" name="prodPrice" value="${mylist1.PROD_PRICE}" />
											<input type="hidden" name="cartDel1" value="${mylist1.CART_DEL}" />
											<input type="hidden" name="prodStock" value="${mylist1.PROD_STOCK}" />
											<input type="checkbox" id=cb name="cb1">
										</td>
										<td rowspan="2"><img src="../resources/images/123.PNG" width="100" height="100"></td>
										<th>${mylist1.PROD_NAME }</th>
										<td id="tdStock">
											<c:set var="check" value="${mylist1.PROD_STOCK - mylist1.PROD_COUNT }"/>
											<c:if test="${check < 0}" var="red">
												<c:set var="check" value="${check = check * -1}"/>
												<font color="red">재고가 ${check}개 부족합니다.</font>
											</c:if>
										</td>
										<td rowspan="2" align="center" >
											<c:set var="sprice" value="${mylist1.PROD_PRICE * mylist1.PROD_COUNT }"/>
											<span id="sprice">
											<b><fmt:formatNumber value="${sprice}" pattern="#,###"/> 원</b>
											</span>
										</td>
									</tr>
									<tr valign="middle" id="tr2">
										<td align="right"><fmt:formatNumber value="${mylist1.PROD_PRICE}" pattern="#,###"/> 원</td>
										<td>
											<img src="../resources/images/left.png" width="30" height="30" name="leftbt">
											<input type="text" size=1 name="countNum" value="${mylist1.PROD_COUNT }" style="text-align:center" onchange="fn_onchangeProdCount(this)">
											<img src="../resources/images/right.png" width="30" height="30" name="rightbt">&nbsp;&nbsp;
											<img src="../resources/images/xbt.png" width="30" height="30" name="xbt">
										</td>
									</tr>
									<c:set var="price" value="${price + sprice}"/>
								</c:forEach>
							<tr align="center" style="border-collapse: collapse; outline: 0; border: 0;">
								<td colspan="4"></td>
								<td><b>총 <font color="red"><fmt:formatNumber value="${price}" pattern="#,###"/> </font> 원</b></td>
							</tr>

						</table>

						<br/><br/>
						</c:otherwise>
						</c:choose>
						</div>
						
						<h5>
							<b>대여 상품</b>&nbsp;&nbsp;
							<span style="background-color : lgray">${temp.RENTAL_START} ~ ${temp.RENTAL_END}</span>&nbsp;&nbsp;
							<button type="button" class="btn btn-outline-dark" name="changeDate">날짜 변경</button>&nbsp;&nbsp;
							<button type="button" class="btn btn-outline-dgray active" id="allDelete2"></button>
						</h5>
						<hr/>
						
						<div id="rental">
						<c:choose>
						<c:when test="${list2.size() == 0}">
						<br/><br/><br/><br/>
						<div>
							<center>
								장바구니에 담은 상품이 없습니다.
							</center>
						</div>
						<br/><br/><br/><br/>
						<hr/>
						<br/><br/>
						</c:when>
						<c:otherwise>

						<table class="table" id="table2">
							<colgroup>
								<col width="5%" />
								<col width="20%" />
								<col width="45%" />
								<col width="15%" />
								<col width="15%" />
							</colgroup>
							<tr align="center" bgcolor="#212926" style="color: white; border-collapse: collapse; outline: 0; border: 0;">
								<!-- 버튼을 눌렀을때 하단 모든 체크박스 선택 -->
								<td colspan="2" align="left"><input type="checkbox" id="checkAll2" >&nbsp;&nbsp;&nbsp;<b>전체 선택</b></td>
								<th colspan="2">상품 정보</th>
								<th>상품 가격</th>
							</tr>
								<c:forEach items="${list2}" var="mylist2">
									<tr valign="middle"  id="tr1">
										<td rowspan="2">
											<input type="hidden" name="cartNum" value="${mylist2.CART_NUM}" />
											<input type="hidden" name="prodPrice" value="${mylist2.PROD_RPRICE}" />
											<input type="hidden" name="cartDel2" value="${mylist2.CART_DEL}" />
											<input type="checkbox" id=cb name="cb2">
										</td>
										<td rowspan="2"><img src="../resources/images/123.PNG" width="100" height="100"></td>
										<th>${mylist2.PROD_NAME }</th>
										<td id="tdStock">
											<c:set var="check" value="${mylist2.REAL_STOCK - mylist2.DAY_STOCK - mylist2.PROD_COUNT }"/>
											<c:if test="${check < 0}" var="red">
												<c:set var="check" value="${check = check * -1}"/>
												<font color="red">재고가 ${check}개 부족합니다.</font>
											</c:if>
										</td>
										<td rowspan="2" align="center" >
											<c:set var="sprice" value="${mylist2.PROD_RPRICE * mylist2.PROD_COUNT }"/>
											<span id="sprice">
											<b><fmt:formatNumber value="${sprice}" pattern="#,###"/> 원</b>
											</span>
										</td>
									</tr>
									<tr valign="middle" id="tr2">
										<td align="right"><fmt:formatNumber value="${mylist2.PROD_RPRICE}" pattern="#,###"/> 원</td>
										<td>
											<img src="../resources/images/left.png" width="30" height="30" name="leftbt">
											<input type="text" size=1 name="countNum" value="${mylist2.PROD_COUNT }" style="text-align:center" onchange="fn_onchangeProdCount(this)">
											<img src="../resources/images/right.png" width="30" height="30" name="rightbt">&nbsp;&nbsp;
											<img src="../resources/images/xbt.png" width="30" height="30" name="xbt">
										</td>
									</tr>
									<c:set var="rprice" value="${rprice + sprice}"/>
								</c:forEach>
							<tr align="center" style="border-collapse: collapse; outline: 0; border: 0;">
								<td colspan="4"></td>
								<td><b>총 <font color="red"><fmt:formatNumber value="${rprice}" pattern="#,###"/> </font> 원</b></td>
							</tr>

						</table>
						
						<br/><br/>
						</c:otherwise>
						</c:choose>
						</div>
						
						<!-- 총 수량 및 가격 -->
						
						<hr/>
						
						<br/>
						<div align="center">
							<c:set var="totalPrice" value="${price + rprice}"/>
							<c:choose>
								<c:when test="${list3.MEMBER_RANK eq 1}">
									<c:set var="dprice" value="2500"/>
								</c:when>
								<c:otherwise>
									<c:set var="dprice" value="0"/>
								</c:otherwise>
							</c:choose>
							<c:set var="lastPrice" value="${totalPrice + dprice}"/>
							총 상품가격&nbsp;&nbsp;<font color="red"><b><fmt:formatNumber value="${totalPrice}" pattern="#,###"/></b></font> 원&nbsp;&nbsp;+&nbsp;&nbsp;
							총 배송비&nbsp;&nbsp;<b><fmt:formatNumber value="${dprice}" pattern="#,###"/></b> 원&nbsp;&nbsp;=&nbsp;&nbsp;
							<b>총 주문금액&nbsp;&nbsp;<font color="red"><fmt:formatNumber value="${lastPrice}" pattern="#,###"/></font> 원</b>
						</div>
						<br/>
						
						<hr/>

						<!-- 하단 버튼 -->
						
						<br><br>
						
						<div>
							<center>
								<a href="../prod/main"><button type="button" style="width:200px; height:60px; font-size:20px; font-weight:bold;" class="btn btn-outline-danger">계속 쇼핑하기</button></a>
								&nbsp;&nbsp;
								<button type="button" style="width:200px; height:60px; font-size:20px; font-weight:bold; color:white; background-color: #dc3545;" class="btn btn-outline-danger" id="nextbt">구매하기</button>
							</center>
						</div>
						
						<br><br>
						
						</c:otherwise>
						</c:choose>
					</div>
				</section>
			</main>
			
			
			<script>

		$(document).ready(function(){
			var cartDel1 = document.getElementsByName('cartDel1');
			var cartDel2 = document.getElementsByName('cartDel2');
			
			var table1 = $('#table1').find('input[name=cb1]').length;
			var table2 = $('#table2').find('input[name=cb2]').length;
			
			for (var i = 0; i < table1; i++) {
				if (cartDel1[i].value == false) {
					$("input[name=cb1]").eq(i).prop("checked",true);
				}
			}
			
			for (var i = 0; i < table2; i++) {
				if (cartDel2[i].value == false) {
					$("input[name=cb2]").eq(i).prop("checked",true);
				}
			}
			
			if($("input[name=cb1]").length == $("input[name=cb1]").filter(":checked").length){
	        	$("#checkAll1").prop("checked",true);
	        } else {
	        	$("#checkAll1").prop("checked",false);
	        }

	        if($("input[name=cb2]").length == $("input[name=cb2]").filter(":checked").length){
	        	$("#checkAll2").prop("checked",true);
	        } else {
	        	$("#checkAll2").prop("checked",false);
	        }
	        
	        if($("#checkAll1").prop("checked")){
	        	$('button#allDelete1').html('전체 삭제');
	        } else {
	        	$('button#allDelete1').html('선택 삭제');
	        }
	        
	        if($("#checkAll2").prop("checked")){
	        	$('button#allDelete2').html('전체 삭제');
	        } else {
	        	$('button#allDelete2').html('선택 삭제');
	        }
			
			// 구매 전체 선택
		    $("#checkAll1").on('click', function() {
				var cartNum = $("#table1 input[name=cartNum]");
				var table = $('#table1').find('input[name=cb1]').length;
	        	
		        if($("#checkAll1").prop("checked")){
		        	var del = 0;
		            $("input[name=cb1]").prop("checked",true);
		            $('button#allDelete1').html('전체 삭제');
		        }else{
		        	var del = 1;
		            $("input[name=cb1]").prop("checked",false);
		            $('button#allDelete1').html('선택 삭제');
		        }
		        
		        for (var i = 0; i < table; i++) {
		        	var cartNumber = parseInt(cartNum.eq(i).val());
		        	
					$.ajax({
		    			type: "POST",
		    			url:"<c:url value='/myPage/myCartUpdateDel'/>",
		    			data:{CART_NUM:cartNumber, CART_DEL:del},
		    			success: function(data){
		    			}	
		            });
				}
		    })
		    
		    // 대여 전체 선택
		    $("#checkAll2").on('click', function() {
		    	var cartNum = $("#table2 input[name=cartNum]");
				var table = $('#table2').find('input[name=cb2]').length;
				
		        if($("#checkAll2").prop("checked")){
		        	var del = 0;
		            $("input[name=cb2]").prop("checked",true);
		            $('button#allDelete2').html('전체 삭제');
		        }else{
		        	var del = 1;
		            $("input[name=cb2]").prop("checked",false);
		            $('button#allDelete2').html('선택 삭제');
		        }
		        
		        for (var i = 0; i < table; i++) {
		        	var cartNumber = parseInt(cartNum.eq(i).val());
		        	
					$.ajax({
		    			type: "POST",
		    			url:"<c:url value='/myPage/myCartUpdateDel'/>",
		    			data:{CART_NUM:cartNumber, CART_DEL:del},
		    			success: function(data){
		    			}	
		            });
				}
		    })
		    
		    // 개별 선택
		    $("input[name=cb1]").on('click', function() {
		    	var index = $("input[id='cb']").index(this);
	        	var obj = document.getElementsByName('cartNum');
	        	
	        	if($(this).prop("checked")){
	        		var del = 0;
	        	} else {
	        		var del = 1;
	        	}
	        	
	        	$.ajax({
	    			type: "POST",
	    			url:"<c:url value='/myPage/myCartUpdateDel'/>",
	    			data:{CART_NUM:obj[index].value, CART_DEL:del},
	    			success: function(data){
	    			}	
	            });
	        	
		        if($("input[name=cb1]").length == $("input[name=cb1]").filter(":checked").length){
		        	$("#checkAll1").prop("checked",true);
		        	$('button#allDelete1').html('전체 삭제');
		        } else {
		        	$("#checkAll1").prop("checked",false);
		        	$('button#allDelete1').html('선택 삭제');
		        }
		    })
		    
		    $("input[name=cb2]").on('click', function() {
		    	var index = $("input[id='cb']").index(this);
	        	var obj = document.getElementsByName('cartNum');
	        	
	        	if($(this).prop("checked")){
	        		var del = 0;
	        	} else {
	        		var del = 1;
	        	}
	        	
	        	$.ajax({
	    			type: "POST",
	    			url:"<c:url value='/myPage/myCartUpdateDel'/>",
	    			data:{CART_NUM:obj[index].value, CART_DEL:del},
	    			success: function(data){
	    			}	
	            });
	        	
		        if($("input[name=cb2]").length == $("input[name=cb2]").filter(":checked").length){
		        	$("#checkAll2").prop("checked",true);
		        	$('button#allDelete2').html('전체 삭제');
		        } else {
		        	$("#checkAll2").prop("checked",false);
		        	$('button#allDelete2').html('선택 삭제');
		        }
		    })
		    
		    // 수량 추가
	        $("img[name='rightbt']").on('click', function() {
	        	var index = $("img[name='rightbt']").index(this);
	        	var obj1 = document.getElementsByName('cartNum');
	        	var obj2 = document.getElementsByName('countNum');
	        	var obj3 = document.getElementsByName('prodPrice');
	        	
	        	obj2[index].value =  parseInt(obj2[index].value) + 1;
	        	
	        	$.ajax({
	    			type: "POST",
	    			url:"<c:url value='/myPage/myCartUpdate'/>",
	    			data:{CART_NUM:obj1[index].value, PROD_COUNT:obj2[index].value},
	    			success: function(data){
	    				var sprice = obj2[index].value * obj3[index].value;
	    				var obj4 = $('span#sprice').eq(index);
	    				obj4.html('<b>'+AddComma(sprice)+' 원</b>');
	    				
	    			}	
	            });
	        })
	        
	        // 수량 감소
	        $("img[name='leftbt']").on('click', function() {
	        	var index = $("img[name='leftbt']").index(this);
	        	var obj1 = document.getElementsByName('cartNum');
	        	var obj2 = document.getElementsByName('countNum');
	        	var obj3 = document.getElementsByName('prodPrice');
	        	
	        	if (obj2[index].value > 1) {
	    			obj2[index].value =  parseInt(obj2[index].value) - 1;
	        	}
	    		
	    		$.ajax({
	    			type: "POST",
	    			url:"<c:url value='/myPage/myCartUpdate'/>",
	    			data:{CART_NUM:obj1[index].value, PROD_COUNT:obj2[index].value},
	    			success: function(data){
	    				var sprice = obj2[index].value * obj3[index].value;
	    				var obj4 = $('span#sprice').eq(index);
	    				obj4.html('<b>'+AddComma(sprice)+' 원</b>');
	    			}	
	            });
	        })
	        
	        // 개별 상품 삭제
	        $("img[name='xbt']").on('click', function() {
	        	var index = $("img[name='xbt']").index(this);
	        	var obj = document.getElementsByName('cartNum');
	        	
	        	$.ajax({
	    			type: "POST",
	    			url:"<c:url value='/myPage/myCartOneDelete'/>",
	    			data:{CART_NUM:obj[index].value},
	    			success: function(data){
	    				$('tr#tr1').eq(index).remove();
	    				$('tr#tr2').eq(index).remove();
	    				
	    				var cartDel1 = document.getElementsByName('cartDel1');
	    				var cartDel2 = document.getElementsByName('cartDel2');
	    				if (cartDel1.length == 0) {
	    					$('div#purchase').html("<br/><br/><br/><br/><div><center>장바구니에 담은 상품이 없습니다.</center></div><br/><br/><br/><br/><hr/><br/><br/>");
	    				}
						if (cartDel2.length == 0) {
							$('div#rental').html("<br/><br/><br/><br/><div><center>장바구니에 담은 상품이 없습니다.</center></div><br/><br/><br/><br/><hr/><br/><br/>");
	    				}
	    			}	
	            });
	        })
	        
	        // 구매 상품 삭제
	        $('button#allDelete1').on('click', function() {
	        	var cartNum = $("#table1 input[name=cartNum]");
	        	var cartNum2 = document.getElementsByName('cartNum');
	        	var table = $('#table1').find('input[name=cb1]').length;
	        	var success = table;
	        	var list = [];
	        	var index = [];
	        	var cartNum3 = [];
	        	
	        	for (var i = 0; i < cartNum2.length; i++){
	        		cartNum3.push(parseInt(cartNum2[i].value));
	        	}
	        	
	        	for (var i = 0; i < table; i++) {
	        		if($('input[name=cb1]').eq(i).prop("checked")){
			        	var cartNumber = parseInt(cartNum.eq(i).val());
			        	list.push({CART_NUM:cartNumber});
			        	index.push(cartNum3.indexOf(cartNumber));
			        	success = success - 1;
					}
				}
	        	
	        	$.ajax({
	    			type: "POST",
	    			url: "<c:url value='/myPage/myCartDelete'/>",
	    			data: JSON.stringify(list),
	    			contentType: 'application/json; charset=utf-8',
	    			success: function(data){
	    				if (success == 0) {
	    	        		$('div#purchase').html("<br/><br/><br/><br/><div><center>장바구니에 담은 상품이 없습니다.</center></div><br/><br/><br/><br/><hr/><br/><br/>");
	    	        	} else {
	    	        		for (var i = index.length - 1; i >= 0; i--) {
	    	        			$('tr#tr1').eq(index[i]).remove();
			    				$('tr#tr2').eq(index[i]).remove();
	    	        		}
	    	        	}
	    			}
	            });
	        })
	        
	        // 대여 상품 삭제
	        $('button#allDelete2').on('click', function() {
	        	var cartNum = $("#table2 input[name=cartNum]");
	        	var cartNum2 = document.getElementsByName('cartNum');
	        	var table = $('#table2').find('input[name=cb2]').length;
	        	var success = table;
	        	var list = [];
	        	var index = [];
	        	var cartNum3 = [];
	        	
	        	for (var i = 0; i < cartNum2.length; i++){
	        		cartNum3.push(parseInt(cartNum2[i].value));
	        	}
	        	
	        	for (var i = 0; i < table; i++) {
	        		if($('input[name=cb2]').eq(i).prop("checked")){
			        	var cartNumber = parseInt(cartNum.eq(i).val());
			        	list.push({CART_NUM:cartNumber});
			        	index.push(cartNum3.indexOf(cartNumber));
			        	success = success - 1;
					}
				}
	        	
	        	$.ajax({
	    			type: "POST",
	    			url: "<c:url value='/myPage/myCartDelete'/>",
	    			data: JSON.stringify(list),
	    			contentType: 'application/json; charset=utf-8',
	    			success: function(data){
	    				if (success == 0) {
	    	        		$('div#rental').html("<br/><br/><br/><br/><div><center>장바구니에 담은 상품이 없습니다.</center></div><br/><br/><br/><br/><hr/><br/><br/>");
	    	        	} else {
	    	        		for (var i = index.length - 1; i >= 0; i--) {
	    	        			$('tr#tr1').eq(index[i]).remove();
			    				$('tr#tr2').eq(index[i]).remove();
	    	        		}
	    	        	}
	    			}
	            });
	        })
	        
	        // 구매하기
	        $('button#nextbt').on('click', function() {
	        	
	        	location.href="../prod/order";
	        })
		})

        function Popup() { window.open("refundForm.jsp", "a", "width=700, height=500, left=100, top=50 , resizable=no"); }
		
		function AddComma(num) {
			var regexp = /\B(?=(\d{3})+(?!\d))/g;
			
			return num.toString().replace(regexp, ',');
		}
		
        </script>
</body>
</html>
