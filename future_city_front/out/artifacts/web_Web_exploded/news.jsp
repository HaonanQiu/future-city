<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<title>新闻资讯</title>
		<link rel="shortcut icon" type="image/x-icon" href="images/icon.png" style="border-radius: 50%;" />

		<script src="/web/js/jquery-3.2.1.min.js" type="text/javascript"></script>
		<script src="/web/utils/bootstrap/js/bootstrap.js" type="text/javascript"></script>
		<link href="/web/utils/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet" />
        <script src="${pageContext.request.contextPath}/utils/layui-v2.6.8/layui/layui.js"></script>
        <link href="${pageContext.request.contextPath}/utils/layui-v2.6.8/layui/css/layui.css"/>

		<link href="/web/utils/Public/Web/css/style.css" type="text/css" rel="stylesheet" />
        <script src="${pageContext.request.contextPath}/js/readCount.js" type="text/javascript"></script>

	</head>

	<body>
		<header class="header">
			<div class="wrap">
				<a href="/web/index.jsp" class="fl logo">
					<img src="/web/images/icon.png" alt="未来城" width="55" height="55" />
				</a>
				<div class="fl logo_text">
					<img src="/web/utils/Public/Web/images/index201601/logo_text.jpg" alt="懂你所需，做你所想" width="163"
						height="49" />
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
								<a href="/web/index.jsp">
									官网首页
								</a>
							</li>
							<li id="menu2">
								<a href="/web/room.jsp">
									房屋信息
								</a>
							</li>
							<li id="menu3">
								<a href="/web/pay.jsp">
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
									aria-haspopup="true" aria-expanded="false">${sessionScope.householder.name}<span class="caret"></span></a>
								<ul class="dropdown-menu" style="width: 100px;">
									<li style="padding-left: 20px;"><a href="#">个人信息</a></li>
									<li style="padding-left: 20px;"><a href="#">注销</a></li>
								</ul>
							</li>
						</ul>
					</nav>
				</div>
			</div>
		</header>
		<script type="text/javascript">
			document.getElementById("menu1").className = "on";
		</script>
		<!--banner-->
		<div class="inside_banner_news"></div>
		<div class="news_list">
			<ul>
				<c:forEach items="${pageInfo.list}" var="information">
					<li>
						<div class="news_time fl">
						<span class="day">
							${information.dayStr()}
						</span>
							<span class="year">
							${information.ymStr()}
						</span>
							<span class="author">
							${information.timeStr()}
						</span>
							<span class="type">
							<a href="#">
								管理员发布
							</a>
						</span>
						</div>
						<div class="news_cont fr">
							<h2>
								<a href="#" onclick="more(${information.id})">
									${information.title}
								</a>
							</h2>
							<p class="demo">
								<a href="#" onclick="more(${information.id})">
									${information.content}
								</a>
							</p>
							<p class="vis">
								<a href="#" class="more btn" onclick="more(${information.id})">
									查看更多 >>
								</a>
								浏览次数：${information.readCount} &nbsp;&nbsp;
								&nbsp; &nbsp;
							</p>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
		<div class="page">
			<ul class="pagination">
				<li>
					<a href="${pageContext.request.contextPath}/information/findByPage?pageNum=1&pageSize=${pageInfo.pageSize}" aria-label="Previous">首页</a>
				</li>
				<li><a href="${pageContext.request.contextPath}/information/findByPage?pageNum=${pageInfo.pageNum-1}&pageSize=${pageInfo.pageSize}">上一页</a></li>
				<c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
					<li><a href="${pageContext.request.contextPath}/information/findByPage?pageNum=${pageNum}&pageSize=${pageInfo.pageSize}">${pageNum}</a></li>
				</c:forEach>
				<li><a href="${pageContext.request.contextPath}/information/findByPage?pageNum=${pageInfo.pageNum+1}&pageSize=${pageInfo.pageSize}">下一页</a></li>
				<li>
					<a href="${pageContext.request.contextPath}/information/findByPage?pageNum=${pageInfo.pages}&pageSize=${pageInfo.pageSize}" aria-label="Next">尾页</a>
				</li>
			</ul>
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
