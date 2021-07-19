<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>用户管理</title>
    <link rel="stylesheet" href="../../component/pear/css/pear.css"/>
</head>
<body class="pear-container">
<div class="layui-card">
    <div class="layui-card-body">
        <form class="layui-form" action="">
            <div class="layui-form-item">
                <div class="layui-form-item layui-inline">
                    <label class="layui-form-label">姓名</label>
                    <div class="layui-input-inline">
                        <input type="text" name="name" placeholder="" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-inline">
                    <label class="layui-form-label">身份证号</label>
                    <div class="layui-input-inline">
                        <input type="text" name="identification" placeholder="" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-inline">
                    <label class="layui-form-label">状态</label>
                    <div class="layui-input-inline">
                        <select name="state" id="state">
                            <option value="">请选择</option>
                            <option value="1">启用</option>
                            <option value="0">禁用</option>
                        </select>
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
    <button class="pear-btn pear-btn-primary pear-btn-sm" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>
    </button>
    <button class="pear-btn pear-btn-danger pear-btn-sm" lay-event="remove"><i class="layui-icon layui-icon-delete"></i>
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
            [{
                type: 'checkbox'
            },
                {
                    title: '户主ID',
                    field: 'id',
                    width: 100
                },
                {
                    title: '姓名',
                    field: 'name',
                    width: 100
                },
                {
                    title: '身份证号',
                    field: 'identification',
                    width: 200,
                },
                {
                    title: '手机号',
                    field: 'phone',
                    width: 150,
                }, {
                title: '邮箱',
                field: 'email',
                width: 150,
            },
                {
                    title: '状态',
                    field: 'state',
                    templet: function (d) {
                        var id = d.id;
                        if (d.state == 1) {
                            return '<input type="checkbox" name="state" value="' + id + '" lay-skin="switch" lay-text="启用|禁用" lay-filter="hh-enable" checked> ';
                        } else {
                            return '<input type="checkbox" name="state" value="' + id + '" lay-skin="switch" lay-text="启用|禁用" lay-filter="hh-enable"> ';
                        }
                    },
                    width: 100
                },
                {
                    title: '操作',
                    toolbar: '#hh-bar',
                    width: 130
                }
            ]
        ]

        table.render({
            elem: '#user-table',
            url: '../../houseHolder/page',
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
                content: MODULE_PATH + 'hh_add.jsp'
            });
        }

        window.edit = function (obj) {
            layer.open({
                type: 2,
                title: '修改',
                shade: 0.1,
                area: ['500px', '400px'],
                content: '../../houseHolder/findById?id=' + obj.data.id,
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

