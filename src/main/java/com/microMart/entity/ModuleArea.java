package com.microMart.entity;

//ģ��������
public class ModuleArea {

	private Integer id;//����
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
	private String name;//������
	private String tagType;//�������� (div span)
	private Float widthValue;//������ֵ
	private String widthUnit;//�����ȵ�λ % px
	private Float heightValue;//����߶�ֵ
	private String heightUnit;//����߶ȵ�λ % px
	private String margin;
	private Boolean marginOpen;
	private Integer sort;//����(����������־������ֻ��˱�ǩ��ǰ����ʾ����ԽСԽ����)
	private Boolean ifShow;//�Ƿ���ʾ
	
}