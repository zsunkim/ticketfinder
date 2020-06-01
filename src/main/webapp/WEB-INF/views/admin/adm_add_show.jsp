<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>TicketFinder - 공연 등록</title>


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


    <!--Switchery [ OPTIONAL ]-->
    <link href="${pageContext.request.contextPath }/a_plugins/switchery/switchery.min.css" rel="stylesheet">


    <!--Bootstrap Select [ OPTIONAL ]-->
    <link href="${pageContext.request.contextPath }/a_plugins/bootstrap-select/bootstrap-select.min.css" rel="stylesheet">


    <!--Demo [ DEMONSTRATION ]-->
    <link href="${pageContext.request.contextPath }/a_css/demo/nifty-demo.min.css" rel="stylesheet">

    <!--SCRIPT-->
    <!--=================================================-->


    <!--Page Load Progress Bar [ OPTIONAL ]-->
    <link href="${pageContext.request.contextPath }/a_plugins/pace/pace.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/a_plugins/pace/pace.min.js"></script>
</head>
<body>
	<div id="container" class="effect mainnav-lg">
		
		<!--NAVBAR-->
		<!--===================================================-->
		<%@include file="adm_header.jsp" %>
		<!--===================================================-->
		<!--END NAVBAR-->

		<div class="boxed">

			<!--CONTENT CONTAINER-->
			<!--===================================================-->
			<div id="content-container">
				
				<!--Page Title-->
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<div id="page-title">
					<h1 class="page-header text-overflow">공연 등록</h1>
				</div>
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<!--End page title-->
				
				
				<!--Breadcrumb-->
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<ol class="breadcrumb">
					<li><a href="${pageContext.request.contextPath }/main.admin">홈</a></li>
					<li><a href="${pageContext.request.contextPath }/show.admin">공연 관리</a></li>
					<li class="active">공연 등록</li>
				</ol>
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<!--End breadcrumb-->
				

				<!--Page content-->
				<!--===================================================-->
				<div id="page-content">
					<div class="row">
						<div class="col-lg-12">
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">Basic Form Elements</h3>
								</div>
					
					
								<!-- BASIC FORM ELEMENTS -->
								<!--===================================================-->
								<form class="panel-body form-horizontal form-padding">
					
									<!--Static-->
									<div class="form-group">
										<label class="col-md-3 control-label">Static</label>
										<div class="col-md-9"><p class="form-control-static">Username</p></div>
									</div>
					
									<!--Text Input-->
									<div class="form-group">
										<label class="col-md-3 control-label" for="demo-text-input">Text Input</label>
										<div class="col-md-9">
											<input type="text" id="demo-text-input" class="form-control" placeholder="Text">
											<small class="help-block">This is a help text</small>
										</div>
									</div>
					
									<!--Email Input-->
									<div class="form-group">
										<label class="col-md-3 control-label" for="demo-email-input">Email Input</label>
										<div class="col-md-9">
											<input type="email" id="demo-email-input" class="form-control" placeholder="Enter your email">
											<small class="help-block">Please enter your email</small>
										</div>
									</div>
					
									<!--Password-->
									<div class="form-group">
										<label class="col-md-3 control-label" for="demo-password-input">Password</label>
										<div class="col-md-9">
											<input type="password" id="demo-password-input" class="form-control" placeholder="Password">
											<small class="help-block">Please enter password</small>
										</div>
									</div>
					
									<!--Readonly Input-->
									<div class="form-group">
										<label class="col-md-3 control-label" for="demo-readonly-input">Readonly input</label>
										<div class="col-md-9">
											<input type="text" id="demo-readonly-input" class="form-control" placeholder="Readonly input here..." readonly>
										</div>
									</div>
					
									<!--Textarea-->
									<div class="form-group">
										<label class="col-md-3 control-label" for="demo-textarea-input">Textarea</label>
										<div class="col-md-9">
											<textarea id="demo-textarea-input" rows="9" class="form-control" placeholder="Your content here.."></textarea>
										</div>
									</div>
					
									<div class="form-group pad-ver">
										<label class="col-md-3 control-label">Radio Buttons</label>
										<div class="col-md-9">
											<div class="col-md-6 pad-no">
					
												<!-- Radio Buttons -->
												<div class="radio">
													<label class="form-radio form-normal active"><input type="radio" checked="" name="de-blk"> Option 1 (pre-checked)</label>
												</div>
												<div class="radio">
													<label class="form-radio form-normal"><input type="radio" name="de-blk"> Option 2</label>
												</div>
												<div class="radio">
													<label class="form-radio form-normal"><input type="radio" name="de-blk"> Option 3</label>
												</div>
					
											</div>
											<div class="col-md-6 pad-no">
					
												<!-- Icon Radio Buttons -->
												<div class="radio">
													<label class="form-radio form-icon active"><input type="radio" checked="" name="ico-blk"> Option 1 (pre-checked)</label>
												</div>
												<div class="radio">
													<label class="form-radio form-icon"><input type="radio" name="ico-blk"> Option 2</label>
												</div>
												<div class="radio">
													<label class="form-radio form-icon"><input type="radio" name="ico-blk"> Option 3</label>
												</div>
					
											</div>
										</div>
									</div>
									<div class="form-group pad-ver">
										<label class="col-md-3 control-label">Inline Radio buttons</label>
										<div class="col-md-9">
											<div class="radio">
					
												<!-- Inline radio buttons -->
												<label class="form-radio form-normal active"><input type="radio" checked="" name="def-w-label"> Option 1 (pre-checked)</label>
												<label class="form-radio form-normal"><input type="radio" name="def-w-label"> Option 2</label>
												<label class="form-radio form-normal"><input type="radio" name="def-w-label"> Option 3</label>
					
											</div>
											<hr class="hr-sm">
											<div class="radio">
					
												<!-- Inline Icon Radios Buttons -->
												<label class="form-radio form-icon active"><input type="radio" checked="" name="ico-w-label"> Option 1 (pre-checked)</label>
												<label class="form-radio form-icon"><input type="radio" name="ico-w-label"> Option 2</label>
												<label class="form-radio form-icon"><input type="radio" name="ico-w-label"> Option 3</label>
					
											</div>
										</div>
									</div>
									<div class="form-group pad-ver">
										<label class="col-md-3 control-label">Checkboxes</label>
										<div class="col-md-9">
											<div class="col-md-6 pad-no form-block">
					
												<!-- Checkboxes -->
												<div class="checkbox">
													<label class="form-checkbox form-normal form-primary active"><input type="checkbox" checked=""> Option 1 (pre-checked)</label>
												</div>
												<div class="checkbox">
													<label class="form-checkbox form-normal form-primary"><input type="checkbox"> Option 2</label>
												</div>
												<div class="checkbox">
													<label class="form-checkbox form-normal form-primary"><input type="checkbox"> Option 3</label>
												</div>
					
											</div>
											<div class="col-md-6 pad-no form-block">
					
												<!-- Icon Checkboxes -->
												<div class="checkbox">
													<label class="form-checkbox form-icon active"><input type="checkbox" checked=""> Option 1 (pre-checked)</label>
												</div>
												<div class="checkbox">
													<label class="form-checkbox form-icon"><input type="checkbox"> Option 2</label>
												</div>
												<div class="checkbox">
													<label class="form-checkbox form-icon"><input type="checkbox"> Option 3</label>
												</div>
					
											</div>
										</div>
									</div>
									<div class="form-group pad-ver">
										<label class="col-md-3 control-label">Inline Checkboxes</label>
										<div class="col-md-9">
											<div class="checkbox">
					
												<!-- Inline Checkboxes -->
												<label class="form-checkbox form-normal form-primary active"><input type="checkbox" checked=""> Option 1 (pre-checked)</label>
												<label class="form-checkbox form-normal form-primary"><input type="checkbox"> Option 2</label>
												<label class="form-checkbox form-normal form-primary"><input type="checkbox"> Option 3</label>
					
											</div>
											<hr class="hr-sm">
											<div class="checkbox">
					
												<!-- Inline Icon Checkboxes -->
												<label class="form-checkbox form-icon active"><input type="checkbox" checked=""> Option 1 (pre-checked)</label>
												<label class="form-checkbox form-icon"><input type="checkbox"> Option 2</label>
												<label class="form-checkbox form-icon"><input type="checkbox"> Option 3</label>
					
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">File input</label>
										<div class="col-md-9">
											<span class="pull-left btn btn-default btn-file">
											Browse... <input type="file">
											</span>
										</div>
									</div>
								</form>
								<!--===================================================-->
								<!-- END BASIC FORM ELEMENTS -->
					
					
							</div>
						</div>			
				</div>
				<!--===================================================-->
				<!--End page content-->
			</div>
			<!--===================================================-->
			<!--END CONTENT CONTAINER-->

			
			<!--MAIN NAVIGATION-->
			<!--===================================================-->
			<%@include file="adm_nav.jsp" %>
			<!--===================================================-->
			<!--END MAIN NAVIGATION-->
			
			<!--ASIDE 삭제-->
			<!--===================================================-->
			<!--===================================================-->
			<!--END ASIDE-->
		</div>


        <!-- FOOTER -->
        <!--===================================================-->
        <footer id="footer">

            <!-- Visible when footer positions are fixed -->
            <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
            <div class="show-fixed pull-right">
                <ul class="footer-list list-inline">
                    <li>
                        <p class="text-sm">SEO Proggres</p>
                        <div class="progress progress-sm progress-light-base">
                            <div style="width: 80%" class="progress-bar progress-bar-danger"></div>
                        </div>
                    </li>

                    <li>
                        <p class="text-sm">Online Tutorial</p>
                        <div class="progress progress-sm progress-light-base">
                            <div style="width: 80%" class="progress-bar progress-bar-primary"></div>
                        </div>
                    </li>
                    <li>
                        <button class="btn btn-sm btn-dark btn-active-success">Checkout</button>
                    </li>
                </ul>
            </div>



            <!-- Visible when footer positions are static -->
            <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
            <div class="hide-fixed pull-right pad-rgt">Currently v2.2.2</div>



            <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
            <!-- Remove the class name "show-fixed" and "hide-fixed" to make the content always appears. -->
            <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

            <p class="pad-lft">&#0169; 2020 TicketFinder</p>



        </footer>
        <!--===================================================-->
        <!-- END FOOTER -->


        <!-- SCROLL TOP BUTTON -->
        <!--===================================================-->
        <button id="scroll-top" class="btn"><i class="fa fa-chevron-up"></i></button>
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


	<!--Switchery [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/a_plugins/switchery/switchery.min.js"></script>


	<!--Bootstrap Select [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/a_plugins/bootstrap-select/bootstrap-select.min.js"></script>


	<!--DataTables [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/a_plugins/datatables/media/js/jquery.dataTables.js"></script>
	<script src="${pageContext.request.contextPath }/a_plugins/datatables/media/js/dataTables.bootstrap.js"></script>
	<script src="${pageContext.request.contextPath }/a_plugins/datatables/extensions/Responsive/js/dataTables.responsive.min.js"></script>


	<!--Demo script [ DEMONSTRATION ]-->
	<script src="${pageContext.request.contextPath }/a_js/demo/nifty-demo.min.js"></script>


	<!--DataTables Sample [ SAMPLE ]-->
	<script src="${pageContext.request.contextPath }/a_js/demo/tables-datatables.js"></script>

	
	<script type="text/javascript">
	$(document).ready(function() {

		$('#mainnav-menu').children().eq(2).addClass('active-sub').children().eq(1).addClass('in').children().eq(1).addClass('active-link');
		
		var test111 = $('#test111').DataTable({
			"responsive": true,
			"language": {
				"paginate": {
				  "previous": '<i class="fa fa-angle-left"></i>',
				  "next": '<i class="fa fa-angle-right"></i>'
				}
			}
		});

		$('#test111').on( 'click', 'tr', function () {
			if ( $(this).hasClass('selected') ) {
				$(this).removeClass('selected');
			}
			else {
				test111.$('tr.selected').removeClass('selected');
				$(this).addClass('selected');
			}
		} );
		
		var rowSelection2 = $('#demo-dt-selection2').DataTable({
			"responsive": true,
			"language": {
				"paginate": {
				  "previous": '<i class="fa fa-angle-left"></i>',
				  "next": '<i class="fa fa-angle-right"></i>'
				}
			}
		});
	
		$('#demo-dt-selection2').on( 'click', 'tr', function () {
			if ( $(this).hasClass('selected') ) {
				$(this).removeClass('selected');
			}
			else {
				rowSelection2.$('tr.selected').removeClass('selected');
				$(this).addClass('selected');
			}
		} );
		
		var rowSelection3 = $('#demo-dt-selection3').DataTable({
			"responsive": true,
			"language": {
				"paginate": {
				  "previous": '<i class="fa fa-angle-left"></i>',
				  "next": '<i class="fa fa-angle-right"></i>'
				}
			}
		});
	
		$('#demo-dt-selection3').on( 'click', 'tr', function () {
			if ( $(this).hasClass('selected') ) {
				$(this).removeClass('selected');
			}
			else {
				rowSelection3.$('tr.selected').removeClass('selected');
				$(this).addClass('selected');
			}
		} );
		
		var rowSelection4 = $('#demo-dt-selection4').DataTable({
			"responsive": true,
			"language": {
				"paginate": {
				  "previous": '<i class="fa fa-angle-left"></i>',
				  "next": '<i class="fa fa-angle-right"></i>'
				}
			}
		});
	
		$('#demo-dt-selection4').on( 'click', 'tr', function () {
			if ( $(this).hasClass('selected') ) {
				$(this).removeClass('selected');
			}
			else {
				rowSelection4.$('tr.selected').removeClass('selected');
				$(this).addClass('selected');
			}
		} );
		
		var rowSelection5 = $('#demo-dt-selection5').DataTable({
			"responsive": true,
			"language": {
				"paginate": {
				  "previous": '<i class="fa fa-angle-left"></i>',
				  "next": '<i class="fa fa-angle-right"></i>'
				}
			}
		});
	
		$('#demo-dt-selection5').on( 'click', 'tr', function () {
			if ( $(this).hasClass('selected') ) {
				$(this).removeClass('selected');
			}
			else {
				rowSelection5.$('tr.selected').removeClass('selected');
				$(this).addClass('selected');
			}
		} );
		
		var rowSelection6 = $('#demo-dt-selection6').DataTable({
			"responsive": true,
			"language": {
				"paginate": {
				  "previous": '<i class="fa fa-angle-left"></i>',
				  "next": '<i class="fa fa-angle-right"></i>'
				}
			}
		});
	
		$('#demo-dt-selection6').on( 'click', 'tr', function () {
			if ( $(this).hasClass('selected') ) {
				$(this).removeClass('selected');
			}
			else {
				rowSelection2.$('tr.selected').removeClass('selected');
				$(this).addClass('selected');
			}
		} );
		
	});
	</script>
</body>
</html>

