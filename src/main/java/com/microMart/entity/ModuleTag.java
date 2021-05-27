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
	public Boolean getMarginLeftOpen() {
		return marginLeftOpen;
	}
	public void setMarginLeftOpen(Boolean marginLeftOpen) {
		this.marginLeftOpen = marginLeftOpen;
	}
	public Float getMarginTop() {
		return marginTop;
	}
	public void setMarginTop(Float marginTop) {
		this.marginTop = marginTop;
	}
	public Boolean getMarginTopOpen() {
		return marginTopOpen;
	}
	public void setMarginTopOpen(Boolean marginTopOpen) {
		this.marginTopOpen = marginTopOpen;
	}
	public Float getPaddingTop() {
		return paddingTop;
	}
	public void setPaddingTop(Float paddingTop) {
		this.paddingTop = paddingTop;
	}
	public Boolean getPaddingTopOpen() {
		return paddingTopOpen;
	}
	public void setPaddingTopOpen(Boolean paddingTopOpen) {
		this.paddingTopOpen = paddingTopOpen;
	}
	public Float getPaddingRight() {
		return paddingRight;
	}
	public void setPaddingRight(Float paddingRight) {
		this.paddingRight = paddingRight;
	}
	public Boolean getPaddingRightOpen() {
		return paddingRightOpen;
	}
	public void setPaddingRightOpen(Boolean paddingRightOpen) {
		this.paddingRightOpen = paddingRightOpen;
	}
	public Float getPaddingBottom() {
		return paddingBottom;
	}
	public void setPaddingBottom(Float paddingBottom) {
		this.paddingBottom = paddingBottom;
	}
	public Boolean getPaddingBottomOpen() {
		return paddingBottomOpen;
	}
	public void setPaddingBottomOpen(Boolean paddingBottomOpen) {
		this.paddingBottomOpen = paddingBottomOpen;
	}
	public Float getPaddingLeft() {
		return paddingLeft;
	}
	public void setPaddingLeft(Float paddingLeft) {
		this.paddingLeft = paddingLeft;
	}
	public Boolean getPaddingLeftOpen() {
		return paddingLeftOpen;
	}
	public void setPaddingLeftOpen(Boolean paddingLeftOpen) {
		this.paddingLeftOpen = paddingLeftOpen;
	}
	public Integer getColorRedValue() {
		return colorRedValue;
	}
	public void setColorRedValue(Integer colorRedValue) {
		this.colorRedValue = colorRedValue;
	}
	public Integer getColorGreenValue() {
		return colorGreenValue;
	}
	public void setColorGreenValue(Integer colorGreenValue) {
		this.colorGreenValue = colorGreenValue;
	}
	public Integer getColorBlueValue() {
		return colorBlueValue;
	}
	public void setColorBlueValue(Integer colorBlueValue) {
		this.colorBlueValue = colorBlueValue;
	}
	public Boolean getColorOpen() {
		return colorOpen;
	}
	public void setColorOpen(Boolean colorOpen) {
		this.colorOpen = colorOpen;
	}
	public Integer getFontSize() {
		return fontSize;
	}
	public void setFontSize(Integer fontSize) {
		this.fontSize = fontSize;
	}
	public Boolean getFontSizeOpen() {
		return fontSizeOpen;
	}
	public void setFontSizeOpen(Boolean fontSizeOpen) {
		this.fontSizeOpen = fontSizeOpen;
	}
	public Integer getBackgroundColorRedValue() {
		return backgroundColorRedValue;
	}
	public void setBackgroundColorRedValue(Integer backgroundColorRedValue) {
		this.backgroundColorRedValue = backgroundColorRedValue;
	}
	public Integer getBackgroundColorGreenValue() {
		return backgroundColorGreenValue;
	}
	public void setBackgroundColorGreenValue(Integer backgroundColorGreenValue) {
		this.backgroundColorGreenValue = backgroundColorGreenValue;
	}
	public Integer getBackgroundColorBlueValue() {
		return backgroundColorBlueValue;
	}
	public void setBackgroundColorBlueValue(Integer backgroundColorBlueValue) {
		this.backgroundColorBlueValue = backgroundColorBlueValue;
	}
	public Boolean getBackgroundColorOpen() {
		return backgroundColorOpen;
	}
	public void setBackgroundColorOpen(Boolean backgroundColorOpen) {
		this.backgroundColorOpen = backgroundColorOpen;
	}
	public Integer getBorderRadius() {
		return borderRadius;
	}
	public void setBorderRadius(Integer borderRadius) {
		this.borderRadius = borderRadius;
	}
	public Boolean getBorderRadiusOpen() {
		return borderRadiusOpen;
	}
	public void setBorderRadiusOpen(Boolean borderRadiusOpen) {
		this.borderRadiusOpen = borderRadiusOpen;
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
	private Boolean marginLeftOpen;
	private Float marginTop;//标签上外边距
	private Boolean marginTopOpen;
	private Float paddingTop;
	private Boolean paddingTopOpen;
	private Float paddingRight;
	private Boolean paddingRightOpen;
	private Float paddingBottom;
	private Boolean paddingBottomOpen;
	private Float paddingLeft;
	private Boolean paddingLeftOpen;
	private Integer colorRedValue;
	private Integer colorGreenValue;
	private Integer colorBlueValue;
	private Boolean colorOpen;
	private Integer fontSize;
	private Boolean fontSizeOpen;
	private Integer backgroundColorRedValue;
	private Integer backgroundColorGreenValue;
	private Integer backgroundColorBlueValue;
	private Boolean backgroundColorOpen;
	private Integer borderRadius;
	private Boolean borderRadiusOpen;
	private String type;//标签类型
	private Integer areaId;//区域id
	private Integer sort;//排序
	private Boolean ifShow;//标签是否显示
	
}
