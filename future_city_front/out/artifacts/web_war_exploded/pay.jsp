<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="author" content="TI Alliance"/>
    <title>生活缴费</title>
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/icon.png"
          style="border-radius: 50%;"/>

    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/utils/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
    <script src="${pageContext.request.contextPath}/utils/bootstrap/js/bootstrap.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/utils/layui-v2.6.8/layui/css/layui.css" type="text/css" rel="stylesheet"/>
    <script src="${pageContext.request.contextPath}/utils/layui-v2.6.8/layui/layui.js" type="text/javascript"></script>

    <link href="${pageContext.request.contextPath}/utils/Public/Web/css/style.css" type="text/css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/pay.css" type="text/css" rel="stylesheet"/>

    <script>
        $(function (){
            $("#water").click(function (){
                console.log(1)
                var index = layer.open({
                    type: 2,
                    title: '水费账单',
                    content: '/web/lifeCost/check?category=0',
                    area: ['100%', '100%'],
                    maxmin: true
                });
                layer.full(index);
            })

            $("#electric").click(function () {
                var index = layer.open({
                    type: 2,
                    title: '电费账单',
                    content: '/web/lifeCost/check?category=1',
                    area: ['100%', '100%'],
                    maxmin: true
                });
                layer.full(index);
            })
            $("#gas").click(function () {
                var index = layer.open({
                    type: 2,
                    title: '燃气费账单',
                    content: '/web/lifeCost/check?category=2',
                    area: ['100%', '100%'],
                    maxmin: true
                });
                layer.full(index);
            })
            $("#property").click(function () {
                var index = layer.open({
                    type: 2,
                    title: '物业费账单',
                    content: '/web/lifeCost/check?category=3',
                    area: ['100%', '100%'],
                    maxmin: true
                });
                layer.full(index);
            })
        })
    </script>

</head>
<c:if test="${ empty sessionScope.householder }">
    <script>
        window.location.href = '${pageContext.request.contextPath}/login.jsp'
    </script>
</c:if>
<body>
<header class="header">
    <div class="wrap">
        <a href="/web/index.jsp" class="fl logo">
            <img src="/web/images/icon.png" alt="未来城" width="55" height="55"/>
        </a>
        <div class="fl logo_text">
            <img src="/web/utils/Public/Web/images/index201601/logo_text.jpg" alt="懂你所需，做你所想" width="163"
                 height="49"/>
        </div>
        <div class="fr">
            <div class="top">
						<span class="call">
						</span>
                <span class="call_tel">
							123-456-78910
						</span>
                <a>
							<span class="email">
							</span>
                    123456@789.com
                </a>
                <a class="ewm">
							<span class="weixin">
							</span>
                    竭诚为您服务
                </a>
            </div>
            <nav class="nav">
                <ul class="fix">
                    <li id="menu1">
                        <a href="/web/index.jsp" style="font-weight: 700">
                            官网首页
                        </a>
                    </li>
                    <li id="menu2">
                        <a href="/web/room/findAll?hid=${sessionScope.householder.id}">
                            房屋信息
                        </a>
                    </li>
                    <li id="menu3">
                        <a href="/web/balance/check">
                            生活缴费
                        </a>
                    </li>
                    <li id="menu4">
                        <a href="/web/repair.jsp">
                            设施报修
                        </a>
                    </li>
                    <li id="menu5">
                        <a href="/web/stall.jsp">
                            车位信息
                        </a>
                    </li>
                    <li id="menu6">
                        <a href="/web/complaint.jsp">
                            投诉建议
                        </a>
                    </li>
                    <li id="menu7">
                        <a href="/web/contact.jsp">
                            联系我们
                        </a>
                    </li>
                    <li id="menu8" class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                           aria-haspopup="true" aria-expanded="false">${sessionScope.householder.name}<span
                                class="caret"></span></a>
                        <ul class="dropdown-menu" style="width: 100px;">
                            <li style="padding-left: 20px;"><a href="${pageContext.request.contextPath}/forget_pwd.jsp">修改密码</a></li>
                            <li style="padding-left: 20px;"><a
                                    href="${pageContext.request.contextPath}/logout.jsp">注销</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</header>
<!--banner-->
<div class="inside_banner_pay">
</div>
<div class="ser_project">
    <div class="home_title">
        <img src="${pageContext.request.contextPath}/utils/Public/Web/images/s01.png" alt="网站定制"/>
    </div>
</div>
<div class="container" id="content">
    <div class="row">
        <div class="col-lg-3">
            <img src="${pageContext.request.contextPath}/images/standing-8.png"/>
        </div>
        <div class="col-lg-6" id="show">
            <div class="col-lg-6">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <img id="water" src="${pageContext.request.contextPath}/images/water.png" width="25px"/>
                        <h3>水费</h3>
                    </div>
                    <div class="panel-body">
                        <h2>${balance.water}元</h2>
                        <button type="button" class="btn btn-default"
                                onclick="location.href = '/web/alipay.jsp?type=0'">充值
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <img id="electric" src="${pageContext.request.contextPath}/images/electric.png" width="25px"/>
                        <h3>电费</h3>
                    </div>
                    <div class="panel-body">
                        <h2>${balance.electric}元</h2>
                        <button type="button" class="btn btn-default"
                                onclick="location.href = '/web/alipay.jsp?type=1'">充值
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="panel panel-warning">
                    <div class="panel-heading">
                        <img id="gas" src="${pageContext.request.contextPath}/images/gas.png" width="25px"/>
                        <h3>燃气费</h3>
                    </div>
                    <div class="panel-body">
                        <h2>${balance.gas}元</h2>
                        <button type="button" class="btn btn-default"
                                onclick="location.href = '/web/alipay.jsp?type=2'">充值
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="panel panel-danger">
                    <div class="panel-heading">
                        <img id="property" src="${pageContext.request.contextPath}/images/fee.png" width="25px"/>
                        <h3>物业费</h3>
                    </div>
                    <div class="panel-body">
                        <h2>${balance.property}元</h2>
                        <button type="button" class="btn btn-default"
                                onclick="location.href = '/web/alipay.jsp?type=3'">充值
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3" style="margin-top: 50px;">
            <img src="${pageContext.request.contextPath}/images/sitting-6.png"/>
        </div>
    </div>
</div>
<footer class="footer">
    <div class="blogroll">
        <div class="wrap">
            友情链接：
            <a href="https://www.baidu.com/" target="_blank">
                百度一下
            </a>
            &nbsp;
            <a href="https://voice.baidu.com/act/newpneumonia/newpneumonia/?from=osari_aladin_banner"
               target="_blank">
                疫情实时大数据报告
            </a>
            &nbsp;
            <a href="https://v3.bootcss.com/" target="_blank">
                Bootstrap中文文档
            </a>
            &nbsp;
            <a href="https://www.layui.com/" target="_blank">
                Layui框架
            </a>
            &nbsp;
            <a href="https://layer.layui.com/" target="_blank">
                Layer弹出层组件
            </a>
            &nbsp;
            <p class="copyright">
                @2021-2031 版权所有 未来城物业 ICP备88888888号
            </p>
        </div>
    </div>
</footer>
</body>

</html>
