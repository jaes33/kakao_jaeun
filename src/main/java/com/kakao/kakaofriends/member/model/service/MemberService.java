package com.kakao.kakaofriends.member.model.service;

import com.kakao.kakaofriends.member.model.vo.Member;

public interface MemberService {
	
	Member selectMemberbyId(String id);

	int insertMember(Member member);

	Member selectMember(Member member);

	Member idcheck(String id);

}
