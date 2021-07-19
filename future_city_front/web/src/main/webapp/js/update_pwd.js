var result1;
var result2;
$(function() {
    $("#newPwd").blur(function() {
        var pwd = document.getElementById("newPwd").value;
        var weakNum = "^[0-9]{6,18}$";
        var weakLetter = "^[A-Za-z]{6,18}$";
        var medium = "^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,18}$";
        var strong = "^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z\\W]{6,18}$";
        var check_pwd = document.getElementById("check_pwd");
        if(pwd.match(weakNum) | pwd.match(weakLetter)){
            check_pwd.style.color = "var(--red)";
            check_pwd.innerText = "密码强度：弱";
            result1 = true;
        }else if(pwd.match(medium)){
            check_pwd.style.color = "var(--orange)";
            check_pwd.innerText = "密码强度：中";
            result1 = true;
        }else if(pwd.match(strong)){
            check_pwd.style.color = "var(--green)";
            check_pwd.innerText = "密码强度：强";
            result1 = true;
        }else{
            check_pwd.style.color = "var(--red)";
            check_pwd.innerText = "密码不符合规范";
            result1 = false;
        }
    })

    $("#validatePwd").blur(function (){
        var pwd = document.getElementById("newPwd").value;
        var validatePwd = document.getElementById("validatePwd");
        var check_validate = document.getElementById("validate_pwd");
        if(pwd == validatePwd.value){
            check_validate.style.color = "var(--green)";
            check_validate.innerText= "两次密码输入一致";
            result2 = true;
        }else{
            check_validate.style.color = "var(--red)";
            check_validate.innerText = "两次密码输入不一致";
            result2 = false;
        }
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