<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>TicketFinder - Admin</title>


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

    <!--FooTable [ OPTIONAL ]-->
    <link href="${pageContext.request.contextPath }/a_plugins/fooTable/css/footable.core.css" rel="stylesheet">	


	<!--SCRIPT-->
	<!--=================================================-->

	<!--Page Load Progress Bar [ OPTIONAL ]-->
    <link href="${pageContext.request.contextPath }/a_plugins/pace/pace.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/a_plugins/pace/pace.min.js"></script>
</head>
<body>
	<div id="container" class="effect aside-float aside-bright mainnav-lg">
		
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
					<h1 class="page-header text-overflow">후기 관리</h1>
				</div>
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<!--End page title-->


				<!--Breadcrumb-->
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<ol class="breadcrumb">
					<li><a href="${pageContext.request.contextPath }/main.admin">홈</a></li>
					<li class="active">후기 관리</li>
				</ol>
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<!--End breadcrumb-->


		

				<!--Page content-->
				<!--===================================================-->
				<div id="page-content">
					<div class="row">
						<div class="panel">
							<div class="panel-heading">
								<h3 class="panel-title">후기 관리</h3>
							</div>
						
							<!-- Foo Table - Add & Remove Rows -->
							<!--===================================================-->
							<div class="panel-body">
								<table id="foo-addrow" class="table table-bordered table-hover toggle-arrow-tiny default" data-page-size="7">
									<thead>
										<tr>
											<th data-sort-ignore="true" class="min-width"></th>
											<th data-toggle="true">아이디</th>
											<th>평점</th>
											<th data-sort-initial="descending">작성일</th>
											<th data-hide="phone, tablet">공연명</th>
											<th data-hide="phone, tablet">관람일</th>
											<th data-hide="phone, tablet">내용</th>
										</tr>
									</thead>
									<div class="pad-btm form-inline">
										<div class="row">
											<div class="col-sm-12 text-xs-center text-right">
												<div class="form-group">
													<input id="input-search2" type="text" placeholder="Search" class="form-control" autocomplete="off">
												</div>
											</div>
										</div>
									</div>
									<tbody>
										<c:forEach var="reviewSd" items="${reviewSdList }">
										<tr>
											<td><button class="delete-row btn btn-danger btn-xs btn-icon fa fa-times" data-num="${reviewSd.review.reviewNum }"></button></td>
											<td>${reviewSd.review.reviewUserId }</td>
											<td>${reviewSd.review.reviewGrade }</td>
											<td>${fn:substring(reviewSd.review.reviewDate,0,10) }</td>
											<td>${reviewSd.showDetail.showName }</td>
											<td>${fn:substring(reviewSd.review.reviewViewDate,0,10) }</td>
											<td>${reviewSd.review.reviewContents }</td>
										</tr>
										</c:forEach>
									</tbody>
									<tfoot>
										<tr>
											<td colspan="7">
												<div class="text-right">
													<ul class="pagination"></ul>
												</div>
											</td>
										</tr>
									</tfoot>
								</table>
							</div>
							<!--===================================================-->
							<!-- End Foo Table - Add & Remove Rows -->
						
						</div>
					</div>
					
				</div>
			</div>
			<!--===================================================-->
			<!--END CONTENT CONTAINER-->


			
			<!--MAIN NAVIGATION-->
			<!--===================================================-->
			<%@include file="adm_nav.jsp" %>
			<!--===================================================-->
			<!--END MAIN NAVIGATION-->
			
			<!--ASIDE 삭제함-->
			<!--===================================================-->
			<!--===================================================-->
			<!--END ASIDE-->

		</div>

		<div id="preview-alert-1" class="preview-alert" style="display:none;">
			<div class="alert alert-success media fade in">
				<strong>1개</strong> 행을 삭제했습니다.
			</div>
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
            <div class="hide-fixed pull-right pad-rgt">Currently v1.0.0</div>



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
	
	<!--FooTable [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/a_plugins/fooTable/dist/footable.all.min.js"></script>
	
	<script type="text/javascript">
	$(window).on('load', function() {
		$('#mainnav-menu').children().eq(6).addClass('active-link');
		
		// Add & Remove Row
		// -----------------------------------------------------------------
		var addrow = $('#foo-addrow');
		addrow.footable().on('click', '.delete-row', function() {

			//get the footable object
			var footable = addrow.data('footable');

			//get the row we are wanting to delete
			var row = $(this).parents('tr:first');

			var removeNum=$('.delete-row').attr('data-num');
			
			if(confirm("삭제하시겠습니까?")) {
				remove(removeNum);
				
				//delete the row
				footable.removeRow(row);
				removeAlert();
			}
		});

		// Search input
		$('#input-search2').on('input', function (e) {
			e.preventDefault();
			addrow.trigger('footable_filter', {filter: $(this).val()});
		});
		
		
		var dataAlert = [{
				type : "info"
			},{
				type : "primary"
			},{
				type : "success"
			},{
				type : "warning"
			},{
				type : "danger"
			},{
				type : "mint"
			},{
				type : "purple"
			},{
				type : "pink"
			},{
				type : "dark"
			}
		],
		alertContent = $('#preview-alert-1').find('.alert').html(),
		autoClose = true;
		
		function removeAlert() {
			dataNum = nifty.randomInt(0,8);
			contentHTML = alertContent.replace("btn-danger", "btn-"+dataAlert[dataNum].type);
	
			$.niftyNoty({
				type: dataAlert[dataNum].type,
				container : 'floating',
				html : contentHTML,
				timer : autoClose ? 3000 : 0
			});
		};
	});
	
	
	function remove(reviewNum) {
		$.ajax({
			type: "get",
			url: "reviewRemove.admin/"+reviewNum,
			async: true,
			dataType: "text",
			success: function(data) {
				
			},
			error: function(xhr) {
				alert("에러 코드 = " + xhr.status);
			}
		});
	};
	</script>
</body>
</html>