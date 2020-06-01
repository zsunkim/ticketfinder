<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
			<nav id="mainnav-container">
				<div id="mainnav">
					<!--Menu-->
					<!--================================-->
					<div id="mainnav-menu-wrap">
						<div class="nano">
							<div class="nano-content">
								<ul id="mainnav-menu" class="list-group">
						
									<!--Category name-->
									<li class="list-header">메뉴</li>
						
									<!-- 굵은 글씨로 활성화 시키고 싶으면 li class에 "active-sub" 추가 -->
									<!-- 서브 메뉴를 활성화 시키고 싶으면 ul class에 "in" 추가 -->
									<!-- 왼쪽 파란줄을 활성화 시키고 싶으면 li class에 "active-link" 추가 -->
						
									<!-- 회원 관리 메뉴 -->
									<li>
										<a href="#">
											<i class="fa fa-users"></i>
											<span class="menu-title">회원 관리</span>
											<i class="arrow"></i>
										</a>
						
										<!--Submenu-->
										<ul class="collapse">
											<li><a href="${pageContext.request.contextPath }/userlist.admin">회원 목록</a></li>
											<li><a href="${pageContext.request.contextPath }/usermanage.admin">휴면회원 관리</a></li>
										</ul>
									</li>
									
									<!-- 공연 관리 메뉴 -->
									<li>
										<a href="${pageContext.request.contextPath }/show.admin">
											<i class="fa fa-video-camera"></i>
											<span class="menu-title">공연 관리</span>
										</a>
									</li>
									
									<!-- 입금 및 배송 관리 메뉴 -->
									<li>
										<a href="#">
											<i class="fa fa-truck"></i>
											<span class="menu-title">입금 및 배송 관리</span>
											<i class="arrow"></i>
										</a>
						
										<!--Submenu-->
										<ul class="collapse">
											<li><a href="${pageContext.request.contextPath }/deposit.admin">입금 처리</a></li>
											<li><a href="${pageContext.request.contextPath }/depositCancel.admin">미입금 주문취소</a></li>
											<li><a href="${pageContext.request.contextPath }/delivery.admin">배송 관리</a></li>
										</ul>
									</li>
									
									<!-- 티켓 및 취소/환불 메뉴 -->
									<li>
										<a href="#">
											<i class="fa fa-krw"></i>
											<span class="menu-title">주문 및 취소/환불</span>
											<i class="arrow"></i>
										</a>
						
										<!--Submenu-->
										<ul class="collapse">
											<li><a href="${pageContext.request.contextPath }/ticketing.admin">티켓 발권</a></li>
											<li><a href="${pageContext.request.contextPath }/order.admin">주문 관리</a></li>
											<li class="list-divider"></li>
											<li><a href="${pageContext.request.contextPath }/refund.admin">취소 / 환불</a></li>
										</ul>
									</li>
									
									<!-- 통계 및 매출 메뉴 -->
									<li>
										<a href="#">
											<i class="fa fa-bar-chart"></i>
											<span class="menu-title">통계 및 매출</span>
											<i class="arrow"></i>
										</a>
						
										<!--Submenu-->
										<ul class="collapse">
											<li><a href="${pageContext.request.contextPath }/sttsshow.admin">공연 통계</a></li>
											<li><a href="${pageContext.request.contextPath }/sttstheater.admin">극장 통계</a></li>
											<li><a href="${pageContext.request.contextPath }/sttsticket.admin">티켓 발권현황</a></li>
											<li><a href="${pageContext.request.contextPath }/sttssales.admin">매출 집계</a></li>
										</ul>
									</li>
									
									<!-- 후기 관리 메뉴(링크) -->
									<li>
										<a href="${pageContext.request.contextPath }/review.admin">
											<i class="fa fa-comments"></i>
											<span class="menu-title">
												후기 관리
												<!-- <span class="pull-right badge badge-purple">99+</span> -->
											</span>
										</a>
									</li>
									
									<!-- 문의 관리 메뉴 -->
									<li>
										<a href="#">
											<i class="fa fa-tag"></i>
											<span class="menu-title">
												문의 관리
												<!-- <span class="pull-right badge badge-success">5</span> -->
											</span>
											<i class="arrow"></i>
										</a>
						
										<!--Submenu-->
										<ul class="collapse">
											<li><a href="${pageContext.request.contextPath }/question.admin">1:1 문의</a></li>
											<li class="list-divider"></li>
											<li><a href="${pageContext.request.contextPath }/faqlist.admin">FAQ</a></li>
										</ul>
									</li>
								</ul>


							</div>
						</div>
					</div>
					<!--================================-->
					<!--End menu-->
				</div>
			</nav>