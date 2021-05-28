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
});

function initTabDiv(){
	var titleDiv=$("#tab_div #title_div");
	var itemDiv=titleDiv.find("div[id^='item_div']");
	itemDiv.click(function(){
		changeTab($(this).attr("id"));
	});
}

function changeTab(itemId){
	$("#tab_div #content_div div[id^='item_div']").css("display","none");
	$("#tab_div #content_div div[id='"+itemId+"']").css("display","block");
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
</style>
<title>下单</title>
</head>
<body>
<c:forEach items="${requestScope.moduleAreaList }" var="moduleArea">
	<c:if test="${moduleArea.tagType eq 'cmImg' }">
		<div class="cm_img_div" id="cm_img_div">
			<div class="cmi_list_div" id="cmi_list_div" style="width:100%;height: 365px;">
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
					height:${moduleArea.heightValue}${moduleArea.heightUnit};
					<c:if test="${moduleArea.marginOpen}">margin:${moduleArea.margin}</c:if>"
		>
			<c:forEach items="${requestScope.moduleTagList }" var="moduleTag">
				<c:if test="${moduleArea.id eq moduleTag.areaId }">
					<c:if test="${moduleTag.type eq 'img' }">
						<img alt="" src="<%=basePath%>${moduleTag.value}" style="width:${moduleTag.widthValue}${moduleTag.widthUnit};
						height:${moduleTag.heightValue}${moduleTag.heightUnit};
						<c:if test='${moduleTag.marginLeftOpen}'>margin-left:${moduleTag.marginLeftValue}${moduleTag.marginLeftUnit};</c:if>
						<c:if test='${moduleTag.marginTopOpen}'>margin-top:${moduleTag.marginTopValue}${moduleTag.marginTopUnit};</c:if>
						">
					</c:if>
					<c:if test="${moduleTag.type eq 'span' }">
						<${moduleTag.type} style="
						<c:if test='${moduleTag.colorOpen}'>color:rgb(${moduleTag.colorRedValue},${moduleTag.colorGreenValue},${moduleTag.colorBlueValue});</c:if>
						<c:if test='${moduleTag.fontSizeOpen}'>font-size:${moduleTag.fontSize}px;</c:if>
						<c:if test='${moduleTag.backgroundColorOpen}'>background-color:rgb(${moduleTag.backgroundColorRedValue},${moduleTag.backgroundColorGreenValue},${moduleTag.backgroundColorBlueValue});</c:if>
						<c:if test='${moduleTag.paddingTopOpen}'>padding-top:${moduleTag.paddingTop}px;</c:if>
						<c:if test='${moduleTag.paddingRightOpen}'>padding-right:${moduleTag.paddingRight}px;</c:if>
						<c:if test='${moduleTag.paddingBottomOpen}'>padding-bottom:${moduleTag.paddingBottom}px;</c:if>
						<c:if test='${moduleTag.paddingLeftOpen}'>padding-left:${moduleTag.paddingLeft}px;</c:if>
						<c:if test='${moduleTag.borderRadiusOpen}'>border-radius:${moduleTag.borderRadius}px;</c:if>
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
						<div class="item_div" id="item_div${childModuleArea.sort}" style="
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
							color:rgb(${childModuleArea.colorRedValue},${childModuleArea.colorGreenValue},${childModuleArea.colorBlueValue});
							text-align: ${childModuleArea.textAlign};">
							${childModuleArea.value}
							<div class="line_div" style="
							width:${childModuleArea.lineDivWidthValue}${childModuleArea.lineDivWidthUnit};
							margin:${childModuleArea.lineDivMargin};
							border-bottom-width:${childModuleArea.lineDivBorderBottomWidthValue}${childModuleArea.lineDivBorderBottomWidthUnit};
							border-bottom-style:${childModuleArea.lineDivBorderBottomWidthStyle};
							border-bottom-color:rgb(${childModuleArea.lineDivBorderBottomWidthColorRedValue},
													${childModuleArea.lineDivBorderBottomWidthColorGreenValue},
													${childModuleArea.lineDivBorderBottomWidthColorBlueValue});
							"></div>
						</div>
					</c:if>
				</c:forEach>
			</div>
			<div id="content_div">
				<c:forEach items="${requestScope.childModuleAreaList }" var="childModuleArea">
					<c:if test="${childModuleArea.tagType eq 'tabItemDiv'&&childModuleArea.parentId eq moduleArea.id }">
						<div id="item_div${childModuleArea.sort}">
							<c:forEach items="${requestScope.moduleTagList }" var="moduleTag">
								<c:if test="${childModuleArea.id eq moduleTag.areaId }">
									<c:if test="${moduleTag.type eq 'div' }">
										<${moduleTag.type} style="
										width:${moduleTag.widthValue}${moduleTag.widthUnit};
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
										width:${moduleTag.widthValue}${moduleTag.widthUnit};
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
</c:forEach>
<div class="tab_div" id="tab_div" style="width:100%;">
	<div class="title_div" id="title_div" style="width:100%;">
	
		<div class="item_div" id="item_div1" style="width:50%;height:50px;line-height:50px;color:rgb(235,25,58);text-align: center;">
			商品详情
			<div class="line_div" style="width:40%;margin:auto;border-bottom: 2px solid #EB193A;"></div>
		</div>
		<div class="item_div" id="item_div2" style="width:50%;height:50px;line-height:50px;margin-top:-50px;margin-left:50%;color:rgb(51,51,51);text-align: center;">
			常见帮助
			<div class="line_div" style="width:40%;margin:auto;border-bottom: 2px solid #fff;"></div>
		</div>
		
	</div>
	<div id="content_div">
	
		<div id="item_div1" style="">
			<div style="width:90%;margin: auto;margin-top:20px;color:rgb(0,102,204);font-weight: bold;">住了几十年的老房子，屋顶、窗台有裂缝，到处漏水、渗水。屋外大雨，屋里小雨，苦不堪言！</div>
			<div style="width:70%;margin: auto;color:rgb(255,255,0);font-weight: bold;text-align:center;background-color: rgb(230,0,0);">补漏丁基材质胶布，横空出世！</div>
			<embed src="<%=basePath %>resource/embed/202105270001.mp4"/>
		</div>
		<div id="item_div2" style="display: none;">雷雨世界香肠灾难电影。。。</div>
		
	</div>
</div>
</body>
</html>