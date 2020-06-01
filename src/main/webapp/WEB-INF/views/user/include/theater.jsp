<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="theater">
	<div id="section01">
		<p class="theaterTitle">공연장 목록</p>
	<!-- Swiper -->
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<c:forEach var="fclty" items="${fcltyList }">
				<div class="swiper-slide" id="${fclty.fcCode }">
					<a><img src="${pageContext.request.contextPath}/images/theater/${fclty.fcImg }"><span>${fclty.fcName }</span></a>
				</div>
				</c:forEach>
			</div>
			<div class="swiper-button-next" style="background: url(${pageContext.request.contextPath}/images/theater/slideNext.png) no-repeat;"></div>
			<div class="swiper-button-prev" style="background: url(${pageContext.request.contextPath}/images/theater/slidePrev.png) no-repeat;"></div>
		  </div>
		  
		<!-- Swiper JS -->
		<script src="${pageContext.request.contextPath}/lib/swiper.min.js"></script>
	
		<!-- Initialize Swiper -->
		<script>
			var swiper = new Swiper('.swiper-container', {
			slidesPerView: 3,
			slidesPerView: 'auto',
			slidesPerGroup: 1,
			loop: true,
			centeredSlides: true,
			loopFillGroupWithBlank: true,
			navigation: {
				nextEl: '.swiper-button-next',
				prevEl: '.swiper-button-prev',
			},
			});
		</script>	
	</div>
	<div id="section02">
		<p class="theaterDetailTitle">
			<img src="${pageContext.request.contextPath}/images/theater/map.PNG" style="vertical-align: -5px;">
			${fclty.fcName}
		</p>
		<div class="theaterInfo">
			<div class="theaterTab">
				<span class="tab1 on">예매 가능 공연</span>
				|
				<span class="tab2">약도</span>
			</div>
			<div class="theaterDetail">
				<div class="theaterPlaylist on">
				<c:choose>
					<c:when test="${!empty(fcShowList)}">
					<%-- <c:when test="${fcShowList != null}"> --%>
						<c:forEach var="fcShow" items="${fcShowList }">
							<a><div class="theaterPlay">
								<img src="${fcShow.tfShow.sPoster}">
								<div class="theaterPlayTxt">
									<p>${fcShow.tfShow.sName}</p>
									<p>${fcShow.tfShow.sSDate} ~ ${fcShow.tfShow.sEDate}</p>
								</div>
							</div></a>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div style="display: block; width: 100%; padding: 100px 0">현재 예매 가능한 공연이 없습니다.</div>
					</c:otherwise>
				</c:choose>
				<%-- <c:if test="${fcShowList == null}">
				</c:if>
				<c:forEach var="fcShow" items="${fcShowList }">
					<a><div class="theaterPlay">
						<img src="${fcShow.tfShow.sPoster}">
						<div class="theaterPlayTxt">
							<p>${fcShow.tfShow.sName}</p>
							<p>${fcShow.tfShow.sSDate} ~ ${fcShow.tfShow.sEDate}</p>
						</div>
					</div></a>
				</c:forEach>	 --%>
				</div>
				<div class="theaterMap">
					<div class="theaterDInfo">
						<div class="theaterTel">전화번호 : ${fclty.fcTel}</div>
						<div class="theaterUrl">홈페이지 : <a href="${fclty.fcUrl}">${fclty.fcUrl}</a></div>
					</div>
					<div id="map" style="height: 400px; width:70%; margin: 0 auto; margin-bottom: 100px"></div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	$('.tab1').click(function(){
		$('.theaterMap').removeClass('on');
		$('.theaterPlaylist').addClass('on');
		$('.tab2').removeClass('on');
		$('.tab1').addClass('on');
	});
	$('.tab2').click(function(){
		$('.theaterPlaylist').removeClass('on');
		$('.theaterMap').addClass('on');
		$('.tab1').removeClass('on');
		$('.tab2').addClass('on');
	});
	
	$('.theaterPlaylist').children('a').mouseenter(function() {
		$(this).find('.theaterPlayTxt').addClass('on');
	});
	
	$(".theaterPlaylist").children('a').mouseleave(function(){
		$(this).find('.theaterPlayTxt').removeClass('on');
	}); 

	$('.swiper-slide').click(function() {
		var fcCode=$(this).attr('id');
		location.href='${pageContext.request.contextPath}/theater?fcCode='+fcCode;
	});
	
	</script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2c3adfbd4c9359122e113ffbf3da9318"></script>
	<script type="text/javascript">
	var fcLa = '<c:out value="${fclty.fcLa}"/>';
	var fcLo = '<c:out value="${fclty.fcLo}"/>';
	var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
		mapOption = { 
			center: new kakao.maps.LatLng(fcLa, fcLo), // 지도의 중심좌표
			level: 3 // 지도의 확대 레벨
		};
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(fcLa, fcLo); 
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
		position: markerPosition
	});
	
	var center = new kakao.maps.LatLng(fcLa, fcLo);
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
	// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
	// marker.setMap(null); 
	
	//setTimeout(function(){ map.relayout(); }, 1000);
	var position = map.getCenter();
	
	$('.tab2').click(function() {
		$(window).trigger('resize');
		setTimeout(function(){ 
			map.relayout();
			map.setCenter(center);
		}, 0);
	});
	</script>
</div>