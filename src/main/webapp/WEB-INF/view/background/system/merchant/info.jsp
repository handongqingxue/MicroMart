<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商家信息</title>
<%@include file="../../js.jsp"%>
<link rel="stylesheet" href="<%=basePath %>resource/css/background/system/merchant/info.css"/>
<script type="text/javascript" src="<%=basePath %>resource/js/MD5.js"></script>
<script type="text/javascript">
var path='<%=basePath %>';
var systemPath=path+"background/system/";
$(function(){
	$("#zhxx_div").css("width",setFitWidthInParent("body")+"px");
	$("#sjxx_div").css("width",setFitWidthInParent("body")+"px");
});

function openEditPwdDialog(flag){
	$("#editPwdBg_div").css("display",flag==1?"block":"none");
}

function openEditMerchantDialog(flag){
	$("#editMerchantBg_div").css("display",flag==1?"block":"none");
}

function uploadLogo(){
	document.getElementById("logo_inp").click();
}

function showLogo(obj){
	var file = $(obj);
    var fileObj = file[0];
    var windowURL = window.URL || window.webkitURL;
    var dataURL;
    var $img = $("#logo_img");

    if (fileObj && fileObj.files && fileObj.files[0]) {
        dataURL = windowURL.createObjectURL(fileObj.files[0]);
        $img.attr("src", dataURL);
    } else {
        dataURL = $file.val();
        var imgObj = document.getElementById("preview");
        // 两个坑:
        // 1、在设置filter属性时，元素必须已经存在在DOM树中，动态创建的Node，也需要在设置属性前加入到DOM中，先设置属性在加入，无效；
        // 2、src属性需要像下面的方式添加，上面的两种方式添加，无效；
        imgObj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
        imgObj.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = dataURL;

    }
}

function checkEditPwd(){
	if(checkPassword()){
		if(checkNewPwd()){
			if(checkNewPwd2()){
				var password = $("#newPwd").val();
				$.post(systemPath+"updatePwdById",
					{password:MD5(password).toUpperCase()},
					function(result){
						var json=JSON.parse(result);
						if(json.status==1){
							$.messager.defaults.ok = "是";
						    $.messager.defaults.cancel = "否";
						    $.messager.defaults.width = 350;//更改消息框宽度
						    $.messager.confirm(
						    	"提示",
						    	"修改密码成功，重新登录生效！是否重新登录？"
						        ,function(r){    
						            if (r){    
						            	location.href=path+"background/exit";
						            }
						        }); 
						}
						else{
							$.messager.alert("提示","修改密码失败","warning");
						}
					}
				);
			}
		}
	}
}

//验证原密码
function checkPassword(){
	var flag=false;
	var userName='${sessionScope.merchant.userName}';
	var password = $("#password").val();
	if(password==null||password==""){
		alert("原密码不能为空");
		flag=false;
	}
	else{
		$.ajaxSetup({async:false});
		$.post(systemPath+"checkPassword",
			{password:MD5(password).toUpperCase(),userName:userName},
			function(data){
				if(data.status=="ok"){
					flag=true;
				}
				else{
					alert(data.message);
					flag=false;
				}
			}
		,"json");
	}
	return flag;
}

function checkEditMerchant(){
	if(checkShopName()){
		if(checkShopAddress()){
			if(checkContactTel()){
				editMerchant();
			}
		}
	}
}

function editMerchant(){
	var formData = new FormData($("#form1")[0]);
	$.ajax({
		type:"post",
		url:systemPath+"editMerchant",
		dataType: "json",
		data:formData,
		cache: false,
		processData: false,
		contentType: false,
		success: function (data){
			if(data.status==1){
				alert(data.msg);
				location.href=path+"background/exit";
			}
			else{
				alert(data.msg);
			}
		}
	});
}

//验证新密码
function checkNewPwd(){
	var password = $("#password").val();
	var newPwd = $("#newPwd").val();
	if(newPwd==null||newPwd==""){
	  	alert("新密码不能为空");
	  	return false;
	}
	if(newPwd==password){
		alert("新密码不能和原密码一致！");
		return false;
	}
	else
		return true;
}

//验证确认密码
function checkNewPwd2(){
	var newPwd = $("#newPwd").val();
	var newPwd2 = $("#newPwd2").val();
	if(newPwd2==null||newPwd2==""){
	  	alert("确认密码不能为空");
	  	return false;
	}
	else if(newPwd!=newPwd2){
		alert("两次密码不一致！");
		return false;
	}
	else
		return true;
}

function focusShopName(){
	var shopName = $("#shopName").val();
	if(shopName=="公司名称不能为空"){
		$("#shopName").val("");
		$("#shopName").css("color", "#555555");
	}
}

//验证商家名称
function checkShopName(){
	var shopName = $("#shopName").val();
	if(shopName==null||shopName==""||shopName=="商家名称不能为空"){
		$("#shopName").css("color","#E15748");
    	$("#shopName").val("商家名称不能为空");
    	return false;
	}
	else
		return true;
}

function focusShopAddress(){
	var shopAddress = $("#shopAddress").val();
	if(shopAddress=="商家地址不能为空"){
		$("#shopAddress").val("");
		$("#shopAddress").css("color", "#555555");
	}
}

//验证商家地址
function checkShopAddress(){
	var shopAddress = $("#editMerchant_div #shopAddress").val();
	if(shopAddress==null||shopAddress==""||shopAddress=="商家地址不能为空"){
		$("#shopAddress").css("color","#E15748");
    	$("#shopAddress").val("商家地址不能为空");
    	return false;
	}
	else
		return true;
}

function focusContactTel(){
	var contactTel = $("#contactTel").val();
	if(contactTel=="联系电话不能为空"){
		$("#contactTel").val("");
		$("#contactTel").css("color", "#555555");
	}
}

//验证联系电话
function checkContactTel(){
	var contactTel = $("#contactTel").val();
	if(contactTel==null||contactTel==""||contactTel=="联系电话不能为空"){
		$("#contactTel").css("color","#E15748");
    	$("#contactTel").val("联系电话不能为空");
    	return false;
	}
	else
		return true;
}
	
function setFitWidthInParent(o){
	var width=$(o).css("width");
	return width.substring(0,width.length-2)-310;
}
</script>
</head>
<body>
<div class="editPwdBg_div" id="editPwdBg_div">
	<div class="editPwd_div">
		<div>
			<span class="close_span" onclick="openEditPwdDialog(0)">×</span>
		</div>
		<h4 class="title">修改密码</h4>
		<div class="ymm_div">
			<input type="password" id="password" placeholder="原密码"/>
		</div>
		<div class="xmm_div">
			<input type="password" id="newPwd" placeholder="新密码"/>
		</div>
		<div class="qrmm_div">
			<input type="password" id="newPwd2" placeholder="确认密码"/>
		</div>
		<div class="confirm_div" onclick="checkEditPwd()">确定</div>
		<div class="warn_div">注意：密码修改后需要重新登录系统</div>
	</div>
</div>

<div class="editMerchantBg_div" id="editMerchantBg_div">
	<div class="editMerchant_div" id="editMerchant_div">
		<div>
			<span class="close_span" onclick="openEditMerchantDialog(0)">×</span>
		</div>
		<h4 class="title">商家信息</h4>
		<form id="form1" name="form1" method="post" enctype="multipart/form-data">
		<input type="hidden" id="id" name="id" value="${sessionScope.merchant.id }">
		<div class="gsmc_div">
			<span>商&nbsp;&nbsp;家&nbsp;&nbsp;&nbsp;名&nbsp;&nbsp;称</span>
			<input type="text" id="shopName" name="shopName" value="${sessionScope.merchant.shopName }" onfocus="focusShopName()" onblur="checkShopName()"/>
		</div>
		<div class="gsdz_div">
			<span>商&nbsp;&nbsp;家&nbsp;&nbsp;&nbsp;地&nbsp;&nbsp;址</span>
			<input type="text" id="shopAddress" name="shopAddress" value="${sessionScope.merchant.shopAddress }" onfocus="focusShopAddress()" onblur="checkShopAddress()"/>
		</div>
		<div class="lxdh_div">
			<span>联&nbsp;&nbsp;系&nbsp;&nbsp;&nbsp;电&nbsp;&nbsp;话</span>
			<input type="text" id="contactTel" name="contactTel" value="${sessionScope.merchant.contactTel }" onfocus="focusContactTel()" onblur="checkContactTel()"/>
		</div>
		<div class="logo_div">
			<span>商&nbsp;&nbsp;家&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;logo</span>
			<div class="img_div">
				<div class="upLoBut_div" onclick="uploadLogo()">选择商家logo</div>
				<input type="file" id="logo_inp" name="logo_inp" style="display: none;" onchange="showLogo(this)"/>
				<img class="logo_img" id="logo_img" alt="" src="${sessionScope.merchant.logo }">
			</div>
		</div>
		</form>
		<div class="but_div">
			<button class="but cancel_but" onclick="openEditMerchantDialog(0)">取消</button>
			<button class="but submit_but" onclick="checkEditMerchant()">提交</button>
		</div>
	</div>
</div>

<div class="layui-layout layui-layout-admin">
	<%@include file="../../side.jsp"%>
	<div class="zhxx_div" id="zhxx_div">
		<div class="title_div">账户信息</div>
		<div class="attr_div">
			<span class="sjzh_key_span">用户账号：</span>
			<span class="sjzh_val_span">${sessionScope.merchant.userName }</span>
			<span class="mm_key_span">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</span>
			<span class="mm_ysz_span">已设置</span>
			<span class="xgmm_span" onclick="openEditPwdDialog(1)">修改密码</span>
		</div>
	</div>
	<div class="sjxx_div" id="sjxx_div">
		<div class="title_div">商家信息</div>
		<div class="attr_div">
			<span class="key_span">商&nbsp;&nbsp;家&nbsp;&nbsp;&nbsp;名&nbsp;&nbsp;称：</span>
			<span class="value_span">${sessionScope.merchant.shopName }</span>
		</div>
		<div class="attr_div">
			<span class="key_span">商&nbsp;&nbsp;家&nbsp;&nbsp;&nbsp;地&nbsp;&nbsp;址：</span>
			<span class="value_span">${sessionScope.merchant.shopAddress }</span>
		</div>
		<div class="attr_div">
			<span class="key_span">联&nbsp;&nbsp;系&nbsp;&nbsp;&nbsp;电&nbsp;&nbsp;话：</span>
			<span class="value_span">${sessionScope.merchant.contactTel }</span>
		</div>
		<div class="attr_div">
			<span class="key_span">商&nbsp;&nbsp;家&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;logo：</span>
			<img alt="" src="${sessionScope.merchant.logo }">
		</div>
		<div class="attr_div">
			<span class="em_but_span" onclick="openEditMerchantDialog(1)">修改商家信息</span>
		</div>
	</div>
	<%@include file="../../foot.jsp"%>
</div>
</body>
</html>