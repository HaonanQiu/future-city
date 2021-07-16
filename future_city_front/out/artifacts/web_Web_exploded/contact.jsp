<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<title>联系我们</title>
		<link rel="shortcut icon" type="image/x-icon" href="images/icon.png" style="border-radius: 50%;" />

		<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
		<link href="utils/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet" />
		<script src="utils/bootstrap/js/bootstrap.js" type="text/javascript"></script>

		<link href="utils/Public/Web/css/style.css" type="text/css" rel="stylesheet" />
		<!-- <script src="utils/Public/Web/js/base.js" type="text/javascript"></script> -->
	</head>

	<body>
		<header class="header">
			<div class="wrap">
				<a href="index.jsp" class="fl logo">
					<img src="images/icon.png" alt="未来城" width="55" height="55" />
				</a>
				<div class="fl logo_text">
					<img src="utils/Public/Web/images/index201601/logo_text.jpg" alt="懂你所需，做你所想" width="163"
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
								<a href="index.jsp">
									官网首页
								</a>
							</li>
							<li id="menu2">
								<a href="room.jsp">
									房屋信息
								</a>
							</li>
							<li id="menu3">
								<a href="pay.jsp">
									生活缴费
								</a>
							</li>
							<li id="menu4">
								<a href="repair.jsp">
									设施报修
								</a>
							</li>
							<li id="menu5">
								<a href="stall.jsp">
									车位信息
								</a>
							</li>
							<li id="menu6">
								<a href="complaint.jsp">
									投诉建议
								</a>
							</li>
							<li id="menu7">
								<a href="contact.jsp" style="font-weight: 700">
									联系我们
								</a>
							</li>
							<li id="menu8" class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
									aria-haspopup="true" aria-expanded="false">XXX <span class="caret"></span></a>
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
		<div class="connect" style="margin-top: 40px;">
			<div class="wrap">
				<div class="home_title">
					<img src="utils/Public/Web/images/cn02.png" alt="联系方维" width="200" height="53" />
				</div>
				<div class="connect_column">
					<ul class="fix">
						<li>
							<div class="s1"></div>
							<div class="info">
								<i class="i1"></i>
								<h2>公司地址</h2>
								<p class="text">未来城一号楼底商101室</br>邮编：000000</p>
							</div>
						</li>
						<li>
							<div class="s2"></div>
							<div class="info">
								<i class="i2"></i>
								<h2>联系方式</h2>
								<p class="text">联系电话：123-456-78910<br />传真：123-456-78910</p>
							</div>
						</li>
						<li>
							<div class="s3"></div>
							<div class="info">
								<i class="i3"></i>
								<h2>物业邮箱</h2>
								<p class="text">123456@789.com</p>
							</div>
						</li>
						<li>
							<a href="" target="_blank">
								<div class="s4"></div>
								<div class="info">
									<i class="i4"></i>
									<h2>联系QQ</h2>
									<p class="text">客服：12345<br /></p>
								</div>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>

		<footer class="footer" style="margin-top: -50px;">
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
