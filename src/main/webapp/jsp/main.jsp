<%@ page language="java" contentType="text/html;UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>main</title>
  <script type="text/javascript">
        var url;
        function addTab(url, text, iconCls) {
            var content = "<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='${pageContext.request.contextPath}/jsp/"
                    + url + "'></iframe>";
            $("#tabs").tabs("add", {
                title: text,
                iconCls: iconCls,
                closable: true,
                content: content
            });
        }
        function openTab(text, url, iconCls) {
            if ($("#tabs").tabs("exists", text)) {
                $("#tabs").tabs("close", text);
                addTab(url, text, iconCls);
                $("#tabs").tabs("select", text);
            } else {
                addTab(url, text, iconCls);
            }
        }

        function logout() {
            $.messager
                    .confirm(
                            "系统提示",
                            "您确定要退出系统吗",
                            function (r) {
                                if (r) {
                                    window.location.href = "${pageContext.request.contextPath}/logout.action";
                                }
                            });
        }
    </script>
<jsp:include page="base.jsp"></jsp:include>
<jsp:include page="loginCheck.jsp"></jsp:include>

</head>
<body class="easyui-layout">
	<div region="north" style="height: 78px; background-color: #ffff">
		<table width="100%">
			<tr>
				<td width="50%"></td>
				<td valign="bottom"
					style="font-size: 20px; color: #8B8B8B; font-family: '楷体';"
					align="right" width="50%"><font size="3">&nbsp;&nbsp;<strong>当前用户：</strong>${currentUser.username
                    }</font>
				</td>
			</tr>
		</table>
	</div>
	<div region="center">
		<div class="easyui-tabs" fit="true" border="false" id="tabs">
			<div title="首页" data-options="iconCls:'icon-home'">
				<div align="center" style="padding-top: 20px;">欢迎使用！</div>
			</div>
		</div>
	</div>
	<div region="west" style="width: 200px; height: 500px;" title="导航菜单"
		split="true">
		<div class="easyui-accordion">
			<div title="项目管理"
				data-options="selected:true,iconCls:'icon-wenzhangs'"
				style="padding: 10px; height: 10px;">
				<a
					href="javascript:openTab(' 项目管理','articleManage.jsp','icon-wenzhang')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-wenzhang'"
					style="width: 150px;"> 项目管理</a>
			</div>
			<div title="项目管理" data-options="iconCls:'icon-shouye'"
				style="padding: 10px">
				<a
					href="javascript:openTab(' 项目管理置','pictureManage.jsp?type=1&grade=1','icon-tupians')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-tupian'"
					style="width: 150px;"> 项目管理</a>
			</div>
			<div title="统计报表" data-options="iconCls:'icon-shuji'"
				style="padding: 10px">
				<a
					href="javascript:openTab(' 统计报表','allBooksManage.jsp','icon-shuben')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-shuben'"
					style="width: 150px;">统计报表</a>
			</div>
			<div title="系统管理" data-options="iconCls:'icon-item'"
				style="padding: 10px; border: none;">
				<a href="javascript:openTab(' 用户列表','userManage.jsp','icon-lxr')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-lxr'" style="width: 150px;">
					用户列表</a>
					<a href="javascript:openTab(' 基本信息维护','userUpdate.jsp','icon-lxr')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-lxr'" style="width: 150px;">
					基本信息维护</a>
					<a href="javascript:logout()" class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-exit'" style="width: 150px;">
					安全退出</a>
			</div>
		</div>
	</div>
</body>

</html>

