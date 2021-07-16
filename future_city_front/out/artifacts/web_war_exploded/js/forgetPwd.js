var count = 60;
var id;
var result1;
var result2;
$(function() {
	$("#codeDiv").click(function() {
		var email = document.getElementById("email").value;
		if(email == "" || ! email.match("\\w[-\\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\\.)+[A-Za-z]{2,14}")){
			layer.msg('邮箱格式错误', {
				icon: 2
			});
			result1 = false;
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
							result1 =  true;
							document.getElementById("codeDiv").disabled = true;
							id = setInterval("countDown()", 1000);
						} else {
							layer.msg('验证码发送失败，请稍后重试', {
								icon: 2
							});
							result1 =  false;
						}
					})
				} else {
					layer.msg('该邮箱还未被注册~', {
						icon: 2
					});
					result1 = false;
				}
			})
		}
	})
	
	$("#code").blur(function(){
		var code = document.getElementById("code").value;
		var url = "/web/householder/validate?code=" + code;
		var validateCode = document.getElementById("validateCode");
		$.post(url, function(data){
			if(data == "true"){
				validateCode.style.color = "var(--green)";
				validateCode.innerText = "验证码正确";
				result2 = true;
			}else{
				validateCode.style.color = "var(--red)";
				validateCode.innerText = "验证码错误";
				result2 = false;
			}
		})
	})
})

function validate(){
	if(result1 && result2){
		return true;
	}else{
		alert("表单验证失败，输入不规范");
		return false;
	}
}

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
