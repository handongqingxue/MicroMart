package com.microMart.entity;

public class ModuleTag {

	private Integer id;//����
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
	private String key;//��ǩ��
	private String value;//��ǩĬ��ֵ
	private Float widthValue;//��ǩ���ֵ
	private String widthUnit;//��ǩ��ȵ�λ
	private Float heightValue;//��ǩ�߶�ֵ
	private String heightUnit;//��ǩ�߶ȵ�λ
	private Float marginLeft;//��ǩ����߾�
	private Float marginTop;//��ǩ����߾�
	private String type;//��ǩ����
	private Integer areaId;//����id
	private Integer sort;//����
	private Boolean ifShow;//��ǩ�Ƿ���ʾ
	
}
