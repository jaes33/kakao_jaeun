package com.kakao.kakaofriends.home.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kakao.kakaofriends.home.model.dao.HomeDao;
import com.kakao.kakaofriends.shop.model.vo.Product;

@Service
public class HomeServiceImpl implements HomeService{
	
	@Autowired
	HomeDao homeDao;

	@Override
	public List<Product> newList() {
		return homeDao.newList();
	}

}
