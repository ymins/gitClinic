package com.ask.dental.mapper;

import java.util.List;
import java.util.Map;

import com.ask.dental.member.MemberModel;

public interface MemberMapper {

	public MemberModel selectMember(MemberModel Member);

	public List<MemberModel> selectMemberList(Map param);

	public int selectMemberCount(Map param);
	
	public void insertMember(MemberModel Member);

	public void updateMember(MemberModel Member);

	public void deleteMember(MemberModel Member);
	
	public List<MemberModel> getSelectClinic(MemberModel Member);
}
