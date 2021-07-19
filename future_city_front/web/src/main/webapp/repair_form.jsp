<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>

		<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/utils/layui-v2.6.8/layui/layui.js" type="text/javascript"></script>
		<link href="${pageContext.request.contextPath}/utils/layui-v2.6.8/layui/css/layui.css" type="text/css" rel="stylesheet" />

		<script src="${pageContext.request.contextPath}/js/repair_info.js" type="text/javascript"></script>
	</head>
	<c:if test="${ empty sessionScope.householder }">
		<script>
			window.location.href = '${pageContext.request.contextPath}/login.jsp'
		</script>
	</c:if>
	<body>
		<div class="layui-container">
			<div class="layui-row">
				<div class="layui-col-lg-offset3 layui-col-lg6">
					<form class="layui-form layui-form-pane" action="#" id="form">
						<input type="hidden" name="hid" value="${sessionScope.householder.id}"/>
						<div class="layui-form-item">
							<label class="layui-form-label">选择房屋</label>
							<div class="layui-input-block">
								<select name="address" lay-verify="required">
									<c:forEach items="${rooms}" var="room">
										<option value="${room.buildingNum}栋-${room.unitNum}单元-${room.roomNum}室">${room.buildingNum}栋-${room.unitNum}单元-${room.roomNum}室</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">联系电话</label>
							<div class="layui-input-block">
								<input type="text" name="phone" required lay-verify="required" placeholder="请输入您的联系方式"
									autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item layui-form-text">
							<label class="layui-form-label">报修内容</label>
							<div class="layui-input-block">
								<textarea name="message" placeholder="请输入报修内容" class="layui-textarea"></textarea>
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-input-block">
								<button class="layui-btn"  id="submit1">立即提交</button>
								<button type="reset" class="layui-btn layui-btn-primary">重置</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>
