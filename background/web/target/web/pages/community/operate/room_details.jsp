<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="utf-8">
  <title>信息管理</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/component/pear/css/pear.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/component/layui/css/layui.css"/>
</head>

<body>
<table class="layui-table" lay-skin="nob">
  <tbody>
  <tr>
    <td>房屋编号</td>
    <td>${room.id}</td>
  </tr>
  <tr>
    <td>楼号</td>
    <td>${room.buildingNum}</td>
  </tr>
  <tr>
    <td>单元号</td>
    <td>${room.unitNum}</td>
  </tr>
  <tr>
    <td>房间号</td>
    <td>${room.roomNum}</td>
  </tr>
  <tr>
    <td>房间面积</td>
    <td>${room.area}</td>
  </tr>
  <tr>
    <td>户主信息:</td>
  </tr>
  <tr>
    <td>姓名</td>
    <td>${room.houseHolder.name}</td>
  </tr>
  <tr>
    <td>身份证号</td>
    <td>${room.houseHolder.identification}</td>
  </tr>
  <tr>
    <td>手机号</td>
    <td>${room.houseHolder.phone}</td>
  </tr>
  <tr>
    <td>邮箱</td>
    <td>${room.houseHolder.email}</td>
  </tr>
  </tbody>
</table>
</body>

</html>
