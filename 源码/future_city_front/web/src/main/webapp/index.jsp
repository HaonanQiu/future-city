<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>未来城Future City - 懂您所需，做您所想</title>
    <link rel="shortcut icon" type="image/x-icon" href="/web/images/icon.png" style="border-radius: 50%;"/>

    <script src="/web/js/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="/web/utils/bootstrap/js/bootstrap.js" type="text/javascript"></script>
    <link href="/web/utils/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
    <script src="${pageContext.request.contextPath}/utils/layui-v2.6.8/layui/layui.js"></script>
    <link href="${pageContext.request.contextPath}/utils/layui-v2.6.8/layui/css/layui.css"/>

    <link href="/web/utils/Public/Web/css/index2016.css" type="text/css" rel="stylesheet" />
    <script src="/web/utils/Public/Web/js/index2016.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/readCount.js" type="text/javascript"></script>
</head>
<c:if test="${ empty sessionScope.householder }">
    <script>
        window.location.href = '${pageContext.request.contextPath}/login.jsp'
    </script>
</c:if>
<c:if test="${ empty sessionScope.threeInformation }">
    <script>
        window.location.href = '/web/information/find'
    </script>
</c:if>
<c:if test="${sessionScope.householder.state == 0}">
    <script>
        layer.open({
            type: 2,
            title: '请完善个人信息',
            area: ['700px', '450px'],
            fixed: false, //不固定
            maxmin: true,
            content: '/web/complete.jsp'
        });
    </script>
</c:if>
<body>
<div id="section1" init="true" class="section section1">
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
                                <li style="padding-left: 20px;"><a href="${pageContext.request.contextPath}/logout.jsp">注销</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </header>
    <!--轮播图-->
    <div id="myCarousel" class="carousel slide">
        <!-- 轮播（Carousel）指标 -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
        </ol>
        <!-- 轮播（Carousel）项目 -->
        <div class="carousel-inner">
            <div class="item active">
                <img src="/web/images/banner1.jpg" alt="First slide">
                <div class="carousel-caption">自然之门，生活之窗</div>
            </div>
            <div class="item">
                <img src="/web/images/banner2.jpg" alt="Second slide">
                <div class="carousel-caption">品位随行，高贵随心</div>
            </div>
        </div>
        <!-- 轮播（Carousel）导航 -->
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div>
<!--news-->
<div id="section5" init="false" class="section section5">
    <div class="home_news">
        <div class="home_news_title">
            <a href="/web/information/findByPage">
                <img src="/web/utils/Public/Web/images/index201601/t_news.jpg" alt="新闻资讯" width="310" height="71"/>
            </a>
        </div>
        <div class="home_news_text">
            提供社区建设相关资讯、政府最新消息、邻里趣事、新闻早晚报、常见问题等
        </div>
        <div class="home_news_list">
            <div class="wrap">
                <div class="home_news_list_inner">
                    <c:forEach items="${sessionScope.threeInformation}" var="information">
                        <div class="home_news_item">
                            <dl>
                                <dt>
                                        ${information.sendTimeStr()}
                                </dt>
                                <dd class="t">
                                    <a href="javascript:void(0);" onclick="more(${information.id})">
                                            ${information.title}
                                    </a>
                                </dd>
                                <dd class="spec">
                                    <a href="javascript:void(0);" onclick="more(${information.id})">
                                            ${information.content}
                                    </a>
                                </dd>
                            </dl>
                        </div>
                    </c:forEach>
                    <div class="c"></div>
                </div>
                <div class="btn_news_more">
                    <a href="/web/information/findByPage" title="新闻资讯" class="btn">
                        查看更多
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<!--partner-->
<div id="section6" init="false" class="section section6">
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
</div>
</body>
</html>
