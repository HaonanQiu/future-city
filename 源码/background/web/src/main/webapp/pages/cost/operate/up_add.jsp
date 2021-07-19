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
                    <label class="layui-form-label">名称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="name" required  lay-verify="required" placeholder="请输入费用名称" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">价格</label>
                    <div class="layui-input-inline">
                        <input type="text" name="price" required  lay-verify="required" placeholder="请输入费用单位价格" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">单位</label>
                    <div class="layui-input-inline">
                        <input type="text" name="unit" required  lay-verify="required" placeholder="请输入费用价格单位" autocomplete="off" class="layui-input">
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
<script src="../../../component/layui/layui.js"></script>
<script src="../../../component/pear/pear.js"></script>
<script>
    layui.use(['form','jquery'],function(){
        let form = layui.form;
        let $ = layui.jquery;

        form.on('submit(unitPrice-save)', function(data){
            $.ajax({
                url:'../../../unitPrice/save',
                data:JSON.stringify(data.field),
                dataType:'json',
                contentType:'application/json',
                type:'post',
                success:function(result){
                    // if(result==("true")){
                        layer.msg('添加成功',{icon:1,time:1000},function(){
                            parent.layer.close(parent.layer.getFrameIndex(window.name));//关闭当前页
                            parent.layui.table.reload("unitPrice-table");
                        });
                    // }else{
                    //     layer.msg('添加失败',{icon:2,time:1000});
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
