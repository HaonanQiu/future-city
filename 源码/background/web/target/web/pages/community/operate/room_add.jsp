<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/component/pear/css/pear.css"/>
</head>
<body>
<form class="layui-form" action="">
    <div class="mainBox">
        <div class="main-container">
            <div class="main-container">
                <%--                <div class="layui-form-item">--%>
                <%--                    <label class="layui-form-label">房屋编号</label>--%>
                <%--                    <div class="layui-input-inline">--%>
                <%--                        <input type="text" name="id" value="${room.id}" class="layui-input layui-disabled" disabled>--%>
                <%--                    </div>--%>
                <%--                </div>--%>
                <div class="layui-form-item">
                    <label class="layui-form-label">楼号</label>
                    <div class="layui-input-inline">
                        <select name="buildingNum" id="state" lay-search>
                                <option value="1">1号楼</option>
                                <option value="2" selected>2号楼</option>
                                <option value="3">3号楼</option>
                                <option value="4">4号楼</option>
                                <option value="5">5号楼</option>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">单元号</label>
                    <div class="layui-input-inline">
                        <select name="unitNum"  lay-search>
                            <option value="1">一单元</option>
                            <option value="2">二单元</option>
                            <option value="3">三单元</option>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">房间号</label>
                    <div class="layui-input-inline">
                        <input type="text" name="roomNum" value="" required lay-verify="required" placeholder=""
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">房屋面积</label>
                    <div class="layui-input-inline">
                        <select name="area"  lay-search>
                            <option value="150">150</option>
                            <option value="120">120</option>
                        </select>
                    </div>
                </div>
                <%--                <div class="layui-form-item">--%>
                <%--                    <label class="layui-form-label">户主</label>--%>
                <%--                    <div class="layui-input-inline">--%>
                <%--                        <select name="householder" id="state" lay-search>--%>
                <%--                            <c:forEach items="${houseHolders}" var="houseHolder">--%>
                <%--                                <option value="${houseHolder}"<c:if test="${room.houseHolder.id==houseHolder.id}"> selected  </c:if> >${houseHolder.name}${houseHolder.identification}--%>
                <%--                                </option>--%>
                <%--                            </c:forEach>--%>
                <%--                        </select>--%>
                <%--                    </div>--%>
                <%--                </div>--%>
            </div>
        </div>
    </div>
    <div class="bottom">
        <div class="button-container">
            <%--            修改位置--%>
            <button type="submit" class="pear-btn pear-btn-primary pear-btn-sm" lay-submit="" lay-filter="hh-save">
                <i class="layui-icon layui-icon-ok"></i>
                提交
            </button>
            <button type="reset" class="pear-btn pear-btn-sm">
                <i class="layui-icon layui-icon-refresh"></i>
                重置
            </button>
        </div>
    </div>
</form>
<script src="${pageContext.request.contextPath}/component/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/component/pear/pear.js"></script>
<script>
    layui.use(['form', 'jquery'], function () {
        let form = layui.form;
        let $ = layui.jquery;

        //修改位置
        form.on('submit(hh-save)', function (data) {
            var room;
            room = $("#state").val();
            // console.log(room.getType());
            console.log(room)
            $.ajax({
                //修改位置
                url: '/web/room/add',
                data: JSON.stringify(data.field),
                dataType: 'json',
                contentType: 'application/json',
                type: 'post',
                success: function (result) {
                    // if(result.success){
                    layer.msg("修改成功", {icon: 1, time: 1000}, function () {
                        parent.layer.close(parent.layer.getFrameIndex(window.name));//关闭当前页
                        //修改位置
                        parent.layui.table.reload("user-table");
                    });
                    // }else{
                    //     layer.msg(result.msg,{icon:2,time:1000});
                    // }
                }
            })
            return false;
        });
    })
</script>
<script>
</script>
</body>
</html>

