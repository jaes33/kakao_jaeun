package com.kakao.kakaofriends.home.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kakao.kakaofriends.home.model.service.HomeService;

@Controller
public class HomeController {
	
	@Autowired
	HomeService homeService;
	
	@RequestMapping(value="/")
	public String home(Model model) {
		model.addAttribute("newList", homeService.newList());	// 최근 등록 순으로 7개만 list에 담아 넘겨줌
		return "index";
	}
	
}
