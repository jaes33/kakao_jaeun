package com.kakao.kakaofriends.member.model.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kakao.kakaofriends.member.model.vo.Member;

@Repository
@Mapper
public interface MemberDao {

	Member selectMemberbyId(String id);

	int insertMember(Member member);

	Member selectMember(Member member);

	Member idcheck(String id);
	
}
