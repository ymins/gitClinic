package com.ask.dental.member;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ask.dental.mapper.MemberMapper;
import com.ask.dental.member.MemberModel;

@Service(value="memberService")
public class MemberService {
	@Autowired
	private MemberMapper memberMapper;

	public MemberModel selectMember(MemberModel Member){
		return memberMapper.selectMember(Member);
	}


	public List<MemberModel> selectMemberList(Map param) {
		return memberMapper.selectMemberList(param);
	}
	
	public int selectMemberCount(Map param) {
		return memberMapper.selectMemberCount(param);
	}

	public void insertMember(MemberModel Member){
		memberMapper.insertMember(Member);
	}

	public void updateMember(MemberModel Member){
		memberMapper.insertMember(Member);
	}

	public void deleteMember(MemberModel Member){
		memberMapper.deleteMember(Member);
	}


}

