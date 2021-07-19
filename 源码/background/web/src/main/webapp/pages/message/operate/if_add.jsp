<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en"  xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="../../../component/pear/css/pear.css" />
</head>
<body>
<form class="layui-form" action="">
    <div class="mainBox">
        <div class="main-container">
            <div class="main-container">
                <div class="layui-form-item">
                    <label class="layui-form-label">标题</label>
                    <div class="layui-input-block">
                        <input type="text" name="title" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">内容</label>
                    <div class="layui-input-block">
                        <textarea name="content" required  lay-verify="required" placeholder="请输入通知内容" autocomplete="off" class="layui-textarea"></textarea>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="bottom">
        <div class="button-container">
<%--            修改处--%>
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
<script src="../../../component/layui/layui.js"></script>
<script src="../../../component/pear/pear.js"></script>
<script>
    layui.use(['form','jquery'],function(){
        let form = layui.form;
        let $ = layui.jquery;
//修改处
        form.on('submit(hh-save)', function(data){
            $.ajax({
                //修改处
                url:'../../../information/save',
                data:JSON.stringify(data.field),
                dataType:'json',
                contentType:'application/json',
                type:'post',
                success:function(result){
                    if(result==true){
                        layer.msg('添加成功',{icon:1,time:1000},function(){
                            parent.layer.close(parent.layer.getFrameIndex(window.name));//关闭当前页
                         //修改处
                            parent.layui.table.reload("user-table");
                        });
                    }else{
                        layer.msg('添加失败',{icon:2,time:1000});
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
