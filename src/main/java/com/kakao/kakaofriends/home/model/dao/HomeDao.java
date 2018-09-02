package com.kakao.kakaofriends.home.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kakao.kakaofriends.shop.model.vo.Product;

@Repository
@Mapper
public interface HomeDao {

	List<Product> newList();

}
