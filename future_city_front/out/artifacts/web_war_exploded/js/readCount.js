$(function (){

})

function more(id){
    var url = "/web/information/more?id=" + id;
    $.post(url, function (result){
        if(result == "true"){
            var index = layer.open({
                type: 2,
                content: '/web/more.jsp',
                area: ['100%', '100%'],
                maxmin: true
            });
            layer.full(index);
        }else{
            layer.msg('出了一些问题，请稍后再试', {icon: 5});
        }
    })
}