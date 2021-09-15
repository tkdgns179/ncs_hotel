package com.hotel.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotel.common.ExistingMemberException;
import com.hotel.mapper.MemberMapper;
import com.hotel.vo.Member;

@Service
public class MemberService {
	
	@Autowired
	private MemberMapper memberMapper;
	
	/**
	 * 회원가입시 회원을 추가하는 서비스 메소드
	 * 중복회원 존재시 예외처리
	 * 
	 * @author 김상훈
	 * @param member
	 */
	@Transactional
	public void addCheckedMember(Member member) {
		
//		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		int checkVal = memberMapper.doCheckUser(member);
		if (checkVal == 1) {
			throw new ExistingMemberException("already existing "+ member.getLoginid());
		} else {
			memberMapper.addMember(member);
		}
		
		
	}
	
	

}
