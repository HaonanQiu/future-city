<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>

		<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
		<script src="utils/layui-v2.6.8/layui/layui.js" type="text/javascript"></script>
		<link href="utils/layui-v2.6.8/layui/css/layui.css" type="text/css" rel="stylesheet" />

		<script>
			layui.use('rate', function() {
				var rate = layui.rate;
				//渲染
				var ins1 = rate.render({
					elem: '#starDiv', //绑定元素
					half: true,
					value: 1,
					choose: function(value) {
						$("#star").attr("value", value);
						if (value >= 0 && value <= 2) {
							layer.msg('抱歉，让您失望了');
						} else if (value > 2 && value <= 4) {
							layer.msg('我们会继续努力的');
						} else {
							layer.msg('感谢您的肯定');
						}
					}
				});
			});
		</script>

	</head>
	<c:if test="${ empty sessionScope.householder }">
		<script>
			window.location.href = '${pageContext.request.contextPath}/login.jsp'
		</script>
	</c:if>
	<body>
	<%
		int rid = Integer.parseInt(request.getParameter("rid"));
		request.setAttribute("rid", rid);
	%>
		<div class="layui-container">
			<div class="layui-row">
				<div class="layui-col-lg-offset2 layui-col-lg8">
					<form class="layui-form layui-form-pane" action="/web/evaluate/submit">
						<input type="hidden" name="rid" value="${requestScope.rid}"/>
						<div class="layui-form-item">
							<label class="layui-form-label">星级评价</label>
							<div class="layui-input-inline" style="width: 200px;">
								<div id="starDiv"></div>
								<input type="hidden" name="star" id="star" value="1" />
							</div>
						</div>
						<div class="layui-form-item" pane>
							<label class="layui-form-label">评价内容</label>
							<div class="layui-input-inline" style="width: 400px;">
								<textarea name="content" required lay-verify="required" placeholder="请输入"
									class="layui-textarea"></textarea>
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
