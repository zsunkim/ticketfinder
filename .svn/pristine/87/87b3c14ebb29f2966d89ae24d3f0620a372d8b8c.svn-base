<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					<h1 class="page-header text-overflow">1:1 문의</h1>
				</div>
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<!--End page title-->


				<!--Breadcrumb-->
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<ol class="breadcrumb">
					<li><a href="${pageContext.request.contextPath }/main.admin">홈</a></li>
					<li><a href="${pageContext.request.contextPath }/question.admin">문의 관리</a></li>
					<li class="active">1:1 문의</li>
				</ol>
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<!--End breadcrumb-->


		

				<!--Page content-->
				<!--===================================================-->
				<div id="page-content">
					<div class="row">
						<div class="panel">
							<div class="panel-heading">
								<h3 class="panel-title">1:1 문의</h3>
							</div>
						
							<!-- Foo Table - Add & Remove Rows -->
							<!--===================================================-->
							<div class="panel-body">
								<table id="foo-filtering" class="table table-bordered table-hover toggle-arrow-tiny default" data-page-size="7">
									<thead>
										<tr>
											<th data-sort-initial="descending" data-toggle="true">작성일</th>
											<th>문의명</th>
											<th>문의자</th>
											<th>문의종류</th>
											<th>답변상태</th>
											<th data-hide="phone, tablet">문의내용</th>
											<th data-hide="phone, tablet">답변</th>
										</tr>
									</thead>
									<div class="pad-btm form-inline">
										<div class="row">
											<div class="col-sm-6 text-xs-center">
												<div class="form-group">
													<label class="control-label">답변상태</label>
													<select id="foo-filter-status" class="form-control">
														<option value="">전체</option>
														<option value="답변 미등록">답변 미등록</option>
														<option value="답변 완료">답변 완료</option>
													</select>
												</div>
											</div>
											<div class="col-sm-6 text-xs-center text-right">
												<div class="form-group">
													<input id="foo-search" type="text" placeholder="Search" class="form-control" autocomplete="off">
												</div>
											</div>
										</div>
									</div>
									<tbody>
										<c:forEach var="question" items="${questionList}">
										<c:if test="${question.questionState eq '답변미등록'}">
											<tr>
												<td>${question.questionDate}</td>
												<td>${question.questionTitle}</td>
												<td>${question.questionUserId}</td>
												<td>${question.questionCategory}</td>
												<td><span class="label label-table label-dark">${question.questionState}</span></td>
												<td>${question.questionContents}</td>
												<td><button class="btn btn-success btn-default btn-icon icon-lg fa fa-envelope" data-num="${question.questionNum }"></button><br>답변하기</td>
											</tr>
										</c:if>
										<c:if test="${question.questionState eq '답변완료'}">
											<tr>
												<td>${question.questionDate}</td>
												<td>${question.questionTitle}</td>
												<td>${question.questionUserId}</td>
												<td>${question.questionCategory}</td>
												<td><span class="label label-table label-success">${question.questionState}</span></td>
												<td>${question.questionContents}</td>
												<td>${question.questionContentsRe }</td>
											</tr>
										</c:if>
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
		$('#mainnav-menu').children().eq(7).addClass('active-sub').children().eq(1).addClass('in').children().eq(0).addClass('active-link');
		
		var filtering = $('#foo-filtering');
		filtering.footable().on('footable_filtering', function (e) {
			var selected = $('#foo-filter-status').find(':selected').val();
			e.filter += (e.filter && e.filter.length > 0) ? ' ' + selected : selected;
			e.clear = !e.filter;
		});

		// Filter status
		$('#foo-filter-status').change(function (e) {
			e.preventDefault();
			filtering.trigger('footable_filter', {filter: $(this).val()});
		});

		// Search input
		$('#foo-search').on('input', function (e) {
			e.preventDefault();
			filtering.trigger('footable_filter', {filter: $(this).val()});
		});
		
		
		$('.fa-envelope').click(function() {
			location.href="${pageContext.request.contextPath }/questionreply.admin?num="+$(this).attr('data-num');
		});
	});
	</script>
</body>
</html>