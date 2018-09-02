<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="/WEB-INF/views/common/header.jsp"></c:import>

	<div class="limiter">
		<div class="container-login100" style="min-height: 70vh;">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt" data-tilt>
					<img src="${pageContext.request.contextPath}/resources/img/img-01.png" alt="IMG">
				</div>

				<form class="login100-form validate-form" action="${pageContext.request.contextPath}/selectMember" method="post">
					<span class="login100-form-title">
						Member Login
					</span>

					<div class="wrap-input100 validate-input">
						<input class="input100" type="text" name="id" placeholder="아이디" required />
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input">
						<input class="input100" type="password" name="password" placeholder="비밀번호" required />
						<span class="focus-input100"></span>
					</div>
					
					<div class="container-login100-form-btn">
						<button class="">
							<img src="${pageContext.request.contextPath}/resources/img/kakao_login_btn_medium.png" alt="" />
						</button>
					</div>

					<div class="text-center p-t-10">
						<a class="txt2" href="/kakaofriends/signup">
							Create your Account
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>