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
                    <label class="layui-form-label">标题</label>
                    <div class="layui-input-block">
                        <input type="hidden" name="id"  value="${information.id}"  class="layui-input">
                        <input type="text" name="title" value="${information.title}" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">内容</label>
                    <div class="layui-input-block">
                        <textarea rows="40" name="content"  required  lay-verify="required" placeholder="请输入通知内容" autocomplete="off" class="layui-textarea">${information.content}</textarea>
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
                url:'/web/information/edit1',
                data:JSON.stringify(data.field),
                dataType:'json',
                contentType:'application/json',
                type:'post',
                success:function(result){
                    if(result==true){
                        layer.msg("修改成功",{icon:1,time:1000},function(){
                            parent.layer.close(parent.layer.getFrameIndex(window.name));//关闭当前页
                            parent.layui.table.reload("user-table");
                        });
                    }else{
                        layer.msg("修改失败",{icon:2,time:1000});
                    }
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

