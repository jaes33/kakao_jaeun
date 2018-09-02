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
					<h2 style="color:#3C1E1E; font-size: 25px; margin-bottom: 25px; text-transform: uppercase;">Products</h2>	
					<div class="woocommerce">
					<form action="/kakaofriends/purchase/payment" method="post">									
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
							<c:if test="${!empty plist}">
							<c:forEach var="l" items="${plist}">
								<tr class="cart_item">
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

									<td class="product-subtotal">
										<span class="amount"><fmt:formatNumber value="${l.PRICE * l.QUANTITY}" pattern="￦#,###.##"/></span>
									</td>
									<c:set var="total" value="${(l.PRICE * l.QUANTITY) + total}"/>
								</tr>
								<input type="hidden" name="pno" value="${l.PNO}"/>	
								<input type="hidden" name="quantity" value="${l.QUANTITY}"/>								
							</c:forEach>
							</c:if>
							<c:if test="${!empty pmap}">
								<tr class="cart_item">
									<td class="product-thumbnail"><a
										href="single-product.html"><img width="145" height="145"
											alt="poster_1_up" class="shop_thumbnail"
											src="${pageContext.request.contextPath}/resources/img/productImg/${pmap.IMAGE}"></a></td>

									<td class="product-name"><a href="single-product.html">${pmap.PNAME}</a></td>

									<td class="product-price"><span class="amount"><fmt:formatNumber value="${pmap.PRICE}" pattern="￦#,###.##"/></span>
									</td>

									<td class="product-quantity">
										<div class="quantity buttons_added">
											${pmap.QUANTITY}
										</div>
									</td>

									<td class="product-subtotal">
										<span class="amount"><fmt:formatNumber value="${pmap.PRICE * pmap.QUANTITY}" pattern="￦#,###.##"/></span>
									</td>
									<c:set var="total" value="${(pmap.PRICE * pmap.QUANTITY) + total}"/>
								</tr>
								<input type="hidden" name="pno" value="${pmap.PNO}"/>	
								<input type="hidden" name="quantity" value="${pmap.QUANTITY}"/>	
							</c:if>
							</tbody>
						</table>
						
						<div class="cart-collaterals">							
							<div class="cart_totals" style="width:100%">
								<h2 style="color:#3C1E1E">배송지 정보</h2>
								<table cellspacing="0">
									<tbody>
										<tr>
											<th style="width:30%">이름</th>
											<td><input class="form-control" name="name" type="text" required/></td>
										</tr>

										<tr>
											<th style="width:30%">연락처</th>
											<td><input class="form-control" name="phone" type="text" placeholder="('-'없이 입력)" required/></td>
										</tr>

										<tr>
											<th style="width:30%">주소</th>
											<td>
												<input class="form-control" id="postcode" name="postcode" type="text" style="width:20%; display:inline-block; margin-bottom:5px;" required/>
												<button type="button" class="btn" onclick="execDaumPostcode()" style="background-color:#3C1E1E; color:#ffd900; width:15%; display:inline-block; margin-bottom:5px;">
													주소검색
												</button>
												<input class="form-control" id="roadAddress" name="roadAddress" type="text" style="margin-bottom:5px;" required/>
												<input class="form-control" name="detailAddress" type="text" placeholder="상세주소"/>
											</td>
										</tr>
										
										<tr>
											<th style="width:30%">배송 요청사항</th>
											<td><input class="form-control" type="text" /></td>
										</tr>
										
									</tbody>
								</table>
							</div>						
						</div>

						<div class="cart-collaterals">							
							<div class="cart_totals" style="width:100%">
								<h2 style="color:#3C1E1E">Totals</h2>
								<table cellspacing="0">
									<tbody>
										<tr class="cart-subtotal">
											<th style="width:30%">총 금액</th>
											<td style="text-align:center"><span class="amount">${total}</span></td>
										</tr>

										<tr class="shipping">
											<th style="width:30%">배송비</th>
											<td style="text-align:center">0</td>
										</tr>

										<tr class="order-total">
											<th style="width:30%">결제 금액</th>
											<td style="text-align:center"><strong><span class="amount">${total}</span></strong>
											</td>
										</tr>
									</tbody>
								</table>
							</div>						
						</div>
						<div class="pull-right">
							<button type="submit" class="btn btn-lg" style="background-color:#3C1E1E; color:#ffd900;">
								결제하기
							</button>
						</div>
					</form>
					</div>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>
</div>

<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>