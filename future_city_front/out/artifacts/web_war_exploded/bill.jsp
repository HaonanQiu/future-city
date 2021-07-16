<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>

		<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js" type="text/javascript"></script>
		<link href="${pageContext.request.contextPath}/utils/layui-v2.6.8/layui/css/layui.css" type="text/css" rel="stylesheet" />
		<script src="${pageContext.request.contextPath}/utils/layui-v2.6.8/layui/layui.js" type="text/javascript"></script>

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
					<table class="layui-table">
						<colgroup>
							<col width="150">
							<col width="200">
							<col>
						</colgroup>
						<thead>
							<tr>
								<th>当前用量</th>
								<th>本次使用</th>
								<th>记录日期</th>
								<th>小计</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${lifeCosts}" var="lifeCost">
								<tr>
									<td>${lifeCost.consumption}</td>
									<td>${lifeCost.difference}</td>
									<td>${lifeCost.inputTimeStr()}</td>
									<td>${lifeCost.price}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</body>
</html>
