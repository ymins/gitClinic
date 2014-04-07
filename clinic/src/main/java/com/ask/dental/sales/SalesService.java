package com.ask.dental.sales;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ask.dental.com.model.SearchModel;
import com.ask.dental.mapper.SalesMapper;

@Service(value="salesService")
public class SalesService {
	@Autowired
	private SalesMapper SalesMapper;

	public JSONArray getSalesList(SearchModel SearchModel) {
		return SalesMapper.getSalesList(SearchModel);
	}
}

