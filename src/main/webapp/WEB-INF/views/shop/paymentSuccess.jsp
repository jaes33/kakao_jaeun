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
					<h2>Purchase</h2>
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
					<h2 style="color:#3C1E1E; font-size: 35px; margin-bottom: 25px;">결제 완료</h2>	
					<div class="woocommerce">														
						<table cellspacing="0" class="shop_table cart">
							<thead>
								<tr>																				
									<th colspan="2" class="product-name">상품</th>
									<th class="product-price">가격</th>
									<th class="product-quantity">수량</th>
									<th class="product-subtotal">총 가격</th>										
								</tr>
							</thead>
							<tbody>
							<c:forEach var="l" items="${plist}">
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
							</c:forEach>
								<tr>
									<th colspan="4">결제 금액</th>
									<td><fmt:formatNumber value="${total}" pattern="￦#,###.##"/></td>
								</tr>
							</tbody>
						</table>					
					</div>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>
</div>

<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>