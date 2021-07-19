<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>信息管理</title>
    <link rel="stylesheet" href="../../component/pear/css/pear.css"/>
</head>
<body class="pear-container">
<div class="layui-card">
    <div class="layui-card-body">
        <form class="layui-form" action="">
            <div class="layui-form-item">
                <div class="layui-form-item layui-inline">
                    <label class="layui-form-label">开始时间</label>
                    <div class="layui-input-inline">
                        <input type="text" name="startDate" placeholder="" class="layui-input" id="startDate">
                    </div>
                </div>
                <div class="layui-form-item layui-inline">
                    <label class="layui-form-label">结束时间</label>
                    <div class="layui-input-inline">
                        <input type="text" name="endDate" placeholder="" class="layui-input" id="endDate">
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

<script type="text/html" id="currentTableBar">
    {{#  if (d.state == 0){ }}
    <button class="layui-btn layui-btn-xs  " lay-event="details">详情</button>
    <button class="layui-btn layui-btn-xs layui-btn-normal " lay-event="approval">审核</button>
    {{#  } else if (d.state == 1)  { }}
    <button class="layui-btn layui-btn-xs  " lay-event="details">详情</button>
    <button class="layui-btn layui-btn-xs layui-btn-danger " lay-event="repair">维修</button>
    {{#  } else { }}
    <button class="layui-btn layui-btn-xs  " lay-event="details">详情</button>
    {{#  }  }}

</script>

<script type="text/html" id="user-toolbar">

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


    layui.use(['table', 'form', 'jquery', 'common', 'laydate'], function () {
        let table = layui.table;
        let form = layui.form;
        let $ = layui.jquery;
        let common = layui.common;
        var laydate = layui.laydate;

        let MODULE_PATH = "operate/";


        laydate.render({
            elem: '#startDate'
            , type: 'datetime'
        });
        laydate.render({
            elem: '#endDate'
            , type: 'datetime'
        });

        let cols = [
            [
                {
                    title: '房屋编号',
                    field: 'room.id',
                    width: 100,
                    templet:function (d){
                        return d.room.id;
                    }
                },
                {
                    title: '户主姓名',
                    field: 'householder.name',
                    width: 100,
                    templet:function (d){
                        return d.houseHolder.name;
                    }
                },
                {
                    title: '费用类别',
                    field: 'category',
                    width: 100,
                    templet(d){
                        if (d.category==0){
                            return"电费"
                        }if (d.category==1){
                            return"水费"
                        }if (d.category==2){
                            return"燃气费"
                        }if (d.category==3){
                            return"物业费"
                        }
                    }
                },
                {
                    title: '当前读数',
                    field: 'consumption',
                    width: 100,
                },
                {
                    title: '用量',
                    field: 'difference',
                    width: 100,
                },
                {
                    title: '抄表日期',
                    field: 'inputDate',
                    width: 200,
                },
                {
                    title: '费用',
                    field: 'price',
                    width: 100,
                }
                // ,
                // {
                //     title: '操作',
                //     toolbar: '#unitPrice-bar',
                //     width: 130
                // }
            ]
        ]

        table.render({
            elem: '#user-table',
            url: '../../lifeCost/page',
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
            }else if (obj.event === 'edit') {
                window.edit(obj);
            }else if (obj.event === 'details') {
                window.details(obj);
            }else if (obj.event === 'approval') {
                window.approval(obj);
            }else if (obj.event === 'repair') {
                window.repair(obj);
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

        window.details =function (obj){
            layer.open({
                type: 2,
                title: '详情',
                shade: 0.1,
                area: ['800px', '500px'],
                content: '../../repair/findById?id=' + obj.data.id,
            });
        }

        window.approval = function (obj) {
            layer.confirm('确定要通过该审核', {
                icon: 3,
                title: '提示'
            }, function (index) {
                $.ajax({
                    url: "../../repair/state?id=" + obj.data['id']+"&state=1",
                    method: "post",
                    success: function (result) {
                        console.log(result);
                        if (result === "true") {
                            layer.msg("修改成功", {
                                icon: 1,
                                time: 1000
                            }, function () {
                                table.reload('user-table');
                            });
                        } else {
                            layer.msg("修改失败", {
                                icon: 2,
                                time: 1000
                            });
                        }
                    }
                })
            });
        }

        window.repair = function (obj) {
            layer.confirm('确定维修完成', {
                icon: 3,
                title: '提示'
            }, function (index) {
                $.ajax({
                    url: "../../repair/state?id=" + obj.data['id']+"&state=2",
                    method: "post",
                    success: function (result) {
                        console.log(result);
                        if (result === "true") {
                            layer.msg("修改成功", {
                                icon: 1,
                                time: 1000
                            }, function () {
                                table.reload('user-table');
                            });
                        } else {
                            layer.msg("修改失败", {
                                icon: 2,
                                time: 1000
                            });
                        }
                    }
                })
            });
        }

        // window.add = function () {
        //     layer.open({
        //         type: 2,
        //         title: '新增',
        //         shade: 0.1,
        //         area: ['100%', '100%'],
        //         content: MODULE_PATH + 'if_add.jsp'
        //     });
        // }

        // window.edit = function (obj) {
        //     layer.open({
        //         type: 2,
        //         title: '详情',
        //         shade: 0.1,
        //         area: ['800px', '800px'],
        //         content: '../../repair/findById?id=' + obj.data.id,
        //     });
        // }

        // window.remove = function (obj) {
        //     layer.confirm('确定要删除该通知', {
        //         icon: 3,
        //         title: '提示'
        //     }, function (index) {
        //         $.ajax({
        //             url: "../../information/remove?checkIds=" + obj.data['id'],
        //             method: "post",
        //             success: function (result) {
        //                 console.log(result);
        //                 if (result === "true") {
        //                     layer.msg("删除成功", {
        //                         icon: 1,
        //                         time: 1000
        //                     }, function () {
        //                         obj.del();
        //                     });
        //                 } else {
        //                     layer.msg("删除失败", {
        //                         icon: 2,
        //                         time: 1000
        //                     });
        //                 }
        //             }
        //         })
        //     });
        // }

        // window.batchRemove = function (obj) {
        //
        //     var checkIds = common.checkField(obj, 'id');
        //
        //     if (checkIds === "") {
        //         layer.msg("未选中数据", {
        //             icon: 3,
        //             time: 1000
        //         });
        //         return false;
        //     }
        //
        //     layer.confirm('确定要删除通知', {
        //         icon: 3,
        //         title: '提示'
        //     }, function (index) {
        //         $.ajax({
        //             url: "../../information/remove?checkIds=" + checkIds,
        //             dataType: 'text',
        //             type: 'post',
        //             success: function (result) {
        //                 console.log(result)
        //                 if (result === "true") {
        //                     layer.msg("删除成功", {
        //                         icon: 1,
        //                         time: 1000
        //                     }, function () {
        //                         table.reload('user-table');
        //                     });
        //                 } else {
        //                     layer.msg("删除失败", {
        //                         icon: 2,
        //                         time: 1000
        //                     });
        //                 }
        //             }
        //         })
        //     });
        // }

        window.refresh = function (param) {
            table.reload('user-table');
        }
    })
</script>
</body>
</html>

