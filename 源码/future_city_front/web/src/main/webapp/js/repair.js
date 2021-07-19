function fillIn(id) {
    layer.open({
        type: 2,
        title: "填写报修单",
        area: ['700px', '450px'],
        fixed: false, //不固定
        maxmin: true,
        content: '/web/room/repairRoom?hid=' + id
    });
}

function repairStateInit() {
    var index = layer.open({
        type: 2,
        title: "报修记录",
        content: '/web/repair_state.jsp',
        area: ['100%', '100%'],
        maxmin: true
    });
    layer.full(index);
}

function repairState(hid, state) {
    var url = "/web/repair/findByState?hid=" + hid + "&state=" + state;
    $.post(url, function (html){
        switch (state){
            case 0:
                $("#bar").css("width", "25%");
                $("#bar").attr("class", "layui-progress-bar layui-bg-red");
                break;
            case 1:
                $("#bar").css("width", "50%");
                $("#bar").attr("class", "layui-progress-bar layui-bg-orange");
                break;
            case 2:
                $("#bar").css("width", "75%");
                $("#bar").attr("class", "layui-progress-bar layui-bg-blue");
                break;
            case 3:
                $("#bar").css("width", "100%");
                $("#bar").attr("class", "layui-progress-bar layui-bg-green");
                break;
        }
        var show = document.getElementById("show");
        show.innerHTML = html
    })
}

function goto(data){
    var rid = data.value;
    rid = rid.substring(3);
    layer.open({
        type: 2,
        title: '服务评价',
        area: ['700px', '450px'],
        fixed: false, //不固定
        maxmin: true,
        content: '/web/evaluate.jsp?rid=' +rid
    });
}