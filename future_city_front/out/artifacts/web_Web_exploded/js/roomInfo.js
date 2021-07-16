function more(id){
    var url = "/web/room/findById?id=" + id;
    $.post(url, function (result){
        if(result == "true"){
            layer.open({
                type: 2,
                title: '房屋详情',
                area: ['700px', '450px'],
                fixed: false, //不固定
                maxmin: true,
                content: '/web/roomInfo.jsp'
            });
        }else{
            layer.msg('出现一些问题，请稍后再试', {icon: 5});
        }
    })
}