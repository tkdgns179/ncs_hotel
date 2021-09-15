package com.hotel.mapper;

import java.util.ArrayList;

import com.hotel.vo.Member;

public interface MemberMapper {
	
	ArrayList<Member> getMembers();
	
	/**
	 * 존재하면 1을, 존재하지않으면 0을 리턴
	 * @param member
	 * @return
	 */
	int doCheckUser(Member member); // 유저가 존재하면 1을 리턴 존재하지 않으면 0을 리턴
	
	void addMember(Member member);

}
