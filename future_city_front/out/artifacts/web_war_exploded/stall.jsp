<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<title>车位信息</title>
		<link rel="shortcut icon" type="image/x-icon" href="images/icon.png" style="border-radius: 50%;" />

		<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
		<link href="utils/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet" />
		<script src="utils/bootstrap/js/bootstrap.js" type="text/javascript"></script>

		<link href="utils/Public/Web/css/style.css" type="text/css" rel="stylesheet" />
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
								<li style="padding-left: 20px;"><a href="${pageContext.request.contextPath}/logout.jsp">注销</a></li>
							</ul>
						</li>
					</ul>
				</nav>
			</div>
		</div>
	</header>
		<!--banner-->
		<div class="inside_banner_solution">
		</div>
		<div class="solution">
			<div class="home_title">
				<img src="utils/Public/Web/images/sl01.jpg"
					width="182" height="54" alt="网站建设解决方案" />
			</div>
			<div class="solution_list">
				<ul class="fix">
					<li>
						<div class="solu_img">
							<a href="#" tppabs="#" class="shade">
							</a>
							<div class="img_icon">
								<a href="#" tppabs="#">
									<img src="utils/Public/Web/images/sl_icon.png" alt="查看企业网站解决方案详细" width="40"
										height="40" />
								</a>
							</div>
							<img src="utils/Public/Web/images/1430299187.jpg" width="370" height="120" alt="企业网站解决方案" />
						</div>
						<h2>
							<a href="#" tppabs="#">
								我的车位
							</a>
						</h2>
						<p class="intro">
							<a href="#" tppabs="#">
								您的个人车位信息
							</a>
						</p>
					</li>
					<li>
						<div class="solu_img">
							<a href="#" tppabs="#" class="shade">
							</a>
							<div class="img_icon">
								<a href="#" tppabs="#">
									<img src="utils/Public/Web/images/sl_icon.png" alt="查看旅游网站解决方案详细" width="40"
										height="40" />
								</a>
							</div>
							<img src="utils/Public/Web/images/1430299202.jpg" width="370" height="120" alt="旅游网站解决方案" />
						</div>
						<h2>
							<a href="#" tppabs="#">
								租赁车位
							</a>
						</h2>
						<p class="intro">
							<a href="#" tppabs="#">
								这里有空闲车位供您租赁
							</a>
						</p>
					</li>
					<li>
						<div class="solu_img">
							<a href="#" tppabs="#" class="shade">
							</a>
							<div class="img_icon">
								<a href="#" tppabs="#">
									<img src="utils/Public/Web/images/sl_icon.png" alt="查看手机网站解决方案详细" width="40"
										height="40" />
								</a>
							</div>
							<img src="utils/Public/Web/images/1430299219.jpg" width="370" height="120" alt="手机网站解决方案" />
						</div>
						<h2>
							<a href="#" tppabs="#">
								购买车位
							</a>
						</h2>
						<p class="intro">
							<a href="#" tppabs="#">
								这里有还未售卖的车位供您挑选
							</a>
						</p>
					</li>
				</ul>
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
