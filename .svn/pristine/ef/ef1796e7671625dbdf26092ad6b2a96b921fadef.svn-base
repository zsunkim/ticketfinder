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
	<title>TicketFinder - 주문관리</title>


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


    <!--Bootstrap Table [ OPTIONAL ]-->
    <link href="${pageContext.request.contextPath }/a_plugins/datatables/media/css/dataTables.bootstrap.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/a_plugins/datatables/extensions/Responsive/css/dataTables.responsive.css" rel="stylesheet">


    <!--Demo [ DEMONSTRATION ]-->
    <link href="${pageContext.request.contextPath }/a_css/demo/nifty-demo.min.css" rel="stylesheet">


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
					<h1 class="page-header text-overflow">주문관리</h1>
				</div>
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<!--End page title-->
				
				
				<!--Breadcrumb-->
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<ol class="breadcrumb">
					<li><a href="${pageContext.request.contextPath }/main.admin">홈</a></li>
					<li><a href="${pageContext.request.contextPath }/ticketing.admin">주문 및 취소/환불</a></li>
					<li class="active">주문 목록</li>
				</ol>
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<!--End breadcrumb-->
				

				<!--Page content-->
				<!--===================================================-->
				<div id="page-content">
					
					
					<!-- Row selection (single row) -->
					<!--===================================================-->
					<div class="panel">
						<div class="panel-heading">
							<h3 class="panel-title">주문목록</h3>
						</div>
						<div class="panel-body">
							<table id="demo-dt-selection" class="table table-striped table-bordered" cellspacing="0" width="100%">
								<thead>
									<tr>
										<th>주문번호</th>
										<th>주문자</th>
										<th>아이디</th>
										<th>공연명</th>
										<th>관람일시</th>
										<th>선택좌석</th>
										<th>매수</th>
										<th>주문금액</th>
										<th>입금상태</th>
										<th>결제방법</th>
										<th>주문날짜</th>
										<th>배송상태</th>
										<th>송장번호</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="order" items="${orderList }">
									<tr>
										<td>${order.tfOrder.orderCode }</td>
										<td>${order.tfOrder.orderUserName }</td>
										<td>${order.tfOrder.orderUserId }</td>
										<td>${order.showDetail.showName }</td>
										<td>${fn:substring(order.showDetail.showDaytime, 0, 16) }</td>
										<td>${order.tfOrder.orderSeat }</td>
										<td>${order.tfOrder.orderQty }</td>
										<td><fmt:formatNumber value="${order.tfOrder.orderPrice }" pattern="#,###"/>원</td>
										<td>${order.tfOrder.orderDpState }</td>
										<td>${order.tfOrder.orderPayment }</td>
										<td>${order.tfOrder.orderDate }</td>
										<td>${order.tfOrder.orderShState }</td>
										<td>${order.tfOrder.orderShippingNum }</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<!--===================================================-->
					<!-- End Row selection (single row) -->
									
					
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

            <p class="pad-lft">&#0169; 2020 Ticket Finder</p>



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


	
	
	<!-- SETTINGS - 삭제 -->
	<!--===================================================-->
	<!--===================================================-->
	<!-- END SETTINGS -->
	
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
	$('#mainnav-menu').children().eq(4).addClass('active-sub').children().eq(1).addClass('in').children().eq(1).addClass('active-link');
	</script>
</body>
</html>

