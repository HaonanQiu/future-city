var count = 60;
var id;
// 点击获取验证码
$(function() {
	$("#codeDiv").click(function() {
		var email = document.getElementById("email").value;
		if(email == "" || ! email.match("\\w[-\\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\\.)+[A-Za-z]{2,14}")){
			layer.msg('邮箱格式错误', {
				icon: 2
			});
		}else{
			var url = "/web/householder/findByEmail?email=" + email;
			var url1 = "/web/email/send?email=" + email;
			$.post(url, function(data) {
				if (data == "true") {
					$.post(url1, function(data1) {
						if (data1 == "true") {
							layer.msg('验证码已发送，请注意查收', {
								icon: 1
							});
							document.getElementById("codeDiv").disabled = true;
							id = setInterval("countDown()", 1000);
						} else {
							layer.msg('验证码发送失败，请稍后重试', {
								icon: 2
							});
						}
					})
				} else {
					layer.msg('该邮箱还未注册~', {
						icon: 2
					});
					return false;
				}
			})
		}
	})

	$("#account_submit").click(function (){
		var account = document.getElementById("account").value;
		var password = document.getElementById("password").value;
		var url = "/web/householder/login?identification=" + account + "&password=" + password;
		$.post(url, function (data){
			if(data == "true"){
				window.location.href = "index.jsp";
			}else{
				layer.msg("身份证号或密码错误",{icon:5});
			}
		})
	})

	$("#email_submit").click(function (){
		var email = document.getElementById("email").value;
		var code = document.getElementById("code").value;
		var url = "/web/householder/loginByEmail?email=" + email + "&code=" + code;
		$.post(url, function (data){
			if(data == "true"){
				window.location.href = "index.jsp";
			}else{
				layer.msg("验证码错误",{icon:5});
			}
		})
	})

})

function countDown(){
	count--;
	if(count != 0){
		document.getElementById("codeDiv").innerText = count + "s";
	}else{
		document.getElementById("codeDiv").disabled = false;
		document.getElementById("codeDiv").innerText = "获取验证码";
		count = 60;
		clearInterval(id);
	}
}
