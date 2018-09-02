package com.kakao.kakaofriends.shop.model.service;

import java.util.List;
import java.util.Map;

import com.kakao.kakaofriends.shop.model.vo.Product;
import com.kakao.kakaofriends.shop.model.vo.Purchase;

public interface ShopService {

	List<Product> shopList();

	Product oneProduct(int pno);

	List<String> detailImgList(int pno);

	Map<String, Object> findCart(Map<String, Object> hmap);

	int updateToCart(Map<String, Object> hmap);
	
	int addToCart(Map<String, Object> hmap);

	List<Map<String, Object>> cartList(String id);

	int deleteFromCart(Map<String, Object> hmap);

	List<Map<String, Object>> purchaseBycart(Map<String, Object> hmap);

	int paymentInf(Purchase purchase);

	List<Map<String, Object>> paySuccessList(int pid);

	Map<String, Object> purchaseByDetail(Map<String, Object> hmap);

	List<Map<String, Object>> payList(String id);

}
