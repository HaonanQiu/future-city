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
    <td>报修编号</td>
    <td>${repairInformation.id}</td>
  </tr>
  <tr>
    <td>报修地址</td>
    <td>${repairInformation.address}</td>
  </tr>
  <tr>
    <td>报修电话</td>
    <td>${repairInformation.phone}</td>
  </tr>
  <tr>
    <td>报修人</td>
    <td>${repairInformation.houseHolder.name}</td>
  </tr>
  <tr>
    <td>报修时间</td>
    <td>${repairInformation.createTime}</td>
  </tr>
  <tr>
    <td>完成时间</td>
    <td>${repairInformation.finishTime}</td>
  </tr>
  <tr>
    <td>报修描述:</td>
  </tr>
  <tr>
    <td>${repairInformation.message}</td>
  </tr>
  </tbody>
</table>
</body>

</html>
