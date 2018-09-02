package com.kakao.kakaofriends.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kakao.kakaofriends.member.model.dao.MemberDao;
import com.kakao.kakaofriends.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberDao memberDao;

	@Override
	public Member selectMemberbyId(String id) {
		return memberDao.selectMemberbyId(id);
	}

	@Override
	public int insertMember(Member member) {
		return memberDao.insertMember(member);
	}

	@Override
	public Member selectMember(Member member) {
		return memberDao.selectMember(member);
	}

	@Override
	public Member idcheck(String id) {
		return memberDao.idcheck(id);
	}

}
