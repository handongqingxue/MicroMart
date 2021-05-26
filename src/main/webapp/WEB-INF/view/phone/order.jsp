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
<style type="text/css">
body{
	margin: 0;
}
</style>
<title>下单</title>
</head>
<body>
<c:forEach items="${requestScope.moduleAreaList }" var="moduleArea">
	<c:if test="${moduleArea.tagType eq 'div' }">
	<div style="width:${moduleArea.widthValue}${moduleArea.widthUnit};height:${moduleArea.heightValue}${moduleArea.heightUnit};">
		<c:forEach items="${requestScope.moduleTagList }" var="moduleTag">
			<c:if test="${moduleArea.id eq moduleTag.areaId }">
				<c:if test="${moduleTag.type eq 'img' }">
					<img alt="" src="<%=basePath%>${moduleTag.value}" style="width:${moduleTag.widthValue}${moduleTag.widthUnit};
					height:${moduleTag.heightValue}${moduleTag.heightUnit};
					margin-left:${moduleTag.marginLeft}px;
					margin-top:${moduleTag.marginTop}px;">
				</c:if>
			</c:if>
		</c:forEach>
	</div>
	</c:if>
</c:forEach>
<img style="width:100%;" alt="" src="<%=basePath%>/resource/image/202105260001.webp">
<div style="width:100%;height:45px;line-height:45px;">我都不惜说你了。。。</div>
</body>
</html>