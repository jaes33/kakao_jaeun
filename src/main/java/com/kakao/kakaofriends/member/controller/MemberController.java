package com.kakao.kakaofriends.member.controller;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kakao.kakaofriends.member.model.service.MemberService;
import com.kakao.kakaofriends.member.model.vo.Member;

@Controller
@SessionAttributes(value={"loginMember"})
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping("/login")
	public String loginView() {
		return "member/login";
	}
	
	@RequestMapping("/signup")
	public String signupView() {
		return "member/signup";
	}
	
	@RequestMapping(value="/insertMember", method = RequestMethod.POST)
    public ModelAndView signup(@ModelAttribute Member member, HttpServletRequest request){
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("common/msg");
		
		Pattern pid = Pattern.compile("^[A-Za-z]{1}[A-Za-z0-9]{3,19}$");	// 아이디 정규표현식 검사
		Matcher mid = pid.matcher(member.getId());
		
		Pattern pPwd = Pattern.compile("^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$");	// 비밀번호 정규표현식 검사
		Matcher mPwd = pPwd.matcher(member.getPassword());
		
		if(mid.find() && mPwd.find() && idcheck(member.getId()) && (member.getPassword().equals(member.getPassword2()))) {
			PasswordEncoder pe = new BCryptPasswordEncoder();
	        
	        member.setPassword(pe.encode(member.getPassword()));	// 암호화 한 비밀번호를 member객체의 password에 저장

	        Member searchMember = memberService.selectMemberbyId(member.getId());
	        
	        if (searchMember == null){	// 입력한 아이디에 대한 정보가 null이라면(사용하지 않는 아이디 라면)
	        	member.setAddress(member.getRoadAddress()+"&"+member.getDetailAddress());	// 도로명 주소와 상세 주소를 '&' 기호로 구분하여 한 문자열로 저장
	        	memberService.insertMember(member);
	        }
	        	        
			mv.addObject("loc","/login");
		} else {
			mv.addObject("msg", "잘못된 접근입니다.");
			mv.addObject("loc", "/signup");
		}

        return mv;
    }
	
	@RequestMapping(value="/idcheck/{id}", method = RequestMethod.GET)
	@ResponseBody
	public boolean idcheck(@PathVariable(value = "id") String id) {
		boolean result = false;
		
		if(memberService.idcheck(id) != null) {
			result = false;
		} else {
			result = true;
		}
		
		return result;
	}
	
	@RequestMapping(value="/selectMember", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute Member member) {
		
		ModelAndView mv = new ModelAndView();
		
		PasswordEncoder pe = new BCryptPasswordEncoder();
		
		Member loginMember = memberService.selectMemberbyId(member.getId());
		
		mv.setViewName("common/msg");
		
		if(loginMember == null) {
			mv.addObject("msg","존재하지 않는 계정입니다.");
			mv.addObject("loc","/login");				
		} else {
			if(pe.matches(member.getPassword(), loginMember.getPassword())) {
				mv.addObject("loginMember", loginMember);
				mv.addObject("loc","/");
			} else {
				mv.addObject("msg","비밀번호를 다시 확인해주세요.");
				mv.addObject("loc","/login");
			}
		}
		
		return mv;
	}
	
	@RequestMapping("/signout")
	public String signout(SessionStatus status){				

		if (!status.isComplete()){
			status.setComplete();
		}
		
		return "redirect:/";
	}

}
