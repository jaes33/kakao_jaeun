package com.kakao.kakaofriends.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.util.ObjectUtils;
import org.springframework.web.servlet.HandlerInterceptor;

import com.kakao.kakaofriends.member.model.vo.Member;

@Component
public class CertificationInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		 
		// session에 로그인 회원에 대한 정보가 없다면 로그인 화면으로
		 HttpSession session = request.getSession();
	        Member loginMember = (Member) session.getAttribute("loginMember");
	 
	        if(ObjectUtils.isEmpty(loginMember)){
	            response.sendRedirect("/kakaofriends/login");
	            return false;
	        }else{
	            session.setMaxInactiveInterval(30*60);
	            return true;
	        }
	}	
		
}
