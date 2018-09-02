<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="/WEB-INF/views/common/header.jsp"></c:import>

<div class="product-big-title-area">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="product-bit-title text-center">
					<h2>Purchase History</h2>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End Page title area -->

<div class="single-product-area">
	<div class="zigzag-bottom"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="product-content-right">
					<div class="woocommerce">
						<form method="post" action="/kakaofriends/purchase" id="cart_frm">
						<c:set var="total" value="0"/>
						<c:set var="pro_cnt" value="0"/>
						<c:set var="nowdate_flag" value="0"/>
						<c:set var="nextdate" value="0"/>
						<c:forEach var="l" items="${plist}" varStatus="status">	
							<c:set var="pro_cnt" value="${pro_cnt+1}"/>	
							<c:if test="${pro_cnt < fn:length(plist)}">
								<c:set var="nextdate" value = "${plist[status.index+1].PDATE}" />
							</c:if>																													
							<c:if test="${nowdate ne l.PDATE}">
							<c:set var="nowdate_flag" value="1"/>
							<table cellspacing="0" class="shop_table cart">
							<c:set var="nowdate" value="${l.PDATE}"/>
							<caption style="text-align:left">주문 일 : ${l.PDATE}</caption>
								<thead>
									<tr>																				
										<th colspan="2" class="product-name">상품</th>
										<th class="product-price">가격</th>
										<th class="product-quantity">수량</th>
										<th class="product-subtotal">총 가격</th>										
									</tr>
								</thead>
								<tbody>
							</c:if>														
								<c:if test="${nowdate eq l.PDATE}">						
									<tr class="cart_item">
										<td class="product-thumbnail"><a
											href="/kakaofriends/shop/product/${l.PNO}"><img width="145" height="145"
												alt="poster_1_up" class="shop_thumbnail"
												src="${pageContext.request.contextPath}/resources/img/productImg/${l.IMAGE}"></a></td>
	
										<td class="product-name"><a href="/kakaofriends/shop/product/${l.PNO}">${l.PNAME}</a></td>
										<td class="product-price"><span class="amount"><fmt:formatNumber value="${l.PRICE}" pattern="￦#,###.##"/></span>
										</td>
	
										<td class="product-quantity">
											<div class="quantity buttons_added">
												${l.QUANTITY}
											</div>
										</td>
	
										<td class="product-subtotal">
											<span class="amount"><fmt:formatNumber value="${l.PRICE * l.QUANTITY}" pattern="￦#,###.##"/></span>
										</td>
										<c:set var="total" value="${(l.PRICE * l.QUANTITY) + total}"/>
									</tr>
								</c:if>
								<c:if test="${(nowdate ne nextdate) or (pro_cnt eq fn:length(plist))}">	
								
									<tr>
										<th colspan="4">결제 금액</th>
										<td><fmt:formatNumber value="${total}" pattern="￦#,###.##"/></td>
									</tr>
									</tbody>
									</table>
									<c:set var="total" value="0"/>
									<c:set var="nowdate_flag" value="0" />	
								</c:if>							
								
													
							</c:forEach>
						</form>						
					</div>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>
</div>

<script>
	$('#doPayment_btn').on('click', function(){
		var chkbox = document.getElementsByName('pno'); 
		var chk = false; 
		
		for(var i=0 ; i<chkbox.length ; i++) { 
			if(chkbox[i].checked) { 
				chk = true;	/* 한개라도 체크된 항목이 있으면 true */
				break;
			} else { 
				chk = false; /* 체크된 항목이 없으면 false */
			} 
		} 
		
		if(chk) { /* 체크된 항목이 있을 경우에만 submit action */
			$('#cart_frm').submit();
		} else { 
			alert("구입할 상품을 선택해주세요."); 
		}
	});
</script>

<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>