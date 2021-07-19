<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>房屋信息管理</title>
    <link rel="stylesheet" href="../../component/pear/css/pear.css"/>
</head>
<body class="pear-container">
<div class="layui-card">
    <div class="layui-card-body">
        <form class="layui-form" action="">
            <div class="layui-form-item">
                <div class="layui-form-item layui-inline">
                    <label class="layui-form-label">楼号</label>
                    <div class="layui-input-inline">
                        <input type="number" name="buildingNum" placeholder="" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-inline">
                    <label class="layui-form-label">单元号</label>
                    <div class="layui-input-inline">
                        <input type="number" name="unitNum" placeholder="" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-inline">
                    <label class="layui-form-label">房间号</label>
                    <div class="layui-input-inline">
                        <input type="number" name="roomNum" placeholder="" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-inline">
                    <button class="pear-btn pear-btn-md pear-btn-primary" lay-submit lay-filter="user-query">
                        <i class="layui-icon layui-icon-search"></i>
                        查询
                    </button>
                    <button type="reset" class="pear-btn pear-btn-md">
                        <i class="layui-icon layui-icon-refresh"></i>
                        重置
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>
<div class="layui-card">
    <div class="layui-card-body">
        <table id="user-table" lay-filter="user-table"></table>
    </div>
</div>

<script type="text/html" id="user-toolbar">
    <button class="pear-btn pear-btn-primary pear-btn-md" lay-event="add">
        <i class="layui-icon layui-icon-add-1"></i>
        新增
    </button>
    <button class="pear-btn pear-btn-danger pear-btn-md" lay-event="batchRemove">
        <i class="layui-icon layui-icon-delete"></i>
        删除
    </button>
</script>

<script type="text/html" id="hh-bar">
    <button class="layui-btn  layui-btn-sm" lay-event="edit">详情
    </button>
</script>


<script src="../../component/layui/layui.js"></script>
<script src="../../component/pear/pear.js"></script>
<script>


    layui.use(['table', 'form', 'jquery', 'common'], function () {
        let table = layui.table;
        let form = layui.form;
        let $ = layui.jquery;
        let common = layui.common;

        let MODULE_PATH = "operate/";


        let cols = [
            [
                {
                    title: '房屋编号',
                    field: 'id',
                    width: 100
                },
                {
                    title: '楼号',
                    field: 'buildingNum',
                    width: 100
                },
                {
                    title: '单元号',
                    field: 'unitNum',
                    width: 100,
                },
                {
                    title: '房间号',
                    field: 'roomNum',
                    width: 150,
                },
                {
                title: '房屋面积',
                field: 'area',
                width: 150,
                }
                ,
                {
                title: '户主姓名',
                field: 'houseHolder.name',
                width: 150,
                    templet:function (d){
                    return d.houseHolder.name;
                    }
                },
                {
                    title: '操作',
                    toolbar: '#hh-bar',
                    width: 100
                }
                // ,
                // {
                //     title: '状态',
                //     field: 'state',
                //     templet: function (d) {
                //         var id = d.id;
                //         if (d.state == 1) {
                //             return '<input type="checkbox" name="state" value="' + id + '" lay-skin="switch" lay-text="有人|无人" lay-filter="hh-enable" checked> ';
                //         } else {
                //             return '<input type="checkbox" name="state" value="' + id + '" lay-skin="switch" lay-text="有人|无人" lay-filter="hh-enable"> ';
                //         }
                //     },
                //     width: 100
                // }
            ]
        ]

        table.render({
            elem: '#user-table',
            url: '../../room/page',
            page: true,
            cols: cols,
            skin: 'line',
            toolbar: '#user-toolbar',
            defaultToolbar: [{
                title: '刷新',
                layEvent: 'refresh',
                icon: 'layui-icon-refresh',
            }, 'filter', 'print', 'exports']
        });

        table.on('tool(user-table)', function (obj) {
            if (obj.event === 'remove') {
                window.remove(obj);
            } else if (obj.event === 'edit') {
                window.edit(obj);
            }
        });

        table.on('toolbar(user-table)', function (obj) {
            if (obj.event === 'add') {
                window.add();
            } else if (obj.event === 'refresh') {
                window.refresh();
            } else if (obj.event === 'batchRemove') {
                window.batchRemove(obj);
            }
        });

        form.on('submit(user-query)', function (data) {
            table.reload('user-table', {
                where: data.field
            })
            return false;
        });

        form.on('switch(hh-enable)', function (obj) {

            // layer.tips(this.value + ' ' + this.name + '：' + obj.elem.checked, obj.othis);
            var id = this.value;
            var state;
            if (obj.elem.checked == true) {
                state = 1;
            } else {
                state = 0;
            }

            $.ajax({
                url: "../../houseHolder/state?id=" + id + "&state=" + state,
                method: "post",
            });
        });

        window.add = function () {
            layer.open({
                type: 2,
                title: '新增',
                shade: 0.1,
                area: [common.isModile() ? '100%' : '500px', common.isModile() ? '100%' : '400px'],
                content: MODULE_PATH + 'room_add.jsp'
            });
        }

        window.edit = function (obj) {
            layer.open({
                type: 2,
                title: '详情',
                shade: 0.1,
                area: ['800px', '500px'],
                content: '../../room/findById?id=' + obj.data.id,
            });
        }

        window.remove = function (obj) {
            layer.confirm('确定要删除该用户', {
                icon: 3,
                title: '提示'
            }, function (index) {
                $.ajax({
                    url: "../../houseHolder/remove?checkIds=" + obj.data['id'],
                    method: "post",
                    success: function (result) {

                        // if (result.success) {
                        layer.msg("删除成功", {
                            icon: 1,
                            time: 1000
                        }, function () {
                            obj.del();
                        });
                        // } else {
                        //     layer.msg(result.msg, {
                        //         icon: 2,
                        //         time: 1000
                        //     });
                        // }
                    }
                })
            });
        }

        window.batchRemove = function (obj) {

            var checkIds = common.checkField(obj, 'id');

            if (checkIds === "") {
                layer.msg("未选中数据", {
                    icon: 3,
                    time: 1000
                });
                return false;
            }

            layer.confirm('确定要删除这些用户', {
                icon: 3,
                title: '提示'
            }, function (index) {
                $.ajax({
                    url: "../../houseHolder/remove?checkIds=" + checkIds,
                    dataType: 'text',
                    type: 'post',
                    success: function (result) {

                        // if (result.success) {
                        layer.msg("删除成功", {
                            icon: 1,
                            time: 1000
                        }, function () {
                            table.reload('user-table');
                        });
                        // } else {
                        //     layer.msg(result.msg, {
                        //         icon: 2,
                        //         time: 1000
                        //     });
                        // }
                    }
                })
            });
        }

        window.refresh = function (param) {
            table.reload('user-table');
        }
    })
</script>
</body>
</html>

