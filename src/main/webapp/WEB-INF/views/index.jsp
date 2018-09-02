<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
    
    <div class="slider-area">
        	<!-- Slider -->
			<div class="block-slider block-slider4">
				<ul class="" id="bxslider-home4">
					<li>
						<img src="${pageContext.request.contextPath}/resources/img/h4-slide.png" alt="Slide">						
					</li>
					<li>
						<img src="${pageContext.request.contextPath}/resources/img/h4-slide2.png" alt="Slide">
					</li>
					<li>
						<img src="${pageContext.request.contextPath}/resources/img/h4-slide3.png" alt="Slide">
					</li>
					<li>
						<img src="${pageContext.request.contextPath}/resources/img/h4-slide4.png" alt="Slide">						
					</li>
				</ul>
			</div>
			<!-- ./Slider -->
    </div> <!-- End slider area -->
    
    <div class="promo-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6">                    
					<img src="${pageContext.request.contextPath}/resources/img/main_1.jpg" />                    
                </div>
                <div class="col-md-3 col-sm-6">                    
					<img src="${pageContext.request.contextPath}/resources/img/main_2.jpg" />
                </div>
                <div class="col-md-3 col-sm-6">
					<img src="${pageContext.request.contextPath}/resources/img/main_3.jpg" />
                </div>
                <div class="col-md-3 col-sm-6">
					<img src="${pageContext.request.contextPath}/resources/img/main_4.jpg" />
                </div>
            </div>
        </div>
    </div> <!-- End promo area -->
    
    <div class="maincontent-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="latest-product">
                        <h2 class="section-title">New Products</h2>
                        <div class="product-carousel">
                        <c:forEach var="l" items="${newList}">
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="${pageContext.request.contextPath}/resources/img/productImg/${l.image}">
                                    <div class="product-hover">                                        
                                        <a href="/kakaofriends/shop/product/${l.pno}" class="view-details-link"><i class="fa fa-link"></i>자세히 보기</a>
                                    </div>
                                </div>
                                
                                <h2><a href="/kakaofriends/shop/product/${l.pno}">${l.pname}</a></h2>
                                
                                <div class="product-carousel-price">
                                    <ins><fmt:formatNumber value="${l.price}" pattern="￦#,###.##"/></ins>
                                </div> 
                            </div>
                        </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End main content area -->    
    
    <script>
		$(document).ready(function(){ 
			$('#shopnav').removeClass('active');
			$('#homenav').addClass('active');
		});
    </script>
    
    <c:import url="/WEB-INF/views/common/footer.jsp"></c:import>