<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8">
    <title></title>

    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/utils/layui-v2.6.8/layui/layui.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/utils/layui-v2.6.8/layui/css/layui.css" type="text/css" rel="stylesheet"/>

    <script src="${pageContext.request.contextPath}/js/repair.js" type="text/javascript"></script>

    <script>
        window.onload = function (){
            repairState(${sessionScope.householder.id}, 0)
        }
    </script>
</head>
<body>
<div class="layui-container">
    <div class="layui-row">
        <div class="layui-col-lg-offset3 layui-col-lg6">
            <div class="layui-progress layui-progress-big" lay-showPercent="true">
                <div id="bar" class="layui-progress-bar" lay-percent="─=≡Σ(((つ•̀ω•́)つ   ">

                </div>
            </div>
            <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
                <ul class="layui-tab-title">
                    <li class="layui-this" onclick="repairState(${sessionScope.householder.id}, 0)">待审核</li>
                    <li onclick="repairState(${sessionScope.householder.id}, 1)">维修中</li>
                    <li onclick="repairState(${sessionScope.householder.id}, 2)">待评价</li>
                    <li onclick="repairState(${sessionScope.householder.id}, 3)">已完成</li>
                </ul>
                <div class="layui-tab-content" style="height: 100%;" id="show">

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
