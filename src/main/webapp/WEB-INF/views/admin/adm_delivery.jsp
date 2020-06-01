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
	<title>TicketFinder - 배송관리</title>


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
					<h1 class="page-header text-overflow">배송 관리</h1>
				</div>
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<!--End page title-->


				<!--Breadcrumb-->
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<ol class="breadcrumb">
					<li><a href="${pageContext.request.contextPath }/main.admin">홈</a></li>
					<li><a href="${pageContext.request.contextPath }/deposit.admin">입금 및 배송 관리</a></li>
					<li class="active">배송 처리</li>
				</ol>
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<!--End breadcrumb-->

				<!--Page content-->
				<!--===================================================-->
				<div id="page-content">
					
					<!-- Row selection and deletion (multiple rows) -->
					<!--===================================================-->
					<div class="panel">
						<div class="panel-heading">
							<h3 class="panel-title">배송 처리</h3>
						</div>
						<div id="demo-custom-toolbar" class="table-toolbar-left">
							<button id="demo-dt-delete-btn" class="btn btn-mint">송장입력</button>
						</div>
						<div class="panel-body">
							<form name="modifyDp" method="post" id="orderForm" action="${pageContext.request.contextPath }/delivery.admin">
							<table id="demo-dt-delete" class="table table-striped table-bordered" cellspacing="0" width="100%">
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
										<th>송장번호</th>
										<th>배송상태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="shipping" items="${ShOrderList }">
									<tr>
										<td><%-- <input type="hidden" value="${shipping.tfOrder.orderCode }" name="orderCode"> --%>${shipping.tfOrder.orderCode }</td>
										<td>${shipping.tfOrder.orderUserName }</td>
										<td>${shipping.tfOrder.orderUserId }</td>
										<td>${shipping.showDetail.showName }</td>
										<td>${fn:substring(shipping.showDetail.showDaytime, 0, 16) }</td>
										<td>${shipping.tfOrder.orderSeat }</td>
										<td>${shipping.tfOrder.orderQty }</td>
										<td><fmt:formatNumber value="${shipping.tfOrder.orderPrice }" pattern="#,###"/>원</td>
										<td>${shipping.tfOrder.orderDpState }</td>
										<td>${shipping.tfOrder.orderPayment }</td>
										<td>${shipping.tfOrder.orderDate }</td>
										<td id="edit-ship">${shipping.tfOrder.orderShippingNum }</td>
										<td>${shipping.tfOrder.orderShState }</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
							</form>
						</div>
					</div>
					<!--===================================================-->
					<!-- End Row selection and deletion (multiple rows) -->
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

	<!-- SETTINGS - DEMO PURPOSE ONLY 삭제 -->
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


	<!--X-editable [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/a_plugins/x-editable/js/bootstrap-editable.min.js"></script>


	<!--Bootstrap Table [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/a_plugins/bootstrap-table/bootstrap-table.min.js"></script>


	<!--Bootstrap Table Extension [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/a_plugins/bootstrap-table/extensions/editable/bootstrap-table-editable.js"></script>


	<!--Demo script [ DEMONSTRATION ]-->
	<script src="${pageContext.request.contextPath }/a_js/demo/nifty-demo.min.js"></script>


	<script src="${pageContext.request.contextPath }/a_plugins/datatables/media/js/jquery.dataTables.js"></script>
	<script src="${pageContext.request.contextPath }/a_plugins/datatables/media/js/dataTables.bootstrap.js"></script>
	<script src="${pageContext.request.contextPath }/a_plugins/datatables/extensions/Responsive/js/dataTables.responsive.min.js"></script>
	
	<script type="text/javascript">
	$(document).ready(function() {
	
		$('#mainnav-menu').children().eq(3).addClass('active-sub').children().eq(1).addClass('in').children().eq(2).addClass('active-link');
		
		var rowDeletion = $('#demo-dt-delete').DataTable({
			"responsive": true,
			"language": {
				"paginate": {
				  "previous": '<i class="fa fa-angle-left"></i>',
				  "next": '<i class="fa fa-angle-right"></i>'
				}
			},
			"dom": '<"toolbar">frtip'
		});
		$('#demo-custom-toolbar').appendTo($("div.toolbar"));
		
		$('#demo-dt-delete tbody').on( 'click', 'tr', function () {
			if(!$(this).hasClass('selected')) {
				$(this).addClass('selected');
				var orval=$(this).children().first().text();
				$(this).prepend('<input type="hidden" value="'+orval+'" name="orderCodeList">');
			} else {
				$(this).removeClass('selected');
				$(this).children().filter('input[type="hidden"]').remove();
			}
			//alert(orval);
			//$(".selected td input[type='hidden']").attr("value", orval);
			//alert($(".selected td input[type='hidden']").attr("value"));
		} );
	
		$('#demo-dt-delete-btn').click(function () {
			//var orderCode=$(".selected td input[type='hidden']").attr('value');
			//alert(orderCode);
			$('#orderForm').submit();
		} );
				
	});
	</script>
</body>
</html>

