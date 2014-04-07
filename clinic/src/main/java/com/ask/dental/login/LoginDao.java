package com.ask.dental.login;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.ask.dental.mapper.LoginMapper;
import com.ask.dental.member.MemberModel;

@Repository("loginDao")
public class LoginDao extends SqlSessionDaoSupport {
 
	@Autowired
	private SqlSession sqlSession;
	
	public int goLogin(Map<String, String> map) {
		return (Integer) getSqlSession().selectOne("goLogin",map);
	}

	public MemberModel getMemberInfo(String memId) {
		return (MemberModel) getSqlSession().selectOne("getMemberInfo", memId);
	}
	
}



