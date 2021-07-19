<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>用户服务中心 - 找回密码</title>
    <!-- 网页小图标 -->
    <link rel="shortcut icon" type="image/x-icon" href="images/icon.png" style="border-radius: 50%;" />
    <!-- 引入jquery -->
    <script src="js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
    <!-- 引入bootstrap -->
    <script src="utils/bootstrap/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" type="text/css" href="utils/bootstrap/css/bootstrap.css" />
    <!-- 引入layui -->
    <script src="utils/layui-v2.6.8/layui/layui.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" type="text/css" href="utils/layui-v2.6.8/layui/css/layui.css" />
    <!-- 引入自己编写的css -->
    <link rel="stylesheet" type="text/css" href="css/forget_pwd.css"/>
    <script src="js/forgetPwd.js" type="text/javascript" charset="utf-8"></script>
</head>
<body style="background-image: url(images/pwd_bg.png);background-size: cover;">
<div class="container-fluid">
    <div class="row">
        <!-- 导航栏 -->
        <div class="col-lg-12" style="padding: 0px;">
            <nav class="navbar navbar-default" id="nav">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="#">
                            <img src="images/icon.png" alt="图标" id="icon" style="float: left;" width="48px"
                                 height="48px">
                        </a>
                        <span id="title">用户服务中心</span>
                    </div><!-- navbar-header -->
                </div><!-- container-fluid -->
            </nav>
        </div><!-- col-lg-10 col-lg-offset-2 -->
    </div>
    <!-- 进度条 -->
    <div class="row">
        <div class="col-lg-6 col-lg-offset-3">
            <div class="progress">
                <div class="progress-bar progress-bar-warning progress-bar-striped active" role="progressbar"
                     aria-valuenow="33.3" aria-valuemin="0" aria-valuemax="100" style="width: 33.3%;">
                    验证账号
                </div>
                <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="66.6"
                     aria-valuemin="0" aria-valuemax="100" style="width: 33.3%;">
                    修改密码
                </div>
                <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="99.9"
                     aria-valuemin="0" aria-valuemax="100" style="width: 33.3%;">
                    修改结果
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-2 col-lg-offset-5"
             id="form-div">
            <form action="update_pwd.jsp" method="post" id="form" onsubmit="validate()">
                <label for="email" id="label">找回密码</label>
                <div class="form-group">
                    <input type="text" class="form-control" id="email" name="email" placeholder="您的邮箱">
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <input type="text" class="form-control" id="code"
                               placeholder="验证码" style="width:75%">
                        <button type="button" class="btn btn-default" id="codeDiv" style="background-color: #706d64;
	opacity: 0.6;
	color: white;
	position: absolute;
	left: 154px;
	width: 96px;">获取验证码
                        </button>
                    </div>
                    <span id="validateCode"></span>
                </div>
                <button type="submit" id="submit" class="btn btn-default">下一步</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
