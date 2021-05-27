package com.microMart.entity;

//模版区域类
public class ModuleArea {

	private Integer id;//主键
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
	public String getTagType() {
		return tagType;
	}
	public void setTagType(String tagType) {
		this.tagType = tagType;
	}
	public Float getWidthValue() {
		return widthValue;
	}
	public void setWidthValue(Float widthValue) {
		this.widthValue = widthValue;
	}
	public String getWidthUnit() {
		return widthUnit;
	}
	public void setWidthUnit(String widthUnit) {
		this.widthUnit = widthUnit;
	}
	public Float getHeightValue() {
		return heightValue;
	}
	public void setHeightValue(Float heightValue) {
		this.heightValue = heightValue;
	}
	public String getHeightUnit() {
		return heightUnit;
	}
	public void setHeightUnit(String heightUnit) {
		this.heightUnit = heightUnit;
	}
	public String getMargin() {
		return margin;
	}
	public void setMargin(String margin) {
		this.margin = margin;
	}
	public Boolean getMarginOpen() {
		return marginOpen;
	}
	public void setMarginOpen(Boolean marginOpen) {
		this.marginOpen = marginOpen;
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
	private String name;//区域名
	private String tagType;//区域类型 (div span)
	private Float widthValue;//区域宽度值
	private String widthUnit;//区域宽度单位 % px
	private Float heightValue;//区域高度值
	private String heightUnit;//区域高度单位 % px
	private String margin;
	private Boolean marginOpen;
	private Integer sort;//排序(这个排序数字决定在手机端标签的前后显示次序，越小越靠上)
	private Boolean ifShow;//是否显示
	
}