package com.ask.dental.mapper;

import org.json.simple.JSONArray;

import com.ask.dental.com.model.SearchModel;

public interface SalesMapper {
	public	JSONArray getSalesList(SearchModel SearchModel);
}
