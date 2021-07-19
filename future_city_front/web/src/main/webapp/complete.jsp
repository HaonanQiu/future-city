<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
		<script src="utils/layui-v2.6.8/layui/layui.js" type="text/javascript"></script>
		<link href="utils/layui-v2.6.8/layui/css/layui.css" type="text/css" rel="stylesheet" />
		<script src="js/complete.js" type="text/javascript"></script>
	</head>
	<body>
		<div class="layui-container">
			<div class="layui-row">
				<div class="layui-col-lg-offset3 layui-col-lg6">
					<form class="layui-form layui-form-pane" action="${pageContext.request.contextPath}/householder/complete">
						<div class="layui-form-item">
							<label class="layui-form-label">联系电话</label>
							<div class="layui-input-block">
								<input type="tel" name="phone" id="phone" required lay-verify="required|phone" placeholder="请输入联系电话"
									autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">电子邮箱</label>
							<div class="layui-input-block">
								<input type="email" name="email" id="email" required lay-verify="required|email" placeholder="请输入电子邮箱" autocomplete="off"
									class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">验证码</label>
							<div class="layui-input-block">
								<input type="text" name="code" id="code" required lay-verify="required" placeholder="请输入验证码" autocomplete="off"
									class="layui-input">
								<button type="button" class="layui-btn layui-btn-primary" id="codeDiv" 
								style="position: absolute;right: 0px;top: 0px;">获取验证码</button>
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-input-block">
								<button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
								<button type="reset" class="layui-btn layui-btn-primary">重置</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>
