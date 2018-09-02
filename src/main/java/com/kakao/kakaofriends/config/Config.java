package com.kakao.kakaofriends.config;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import com.kakao.kakaofriends.interceptor.CertificationInterceptor;

@Configuration
public class Config extends WebMvcConfigurerAdapter {
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		List<String> list = new ArrayList<String>();
		
		// 로그인 후에 사용해야 하는 기능에 대한 인터셉터 적용
		list.add("/**/cart*");
		list.add("/**/payList*");
		list.add("/**/purchase*");
		list.add("/**/addToCart*");
		list.add("/**/deleteFromCart*");
		
		registry.addInterceptor(new CertificationInterceptor()).addPathPatterns(list);
	}
}
