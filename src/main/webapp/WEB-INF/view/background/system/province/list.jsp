<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="../../js.jsp"%>
<script type="text/javascript">
var systemPath='<%=basePath%>'+"background/system/";
var apjbsxzdNum=0;
var epjbsxzdNum=1;
$(function(){
	initProvinceTab();
	initAddProvinceJBSXZDialog();//0.添加省份窗口
	initEditProvinceJBSXZDialog();//1.修改运输商窗口
	
	initDialogPosition();//将不同窗体移动到主要内容区域
});

function initDialogPosition(){
	//添加省份
	var apjbsxzdpw=$("body").find(".panel.window").eq(apjbsxzdNum);
	var apjbsxzdws=$("body").find(".window-shadow").eq(apjbsxzdNum);

	//编辑省份
	var epjbsxzdpw=$("body").find(".panel.window").eq(epjbsxzdNum);
	var epjbsxzdws=$("body").find(".window-shadow").eq(epjbsxzdNum);

	var apdDiv=$("#add_province_dialog_div");
	apdDiv.append(apjbsxzdpw);
	apdDiv.append(apjbsxzdws);

	var epdDiv=$("#edit_province_dialog_div");
	epdDiv.append(epjbsxzdpw);
	epdDiv.append(epjbsxzdws);
}

function initAddProvinceJBSXZDialog(){
	initAddProvinceDivIfShowCBB();
	
	addProvinceDialog=$("#add_province_jbsxz_dialog_div").dialog({
		title:"添加省份实体",
		width:setFitWidthInParent("#add_province_div","add_province_jbsxz_dialog_div"),
		height:231,
		top:10,
		left:20,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openAddProvinceDialog(0);
           }},
           {text:"保存",id:"ok_but",iconCls:"icon-save",handler:function(){
        	    addProvince();
           }}
        ]
	});

	$("#add_province_jbsxz_dialog_div table").css("width",(setFitWidthInParent("#add_province_div","add_province_jbsxz_dialog_table"))+"px");
	$("#add_province_jbsxz_dialog_div table").css("magin","-100px");
	$("#add_province_jbsxz_dialog_div table td").css("padding-left","20px");
	$("#add_province_jbsxz_dialog_div table td").css("padding-right","20px");
	$("#add_province_jbsxz_dialog_div table td").css("font-size","15px");
	$("#add_province_jbsxz_dialog_div table tr").css("height","45px");

	$(".panel.window").eq(apjbsxzdNum).css("margin-top","40px");
	$(".panel.window .panel-title").eq(apjbsxzdNum).css("color","#000");
	$(".panel.window .panel-title").eq(apjbsxzdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(apjbsxzdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(apjbsxzdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(apjbsxzdNum).css("margin-top","40px");
	$(".window,.window .window-body").css("border-color","#ddd");

	$("#add_province_jbsxz_dialog_div #cancel_but").css("left","30%");
	$("#add_province_jbsxz_dialog_div #cancel_but").css("position","absolute");

	$("#add_province_jbsxz_dialog_div #ok_but").css("left","55%");
	$("#add_province_jbsxz_dialog_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openAddProvinceJBSXZDialog(0);
}

function initAddProvinceDivIfShowCBB(){
	apdIfShowCBB=$("#add_province_div #ifShow_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:[{"value":"","text":"请选择"},{"value":"1","text":"是"},{"value":"0","text":"否"}]
		/*
		onLoadSuccess:function(){
			$(this).combobox("setValue",'${requestScope.dd.lxlx }');
		},
		onSelect:function(){
			$("#lxlx").val($(this).combobox("getValue"));
		}
		*/
	});
}

function initEditProvinceJBSXZDialog(){
	initEditProvinceDivIfShowCBB();
	
	editProvinceDialog=$("#edit_province_jbsxz_dialog_div").dialog({
		title:"编辑省份实体",
		width:setFitWidthInParent("#edit_province_div","edit_province_jbsxz_dialog_div"),
		height:231,
		top:10,
		left:20,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openEditProvinceDialog(0);
           }},
           {text:"保存",id:"ok_but",iconCls:"icon-save",handler:function(){
        	    editProvince();
           }}
        ]
	});

	$("#edit_province_jbsxz_dialog_div table").css("width",(setFitWidthInParent("#edit_province_div","edit_province_jbsxz_dialog_table"))+"px");
	$("#edit_province_jbsxz_dialog_div table").css("magin","-100px");
	$("#edit_province_jbsxz_dialog_div table td").css("padding-left","20px");
	$("#edit_province_jbsxz_dialog_div table td").css("padding-right","20px");
	$("#edit_province_jbsxz_dialog_div table td").css("font-size","15px");
	$("#edit_province_jbsxz_dialog_div table tr").css("height","45px");

	$(".panel.window").eq(epjbsxzdNum).css("margin-top","40px");
	$(".panel.window .panel-title").eq(epjbsxzdNum).css("color","#000");
	$(".panel.window .panel-title").eq(epjbsxzdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(epjbsxzdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(epjbsxzdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(epjbsxzdNum).css("margin-top","40px");
	$(".window,.window .window-body").css("border-color","#ddd");

	$("#edit_province_jbsxz_dialog_div #cancel_but").css("left","30%");
	$("#edit_province_jbsxz_dialog_div #cancel_but").css("position","absolute");

	$("#edit_province_jbsxz_dialog_div #ok_but").css("left","55%");
	$("#edit_province_jbsxz_dialog_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openEditProvinceJBSXZDialog(0);
}

function initEditProvinceDivIfShowCBB(){
	epdIfShowCBB=$("#edit_province_div #ifShow_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:[{"value":"","text":"请选择"},{"value":"1","text":"是"},{"value":"0","text":"否"}]
	});
}

function initProvinceTab(){
	initProvinceTabSearchLB();
	initProvinceTabAddLB();
	initProvinceTabRemoveLB();
	
	provinceTab=$("#province_tab").datagrid({
		title:"省份查询",
		url:systemPath+"selectProvinceList",
		toolbar:"#province_toolbar",
		width:400,
		height:300,
		pagination:true,
		pageSize:10,
		columns:[[
			{field:"name",title:"名称",width:150},
			{field:"sort",title:"排序",width:60},
			{field:"ifShow",title:"是否显示",width:100,formatter:function(value,row){
				return value?"是":"否";
			}},
			{field:"id",title:"操作",width:60,formatter:function(value,row){
				return "<a onclick=\"editProvinceTabRow()\">编辑</a>";
			}}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{name:"<div style=\"text-align:center;\">暂无信息<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"name",colspan:4});
				data.total=0;
			}
			
			$(".panel-header").css("background","linear-gradient(to bottom,#F4F4F4 0,#F4F4F4 20%)");
			$(".panel-header .panel-title").css("color","#000");
			$(".panel-header .panel-title").css("font-size","15px");
			$(".panel-header .panel-title").css("padding-left","10px");
			$(".panel-header, .panel-body").css("border-color","#ddd");
		}
	});
}

function initProvinceTabSearchLB(){
	$("#province_toolbar #search_but").linkbutton({
		iconCls:"icon-search",
		onClick:function(){
			var name=$("#province_toolbar #name").val();
			provinceTab.datagrid("load",{name:name});
		}
	});
}

function initProvinceTabAddLB(){
	$("#province_toolbar #add_but").linkbutton({
		iconCls:"icon-add",
		onClick:function(){
			openAddProvinceDialog(1);
		}
	});
}

function initProvinceTabRemoveLB(){
	$("#province_toolbar #remove_but").linkbutton({
		iconCls:"icon-remove",
		onClick:function(){
			
		}
	});
}

function openAddProvinceDialog(flag){
	if(flag==1){
		$("#add_province_bg_div").css("display","block");
	}
	else{
		$("#add_province_bg_div").css("display","none");
	}
	openAddProvinceJBSXZDialog(flag);
}

function openAddProvinceJBSXZDialog(flag){
	if(flag==1){
		addProvinceDialog.dialog("open");
	}
	else{
		addProvinceDialog.dialog("close");
	}
}

function addProvince(){
	var name=$("#add_province_div #name").val();
	var sort=$("#add_province_div #sort").val();
	var ifShow=apdIfShowCBB.combobox("getValue");
	$.post(systemPath+"addProvince",
		{name:name,sort:sort,ifShow:ifShow},
		function(data){
			if(data.status=="ok"){
				alert(data.message);
				provinceTab.datagrid("load");
			}
			else
				alert(data.message);
			openAddProvinceDialog(0);
		}
	,"json");
}

function openEditProvinceDialog(flag){
	if(flag==1){
		$("#edit_province_bg_div").css("display","block");
	}
	else{
		$("#edit_province_bg_div").css("display","none");
	}
	openEditProvinceJBSXZDialog(flag);
}

function openEditProvinceJBSXZDialog(flag){
	if(flag==1){
		editProvinceDialog.dialog("open");
	}
	else{
		editProvinceDialog.dialog("close");
	}
}

function editProvinceTabRow(){
	var row=provinceTab.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("提示","请选择要编辑的信息！","warning");
		return false;
	}
	$("#edit_province_div #id").val(row.id);
	$("#edit_province_div #name").val(row.name);
	$("#edit_province_div #sort").val(row.sort);
	epdIfShowCBB.combobox("setValue",row.ifShow?"1":"0");
	openEditProvinceDialog(1);
}

function editProvince(){
	var id=$("#edit_province_div #id").val();
	var name=$("#edit_province_div #name").val();
	var sort=$("#edit_province_div #sort").val();
	var ifShow=epdIfShowCBB.combobox("getValue");
	$.post(systemPath+"editProvince",
		{id:id,name:name,sort:sort,ifShow:ifShow},
		function(data){
			if(data.status=="ok"){
				alert(data.message);
				provinceTab.datagrid("load");
			}
			else
				alert(data.message);
			openEditProvinceDialog(0);
		}
	,"json");
}

function setFitWidthInParent(parent,self){
	var space=0;
	switch (self) {
	case "add_province_jbsxz_dialog_div":
	case "edit_province_jbsxz_dialog_div":
		space=50;
		break;
	case "add_province_jbsxz_dialog_table":
	case "edit_province_jbsxz_dialog_table":
		space=65;
		break;
	}
	var width=$(parent).css("width");
	return width.substring(0,width.length-2)-space;
}
</script>
<style type="text/css">
.province_tab_div{
	margin-top:20px;
	margin-left: 220px;
}
.city_tab_div{
	margin-top:-172px;
	margin-left: 650px;
}

.add_province_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: fixed;
	z-index: 9016;
	display:none;
}
.add_province_div{
	width: 500px;
	height: 400px;
	margin: 150px auto 0;
	background-color: #fff;
	border-radius:5px;
	position: absolute;
	left: 0;
	right: 0;
}
.add_province_div .xgst_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	border-bottom: #eee solid 1px;
}
.add_province_div .xgst_span{
	margin-left: 30px;
}
.add_province_div .close_span{
	float: right;margin-right: 30px;cursor: pointer;
}
.add_province_dialog_div{
	width: 500px;
	height: 350px;
	overflow-y: scroll;
	position: absolute;
}
.add_province_div .title_div{
	width: 100%;height: 50px;line-height: 50px;
}
.add_province_div .title_span{
	margin-left: 30px;
}

.edit_province_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: fixed;
	z-index: 9016;
	display:none;
}
.edit_province_div{
	width: 500px;
	height: 400px;
	margin: 150px auto 0;
	background-color: #fff;
	border-radius:5px;
	position: absolute;
	left: 0;
	right: 0;
}
.edit_province_div .xgst_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	border-bottom: #eee solid 1px;
}
.edit_province_div .xgst_span{
	margin-left: 30px;
}
.edit_province_div .close_span{
	float: right;margin-right: 30px;cursor: pointer;
}
.edit_province_dialog_div{
	width: 500px;
	height: 350px;
	overflow-y: scroll;
	position: absolute;
}
.edit_province_div .title_div{
	width: 100%;height: 50px;line-height: 50px;
}
.edit_province_div .title_span{
	margin-left: 30px;
}
</style>
<title>省市查询</title>
</head>
<body>
<!-- 添加省份start -->
<div class="add_province_bg_div" id="add_province_bg_div">
	<div class="add_province_div" id="add_province_div">
		<div class="xgst_div">
			<span class="xgst_span">添加实体</span>
			<span class="close_span" onclick="openAddProvinceDialog(0)">X</span>
		</div>
		<div class="add_province_dialog_div" id="add_province_dialog_div">
			<div class="title_div">
				<span class="title_span">省市管理-省份查询-添加</span>
			</div>
			<div id="add_province_jbsxz_dialog_div">
				<table>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right" style="width:30%;">
						名称
					</td>
					<td style="width:60%;">
						<input type="text" id="name" placeholder="请输入名称" style="width: 200px;height:30px;"/>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right" style="width:30%;">
						排序
					</td>
					<td style="width:60%;">
						<input type="number" id="sort" placeholder="请输入排序" style="width: 100px;height:30px;"/>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right" style="width:30%;">
						是否显示
					</td>
					<td style="width:60%;">
						<input id="ifShow_cbb"/>
					</td>
				  </tr>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 添加省份end -->

<!-- 编辑省份 start -->
<div class="edit_province_bg_div" id="edit_province_bg_div">
	<div class="edit_province_div" id="edit_province_div">
		<div class="xgst_div">
			<span class="xgst_span">编辑实体</span>
			<span class="close_span" onclick="openEditProvinceDialog(0)">X</span>
		</div>
		<div class="edit_province_dialog_div" id="edit_province_dialog_div">
			<div class="title_div">
				<span class="title_span">省市管理-省份查询-编辑</span>
			</div>
			<div id="edit_province_jbsxz_dialog_div">
				<input type="hidden" id="id"/>
				<table>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right" style="width:30%;">
						名称
					</td>
					<td style="width:60%;">
						<input type="text" id="name" placeholder="请输入名称" style="width: 200px;height:30px;"/>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right" style="width:30%;">
						排序
					</td>
					<td style="width:60%;">
						<input type="number" id="sort" placeholder="请输入排序" style="width: 100px;height:30px;"/>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right" style="width:30%;">
						是否显示
					</td>
					<td style="width:60%;">
						<input id="ifShow_cbb"/>
					</td>
				  </tr>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 编辑省份 end -->

<div class="layui-layout layui-layout-admin">
	<%@include file="../../side.jsp"%>
	<div class="province_tab_div" id="province_tab_div">
		<div id="province_toolbar" style="height:32px;">
			<span style="margin-left: 13px;">名称：</span>
			<input type="text" id="name" placeholder="请输入名称" style="width: 120px;height: 25px;"/>
			<a id="search_but" style="margin-left: 13px;">查询</a>
			<a id="add_but">添加</a>
			<a id="remove_but">删除</a>
		</div>
		<table id="province_tab">
		</table>
	</div>
	<div class="city_tab_div">
		<table id="city_tab">
		</table>
	</div>
	<%@include file="../../foot.jsp"%>
</div>
</body>
</html>