<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String basePath=request.getScheme()+"://"+request.getServerName()+":"
		+request.getServerPort()+request.getContextPath()+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<script type="text/javascript" src="<%=basePath %>resource/js/jquery-3.3.1.js"></script>
<script type="text/javascript">
var width = document.documentElement.clientWidth;
var startX =0;
var index = 0;
var translateX = 0;
var startTime;
var startTranslate;
var isSlide = false;
var sliderNumber = 0;//滑块是数量，控制溢出不能滑动
$(function(){
	initCarouselMapDiv();
	initTabDiv();
	initHelpListDiv();
});

function initHelpListDiv(){
	var titleDiv=$("#help_list_div div[id^='help_item_div'] div[id='help_title_div']");
	titleDiv.click(function(){
		var id=$(this).parent().attr("id").substring(13);
		var display=$(this).next().css("display");
		if(display=="block"){
			$(this).next().css("display","none");
			$(this).find("div[id='pointer_div"+id+"']").attr("class","pointer_div close_div");
		}
		else{
			$(this).next().css("display","block");
			$(this).find("div[id='pointer_div"+id+"']").attr("class","pointer_div open_div");
		}
		$("#help_list_div div[id^='help_item_div'] div[id='help_title_div'] div[id!='pointer_div"+id+"']").attr("class","pointer_div close_div");
		$("#help_list_div div[id!='help_item_div"+id+"'] div[id='help_content_div']").css("display","none");
	});
}

function initTabDiv(){
	var titleDiv=$("#tab_div #title_div");
	var itemDiv=titleDiv.find("div[id^='item_div']");
	itemDiv.click(function(){
		var id=$(this).attr("id").substring(8);
		changeTab(id);
	});
	//changeTab(6);
}

function changeTab(id){
	var cmaList=JSON.parse('${requestScope.childModuleAreaListStr}');
	var cmad=cmaList[0];
	$("#tab_div #title_div div[id^='item_div']").css("color","rgb("+cmad.colorRedValue+","+cmad.colorGreenValue+","+cmad.colorBlueValue+")");
	$("#tab_div #title_div div[id^='item_div'] .line_div").css("border-bottom-color","rgb("+cmad.lineDivBorderBottomWidthColorRedValue+","+cmad.lineDivBorderBottomWidthColorGreenValue+","+cmad.lineDivBorderBottomWidthColorBlueValue+")");
	for(var i=0;i<cmaList.length;i++){
		var cma=cmaList[i];
		if(cma.id==id){
			$("#tab_div #title_div div[id=item_div"+id+"]").css("color","rgb("+cma.selectedColorRedValue+","+cma.selectedColorGreenValue+","+cma.selectedColorBlueValue+")");
			$("#tab_div #title_div div[id=item_div"+id+"] .line_div").css("border-bottom-color","rgb("+cma.lineDivSelectedBorderBottomWidthColorRedValue+","+cma.lineDivSelectedBorderBottomWidthColorGreenValue+","+cma.lineDivSelectedBorderBottomWidthColorBlueValue+")");
		}
	}
	
	$("#tab_div #content_div div[id^='item_div']").css("display","none");
	$("#tab_div #content_div div[id=item_div"+id+"]").css("display","block");
}

function initCarouselMapDiv(){
	document.getElementById('cm_img_div').addEventListener('touchstart',touchstart, false);
	document.getElementById('cm_img_div').addEventListener('touchmove',touchmove, false);
	document.getElementById('cm_img_div').addEventListener('touchend',touchend, false);

	var marginTop=0;
	var marginLeft=0;
	var pageCount=$("#cmi_list_div .item_img").length;
	sliderNumber=pageCount;
	var pagerDiv=$("#cm_img_div #pager_div");
	pagerDiv.css("width",(pageCount*20-10)+"px");
	pagerDiv.empty();
	for(var i=0;i<pageCount;i++){
		if(i==0)
			pagerDiv.append("<div class=\"item_div selected\" style=\"border-radius:5px;\"></div>");
		else if(i==pageCount-1){
			marginTop=-10;
			marginLeft+=20;
			pagerDiv.append("<div class=\"item_div unSelected\" style=\"margin-top:"+marginTop+"px;margin-left:"+marginLeft+"px;border-radius:5px;\"></div>");
		}
		else{
			marginTop=-10;
			marginLeft+=20;
			pagerDiv.append("<div class=\"item_div unSelected\" style=\"margin-top:"+marginTop+"px;margin-left:"+marginLeft+"px;\"></div>");
		}
	}
	document.getElementById("cmi_list_div").style.transform = "translateX(0px)";//必须加上这行代码，不然屏幕往左边拖，右边会出现空白
}

function touchstart(e){
  startX = e.touches[0].clientX;
  startTime = new Date().getTime();
  startTranslate = translateX;
  isSlide = true;
}
 
function touchmove(e){
  if (!isSlide) return
  var currentX = e.touches[0].clientX
  //2端溢出不能滑动
  if (startTranslate == 0 && currentX > startX) return;
  if (Math.abs(startTranslate) == width * (sliderNumber - 1) && currentX < startX) return;
 
  // 向右滑动时， 没数据无法滑动
  if (currentX < startX) {
	  
  }
 
  distance = currentX - startX;
  translateX = currentX - startX + startTranslate;
 
  document.getElementById("cmi_list_div").style.transform = "translateX("+translateX+"px)"
}

function touchend(){
   if (!isSlide) return
 
  var duration = +new Date() - startTime
  var newTranslateX
  if (translateX > startTranslate) {
    // 向左划
    if (distance > width / 3 || (distance > 40 && duration < 600)) {
      newTranslateX = startTranslate + width;
    } else {
      newTranslateX = startTranslate
    }
  } else {
    // 向右划
    if (Math.abs(distance) > width / 3 || (Math.abs(distance) > 40 && duration < 600)) {
      newTranslateX = startTranslate - width;
    } else {
      newTranslateX = startTranslate
    }
  }
 
  translateX = newTranslateX;
  isSlide = false;
  distance = 0;
  index = Math.abs(newTranslateX / width)
  
  //console.log(startX);
  $(".pager_div .item_div").each(function(i){
	  if(i==index){
	  	  $(this).css("background-color","#1576FB");
	  }
	  else{
		  $(this).css("background-color","#EEEEEE");
	  }
  });
 
  document.getElementById("cmi_list_div").style.transform = "translateX("+translateX+"px)"
}
</script>
<style type="text/css">
body{
	margin: 0;
}
.cm_img_div{
	width:100%;margin:auto;overflow: hidden;
}
.cmi_list_div{
	transition: all .6s;
}
.cmi_list_div .item_img{
	width:100%;height:auto;position: absolute;
}
.pager_div{
	height: 20px;margin:-20px auto 0;position: relative;
}
.pager_div .item_div{
	width: 10px;height: 10px;border-radius:5px;
}
.cm_img_div .pager_div .selected{
	background-color: #1576FB;
}
.cm_img_div .pager_div .unSelected{
	background-color: #EEEEEE;
}

.help_list_div .help_item_div .pointer_div{
	content: "&nbsp;";
	display: inline-block;
	height: 6px;
	width: 6px;
	border-width: 2px 2px 0 0;
	border-color: #999;
	border-style: solid;
	position: absolute;
	margin-top: 17px;
	right: 10px;
	transition: transform .7s,-webkit-transform .7s;
}
.help_list_div .help_item_div .close_div{
	transform: rotate(45deg);
}
.help_list_div .help_item_div .open_div{
	transform: rotate(135deg);
}
</style>
<title>下单</title>
</head>
<body>
<c:forEach items="${requestScope.moduleAreaList }" var="moduleArea">
	<c:if test="${moduleArea.tagType eq 'cmImg' }">
		<div class="cm_img_div" id="cm_img_div">
			<div class="cmi_list_div" id="cmi_list_div" style="
			width:100%;
			<c:if test="${moduleArea.heightOpen}">height: ${moduleArea.heightValue}${moduleArea.heightUnit};</c:if>
			">
				<c:forEach items="${requestScope.moduleTagList }" var="moduleTag">
					<c:if test="${moduleTag.areaId eq moduleArea.id}">
						<img class="item_img" alt="" src="<%=basePath%>${moduleTag.value}" style="margin-left:${(moduleTag.sort-1)*100}%;">
					</c:if>
				</c:forEach>
			</div>
			<div class="pager_div" id="pager_div">
			</div>
		</div>
	</c:if>
	<c:if test="${moduleArea.tagType eq 'div' }">
		<div style="width:${moduleArea.widthValue}${moduleArea.widthUnit};
					<c:if test="${moduleArea.heightOpen}">height:${moduleArea.heightValue}${moduleArea.heightUnit};</c:if>
					<c:if test="${moduleArea.lineHeightOpen}">line-height:${moduleArea.lineHeightValue}${moduleArea.lineHeightUnit};</c:if>
					<c:if test="${moduleArea.marginOpen}">margin:${moduleArea.margin};</c:if>
					<c:if test="${moduleArea.borderBottomColorOpen}">
						border-bottom-color:rgba(${moduleArea.borderBottomColorRedValue},
						${moduleArea.borderBottomColorGreenValue},
						${moduleArea.borderBottomColorBlueValue},
						${moduleArea.borderBottomColorAlphaValue});
					</c:if>"
		>
			<c:forEach items="${requestScope.moduleTagList }" var="moduleTag">
				<c:if test="${moduleArea.id eq moduleTag.areaId }">
					<c:if test="${moduleTag.type eq 'img' }">
						<img alt="" src="<%=basePath%>${moduleTag.value}" style="
						<c:if test="${moduleTag.widthOpen}">width:${moduleTag.widthValue}${moduleTag.widthUnit};</c:if>
						<c:if test="${moduleTag.heightOpen}">height:${moduleTag.heightValue}${moduleTag.heightUnit};</c:if>
						<c:if test='${moduleTag.marginLeftOpen}'>margin-left:${moduleTag.marginLeftValue}${moduleTag.marginLeftUnit};</c:if>
						<c:if test='${moduleTag.marginTopOpen}'>margin-top:${moduleTag.marginTopValue}${moduleTag.marginTopUnit};</c:if>
						">
					</c:if>
					<c:if test="${moduleTag.type eq 'span'||moduleTag.type eq 'div' }">
						<${moduleTag.type}
						<c:if test="${moduleTag.tagIdOpen}">id="${moduleTag.tagId}"</c:if>
						 style="
						<c:if test="${moduleTag.widthOpen}">width:${moduleTag.widthValue}${moduleTag.widthUnit};</c:if>
						<c:if test="${moduleTag.heightOpen}">height:${moduleTag.heightValue}${moduleTag.heightUnit};</c:if>
						<c:if test="${moduleTag.lineHeightOpen}">line-height:${moduleTag.lineHeightValue}${moduleTag.lineHeightUnit};</c:if>
						<c:if test='${moduleTag.marginOpen}'>margin:${moduleTag.margin};</c:if>
						<c:if test='${moduleTag.marginTopOpen}'>margin-top:${moduleTag.marginTopValue}${moduleTag.marginTopUnit};</c:if>
						<c:if test='${moduleTag.marginLeftOpen}'>margin-left:${moduleTag.marginLeftValue}${moduleTag.marginLeftUnit};</c:if>
						<c:if test='${moduleTag.paddingTopOpen}'>padding-top:${moduleTag.paddingTop}px;</c:if>
						<c:if test='${moduleTag.paddingRightOpen}'>padding-right:${moduleTag.paddingRight}px;</c:if>
						<c:if test='${moduleTag.paddingBottomOpen}'>padding-bottom:${moduleTag.paddingBottom}px;</c:if>
						<c:if test='${moduleTag.paddingLeftOpen}'>padding-left:${moduleTag.paddingLeft}px;</c:if>
						<c:if test="${moduleTag.colorOpen}">color:rgb(${moduleTag.colorRedValue},${moduleTag.colorGreenValue},${moduleTag.colorBlueValue});</c:if>
						<c:if test='${moduleTag.fontSizeOpen}'>font-size:${moduleTag.fontSize}px;</c:if>
						<c:if test='${moduleTag.fontWeightOpen}'>font-weight:${moduleTag.fontWeight};</c:if>
						<c:if test='${moduleTag.textAlignOpen}'>text-align:${moduleTag.textAlign};</c:if>
						<c:if test='${moduleTag.backgroundColorOpen}'>background-color:rgb(${moduleTag.backgroundColorRedValue},${moduleTag.backgroundColorGreenValue},${moduleTag.backgroundColorBlueValue});</c:if>
						<c:if test='${moduleTag.borderTopWidthOpen}'>border-top-width:${moduleTag.borderTopWidthValue}${moduleTag.borderTopWidthUnit};</c:if>
						<c:if test='${moduleTag.borderTopStyleOpen}'>border-style:${moduleTag.borderTopStyle};</c:if>
						<c:if test='${moduleTag.borderTopColorOpen}'>border-top-color:rgb(${moduleTag.borderTopColorRedValue},
																						  ${moduleTag.borderTopColorGreenValue},
																						  ${moduleTag.borderTopColorBlueValue});</c:if>
						<c:if test='${moduleTag.borderBottomWidthOpen}'>border-bottom-width:${moduleTag.borderBottomWidthValue}${moduleTag.borderBottomWidthUnit};</c:if>
						<c:if test='${moduleTag.borderBottomStyleOpen}'>border-bottom-style:${moduleTag.borderBottomStyle};</c:if>
						<c:if test='${moduleTag.borderBottomColorOpen}'>border-bottom-color:rgb(${moduleTag.borderBottomColorRedValue},
																						  ${moduleTag.borderBottomColorGreenValue},
																						  ${moduleTag.borderBottomColorBlueValue});</c:if>
						<c:if test='${moduleTag.borderRadiusOpen}'>border-radius:${moduleTag.borderRadius}px;</c:if>
						<c:if test='${moduleTag.positionOpen}'>position:${moduleTag.position};</c:if>
						">${moduleTag.value}</${moduleTag.type}>
					</c:if>
				</c:if>
			</c:forEach>
		</div>
	</c:if>
	<c:if test="${moduleArea.tagType eq 'tabDiv' }">
		<div class="tab_div" id="tab_div" style="width:${moduleArea.widthValue}${moduleArea.widthUnit};"
		>
			<div class="title_div" id="title_div" style="width:100%;">
				<c:forEach items="${requestScope.childModuleAreaList }" var="childModuleArea">
					<c:if test="${childModuleArea.tagType eq 'tabItemDiv'&&childModuleArea.parentId eq moduleArea.id }">
						<div class="item_div" id="item_div${childModuleArea.id}" style="
							width:${childModuleArea.widthValue}${childModuleArea.widthUnit};
							height:${childModuleArea.heightValue}${childModuleArea.heightUnit};
							line-height:${childModuleArea.lineHeightValue}${childModuleArea.lineHeightUnit};
							<c:choose>
								<c:when test="${childModuleArea.sort eq 1}">
								</c:when>
								<c:otherwise>
									margin-top:${childModuleArea.marginTopValue}${childModuleArea.marginTopUnit};
									margin-left:${childModuleArea.marginLeftValue}${childModuleArea.marginLeftUnit};
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${childModuleArea.sort eq 1}">
									color:rgb(${childModuleArea.selectedColorRedValue},
											  ${childModuleArea.selectedColorGreenValue},
											  ${childModuleArea.selectedColorBlueValue});
								</c:when>
								<c:otherwise>
									color:rgb(${childModuleArea.colorRedValue},
											  ${childModuleArea.colorGreenValue},
											  ${childModuleArea.colorBlueValue});
								</c:otherwise>
							</c:choose>
							text-align: ${childModuleArea.textAlign};">
							${childModuleArea.value}
							<div class="line_div" style="
							width:${childModuleArea.lineDivWidthValue}${childModuleArea.lineDivWidthUnit};
							margin:${childModuleArea.lineDivMargin};
							border-bottom-width:${childModuleArea.lineDivBorderBottomWidthValue}${childModuleArea.lineDivBorderBottomWidthUnit};
							border-bottom-style:${childModuleArea.lineDivBorderBottomWidthStyle};
							<c:choose>
								<c:when test="${childModuleArea.sort eq 1}">
									border-bottom-color:rgb(${childModuleArea.lineDivSelectedBorderBottomWidthColorRedValue},
															${childModuleArea.lineDivSelectedBorderBottomWidthColorGreenValue},
															${childModuleArea.lineDivSelectedBorderBottomWidthColorBlueValue});
								</c:when>
								<c:otherwise>
									border-bottom-color:rgb(${childModuleArea.lineDivBorderBottomWidthColorRedValue},
															${childModuleArea.lineDivBorderBottomWidthColorGreenValue},
															${childModuleArea.lineDivBorderBottomWidthColorBlueValue});
								</c:otherwise>
							</c:choose>
							"></div>
						</div>
					</c:if>
				</c:forEach>
			</div>
			<div id="content_div">
				<c:forEach items="${requestScope.childModuleAreaList }" var="childModuleArea">
					<c:if test="${childModuleArea.tagType eq 'tabItemDiv'&&childModuleArea.parentId eq moduleArea.id }">
						<div id="item_div${childModuleArea.id}" style="display:${childModuleArea.display};">
							<c:forEach items="${requestScope.childModuleAreaList }" var="helpModuleArea">
								<c:if test="${helpModuleArea.parentId eq childModuleArea.id }">
									<div class="help_list_div" id="help_list_div" style="
									width:${helpModuleArea.widthValue}${helpModuleArea.widthUnit};
									<c:if test="${helpModuleArea.marginBottomOpen}">
									margin-bottom: ${helpModuleArea.marginBottomValue}${helpModuleArea.marginBottomUnit};
									</c:if>">
										<c:forEach items="${requestScope.childModuleAreaList }" var="helpChildModuleArea">
											<c:forEach items="${requestScope.helpList }" var="help">
												<c:if test="${helpChildModuleArea.parentId eq helpModuleArea.id }">
													<div class="help_item_div" id="help_item_div${help.sort }" style="
													width:${helpChildModuleArea.widthValue}${helpChildModuleArea.widthUnit};
													border-bottom-width: ${helpChildModuleArea.borderBottomWidthValue}${helpChildModuleArea.borderBottomWidthUnit};
													border-bottom-style:${helpChildModuleArea.borderBottomStyle};
													<c:if test="${helpChildModuleArea.borderBottomColorOpen}">
														border-bottom-color:rgba(${helpChildModuleArea.borderBottomColorRedValue},
																				${helpChildModuleArea.borderBottomColorGreenValue},
																				${helpChildModuleArea.borderBottomColorBlueValue},
																				${helpChildModuleArea.borderBottomColorAlphaValue});
													</c:if>">
														<div id="help_title_div" style="
														<c:if test="${helpChildModuleArea.titleWidthOpen}">
															width:${helpChildModuleArea.titleWidthValue}${helpChildModuleArea.titleWidthUnit};
														</c:if>
														<c:if test="${helpChildModuleArea.titleHeightOpen}">
															height:${helpChildModuleArea.titleHeightValue}${helpChildModuleArea.titleHeightUnit};
														</c:if>
														<c:if test="${helpChildModuleArea.titleLineHeightOpen}">
															line-height:${helpChildModuleArea.titleLineHeightValue}${helpChildModuleArea.titleLineHeightUnit};
														</c:if>
														<c:if test="${helpChildModuleArea.titleColorOpen}">
															color: rgb(${helpChildModuleArea.titleColorRedValue},
																	   ${helpChildModuleArea.titleColorGreenValue},
																	   ${helpChildModuleArea.titleColorBlueValue});
														</c:if>
														<c:if test="${helpChildModuleArea.titleFontSizeOpen}">
															font-size: ${helpChildModuleArea.titleFontSize}px;
														</c:if>
														">
															${help.sort }. ${help.question }
															<div class="pointer_div close_div" id="pointer_div${help.sort }"></div>
														</div>
														<div id="help_content_div" style="
														<c:if test="${helpChildModuleArea.contentLineHeightOpen}">
															line-height: ${helpChildModuleArea.contentLineHeightValue}${helpChildModuleArea.contentLineHeightUnit};
														</c:if>
														<c:if test="${helpChildModuleArea.contentMarginLeftOpen}">
															margin-left: ${helpChildModuleArea.contentMarginLeftValue}${helpChildModuleArea.contentMarginLeftUnit};
														</c:if>
														<c:if test="${helpChildModuleArea.contentColorOpen}">
															color: rgb(${helpChildModuleArea.contentColorRedValue},
																	   ${helpChildModuleArea.contentColorGreenValue},
																	   ${helpChildModuleArea.contentColorBlueValue});
														</c:if>
														<c:if test="${helpChildModuleArea.contentFontSizeOpen}">
															font-size: ${helpChildModuleArea.contentFontSizeValue}${helpChildModuleArea.contentFontSizeUnit};
														</c:if>
														display: ${helpChildModuleArea.contentDisplay};
														">
															${help.answer }
														</div>
													</div>
												</c:if>
											</c:forEach>
										</c:forEach>
									</div>
								</c:if>
							</c:forEach>
							<c:forEach items="${requestScope.moduleTagList }" var="moduleTag">
								<c:if test="${childModuleArea.id eq moduleTag.areaId }">
									<c:if test="${moduleTag.type eq 'div' }">
										<${moduleTag.type} style="
										<c:if test="${moduleTag.widthOpen}">width:${moduleTag.widthValue}${moduleTag.widthUnit};</c:if>
										<c:if test="${moduleTag.marginOpen}">margin:${moduleTag.margin};</c:if>
										<c:if test="${moduleTag.marginTopOpen}">margin-top:${moduleTag.marginTopValue}${moduleTag.marginTopUnit};</c:if>
										<c:if test="${moduleTag.colorOpen}">color:rgb(${moduleTag.colorRedValue},${moduleTag.colorGreenValue},${moduleTag.colorBlueValue});</c:if>
										<c:if test="${moduleTag.fontWeightOpen}">font-weight: ${moduleTag.fontWeight};</c:if>
										<c:if test="${moduleTag.textAlignOpen}">text-align:${moduleTag.textAlign};</c:if>
										<c:if test="${moduleTag.backgroundColorOpen}">background-color: rgb(${moduleTag.backgroundColorRedValue},
																											${moduleTag.backgroundColorGreenValue},
																											${moduleTag.backgroundColorBlueValue});
										</c:if>
										">${moduleTag.value}</${moduleTag.type}>
									</c:if>
									<c:if test="${moduleTag.type eq 'img'||moduleTag.type eq 'embed' }">
										<${moduleTag.type} alt="" src="<%=basePath%>${moduleTag.value}" style="
										<c:if test="${moduleTag.widthOpen}">width:${moduleTag.widthValue}${moduleTag.widthUnit};</c:if>
										">
									</c:if>
								</c:if>
							</c:forEach>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</c:if>
	<c:if test="${moduleArea.tagType eq 'comboDiv' }">
		<div class="combo_div" id="combo_div" style="
			width:${moduleArea.widthValue}${moduleArea.widthUnit};
			<c:if test="${moduleArea.marginOpen}">margin:${moduleArea.margin};</c:if>
		"
		>
			<c:forEach items="${requestScope.moduleTagList }" var="comboTag">
				<c:if test="${comboTag.type eq 'comboTit'}">
					<c:if test="${comboTag.areaId eq moduleArea.id }">
						<div style="
						<c:if test="${comboTag.widthOpen}">width:${comboTag.widthValue}${comboTag.widthUnit};</c:if>
						<c:if test="${comboTag.lineHeightOpen}">line-height:${comboTag.lineHeightValue}${comboTag.lineHeightUnit};</c:if>
						">${comboTag.value}</div>
					</c:if>
				</c:if>
				<c:if test="${comboTag.type eq 'comboList'}">
					<c:if test="${comboTag.areaId eq moduleArea.id }">
						<c:forEach items="${requestScope.comboList }" var="combo">
							<div style="
							<c:if test="${requestScope.comboModuleTagMap[combo.tagId].widthOpen}">
								width:${requestScope.comboModuleTagMap[combo.tagId].widthValue}${requestScope.comboModuleTagMap[combo.tagId].widthUnit};
							</c:if>
							<c:if test="${requestScope.comboModuleTagMap[combo.tagId].heightOpen}">
								height:${requestScope.comboModuleTagMap[combo.tagId].heightValue}${requestScope.comboModuleTagMap[combo.tagId].heightUnit};
							</c:if>
							<c:if test="${requestScope.comboModuleTagMap[combo.tagId].lineHeightOpen}">
								line-height:${requestScope.comboModuleTagMap[combo.tagId].lineHeightValue}${requestScope.comboModuleTagMap[combo.tagId].lineHeightUnit};
							</c:if>
							<c:if test="${requestScope.comboModuleTagMap[combo.tagId].marginTopOpen}">
								margin-top:${requestScope.comboModuleTagMap[combo.tagId].marginTopValue}${requestScope.comboModuleTagMap[combo.tagId].marginTopUnit};
							</c:if>
							<c:if test="${requestScope.comboModuleTagMap[combo.tagId].colorOpen}">
								color:rgb(${requestScope.comboModuleTagMap[combo.tagId].colorRedValue},
										${requestScope.comboModuleTagMap[combo.tagId].colorGreenValue},
										${requestScope.comboModuleTagMap[combo.tagId].colorBlueValue});
							</c:if>
							<c:if test="${requestScope.comboModuleTagMap[combo.tagId].fontSizeOpen}">
								font-size:${requestScope.comboModuleTagMap[combo.tagId].fontSize}px;
							</c:if>
							<c:if test="${requestScope.comboModuleTagMap[combo.tagId].textAlignOpen}">
								text-align:${requestScope.comboModuleTagMap[combo.tagId].textAlign};
							</c:if>
							<c:if test="${requestScope.comboModuleTagMap[combo.tagId].backgroundColorOpen}">
								background-color:rgb(${requestScope.comboModuleTagMap[combo.tagId].backgroundColorRedValue},
													${requestScope.comboModuleTagMap[combo.tagId].backgroundColorGreenValue},
													${requestScope.comboModuleTagMap[combo.tagId].backgroundColorBlueValue});
							</c:if>
							<c:if test="${requestScope.comboModuleTagMap[combo.tagId].borderWidthOpen}">
								border-width:${requestScope.comboModuleTagMap[combo.tagId].borderWidthValue}${requestScope.comboModuleTagMap[combo.tagId].borderWidthUnit};
							</c:if>
							<c:if test="${requestScope.comboModuleTagMap[combo.tagId].borderStyleOpen}">
								border-style:${requestScope.comboModuleTagMap[combo.tagId].borderStyle};
							</c:if>
							<c:if test="${requestScope.comboModuleTagMap[combo.tagId].borderColorOpen}">
								border-color:rgb(${requestScope.comboModuleTagMap[combo.tagId].borderColorRedValue},
												${requestScope.comboModuleTagMap[combo.tagId].borderColorGreenValue},
												${requestScope.comboModuleTagMap[combo.tagId].borderColorBlueValue});
							</c:if>
								border-radius:${requestScope.comboModuleTagMap[combo.tagId].borderRadius}px;
							">${combo.name }</div>
						</c:forEach>
					</c:if>
				</c:if>
			</c:forEach>
		</div>
	</c:if>
	<!-- 
	<c:if  test="${moduleArea.tagType eq 'orderDiv' }">
		<div style="width: 100%;height: 50px;line-height: 50px;background-color: rgb(255,255,255);">
			<span style="color:rgb(72,72,72);margin-left:10px;">数量</span>
			<div style="width:30px;height:30px;line-height:30px;margin-top:-38px;margin-left:70px;text-align:center;background-color:rgb(245,245,245)">-</div>
			<div style="width:30px;height:30px;line-height:30px;margin-top:-30px;margin-left:105px;font-size: 15px;text-align:center;background-color:rgb(245,245,245)">1</div>
			<div style="width:30px;height:30px;line-height:30px;margin-top:-30px;margin-left:140px;text-align:center;background-color:rgb(245,245,245)">+</div>
			<span style="color: rgb(72,72,72);font-size: 15px;margin-top:-40px;margin-left:200px;position: absolute;">应付款</span>
			<span style="color: rgb(235,25,58);font-size: 15px;margin-top:-40px;margin-left:260px;position: absolute;">￥</span>
			<span style="color: rgb(235,25,58);font-size: 15px;margin-top:-40px;margin-left:280px;position: absolute;">168</span>
		</div>
	</c:if>
			<div style="width: 100%;height: 10px;background-color: rgb(245,245,245);">
			</div>
			<div style="width: 100%;height: 50px;line-height: 50px;background-color: rgb(255,255,255);">
			</div>
			 -->
</c:forEach>
</body>
</html>