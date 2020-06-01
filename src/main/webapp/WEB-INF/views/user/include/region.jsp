<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="region">
	<div id="section">
		<div class="cont">
	        <p class="mainTitle">지역별 공연</p>
	        <div class="region_tab">
	            <a href="#" class="tab1 on" id="tab1" value="">전체</a>
				<a href="#" class="tab2" id="tab2" value="11">서울</a>
				<a href="#" class="tab3" id="tab3" value="41">경기/인천</a>
				<a href="#" class="tab4" id="tab4" value="43">대전/충청도</a>
				<a href="#" class="tab5" id="tab5" value="26">경상/대구/부산</a>
				<a href="#" class="tab6" id="tab6" value="29">전라/광주</a>
				<a href="#" class="tab7" id="tab7" value="50">제주</a>
	        </div>
	
	        <div class="re_search">
	            <div class="re_search_top">
	                <div>
	                    <a class="rankTab1 on">
	                        <span>신상품순</span>
	                    </a>
	                    <a class="rankTab2">
	                        <span>종료임박순</span>
	                    </a>
	                    <a class="rankTab3">
	                        <span>상품명순</span>
	                    </a>
	                </div>
	            </div>
	        </div>
	
	        <div class="re_comment">
	            현재 예매 가능한 공연은 총 <span>89개</span> 입니다.
	        </div>
	
	        <div class="region_list" id="region_list">
	            <div>
	            <c:forEach var="area1" items="${areaList1 }">
	                <a href="${pageContext.request.contextPath}/perform/${area1.tfShow.sCode}">
	                    <div class="list_big">
	                        <img src="${area1.tfShow.sPoster }">
	                        <div class="list_small">
	                            <p class="list_tit1">${area1.tfShow.sGenre} &lt;${area1.tfShow.sName }&gt;</p>
	                            <p class="list_tit2">${fn:substring(area1.tfShow.sSDate,0,10) } ~ ${fn:substring(area1.tfShow.sEDate,0,10) }</p>
	                            <p class="list_tit2">${area1.showDetail.showHallName}</p>
	                        </div>
	                    </div>
	                </a>
	             </c:forEach>
	            </div>
	        </div>
	        
	    </div>
	</div>
<%-- <script src="${pageContext.request.contextPath}/js/region.js"></script> --%>
</div>