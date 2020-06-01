<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

	<!--Bootstrap Select [ OPTIONAL ]-->
    <link href="${pageContext.request.contextPath }/a_plugins/bootstrap-select/bootstrap-select.min.css" rel="stylesheet">
    
    <!--Bootstrap Datepicker [ OPTIONAL ]-->
    <link href="${pageContext.request.contextPath }/a_plugins/bootstrap-datepicker/bootstrap-datepicker.css" rel="stylesheet">
    
    <link href="${pageContext.request.contextPath }/css/book.css" rel="stylesheet">
	<!--SCRIPT-->
	<!--=================================================-->

	<!--Page Load Progress Bar [ OPTIONAL ]-->
    <link href="${pageContext.request.contextPath }/a_plugins/pace/pace.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/a_plugins/pace/pace.min.js"></script>
<style type="text/css">
#container #foo-filtering tbody tr.selected {background-color: #f2f5ca;}
</style>
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
					<h1 class="page-header text-overflow">공연 통계</h1>
				</div>
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<!--End page title-->


				<!--Breadcrumb-->
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<ol class="breadcrumb">
					<li><a href="${pageContext.request.contextPath }/main.admin">홈</a></li>
					<li><a href="${pageContext.request.contextPath }/sttsshow.admin">통계 및 매출</a></li>
					<li class="active">공연 통계</li>
				</ol>
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<!--End breadcrumb-->


		

				<!--Page content-->
				<!--===================================================-->
				<div id="page-content">
					<div class="row">
					
						<div class="col-lg-12">
						
							<!--Default Tabs (Left Aligned)-->
							<!--===================================================-->
							<div class="tab-base">
					
								<!--Nav Tabs-->
								<ul class="nav nav-tabs">
									<li class="active">
										<a data-toggle="tab" href="#lft-tab-1">판매 현황</a>
									</li>
									<li>
										<a data-toggle="tab" href="#lft-tab-2">좌석 현황</a>
									</li>
								</ul>
					
								<!--Tabs Content-->
								<div class="tab-content">
									<div id="lft-tab-1" class="tab-pane fade active in">
										<!-- Foo Table - Filtering -->
										<!--===================================================-->
										<div class="panel-body">
											<table id="foo-filtering" class="table table-bordered table-hover toggle-circle" data-page-size="5">
												<thead>
													<tr>
														<th>공연명</th>
														<th>관람회차</th>
														<th>좌석등급</th>
														<th>배정석</th>
														<th>잔여석</th>
														<th>점유율</th>
														<th>단가</th>
														<th>판매매수</th>
														<th>판매금액</th>
													</tr>
												</thead>
												<div class="pad-btm form-inline">
													<div class="row">
														<div class="col-sm-8 text-xs-center">
															<div class="form-group" style="display: block;">
																<label class="control-label">공연명</label>
																<!-- Bootstrap Select with Search Input -->
																<!--===================================================-->
																<select id="foo-filter-status" class="form-control selectpicker" data-live-search="true" data-width="25%">
																	<option></option>
																	<c:forEach var="tfShow" items="${tfShowList }">
																		<option>${tfShow.sName }</option>
																	</c:forEach>
																</select>
																<!--===================================================-->
																
																<!--Bootstrap Datepicker : Range-->
																<!--===================================================-->
																<div id="dp-range" style="display: inline-block;">
																	<div class="input-daterange input-group" id="datepicker">
																		<input type="text" class="form-control" name="startDate" autocomplete="off" id="startDate"/>
																		<span class="input-group-addon">to</span>
																		<input type="text" class="form-control" name="endDate" autocomplete="off" id="endDate"/>
																	</div>
																</div>
																<button class="panel-ref-btn btn btn-default" data-target="#page-content" data-toggle="panel-overlay">
																	<i class="fa fa-rotate-right fa-fw"></i> Refresh
																</button>
																<!--===================================================-->
															</div>
														</div>
														<div class="col-sm-4 text-xs-center text-right">
															<div class="form-group">
																<input id="foo-search" type="text" placeholder="Search" class="form-control" autocomplete="off">
															</div>
														</div>
													</div>
												</div>
												<tbody>
													<c:choose>
														<c:when test="${!empty(showOrder) }">
															<c:forEach var="so" items="${showOrder }">
															<tr>
																<td>${so.showDetail.showName }</td>
																<td>${fn:substring(so.showDetail.showDaytime,0,16) }</td>
																<td><span class="label label-table label-success">${so.tfOrder.orderGrade }</span></td>
																<td>${so.fcltyHall.hallSeatCnt }석</td>
																<c:set var="seat" value="0" />
																<c:forEach var="i" begin="0" end="${fn:length(so.showDetail.showSeat) }" step="1">
																	<c:if test="${fn:substring(so.showDetail.showSeat,i,i+1) eq '2'}">
																		<c:set var="seat" value="${seat+1 }" />
																	</c:if>
																</c:forEach>
																<td>${so.fcltyHall.hallSeatCnt-seat }석</td>
																<td>${so.showDetail.showRate }%</td>
																<td>
																	<fmt:formatNumber value="${so.tfOrder.orderPrice/so.tfOrder.orderQty }" type="number" maxFractionDigits="3"/>원
																</td>
																<td>${so.tfOrder.orderQty }</td>
																<td>
																	<fmt:formatNumber value="${so.tfOrder.orderPrice }" type="number" maxFractionDigits="3"/>원
																</td>
															</tr>
															</c:forEach>
														</c:when>
														<c:otherwise>
															<tr>
																<td colspan="9">조회 결과가 없습니다.</td>
															</tr>
														</c:otherwise>
													</c:choose>
												</tbody>
												<tfoot>
													<tr>
														<td colspan="9">
															<div class="text-right">
																<ul class="pagination"></ul>
															</div>
														</td>
													</tr>
												</tfoot>
											</table>
										</div>
										
										
										<div class="panel-body">
											<table id="foo-filtering2" class="table table-bordered table-hover toggle-circle" data-page-size="3">
												<thead>
													<tr>
														<th data-sort-ignore="true">주문자</th>
														<th data-sort-ignore="true">주문번호</th>
														<th data-sort-ignore="true">주문일</th>
														<th data-sort-ignore="true">매수</th>
														<th data-sort-ignore="true">금액</th>
														<th data-sort-ignore="true">결제수단</th>
													</tr>
												</thead>
												<div class="pad-btm form-inline">
													<div class="row">
														<div class="col-sm-12 text-xs-center text-right">
															<div class="form-group">
																<input id="foo-search2" type="text" placeholder="Search" class="form-control" autocomplete="off">
															</div>
														</div>
													</div>
												</div>
												<tbody>
												</tbody>
											</table>
										</div>
										<!--===================================================-->
										<!-- End Foo Table - Filtering -->
									</div>
									
									
									
									<div id="lft-tab-2" class="tab-pane fade">
										<div class="panel-body">
											<div class="pad-btm form-inline">
												<div class="row">
													<div class="col-lg-12">
														<div class="form-group" style="display: block;" id="form-group2">
															<label class="control-label">공연명</label>
															<!-- Bootstrap Select with Search Input -->
															<!--===================================================-->
															<select id="foo-filter-status2" class="form-control selectpicker" data-width="25%">
																<option></option>
																<c:forEach var="one" items="${selectOne }">
																	<option value="${one.tfShow.sCode }">${one.tfShow.sName }</option>
																</c:forEach>
															</select>
															<select id="foo-filter-status3" class="form-control" style="width: 180px;display: inline-block;">
															</select>
														</div>
													</div>
												</div>
											</div>
											<div class="row" id="seat" style="width:100%;">
												<div class="col-lg-8">
												</div>
												<div class="col-lg-4">
												</div>
											</div>
										</div>
									</div>
								</div>
								
								
								
								
							</div>
							<!--===================================================-->
							<!--End Default Tabs (Left Aligned)-->
							
							
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
	
	<!--Bootstrap Select [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/a_plugins/bootstrap-select/bootstrap-select.min.js"></script>
	
	<!--Bootstrap Datepicker [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/a_plugins/bootstrap-datepicker/bootstrap-datepicker.js"></script>
	
	<script type="text/javascript">
	$(window).on('load', function() {
		$('#mainnav-menu').children().eq(5).addClass('active-sub').children().eq(1).addClass('in').children().eq(0).addClass('active-link');
		
		
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
		
		$('#dp-range .input-daterange').datepicker({
			format: "yyyy/mm/dd",
			todayBtn: "linked",
			autoclose: true,
			todayHighlight: true
		});
		
		$('.panel-ref-btn').niftyOverlay().on('click', function(){
			var $el = $(this), relTime;
			$el.niftyOverlay('show');

			// Do something...
			//location.reload();
			location.href="${pageContext.request.contextPath }/sttsshow.admin";

			relTime = setInterval(function(){
				// Hide the screen overlay
				$el.niftyOverlay('hide');

				clearInterval(relTime);
			},2000);
		});
		
		
		var filtering2 = $('#foo-filtering2');
		filtering2.footable().on('footable_filtering', function (e) {
			e.clear = !e.filter;
		});
		// Search input
		$('#foo-search2').on('input', function (e) {
			e.preventDefault();
			filtering2.trigger('footable_filter', {filter: $(this).val()});
		});
		
	});
	
	$('#foo-filtering tbody').on('click', 'tr', function () {
		var tr=$('#foo-filtering tbody tr');
		if(!tr.hasClass('selected')) {
			$(this).addClass('selected');
			var valt=$(this).children().first().text();
			console.log(valt);
			showChoice(valt);
		} else if($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			tr.removeClass('selected');
			$(this).addClass('selected');
			var valt=$(this).children().first().text();
			console.log(valt);
			showChoice(valt);
		}
	});
	
	$('#startDate').change(function(){
		var sd=$('#startDate').val();
		var ed=$('#endDate').val();
		if(sd.length==10 && ed.length==10) {
			if(dateCal(sd).getTime() <= dateCal(ed).getTime()) {
				dateSelect(sd, ed);
			}
		}
	});
	
	$('#endDate').change(function(){
		var sd=$('#startDate').val();
		var ed=$('#endDate').val();
		if(sd.length==10 && ed.length==10) {
			if(dateCal(sd).getTime() <= dateCal(ed).getTime()) {
				dateSelect(sd, ed);
			}
		}
	});
	
	$('#foo-filter-status2').change(function(){
		var showCode=$('#foo-filter-status2 option:selected').val();
		selectTwo(showCode);
	});
	
	$('#foo-filter-status3').change(function(){
		var showNum=$('#foo-filter-status3 option:selected').val();
		//console.log(showNum);
		$.getJSON('${pageContext.request.contextPath}/showseatdraw.admin/'+showNum, function(data) {
			//console.log(data);
			$(".col-lg-8").children().remove();
			$.each(data, function(indexY, line) {
				var $line = $('<div></div>').addClass('line');
				$.each(line, function(indexX, seat) {
					var $output = $('<div></div>', {
						'class' : 'seat',
						'data-y' : indexY,
						'data-x' : indexX
					}).appendTo($line);

					if (seat == 1) {
						$output.addClass('enable')
					} else if (seat == 2) {
						$output.addClass('booked');
					}else if(seat == 0){
						$output.addClass('empty');
					}
				});
				$line.appendTo('.col-lg-8');
			});
			
			var w=$(".col-lg-8").width();
			init(w);
		});
		showSeatInfo(showNum);
	});
	
	function dateCal(inputVal) {
		var year = inputVal.substring(0,4);
		var month = inputVal.substring(5,7);
		var day = inputVal.substring(8,10);
		var date = new Date();
		date.setFullYear(year, month-1, day); // 실제 사용하는 월에서 1을 빼고 셋팅을 해줘야 한다. Date 객체에서는 월의 값으로 0부터 11을 사용한다.
		return date;
	}
	
	function dateSelect(startDate, endDate) {
		$.ajax({
			type: "get",
			url: "showdate.admin?startDate="+startDate+"&endDate="+endDate,
			dataType: "json",
			success: function(json) {
				$("#foo-filtering tbody tr").remove();
				if(json.length==0){
	                var html='';
					html+='<tr style="display: table-row;" class="footable-even"><td colspan="9">조회 결과가 없습니다.</td></tr>';
					$('#foo-filtering tbody').append(html);
				}
				var i=1;
				$(json).each(function(){
					var htmlO='';
					if(i%2==1) htmlO+='<tr class="footable-even" style="display: table-row;">';
					if(i%2==0) htmlO+='<tr class="footable-odd" style="display: table-row;">';
					htmlO+='<td>'+this.showDetail.showName+'</td>';
					htmlO+='<td>'+this.showDetail.showDaytime.substring(0,16)+'</td>';
					htmlO+='<td><span class="label label-table label-success">'+this.tfOrder.orderGrade+'</span></td>';
					htmlO+='<td>'+this.fcltyHall.hallSeatCnt+'</td>';
					htmlO+='<div>잔여석 : '+(this.fcltyHall.hallSeatCnt-residual(this.showDetail.showSeat))+'</div>';
					htmlO+='<td>'+this.showDetail.showRate+'</td>';
					htmlO+='<td>'+(this.tfOrder.orderPrice/this.tfOrder.orderQty).toLocaleString()+'</td>';
					htmlO+='<td>'+this.tfOrder.orderQty+'</td>';
					htmlO+='<td>'+this.tfOrder.orderPrice.toLocaleString()+'</td>';
					htmlO+='</tr>';
					
					$('#foo-filtering tbody').append(htmlO);
				});
			},
			error: function(xhr) {
				alert("에러 코드 = " + xhr.status);
			}
		});
	}
	
	function showChoice(valt) {
		$.ajax({
			type: "get",
			url: "showchoice.admin?valt="+valt,
			dataType: "json",
			contentType: "charset=utf-8",
			success: function(json) {
				$("#foo-filtering2 tbody tr").remove();
				if(json.length==0){
					html='<tr style="display: table-row;" class="footable-even"><td colspan="6">조회 결과가 없습니다.</td></tr>';
					$('#foo-filtering2 tbody').append(html);
				}
				var i=1;
				$(json).each(function(){
					var htmlO='';
					if(i%2==1) htmlO+='<tr class="footable-even" style="display: table-row;">';
					if(i%2==0) htmlO+='<tr class="footable-odd" style="display: table-row;">';
					htmlO+='<td>'+this.tfOrder.orderUserId+'</td>';
					htmlO+='<td>'+this.tfOrder.orderCode+'</td>';
					htmlO+='<td>'+this.tfOrder.orderDate.substring(0,10)+'</td>';
					htmlO+='<td>'+this.tfOrder.orderQty+'</td>';
					htmlO+='<td>'+this.tfOrder.orderPrice.toLocaleString()+'원</td>';
					htmlO+='<td>'+this.tfOrder.orderPayment+'</td>';
					htmlO+='</tr>';
					
					$('#foo-filtering2 tbody').append(htmlO);
				});
			},
			error: function(xhr) {
				alert("에러 코드 = " + xhr.status);
			}
		});
	}
	
	function selectTwo(showCode) {
		$.ajax({
			type: "get",
			url: "selecttwo.admin?showCode="+showCode,
			dataType: "json",
			contentType: "charset=utf-8",
			success: function(json) {
				$("#foo-filter-status3 option").remove();
				if(json.length==0){
					html='<option></option>';
					$('#foo-filter-status3').append(html);
				} else {
					htmlO='<option>Nothing Selected</option>';
					$(json).each(function(){
						htmlO+='<option value="'+this.showDetail.showNum+'">'+this.showDetail.showDaytime+'</option>';
					});
					$('#foo-filter-status3').append(htmlO);
				}
			},
			error: function(xhr) {
				alert("에러 코드 = " + xhr.status);
			}
		});
	}
	
	function residual(seat) {
		var bookedSeat=0;
		for(var i=0; i<seat.length; i++) {
			var str=seat.substring(i, i+1);
			if(str=="2") {
				bookedSeat++;
			}
		}
		return Number.parseInt(bookedSeat); 
	}
	
	function init(width){
		var w=Math.floor((width/$(".line:first-child>div").length)-2);
		var h=w;
		$(".seat").css({"width":w, "height":h});
	}

	function showSeatInfo(showNum) {
		$.ajax({
			type: "get",
			url: "showseatinfo.admin?showNum="+showNum,
			dataType: "json",
			success: function(json) {
				$(".col-lg-4").children().remove();
				if(json.length==0){
					html='<div class="text-center text-bold" style="font-size:20px;color:red;">좌석 정보가 없습니다.</div>';
					$('.col-lg-4').append(html);
				} else {
					htmlO='<div class="text-left text-bold" style="font-size:20px;">';
					$(json).each(function(){
						htmlO+='<div>총 좌석 : '+this.fcltyHall.hallSeatCnt+'석</div>';
						htmlO+='<div>잔여석 : '+(this.fcltyHall.hallSeatCnt-residual(this.showDetail.showSeat))+'석</div>';
						htmlO+='<div>판매석 : '+residual(this.showDetail.showSeat)+'석</div>';
						htmlO+='<div>점유율 : '+this.showDetail.showRate+'%</div>';
						htmlO+='<div>공연장 : '+this.fcltyHall.hallName+'</div>';
					});
					htmlO+='</div>';
					$('.col-lg-4').append(htmlO);
				}
			},
			error: function(xhr) {
				alert("에러 코드 = " + xhr.status);
			}
		});
	}
	
	
	</script>
</body>
</html>