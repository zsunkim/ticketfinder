<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login page - Admin</title>


    <!--STYLESHEET-->
    <!--=================================================-->

    <!--Open Sans Font [ OPTIONAL ] -->
     <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&amp;subset=latin" rel="stylesheet">


    <!--Bootstrap Stylesheet [ REQUIRED ]-->
    <link href="${pageContext.request.contextPath }/a_css/bootstrap.min.css" rel="stylesheet">


    <!--Nifty Stylesheet [ REQUIRED ]-->
    <link href="${pageContext.request.contextPath }/a_css/nifty.min.css" rel="stylesheet">

    
    <!--Font Awesome [ OPTIONAL ]-->
    <link href="${pageContext.request.contextPath }/a_plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">


    <!--Demo [ DEMONSTRATION ]-->
    <link href="${pageContext.request.contextPath }/a_css/demo/nifty-demo.min.css" rel="stylesheet">


    <!--SCRIPT-->
    <!--=================================================-->

    <!--Page Load Progress Bar [ OPTIONAL ]-->
    <link href="${pageContext.request.contextPath }/a_plugins/pace/pace.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/a_plugins/pace/pace.min.js"></script>
</head>
<body>
	<div id="container" class="cls-container">
		
		<!-- BACKGROUND IMAGE -->
		<!--===================================================-->
		<div id="bg-overlay" class="bg-img" style="background-color: #b3b3b3;"></div>
		
		
		<!-- HEADER -->
		<!--===================================================-->
		<div class="cls-header cls-header-lg">
			<div class="cls-brand">
				<a class="box-inline">
					<span class="brand-title">TicketFinder <span class="text-thin">Admin</span></span>
				</a>
			</div>
		</div>
		<!--===================================================-->
		
		
		<!-- LOGIN FORM -->
		<!--===================================================-->
		<div class="cls-content">
			<div class="cls-content-sm panel">
				<div class="panel-body">
					<p class="pad-btm">관리자 로그인</p>
					<form name="f" method="post" action="${pageContext.request.contextPath }/login.admin">
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon"><i class="fa fa-user"></i></div>
								<input type="text" class="form-control" placeholder="User Id" name="userId" id="id">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon"><i class="fa fa-asterisk"></i></div>
								<input type="password" class="form-control" placeholder="Password" name="userPw" id="passwd">
							</div>
						</div>
						<!-- <div class="row">
							<div class="col-xs-12 text-left checkbox">
								<label class="form-checkbox form-icon">
								<input type="checkbox"> Remember me
								</label>
							</div>
						</div> -->
						<div class="mar-btm"><em></em></div>
						<button class="btn btn-primary btn-lg btn-block" type="button" style="margin-top:45px;" onclick="login();">로그인</button>
					</form>
				</div>
			</div>
			<div class="pad-ver">
				<a href="${pageContext.request.contextPath }/forgot.admin" class="btn-link mar-all">비밀번호 찾기</a>
			</div>
		</div>
		<!--===================================================-->
	</div>
	<!--===================================================-->
	<!-- END OF CONTAINER -->


		
	<!--JAVASCRIPT-->
	<!--=================================================-->

	<!--jQuery [ REQUIRED ]-->
	<script src="${pageContext.request.contextPath }/a_js/jquery-2.1.1.min.js"></script>

	<!--BootstrapJS [ RECOMMENDED ]-->
	<script src="${pageContext.request.contextPath }/a_js/bootstrap.min.js"></script>

	<!--Fast Click [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/a_plugins/fast-click/fastclick.min.js"></script>
	
	<!--Nifty Admin [ RECOMMENDED ]-->
	<script src="${pageContext.request.contextPath }/a_js/nifty.min.js"></script>
	<script type="text/javascript">
	function login() {
		if ($('#id').val()=="") {
			//$("#idMsg").text("아이디를 입력해 주세요.");
			$("#id").focus();
			return false;
		} 
		if ($('#passwd').val()=="") {
			//$("#passwdMsg").text("비밀번호를 입력해 주세요.");
			$("#passwd").focus();
			return false;
		}	
		
		//f.action = "${pageContext.request.contextPath }/login";
		f.submit();
	}
	</script>
</body>
</html>