package com.microMart.entity;

public class ModuleTag {

	private Integer id;//主键
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
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
	public Float getMarginLeft() {
		return marginLeft;
	}
	public void setMarginLeft(Float marginLeft) {
		this.marginLeft = marginLeft;
	}
	public Float getMarginTop() {
		return marginTop;
	}
	public void setMarginTop(Float marginTop) {
		this.marginTop = marginTop;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Integer getAreaId() {
		return areaId;
	}
	public void setAreaId(Integer areaId) {
		this.areaId = areaId;
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
	private String key;//标签名
	private String value;//标签默认值
	private Float widthValue;//标签宽度值
	private String widthUnit;//标签宽度单位
	private Float heightValue;//标签高度值
	private String heightUnit;//标签高度单位
	private Float marginLeft;//标签左外边距
	private Float marginTop;//标签上外边距
	private String type;//标签类型
	private Integer areaId;//区域id
	private Integer sort;//排序
	private Boolean ifShow;//标签是否显示
	
}
