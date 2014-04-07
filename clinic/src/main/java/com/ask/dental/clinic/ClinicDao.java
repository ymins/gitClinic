package com.ask.dental.clinic;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.ask.dental.com.util.dataaccess.MybatisAbstractDao;
import com.ask.dental.mapper.ClinicMapper;


@Repository("ClinicDao")
public class ClinicDao extends MybatisAbstractDao {
 
	@Autowired
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
 
	public ClinicModel selectClinic(ClinicModel Clinic) {
		return (ClinicModel) selectByPk("selectClinic",Clinic);
	}

	@SuppressWarnings("unchecked")
	public List<ClinicModel> selectClinicList(Map param) {
		return list("selectClinicList",param);
	}

	public int selectClinicCount(Map param) {
		return (Integer) selectByPk("selectClinicCount",param);
	}
	
	public void insertClinic(ClinicModel Clinic) throws DataAccessException{
		insert("insertClinic", Clinic);
	}

	public int updateClinic(ClinicModel Clinic) {
		return update("updateClinic", Clinic);
	}

	public int deleteClinic(ClinicModel Clinic) {
		return delete("deleteClinic",Clinic);
	}
	
	public List<ClinicModel> getSelectClinic(ClinicModel Clinic) {
		return list("getSelectClinic",Clinic);
	}
}



