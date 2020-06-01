<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="search">
    <div id="section1">
        <div class="search_top">
            <p><span>${search}</span>에 대한 검색 결과입니다.</p>
            <div class="searchBox">
            	<form action="${pageContext.request.contextPath}/search" method="post" name="f">
	                <input type="text" id="srchText" name="search">
	                <a href="#" type="submit" class="searchBtn1"><img src="images/search/search.png"></a>
	                <!-- <button type="submit" style="display: none;"></button> -->
	                <!-- <a href="#" class="searchBtn2" id="srchReBtn">결과 내 재검색</a> -->
	            </form>
            </div>
            <script type="text/javascript">
            $(".searchBtn1").click(function() {
				f.submit();
			});
            </script>
        </div>
    </div>
    <div id="section2">
        <div>
            <div class="search_list">
                <div class="search_header">
                    <div style="display: none;"><p>공연명</p></div>
                    <div><p>공연명</p></div>
                    <div><p>공연날짜</p></div>
                    <div><p>공연장</p></div>
                </div>
                
                <c:forEach var="srch" items="${srchList }">
                <div class="srch_list_result">
                    <div>
                        <a href="${pageContext.request.contextPath}/perform/${srch.tfShow.sCode}">
                            <img src="${srch.tfShow.sPoster }">
                        </a>
                    </div>
                    <div>
                        <p class="title">
                            <a href="${pageContext.request.contextPath}/perform/${srch.tfShow.sCode}">${srch.showDetail.showName }</a>
                        </p>
                    </div>
                    <div>${fn:substring(srch.tfShow.sSDate,0,10) } ~ ${fn:substring(srch.tfShow.sEDate,0,10) }</div>
                    <div>${srch.showDetail.showHallName}</div>
                </div>
                </c:forEach>
               
            </div>
        </div>
    </div>
</div>