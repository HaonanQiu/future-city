
<%@ page contentType="text/html;charset=UTF-8" language="java" %><!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Login Page</title>
		<!-- 样 式 文 件 -->
		<link rel="stylesheet" href="component/pear/css/pear.css" />
		<link rel="stylesheet" href="admin/css/other/login.css" />
	</head>
    <!-- 代 码 结 构 -->
	<body background="admin/images/background.svg" style="background-size: cover;">
		<form class="layui-form" action="/web/login/user/login.action" method="post">
			<div class="layui-form-item">
				<img class="logo" src="admin/images/logo.png" />
				<div class="title">Pear Admin</div>
				<div class="desc">
					小 区 管 理 后 台
				</div>
			</div>
			<div class="layui-form-item">
				<input placeholder="账 户 : admin " name="name" lay-verify="required" hover class="layui-input"  />
			</div>
			<div class="layui-form-item">
				<input type="password" name="password" placeholder="密 码 : admin " lay-verify="required" hover class="layui-input"  />
			</div>
			<div class="layui-form-item">
				<button type="submit" class="pear-btn pear-btn-success login" lay-submit lay-filter="login">
					登 入
				</button>
			</div>
		</form>
		<!-- 资 源 引 入 -->
		<script src="component/layui/layui.js"></script>
		<script src="component/pear/pear.js"></script>
	</body>
</html>
