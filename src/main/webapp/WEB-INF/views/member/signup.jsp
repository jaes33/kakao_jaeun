<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="/WEB-INF/views/common/header.jsp"></c:import>

<div class="limiter">
	<div class="container-login100">
		<div class="wrap-login100" style="width: 1000px">
			<div class="login100-pic js-tilt" data-tilt>
				<img
					src="${pageContext.request.contextPath}/resources/img/img-02.png" />
			</div>

			<form class="login100-form validate-form"
				action="${pageContext.request.contextPath}/insertMember"
				method="post"
				onsubmit="return validate();">
				<span class="login100-form-title"
					style="padding-bottom: 20px; padding-top: 50px;"> Member
					Sign up </span>

				<div class="wrap-input100 validate-input">
					<input class="input100" type="text" name="id" placeholder="아이디"
						required> <span class="focus-input100"></span> <small
						class="pull-right" id="idreg" style="color: red; display: none">아이디
						형식 오류.</small> <small class="pull-right" id="idable"
						style="color: green; display: none">사용 가능한 아이디 입니다.</small> <small
						class="pull-right" id="iddisable"
						style="color: red; display: none">사용 불가능한 아이디 입니다.</small>
				</div>

				<div class="wrap-input100 validate-input">
					<input class="input100" type="password" name="password"
						placeholder="비밀번호" required> <small class="pull-right"
						id="pwdreg" style="color: red; display: none">비밀번호 형식 오류.</small>
					<span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input">
					<input class="input100" type="password" name="password2"
						placeholder="비밀번호 확인" required> <span
						class="focus-input100"></span> <small class="pull-right"
						id="pwdisable" style="color: red; display: none">비밀번호가 불일치
						합니다.</small> <small class="pull-right" id="pwable"
						style="color: green; display: none">비밀번호가 일치 합니다.</small>
				</div>

				<div class="wrap-input100 validate-input">
					<input class="input100" type="text" name="name" placeholder="이름"
						required> <span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input">
					<input class="input100" type="text" name="nickname"
						placeholder="닉네임" required> <span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input">
					<input class="input100" type="text" name="phone"
						placeholder="연락처 ('-'없이 입력)" required> <span
						class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input"
					style="width: 58%; display: inline-block;">
					<input class="input100" type="text" name="postcode" id="postcode"
						placeholder="우편번호" style="display: inline-block;" required>
					<span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input"
					style="width: 40%; display: inline-block;">
					<button class="login100-form-btn" type="button"
						onclick="execDaumPostcode()"
						style="background-color: #FFEE33; color: #3C1E1E">
						<b>주소검색</b>
					</button>
				</div>

				<div class="wrap-input100 validate-input">
					<input class="input100" type="text" name="roadAddress"
						id="roadAddress" placeholder="주소" required> <span
						class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input">
					<input class="input100" type="text" name="detailAddress"
						placeholder="상세주소"> <span class="focus-input100"></span>
				</div>

				<div class="container-login100-form-btn" style="padding-top: 0px;">
					<button class="btnInsert" type="submit" style="background: none;">
						<img
							src="${pageContext.request.contextPath}/resources/img/kakao_login_btn_medium2.png"
							style="width: 121px; height: 49px" />
					</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
var pw_reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
var id_reg = /^[A-Za-z]{1}[A-Za-z0-9]{3,19}$/;
var pwCheck = false;
var idPatCheck = false;
var idValCheck = false;
$(function(){
     $("input[name=id]").keyup(function(e){
     var id = this.value;
     if( this.value.length == 0){
    	$("#idable").css("display", "none");
        $("#iddisable").css("display", "none");
        $("#idreg").css("display", "none");
     } else {
     
     if( !id_reg.test(id) ) {
    	$("#idable").css("display", "none");
    	$("#idreg").css("display", "block");
        $("#iddisable").css("display", "none");
        return;
     } else {
        $("#idreg").css("display", "none");
        $("#idable").css("display", "none");
        $("#iddisable").css("display", "none");
        idPatCheck = true;
     }
     
     $.get("/kakaofriends/idcheck/" + id, function(result){
    	 console.log(result);
        if(result){
        	$("#idable").css("display", "block");
            $("#iddisable").css("display", "none");
            idValCheck = true;
        } else {
        	$("#idable").css("display", "none");
        	$("#iddisable").css("display", "block");
        }
     });
     }
  });
  
  $("input[name=password]").keyup(function(e){

     if(this.value.length != 0){
        if (!pw_reg.test(this.value))
           $("#pwdreg").css("display", "inline");
        else {
           $("#pwdreg").css("display", "none");
        }
     } else {
        $("#pwdreg").css("display", "none");
     }
  
     $("input[name=password2]").val("");
     $("#pwable").css("display", "none");
     $("#pwdisable").css("display", "none");
  });
  
  $("input[name=password2]").keyup(function(e){
     var passwd = $("input[name=password]").val();
     var passwd2 = this.value;
     var password = $("input[name=password]");
     if ( $("#pwdreg").css("display") != "none") {
        password.focus();
     }
     
     if( this.value.length == 0){
        $("#pwable").css("display", "none");
        $("#pwdisable").css("display", "none");
     } else {
     if ( passwd == passwd2 ) {
        $("#pwdisable").css("display", "none");
        $("#pwable").css("display", "inline");
        pwCheck = true;
     }
     else {
        $("#pwable").css("display", "none");
        $("#pwdisable").css("display", "inline");
     }
     }
     
  });
});

function validate(){
	if ( !idPatCheck ){
		alert("올바른 아이디를 입력하세요");
		return false;
	}
	if ( !idValCheck ){
		alert("이미 존재하는 아이디 입니다");
		return false;
	}
	if ( !pwCheck ) {
		alert("동일한 비밀번호를 입력하세요");
		return false;
	}
	
	return true;
} 

</script>
	
	<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>