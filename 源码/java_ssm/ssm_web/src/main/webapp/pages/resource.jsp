<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <style type="text/css">

    </style>
</head>
<body>

<div class="layui-container" >
    <div class="layui-row" style="margin-top: 200px">
        <div class="layui-col-lg4">
            <h2>水表</h2></br></br></br></br>
            <form class="layui-form" action="/ssm/all/save">
                <div class="layui-form-item">
                    <label class="layui-form-label">水表值</label>
                    <div class="layui-input-block">
                        <input type="hidden" name="hid" value="${resource.hid}" autocomplete="off" class="layui-input">
                        <input type="hidden" name="rid" value="${resource.rid}" autocomplete="off" class="layui-input">
                        <input type="hidden" name="category" value="0" autocomplete="off" class="layui-input">
                        <input type="number" name="consumption" value="${resource.water}" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="water">结算</button>
                    </div>
                </div>
            </form>
        </div>


        <div class="layui-col-lg4">
            <h2>电表</h2></br></br></br></br>
            <form class="layui-form" action="/ssm/all/save">
                <div class="layui-form-item">
                    <label class="layui-form-label">电表值</label>
                    <div class="layui-input-block">
                        <input type="hidden" name="hid" value="${resource.hid}" autocomplete="off" class="layui-input">
                        <input type="hidden" name="rid" value="${resource.rid}" autocomplete="off" class="layui-input">
                        <input type="hidden" name="category" value="1" autocomplete="off" class="layui-input">
                        <input type="number" name="consumption" value="${resource.electric}" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="electric">结算</button>
                    </div>
                </div>
            </form>
        </div>


        <div class="layui-col-lg4">
            <h2>燃气表</h2></br></br></br></br>
            <form class="layui-form" action="/ssm/all/save">
                <div class="layui-form-item">
                    <label class="layui-form-label">燃气表值</label>
                    <div class="layui-input-block">
                        <input type="hidden" name="hid" value="${resource.hid}" autocomplete="off" class="layui-input">
                        <input type="hidden" name="rid" value="${resource.rid}" autocomplete="off" class="layui-input">
                        <input type="hidden" name="category" value="2" autocomplete="off" class="layui-input">
                        <input type="number" name="consumption" value="${resource.gas}" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="gas">结算</button>
                    </div>
                </div>
            </form>
        </div>


    </div>
</div>

<script>
    layui.use( ['form','jquery'], function(){
        var form = layui.form;
        var $=layui.jquery;

        form.on('submit(water)', function(data){

            $.ajax({
                url:'../all/save',
                data:data.field,
                // dataType:'json',
                // contentType:'application/json',
                type:'post',
                success:function(result){
                    console.log(result);
                }
            })
            return false;
        });

        form.on('submit(electric)', function(data){

            $.ajax({
                url:'../all/save',
                data:data.field,
                // dataType:'json',
                // contentType:'application/json',
                type:'post',
                success:function(result){
                    console.log(result);
                }
            })
            return false;
        });

        form.on('submit(gas)', function(data){

            $.ajax({
                url:'../all/save',
                data:data.field,
                // dataType:'json',
                // contentType:'application/json',
                type:'post',
                success:function(result){
                    console.log(result);
                }
            })
            return false;
        });

    });
</script>

<%--<input type="text" id="num" value="3" />--%>
<%--<input type="button" value="+" onclick="addOne()" />--%>
</body>
<script type="text/javascript">
    function addOne() {
        var num = document.getElementById("one");
        num.value = parseInt(num.value) + 1;
    }
</script>
</html>
