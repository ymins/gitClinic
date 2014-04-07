package com.ask.dental.mapper;

import java.util.Map;

import com.ask.dental.member.MemberModel;

public interface LoginMapper {

	public int goLogin(Map<String, String> map);
	public MemberModel getMemberInfo(String memId);
}
