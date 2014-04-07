package com.ask.dental.com.model;

public class SearchModel {
	
	private String	id;
	private String	name;
	private	String	searchType;
	private	String	searchValue;
	private	String	searchCount;
	private	String	searchCount2;
	private	String	reqStatus;
	private	String	prgStatus;
	private	String	orderItem;
	private	String	orderType;
	private	int		currentPage;
	private	int		pageSize;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	public String getSearchCount() {
		return searchCount;
	}
	public void setSearchCount(String searchCount) {
		this.searchCount = searchCount;
	}
	public String getSearchCount2() {
		return searchCount2;
	}
	public void setSearchCount2(String searchCount2) {
		this.searchCount2 = searchCount2;
	}
	public String getReqStatus() {
		return reqStatus;
	}
	public void setReqStatus(String reqStatus) {
		this.reqStatus = reqStatus;
	}
	public String getPrgStatus() {
		return prgStatus;
	}
	public void setPrgStatus(String prgStatus) {
		this.prgStatus = prgStatus;
	}
	public String getOrderItem() {
		return orderItem;
	}
	public void setOrderItem(String orderItem) {
		this.orderItem = orderItem;
	}
	public String getOrderType() {
		return orderType;
	}
	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	
}