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

		<script src="${pageContext.request.contextPath}/js/roomInfo.js" type="text/javascript"></script>
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
					<table class="layui-table" lay-size="lg">
						<thead>
						    <tr>
						      <th>参数</th>
						      <th>参数值</th>
						    </tr> 
						  </thead>
						  <tbody>
						      <tr>
						        <td>房屋编号</td>
						        <td>${sessionScope.room.id}</td>
						      </tr>
						      <tr>
						        <td>楼号</td>
						        <td>${sessionScope.room.buildingNum}号楼</td>
						      </tr>
						      <tr>
						        <td>单元号</td>
						        <td>${sessionScope.room.unitNum}单元</td>
						      </tr>
						      <tr>
						        <td>房间号</td>
						        <td>${sessionScope.room.roomNum}室</td>
						      </tr>
						      <tr>
						        <td>面积</td>
						        <td>${sessionScope.room.area}㎡</td>
						      </tr>
						      <tr>
						        <td>状态</td>
						        <td>有人居住</td>
						      </tr>
						    </tbody>
					</table>
				</div>
			</div>
		</div>
	</body>
</html>
