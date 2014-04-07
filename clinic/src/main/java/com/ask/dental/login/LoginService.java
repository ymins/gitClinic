package com.ask.dental.login;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ask.dental.clinic.ClinicModel;
import com.ask.dental.com.util.message.Message;
import com.ask.dental.mapper.LoginMapper;
import com.ask.dental.member.MemberModel;

@Service(value="LoginService")
public class LoginService {
	@Autowired
	private LoginMapper LoginMapper;
	
	public int goLogin(Map<String, String> map) {
		return LoginMapper.goLogin(map);
	}
	public MemberModel getMemberInfo(String memId){
		return LoginMapper.getMemberInfo(memId);
	}

}