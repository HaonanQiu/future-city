<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>数据表格</title>
  <link rel="stylesheet" href="../../component/pear/css/pear.css" />
</head>
<body class="pear-container">
<div class="layui-card">
  <div class="layui-card-body">
    <table id="unitPrice-table" lay-filter="unitPrice-table"></table>
  </div>
</div>

<script type="text/html" id="user-toolbar">
  <button class="pear-btn pear-btn-primary pear-btn-md" lay-event="add">
    <i class="layui-icon layui-icon-add-1"></i>
    新增
  </button>
</script>

<script type="text/html" id="unitPrice-bar">
  <button class="pear-btn pear-btn-primary pear-btn-sm" lay-event="edit"><i class="layui-icon layui-icon-edit"></i></button>
  <button class="pear-btn pear-btn-danger pear-btn-sm" lay-event="remove"><i class="layui-icon layui-icon-delete"></i></button>
</script>


<script src="../../component/layui/layui.js"></script>
<script src="../../component/pear/pear.js"></script>
<script>
  layui.use(['table', 'form', 'jquery', 'drawer', 'dropdown','common'], function() {
    let table = layui.table;
    let form = layui.form;
    let $ = layui.jquery;
    let drawer = layui.drawer;
    let dropdown = layui.dropdown;
    let common = layui.common;

    let MODULE_PATH = "operate/";

    let cols = [
      [
        {
          title: 'id',
          field: 'id',
          hide:'true',
          width: 100
        },
        {
          title: '费用名称',
          field: 'name',
          width: 100
        },
        {
          title: '费用单价',
          field: 'price',
          width: 100
        },
        {
          title: '费用单位',
          field: 'unit',
          width: 100,
        },
        {
          title: '操作',
          toolbar: '#unitPrice-bar',
          width: 130
        }
      ]
    ]

    table.render({
      elem: '#unitPrice-table',
      url: '../../unitPrice/list',
      page: false,
      cols: cols,
      skin: 'line',
      toolbar: '#user-toolbar',
      defaultToolbar: [{
        layEvent: 'refresh',
        icon: 'layui-icon-refresh',
      }, 'filter', 'print', 'exports']
    });

    table.on('tool(unitPrice-table)', function(obj) {
      if (obj.event === 'remove') {
        window.remove(obj);
      } else if (obj.event === 'edit') {
        window.edit(obj);
      }
    });

    table.on('toolbar(unitPrice-table)', function(obj) {
      if (obj.event === 'add') {
        window.add();
      } else if (obj.event === 'refresh') {
        window.refresh();
      } else if (obj.event === 'batchRemove') {
        window.batchRemove(obj);
      }
    });


    window.add = function() {
      layer.open({
        type: 2,
        title: '新增',
        shade: 0.1,
        area: [common.isModile() ? '100%' : '500px', common.isModile() ? '100%' : '400px'],
        content: MODULE_PATH + 'if_add.jsp'
      });
    }

    window.edit = function(obj) {
      var data=obj.data;
      data.na
      layer.open({
        type: 2,
        title: '修改',
        shade: 0.1,
        area: ['500px', '400px'],
        content: '../../unitPrice/findByName?name='+ obj.data.name,
      });
    }

    window.remove = function(obj) {

      layer.confirm('确定要删除?', {
        icon: 3,
        title: '提示'
      }, function(index) {
        // layer.close(index);
        // let loading = layer.load();
        $.ajax({
          url: "../../unitPrice/remove?name=" + obj.data['name'],
          method:"post",
          success: function(result) {

              layer.msg("删除成功", {
                icon: 1,
                time: 1000
              }, function() {
                obj.del();
              });

          }
        })
      });
    }

    window.refresh = function(param) {
      table.reload('unitPrice-table');
    }
  })

</script>
</body>
</html>

