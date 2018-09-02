package com.kakao.kakaofriends.shop.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kakao.kakaofriends.shop.model.dao.ShopDao;
import com.kakao.kakaofriends.shop.model.vo.Product;
import com.kakao.kakaofriends.shop.model.vo.Purchase;

@Service
public class ShopServiceImpl implements ShopService{
	
	@Autowired
	ShopDao shopDao;

	@Override
	public List<Product> shopList() {
		return shopDao.shopList();
	}

	@Override
	public Product oneProduct(int pno) {
		return shopDao.oneProduct(pno);
	}

	@Override
	public List<String> detailImgList(int pno) {
		return shopDao.detailImgList(pno);
	}

	@Override
	public Map<String, Object> findCart(Map<String, Object> hmap) {
		return shopDao.findCart(hmap);
	}

	@Override
	public int updateToCart(Map<String, Object> hmap) {
		return shopDao.updateToCart(hmap);
	}

	@Override
	public int addToCart(Map<String, Object> hmap) {
		return shopDao.addToCart(hmap);
	}

	@Override
	public List<Map<String, Object>> cartList(String id) {
		return shopDao.cartList(id);
	}

	@Override
	public int deleteFromCart(Map<String, Object> hmap) {
		return shopDao.deleteFromCart(hmap);
	}

	@Override
	public List<Map<String, Object>> purchaseBycart(Map<String, Object> hmap) {
		return shopDao.purchaseBycart(hmap);
	}

	@Override
	public int paymentInf(Purchase purchase) {
		int result = 0; 
		
		result = shopDao.paymentInf(purchase);
		
		if(result > 0){			
			Map<String, Object> hmap = new HashMap<String, Object>();
			
			hmap.put("pid", purchase.getPid());
			
			for(int i = 0; i < purchase.getPno().length; i++) {
				hmap.put("pno", purchase.getPno()[i]);
				hmap.put("quantity", purchase.getQuantity()[i]);
				
				shopDao.paymentList(hmap);									
			}
		}
		
		return purchase.getPid();
	}

	@Override
	public List<Map<String, Object>> paySuccessList(int pid) {
		return shopDao.paySuccessList(pid);
	}

	@Override
	public Map<String, Object> purchaseByDetail(Map<String, Object> hmap) {
		return shopDao.purchaseByDetail(hmap);
	}

	@Override
	public List<Map<String, Object>> payList(String id) {
		return shopDao.payList(id);
	}

}
