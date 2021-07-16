<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/utils/layui-v2.6.8/layui/layui.js" type="text/javascript"></script>
		<link href="${pageContext.request.contextPath}/utils/layui-v2.6.8/layui/css/layui.css" type="text/css" rel="stylesheet" />
	</head>
	<body>
		<h1 align="center">${sessionScope.information.title}</h1>
		<div>
			<span style="display: inline-block;float: left">发布日期: ${sessionScope.information.sendTimeStr()}</span>
			<span class="layui-badge-rim" style="display: inline-block;float: right">
				<i class="layui-icon layui-icon-read" style="font-size: 20px;"></i>
				浏览次数：${sessionScope.information.readCount}</span>
		</div>
		<hr class="layui-border-red" />
		<div class="layui-container">
			<div class="layui-row">
				<div class="layui-col-lg-offset2 layui-col-lg8">
					<p style="white-space: pre-wrap;text-indent: 2em;">${sessionScope.information.content}</p>
				</div>
			</div>
		</div>
	</body>
</html>
