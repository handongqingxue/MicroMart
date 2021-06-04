package com.microMart.entity;

public class District {

	private Integer id;//Ö÷¼ü
	private String name;
	private Integer cityId;
	private Integer sort;
	private Boolean ifShow;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getCityId() {
		return cityId;
	}
	public void setCityId(Integer cityId) {
		this.cityId = cityId;
	}
	public Integer getSort() {
		return sort;
	}
	public void setSort(Integer sort) {
		this.sort = sort;
	}
	public Boolean getIfShow() {
		return ifShow;
	}
	public void setIfShow(Boolean ifShow) {
		this.ifShow = ifShow;
	}
}
