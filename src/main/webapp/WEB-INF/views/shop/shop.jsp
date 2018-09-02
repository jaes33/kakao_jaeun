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
            	<c:forEach var="l" items="${plist}">
                <div class="col-md-3 col-sm-6" style="text-align: center;">
                    <div class="single-shop-product">
                        <div class="product-upper">
                        	<a href="/kakaofriends/shop/product/${l.pno}">
                            	<img src="${pageContext.request.contextPath}/resources/img/productImg/${l.image}" style="width:240px; height:240px">
                            </a>
                        </div>
                        <h2><a href="/kakaofriends/shop/product/${l.pno}">${l.pname}</a></h2>
                        <div class="product-carousel-price">
                            <ins><fmt:formatNumber value="${l.price}" pattern="￦#,###.##"/></ins>
                        </div>  
                        
                        <div class="product-option-shop">
                            <a href="/kakaofriends/shop/addToCart/${l.pno}"><span class="glyphicon glyphicon-shopping-cart"></span></a>
                        </div>                       
                    </div>
                </div>
                </c:forEach>
            </div>            
        </div>
    </div>
    
    <script>
		$(document).ready(function(){ 
			$('#homenav').removeClass('active');
			$('#shopnav').addClass('active');
		});
    </script>

	<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>