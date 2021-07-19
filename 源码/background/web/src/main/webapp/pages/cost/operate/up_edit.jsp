<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en"  xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/component/pear/css/pear.css" />
</head>
<body>
<form class="layui-form" action="">
    <div class="mainBox">
        <div class="main-container">
            <div class="main-container">
                <div class="layui-form-item">
                    <label class="layui-form-label">名称</label>
                    <div class="layui-input-inline">
                        <input type="hidden" name="id" value="${unitPrice.id}"  class="layui-input">
                        <input type="text" name="name" value="${unitPrice.name}" required  lay-verify="required" placeholder="请输入费用名称" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">价格</label>
                    <div class="layui-input-inline">
                        <input type="number" name="price" value="${unitPrice.price}" required  lay-verify="required" placeholder="请输入费用单位价格" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">单位</label>
                    <div class="layui-input-inline">
                        <input type="text" name="unit" value="${unitPrice.unit}" required  lay-verify="required" placeholder="请输入费用价格单位" autocomplete="off" class="layui-input">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="bottom">
        <div class="button-container">
            <button type="submit" class="pear-btn pear-btn-primary pear-btn-sm" lay-submit="" lay-filter="unitPrice-save">
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
    layui.use(['form','jquery'],function(){
        let form = layui.form;
        let $ = layui.jquery;

        form.on('submit(unitPrice-save)', function(data){
            $.ajax({
                url:'/web/unitPrice/edit',
                data:JSON.stringify(data.field),
                dataType:'json',
                contentType:'application/json',
                type:'post',
                success:function(result){
                    // if(result.success){
                        layer.msg("修改成功",{icon:1,time:1000},function(){
                            parent.layer.close(parent.layer.getFrameIndex(window.name));//关闭当前页
                            parent.layui.table.reload("unitPrice-table");
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

