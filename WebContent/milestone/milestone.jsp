<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.milestone.model.*"%>
<%@ page import="java.util.*"%>

<%
	MilestoneService milestoneSvc = new MilestoneService();

	MilestoneVO milestoneVO1 = milestoneSvc.getOneMilestone("MSNO0000021");
	MilestoneVO milestoneVO2 = milestoneSvc.getOneMilestone("MSNO0000022");
	MilestoneVO milestoneVO3 = milestoneSvc.getOneMilestone("MSNO0000023");
	MilestoneVO milestoneVO4 = milestoneSvc.getOneMilestone("MSNO0000024");
	MilestoneVO milestoneVO5 = milestoneSvc.getOneMilestone("MSNO0000025");
	//default "CS0000026"
	//List<MilestoneVO> list = milestoneSvc.getMileStoneByCs("CS0000026");
	List<MilestoneVO> list = (List<MilestoneVO>)request.getAttribute("mileStoneList");
	pageContext.setAttribute("list", list);
%>
<html lang="pt-br">
<head>
<title>案件進度</title>

<meta charset="UTF-8" />

<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<meta name="viewport" content="width=device-width, initial-scale=1.0">


<!-- # linking piont tab-icon-->
<link rel="icon" type="images/gif" href="img/hc_icon_w.png"
	sizes="16x16">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/animatecss/3.5.2/animate.min.css" />


<!-- # linking piont progress-bar -->
<link rel='stylesheet prefetch' href='css/progress-bar-kiaod.css'>
<link rel="stylesheet" href="css/progress-bar-style.css">


<title>HomeCode!</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<!--[if lt IE 9]>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<link rel="stylesheet" type="text/css" href="css/style-timeline.css">
<link rel="stylesheet" type="text/css" href="css/style.css">

<!-- # linking piont bootstrap-lightbox-->
<link rel="stylesheet" href="bootstrap-lightbox/bootstrap-lightbox.css">


</head>
<body>
	<!-- nav bar 開始======================================================================================= -->
	<nav class="navbar navbar-default" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-ex1-collapse">
					<span class="sr-only">選單切換</span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<!-- # linking piont 首頁-->
				<a class="navbar-brand" href="index.html"><img
					src="img/homecode2.png" height="35" class="img-va"></a>

			</div>

			<!-- 手機隱藏選單區 -->
			<div class="collapse navbar-collapse navbar-ex1-collapse">

				<!-- 左選單 -->
				<ul class="nav navbar-nav">
					<li class="dropdown"><a href="#" class="collapse-toggle"
						data-toggle="dropdown">接手案件 <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="member_post.html">張貼案件</a></li>
							<li><a href="#">申請中案件</a></li>
							<li><a href="member_case.html">進行中案件</a></li>
							<li><a href="#">已完成案件</a></li>
							<li><a href="#">接案評價</a></li>
						</ul></li>
				</ul>

				<ul class="nav navbar-nav">
					<li class="dropdown"><a href="#" class="collapse-toggle"
						data-toggle="dropdown">發包案件 <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#">等待中案件</a></li>
							<li><a href="member_case.html">進行中案件</a></li>
							<li><a href="#">已完成案件</a></li>
							<li><a href="#">發案評價</a></li>

						</ul></li>
				</ul>

				<ul class="nav navbar-nav">
					<li class="dropdown"><a href="#" class="collapse-toggle"
						data-toggle="dropdown">訊息中心 <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#">HomeCode! 訊息</a></li>
							<li><a href="#">會員訊息</a></li>
						</ul></li>
				</ul>

				<form class="navbar-form navbar-left ng-pristine margin01">
					<div class="input-group">
						<div class="dropdown input-group-btn collapse-toggle">
							<label class="btn dropdown-toggle" data-toggle="dropdown">
								<span class="glyphicon glyphicon-search "></span> <span
								class="glyphicon glyphicon-chevron-down "></span>
							</label>
							<ul class="dropdown-menu">
								<li><a href="#">尋找案件</a></li>
								<li><a href="#">尋找人才</a></li>
							</ul>
						</div>
						<input type="text" class="form-control" placeholder=" 找設計人才/工作案件">
					</div>
				</form>



				<!-- 右選單 -->
				<ul class="nav navbar-nav navbar-right">
					<ul class="nav navbar-nav">
						<li class="dropdown"><a href="#"
							class="collapse-toggle glyphicon glyphicon-question-sign navicon"
							data-toggle="dropdown"></a>
							<ul class="dropdown-menu">
								<li><a href="#">如何接案</a></li>
								<li><a href="#">如何發案</a></li>
								<li><a href="#">客服中心</a></li>
								<li><a href="#">合約範本下載</a></li>
								<li><a href="#">App下載</a></li>
							</ul></li>
					</ul>
					<li><a href="#" class="glyphicon glyphicon-bell navicon">
					</a></li>
					<li class="dropdown"><a href="#"
						class="glyphicon glyphicon-user collapse-toggle"
						data-toggle="dropdown"> <span class="font-18">
								user-name</span> <span class="glyphicon glyphicon-chevron-down"></span></a>
						<ul class="dropdown-menu">
							<li><a href="member_profile.html">user-name</a></li>
							<li><a href="#">設定</a></li>
							<li><a href="#">登出</a></li>
						</ul></li>

				</ul>

			</div>
			<!-- 手機隱藏選單區結束 -->
		</div>
	</nav>

	<!-- ==nav bar 結束======================================================================================= -->


	<div class="container mrg-top-15 mb20">
		<div class="row">
			<a href="member_case.html"><div class="col-xs-12 col-sm-4 btn btn-default central btn-tab-4">案件詳情</div></a>
			<a href="#"><div class="col-xs-12 col-sm-4 btn btn-default central btn-tab-4 active">案件進度</div></a>
			<a href="member_timeline.html"><div class="col-xs-12 col-sm-4 btn btn-default central btn-tab-4">Timeline</div></a>
		</div>
		<!-- Row End -->
	</div>
	<!-- container mrg-top-15 width-75per End -->


	<div class="hiw">
		<div class="container width-100px">
			<div class="row">
				<h2>3D人體解剖學的教學軟體維護</h2>
			</div>
		</div>

		<div class="container mrg-bottom-15 mrg-top-15 progress-area">
			<div class="row">

				<!-- 進度百分比顯示開始 -->
				<div class=" percentage central">
					<div id="process"
						style="font-size: 60px; display: flex; align-items: flex-end; justify-content: center; margin-top: 20px;">75%</div>
				</div>

				<FORM METHOD="post" ACTION="milestone.do">
					<b>輸入案件編號 (如):CS00000017</b> <input type="text" name="csNo"> 
					<input type="submit" value="送出">
					<input type="hidden" name="action" value="getCase_milestone">
				</FORM>
				<!-- 進度百分比顯示結素 -->



				<!-- 進度條顯示開始 -->
				<div class="">


					<ol class="ProgressBar">

						<li class="ProgressBar-step is-current is-complete"><svg
								class="ProgressBar-icon">
								<use xlink:href="#checkmark-bold" /></svg> <span
							class="ProgressBar-stepLabel"><%=milestoneVO1.getMilestoneName()%></span>
						</li>

						<li class="ProgressBar-step is-current is-complete"><svg
								class="ProgressBar-icon">
								<use xlink:href="#checkmark-bold" /></svg> <span
							class="ProgressBar-stepLabel"><%=milestoneVO2.getMilestoneName()%></span>
						</li>

						<li class="ProgressBar-step is-current is-complete"><svg
								class="ProgressBar-icon">
								<use xlink:href="#checkmark-bold" /></svg> <span
							class="ProgressBar-stepLabel"><%=milestoneVO3.getMilestoneName()%></span>
						</li>

						<li class="ProgressBar-step is-current is-complete"><svg
								class="ProgressBar-icon">
								<use xlink:href="#checkmark-bold" /></svg> <span
							class="ProgressBar-stepLabel"><%=milestoneVO4.getMilestoneName()%></span>
						</li>

						<li class="ProgressBar-step"><svg class="ProgressBar-icon">
								<use xlink:href="#checkmark-bold" /></svg> <span
							class="ProgressBar-stepLabel"><%=milestoneVO5.getMilestoneName()%></span>
						</li>

					</ol>

					<!--
                <p>
                <button id="previous">Previous</button>
                <button id="advance">Advance</button>
                </p>
                -->


				</div>

				<svg xmlns="http://www.w3.org/2000/svg" style="height: 0px;">
                <symbol id="checkmark-bold" viewBox="0 0 24 24">
                <path
						d="M20.285 2l-11.285 11.567-5.286-5.011-3.714 3.716 9 8.728 15-15.285z" />
                </symbol>
                </svg>
				<!-- 進度條顯示結束 -->


				<!-- 里程碑顯示開始 -->
				<div class="" style="width: 85%; margin-left: auto; margin-right: auto;">
					<c:forEach var="milestoneVO" items="${list}">
						<div class="panel panel-default">
							<div class="panel-body row">
								<div class="col-xs-12 col-sm-8">
									<h1>${milestoneVO.milestoneName}</h1>
									<span>開始時間:${milestoneVO.mileStartTime}</span> <span>結束時間:${milestoneVO.mileEndTime}</span>
								</div>
								<c:if test="${'已提交'eq milestoneVO.milestoneState}">
									<div class="col-xs-12 col-sm-offset-2 col-sm-2" id="accept">
										<FORM METHOD="post" ACTION="milestone.do">
											<input type="hidden" name="action" value="agree-milestone">
											<input type="submit" value="同意"
												class="btn btn-default btn-square" style="width: 100%;"><br>
											<input type="hidden" name="milestoneState" value="已完成">
											<input type="hidden" name="milestoneNo" value="${milestoneVO.getMilestoneNO()}">
										
										</FORM>
										<FORM METHOD="post" ACTION="milestone.do">
											<input type="hidden" name="action" value="disagree-milestone">
											<input type="submit" value="不同意"
												class="btn btn-default btn-square" style="width: 100%;"><br>
											<input type="hidden" name="milestoneState" value="未完成">
											<input type="hidden" name="milestoneNo" value="${milestoneVO.getMilestoneNO()}">
										
										</FORM>
									</div>
								</c:if>

								<c:if
									test="${'已完成'eq milestoneVO.milestoneState or '未完成'eq milestoneVO.milestoneState }">
									<div class="col-xs-12 col-sm-offset-2 col-sm-2">

										<h3>${milestoneVO.milestoneState}</h3>
									</div>
								</c:if>


							</div>
						</div>
					</c:forEach>
				</div>

				<!--  -->





			</div>
			<!-- 里程碑顯示結束 -->

		</div>
		<!-- row End -->
	</div>
	<!-- container End -->


	</div>
	<!-- hiw End -->













	<!-- footer區 =========================================================== -->
	<div class="footer">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-3">
					<h3>title</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Rem provident dolorum veniam, iure voluptate veritatis a debitis
						architecto iste deserunt aperiam consequatur, officia sequi
						dolore. Odio, quam ratione magnam fuga itaque? Dicta libero
						mollitia voluptates neque molestias, harum magnam amet.</p>
				</div>
				<div class="col-xs-12 col-sm-3">
					<h3>title</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Deleniti sapiente doloribus repellendus exercitationem optio
						veniam quidem porro quis eaque, hic corrupti nobis voluptatum
						praesentium nemo cum est expedita minus temporibus, commodi fuga
						nisi. Quis velit, enim earum, provident ab odit!</p>
				</div>
				<div class="col-xs-12 col-sm-3">
					<h3>title</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Excepturi illo distinctio possimus quas et fuga ad enim quod eius
						iure inventore perspiciatis obcaecati eveniet at consequatur sed
						animi, itaque sapiente necessitatibus vel quam illum esse
						exercitationem culpa. Beatae, nisi inventore?</p>
				</div>
				<div class="col-xs-12 col-sm-3">
					<h3>title</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Quia voluptatem necessitatibus quaerat iste ad aliquam earum
						soluta vitae corporis, nulla sed iusto odit, sunt molestias
						exercitationem quibusdam ex veniam deserunt beatae? Possimus
						fugiat cum omnis blanditiis ab ipsum, deleniti facilis!</p>
				</div>
			</div>
		</div>
	</div>
	<!-- footer區結束 =========================================================== -->
	<script src="https://cdn.jsdelivr.net/jquery/1.11.1/jquery.min.js"></script>
	<!--  <script src="js/jquery-albe-timeline-3.0.0.min.js"></script> -->
	<script src="js/data-albe-timeline.js"></script>
	<script src="https://code.jquery.com/jquery.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src="js/dot-progress-bar.js"></script>


	<script type="text/javascript">
		window.onload = function() {
			var val = 100;
			// var val = document.getElementById('progress-now').getAttribute('value');
			var progress = (val * 50 > 400) ? 400 : val * 50; /* 50 is 1/8th of height, 400 is height */
			document.getElementById('progress-now').setAttribute('style',
					'height: ' + progress + 'px');
		}

		$("#advance").on(
				"click",
				function() {
					var $bar = $(".ProgressBar");
					var $accept = $("#accept");
					if ($bar.children(".is-current").length > 0) {
						$bar.children(".is-current").removeClass("is-current")
								.next().addClass("is-current is-complete");
						$("#accept").html("<h3>已完成</h3>");
						$("#process").html("100%");

					} else {
						$bar.children().first().addClass(
								"is-current is-complete");
					}
				});
	</script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>


</body>
</html>
