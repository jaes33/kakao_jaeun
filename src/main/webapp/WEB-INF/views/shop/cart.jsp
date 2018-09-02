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
					<h2>Shopping Cart</h2>
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
							<table cellspacing="0" class="shop_table cart">
								<thead>
									<tr>
										<th class="product-check"></th>																				
										<th colspan="2" class="product-name">상품</th>
										<th class="product-price">가격</th>
										<th class="product-quantity">수량</th>
										<th class="product-subtotal">총 가격</th>
										<th class="product-remove"></th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="l" items="${clist}">
									<tr class="cart_item">
										<td class="deleteCkbox">
											<div class="ckbox">
												<input type="checkbox" name="pno" value="${l.PNO}"> 												
											</div>
										</td>
										<td class="product-thumbnail"><a
											href="single-product.html"><img width="145" height="145"
												alt="poster_1_up" class="shop_thumbnail"
												src="${pageContext.request.contextPath}/resources/img/productImg/${l.IMAGE}"></a></td>

										<td class="product-name"><a href="single-product.html">${l.PNAME}</a></td>

										<td class="product-price"><span class="amount"><fmt:formatNumber value="${l.PRICE}" pattern="￦#,###.##"/></span>
										</td>

										<td class="product-quantity">
											<div class="quantity buttons_added">
												${l.QUANTITY}
											</div>
										</td>
																				
										<td class="product-subtotal"><span class="amount"><fmt:formatNumber value="${l.PRICE * l.QUANTITY}" pattern="￦#,###.##"/></span>
										</td>
										
										<td>
											<a type="button" class="btn btn-danger" href="/kakaofriends/deleteFromCart/${l.PNO}">삭제</a>
										</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
							<button type="button" class="btn pull-right" id="doPayment_btn" style="background:#3C1E1E; color:#ffd900;">결제하기</button>
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
				chk = true;
				break;
			} else { 
				chk = false; 
			} 
		} 
		
		if(chk) { 
			$('#cart_frm').submit();
		} else { 
			alert("구입할 상품을 선택해주세요."); 
		}
	});
</script>

<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>