<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>未来城智慧社区登录页面</title>
		<!-- 网页小图标 -->
		<link rel="shortcut icon" type="image/x-icon" href="images/icon.png" style="border-radius: 50%;" />
		<!-- 引入jquery -->
		<script src="js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
		<!-- 引入bootstrap -->
		<script src="utils/bootstrap/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" type="text/css" href="utils/bootstrap/css/bootstrap.css" />
		<!-- 引入layui -->
		<script src="utils/layui-v2.6.8/layui/layui.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" type="text/css" href="utils/layui-v2.6.8/layui/css/layui.css" />
		<!-- 引入自己编写的css -->
		<link rel="stylesheet" type="text/css" href="css/login.css" />
		<!-- 引入自己编写的js -->
		<script src="js/login.js" type="text/javascript" charset="utf-8"></script>
	</head>
	<body style="background-image: url(images/login-bg.jpg);background-size: cover;">
		<div class="container-fluid">
			<h1>未来城智慧社区登录页面</h1>
			<!-- 内容区 -->
			<div id="form-div">
				<div class="layui-tab layui-tab-brief" style="margin: 0px;">
					<ul class="layui-tab-title">
						<li class="layui-this">密码登录</li>
						<li>邮箱登录</li>
					</ul>
					<div class="layui-tab-content">
						<div class="layui-tab-item layui-show layui-anim layui-anim-scale">
							<form action="/householder/login" method="post" class="form">
								<div class="form-group">
									<input type="text" class="form-control" name="identification" id="account"
										placeholder="身份证号">
								</div>
								<div class="form-group">
									<input type="password" class="form-control" name="password" id="password"
										placeholder="密码">
								</div>
								<div class="form-group">
									<span id="forget"><a href="${pageContext.request.contextPath}/forget_pwd.jsp">忘记密码</a></span>
								</div>
								<button type="button" class="btn btn-default submit" id="account_submit">登录</button>
							</form>
						</div>
						<div class="layui-tab-item layui-anim layui-anim-scale">
							<form action="UserServlet?m=emailLogin" method="post" class="form" id="login_form">
								<div class="form-group">
									<input type="text" class="form-control" name="email" id="email" placeholder="邮箱">
								</div>
								<div class="form-group">
									<div class="input-group">
										<input type="text" class="form-control" name="verCode" id="code"
											placeholder="验证码">
										<button type="button" class="btn btn-default" id="codeDiv">获取验证码</button>
									</div>
								</div>
								<div class="form-group">
									<span id="forget"><a href="${pageContext.request.contextPath}/forget_pwd.jsp">忘记密码</a></span>
								</div>
								<button type="button" class="btn btn-default submit" id="email_submit">登录</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
