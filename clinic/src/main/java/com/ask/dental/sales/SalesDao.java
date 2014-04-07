package com.ask.dental.sales;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.ask.dental.com.util.dataaccess.MybatisAbstractDao;
import com.ask.dental.mapper.SalesMapper;
import com.ask.dental.com.model.SearchModel;


@Repository("salesDao")
public class SalesDao {
 
	@Autowired
	private SqlSession sqlSession;
}



