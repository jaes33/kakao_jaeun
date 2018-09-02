package com.kakao.kakaofriends.shop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.kakao.kakaofriends.member.model.vo.Member;
import com.kakao.kakaofriends.shop.model.service.ShopService;
import com.kakao.kakaofriends.shop.model.vo.Product;
import com.kakao.kakaofriends.shop.model.vo.Purchase;

@Controller
public class ShopController {
	
	@Autowired
	ShopService shopService;
	
	@RequestMapping("/shop")
	public String shop(Model model) {
		
		model.addAttribute("plist", shopService.shopList());
		
		return "shop/shop";
	}
	
	@RequestMapping("/shop/product/{pno}")
	public String detail(@PathVariable(value = "pno") int pno, Model model) {
	// 상품 디테일	
		model.addAttribute("product", shopService.oneProduct(pno));	// 상품 기본정보
		model.addAttribute("imgList", shopService.detailImgList(pno));	// 상품에 대한 사진 리스트
		
		return "shop/single-product";
	}
	
	@RequestMapping("/cart")
	public String cart(Model model, @SessionAttribute(value="loginMember", required=false) Member member) {
		
		model.addAttribute("clist", shopService.cartList(member.getId()));
		
		return "shop/cart";
	}
	
	@RequestMapping("/payList")
	public String payList(Model model, @SessionAttribute(value="loginMember", required=false) Member member){
		
		model.addAttribute("plist", shopService.payList(member.getId()));
		
		return "shop/payList";
	}
	
	@RequestMapping("/shop/addToCart/{pno}")
	public ModelAndView addToCart(@PathVariable(value = "pno") int pno, @SessionAttribute(value="loginMember", required=false) Member member) {
	// 장바구니에 추가
		ModelAndView mv = new ModelAndView();	
		
		mv.setViewName("common/msg");		
		
		if(member == null) {
			mv.addObject("msg","로그인을 해주세요.");
			mv.addObject("loc", "/login");
			
			return mv;
		}
		
		mv.addObject("loc", "/shop");
		
		Map<String, Object> hmap = new HashMap<String, Object>();
		
		hmap.put("pno", pno);
		hmap.put("id", member.getId());
		hmap.put("quantity", 1);
		
		Map<String, Object> findCart = shopService.findCart(hmap);	//장바구니에 이미 존재하는 상품인지 확인 
		
		if(findCart != null) {	// 장바구니에 이미 존재 한다면, 수량 +1
			if(shopService.updateToCart(hmap) == 1) {
				mv.addObject("msg","장바구니에 추가되었습니다.");						
			} else {
				mv.addObject("msg","실패! 관리자에게 문의하세요.");
			}
		} else {	// 장바구니에 존재하지 않으면 새로 추가
			if(shopService.addToCart(hmap) == 1) {
				mv.addObject("msg","장바구니에 추가되었습니다.");						
			} else {
				mv.addObject("msg","실패! 관리자에게 문의하세요.");
			}
		}				
		
		return mv;
	}
	
	@RequestMapping("/shop/addToCart/{pno}/{quantity}")
	@ResponseBody
	public boolean addToCart(@PathVariable(value = "pno") int pno, @PathVariable(value = "quantity") int quantity, @SessionAttribute(value="loginMember") Member member){	
		
		boolean result = false;
		
		Map<String, Object> hmap = new HashMap<String, Object>();
		
		hmap.put("pno", pno);
		hmap.put("id", member.getId());
		hmap.put("quantity", quantity);
		
		Map<String, Object> findCart = shopService.findCart(hmap);	//장바구니에 이미 존재하는 상품인지 확인 
		
		if(findCart != null) {	// 장바구니에 이미 존재 한다면, 수량 +quantity
			if(shopService.updateToCart(hmap) == 1) {
				result = true;						
			}
		} else {	// 장바구니에 존재하지 않으면 새로 추가
			if(shopService.addToCart(hmap) == 1) {
				result = true;						
			}
		}				
		
		return result;
	}
	
	@RequestMapping("/deleteFromCart/{pno}")
	public ModelAndView deleteFromCart(@PathVariable(value = "pno") int pno, @SessionAttribute(value="loginMember") Member member) {
	// 장바구니에서 상품 삭제	
		ModelAndView mv = new ModelAndView();	
		
		mv.setViewName("common/msg");				
		mv.addObject("loc", "/cart");
		
		Map<String, Object> hmap = new HashMap<String, Object>();
		
		hmap.put("pno", pno);
		hmap.put("id", member.getId());
		
		if(shopService.deleteFromCart(hmap) == 1) {
			mv.addObject("msg","장바구니에서 삭제되었습니다.");						
		} else {
			mv.addObject("msg","실패! 관리자에게 문의하세요.");
		}
		
		return mv;
	}
	
	@RequestMapping(value="/purchase", method = RequestMethod.POST)
	public String purchaseBycart(@RequestParam(value="pno", required=false) List<Integer> pno, @SessionAttribute(value="loginMember") Member member, Model model){
	// 장바구니에서 결제페이지로 이동하는 메소드
		Map<String, Object> hmap = new HashMap<String, Object>();
		
		hmap.put("pno", pno);
		hmap.put("id", member.getId());
		
		model.addAttribute("plist", shopService.purchaseBycart(hmap));
		
		return "shop/purchase";
	}
	
	@RequestMapping(value="/purchase/{pno}/{quantity}", method = RequestMethod.GET)
	public String purchaseByDetail(@PathVariable(value = "pno") int pno, @PathVariable(value = "quantity") int quantity, @SessionAttribute(value="loginMember") Member member, Model model){
	// 장바구니에서 결제페이지로 이동하는 메소드
		Map<String, Object> hmap = new HashMap<String, Object>();
		
		hmap.put("pno", pno);
		hmap.put("id", member.getId());
		
		Map<String, Object> pmap = new HashMap<String, Object>();				
		
		pmap = shopService.purchaseByDetail(hmap);
		
		pmap.put("QUANTITY", quantity);
		
		model.addAttribute("pmap", pmap);
		
		return "shop/purchase";
	}
	
	@RequestMapping(value="/purchase/payment", method = RequestMethod.POST)
	public String payment(@ModelAttribute Purchase purchase, @SessionAttribute(value="loginMember") Member member, Model model) {
	// 결제
		purchase.setAddress(purchase.getRoadAddress()+" "+purchase.getDetailAddress());
		
		purchase.setId(member.getId());
		
		int amount = 0;
		int pid = 0;
		
		for(int i = 0; i < purchase.getPno().length; i++) {
			Product product = shopService.oneProduct(purchase.getPno()[i]);	// 사용자가 임의로 가격을 바꿀 수 있기에 가격정보는 db에서 직접 가져온다.
			amount += product.getPrice() * purchase.getQuantity()[i]; 
		}		
		
		purchase.setAmount(amount);
		
		pid = shopService.paymentInf(purchase);
		
		if(pid > 0) {	// 결제를 성공적으로 마치면 장바구니에서 해당 내역을 지워준다.
			Map<String, Object> hmap = new HashMap<String, Object>();			
			hmap.put("id", member.getId());
			
			for(int i = 0; i < purchase.getPno().length; i++) {
				hmap.put("pno", purchase.getPno()[i]);
				shopService.deleteFromCart(hmap);
			}			
		}
		
		model.addAttribute("plist", shopService.paySuccessList(pid));
		
		return "shop/paymentSuccess";
	}
	
}
