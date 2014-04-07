package com.ask.dental.member;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.ask.dental.com.util.dataaccess.MybatisAbstractDao;
import com.ask.dental.mapper.MemberMapper;


@Repository("memberDao")
public class MemberDao extends MybatisAbstractDao {
 
	@Autowired
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
 
	public MemberModel selectMember(MemberModel Member) {
		return (MemberModel) selectByPk("selectMember",Member);
	}

	@SuppressWarnings("unchecked")
	public List<MemberModel> selectMemberList(Map param) {
		return list("selectMemberList",param);
	}

	public int selectMemberCount(Map param) {
		return (Integer) selectByPk("selectMemberCount",param);
	}
	
	public void insertMember(MemberModel Member) throws DataAccessException{
		insert("insertMember", Member);
	}

	public int updateMember(MemberModel Member) {
		return update("updateMember", Member);
	}

	public int deleteMember(MemberModel Member) {
		return delete("deleteMember",Member);
	}
	
}



