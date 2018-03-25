<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>1</title>
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/easyui/1.3.4/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/wu.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/icon.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/easyui/1.3.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/1.3.4/locale/easyui-lang-zh_CN.js"></script> 

</head>
<body >
<div><table id="dg"></table></div>
<script type="text/javascript">
$('#dg').datagrid({      
    url:'datagrid_data.json',      
    columns:[[      
        {field:'code',title:'Code',width:100},      
        {field:'name',title:'Name',width:100},      
        {field:'price',title:'Price',width:100,align:'right'}      
    ]]      
});    
</script>


	
</body>
</html>