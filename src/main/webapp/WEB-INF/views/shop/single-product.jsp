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
					<h2>Shop</h2>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="single-product-area">
	<div class="zigzag-bottom"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="product-content-right">
					<div class="product-breadcroumb">
						<a href="/kakaofriends/shop">Shop</a><a>${product.pname}</a>
					</div>

					<div class="row">
						<div class="col-sm-6">
							<div class="product-images">
								<div class="product-main-img">
									<img src="${pageContext.request.contextPath}/resources/img/productDetailImg/${imgList[0]}" style="width:500px; height:400px">
								</div>
							</div>
						</div>

						<div class="col-sm-6">
							<div class="product-inner">
								<h2 class="product-name">${product.pname}</h2>
								<div class="product-inner-price">
									<ins><fmt:formatNumber value="${product.price}" pattern="￦#,###.##"/></ins>									
								</div>

								<form action="" class="cart">
									<div class="quantity">
										<input type="number" size="4" class="input-text qty text"
											title="Qty" value="1" id="quantity" min="1" step="1">
									</div>
									<button class="add_to_cart_button" id="cart_btn" type="button">장바구니</button>
									<button class="add_to_cart_button" id="purchase_btn" type="button">구매하기</button>
								</form>
								
								<hr />
								
								<div>									
									<p>${product.intro}</p>								
								</div>								
							</div>
						</div>
					</div>
					
					<hr />
						
					<c:forEach var="l" items="${imgList}">
					<div class="row" style="text-align:center;">
						<div class="col-sm-12">
							<img src="${pageContext.request.contextPath}/resources/img/productDetailImg/${l}" style="max-width:1000px; max-height:770px" />
						</div>
					</div>	
					</c:forEach>				
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function(){ 
		$('#homenav').removeClass('active');
		$('#shopnav').addClass('active');
	});
	
	$('#cart_btn').on('click', function(){
		var pno = '${product.pno}';
		var quantity = $('#quantity').val();
		
		if('${loginMember}' == '') {
			var check = confirm("로그인 후에 사용 가능합니다. \n로그인 하시겠습니까 ?");
			if(check) {
				location.href="/kakaofriends/login";
			}
		} else {
			$.ajax({
				url: '/kakaofriends/shop/addToCart/'+pno+'/'+quantity,
				success : function(result) {
					check = confirm("장바구니에 추가되었습니다. \n장바구니로 이동 하시겠습니까 ?");
					if(check) {
						location.href="/kakaofriends/cart";
					}
			    }
			});
		}
	});
	
	$('#purchase_btn').on('click', function(){
		var pno = '${product.pno}';
		var quantity = $('#quantity').val();
		
		if('${loginMember}' == '') {
			var check = confirm("로그인 후에 사용 가능합니다. \n로그인 하시겠습니까 ?");
			if(check) {
				location.href="/kakaofriends/login";
			} 
		} else {
			location.href="/kakaofriends/purchase/"+pno+"/"+quantity;
		}
	});
</script>

<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>