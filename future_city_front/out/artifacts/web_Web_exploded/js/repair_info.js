$(function (){
    $("#submit1").click(function (){
        $.ajax({
            type: 'post',
            url: '/web/repair/fillIn',
            dataType: 'json',
            data:$('#form').serialize(),
            success:function (result){
                if(result == true){
                    layer.msg('提交成功', {icon: 6});
                } else {
                    layer.msg('提交失败，请稍后重试', {icon: 5});
                }
            }
        })
    });
})