<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Ticket Finder 결제화면</title>
	<%-- jQuery 라이브러리 및 Fontawesome 라이브러리 --%>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	
	<%-- 공통 CSS 및 JS 파일 --%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/book.css"/>
	
	<%-- 파비콘 link 태그 --%>
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/common/favicon.ico" type="image/x-icon">
<style>
  	*{margin:0; padding:0;}
</style>
</head>
<body id="delivery">
	<div id="section">
        <div>
            <ul class="book_tap">
                <li class="step">
                    <span>좌석선택</span>
                </li>
                
                <li class="step on">
                    <span>결제</span>
                </li>
            </ul>
        </div>
        
        <div class="wrap_left">
        	<div class="deliver_box">
                <div>
                    <h2>수령방법</h2>
                    <div class="sel_receipt">
                        <em>수령방법선택</em>
                        <span>
                            <input type="checkbox" id="deliver" name="receipt" value="deliver" checked>
                            <label>배송 (2,500원)</label>
                        </span>
                    </div>
                </div>

                <div class="user_info">
                    <!-- 현장수령 -->
                    <h4>주문자 정보 확인</h4>
                    <ul>
                        <li>
                            <em>이름</em>
                            <p>${userinfo.userName }</p>
                        </li>
                        <li>
                            <em>연락처</em>
                            <p>${userinfo.userTel }</p>
                        </li>
                        <li>
                            <em>e-mail</em>
                            <p>${userinfo.userEmail }</p>
                        </li>
                    </ul>
                </div>
                 <!-- 주의사항 -->
                <div class="caution" id="step04_DeliveryCaution" style="display: block;">
                    <h5>주의사항</h5>
                    <ul>
                        <li>1)<span class="red"> 배송 선택 시 티켓 수령자의 배송지 정보를 정확히 입력해주시기 바랍니다.</span></li>
                        <li>2)<span class="red"> 티켓은 유가증권으로 본인에게 직접 전달해야하며, 분실된 티켓은 재발권 되지 않습니다.</span></li>
                        <li>3)<span class="red"> 일괄배송의 경우 정해진 날짜에 티켓 배송이 시작되며, 주소 수정은 일괄배송일 2일 전까지 가능합니다.</span></li>
                        <li>4)<span class="red"> 예매 티켓 배송은 예매완료일, 혹은 일괄배송일로부터 4~5일(영업일 기준) 이내 수령 가능합니다.</span> </li>
                        <li>5) 긴급연락처는 공연 취소와 같은 유사 시 안내 받으실 연락처이므로 정확히 입력해주시기 바랍니다.</li>
                        <li>6) 이메일 정보 미 입력 시 예매 관련 안내 메일을 받을 수 없으니 이메일 받기를 원하시는 경우 마이페이지에서<br />&nbsp;&nbsp;&nbsp;회원정보를 수정해주시기 바랍니다.</li>
                    </ul>
                </div>
	        </div>
	        
	        <div class="pay_box">
                <div>
                    <h2>결제방법</h2>
                    <div class="sel_receipt">
                        <em>결제방법선택</em>
                        <span>
                            <input type="checkbox" id="site" name="receipt" value="site" checked>
                            <label>신용카드</label>
                        </span>
                    </div>
                </div>
	
                 <!-- 취소수수료 안내 및 약관동의 -->
                <div class="caution bgbrn" id="cancelFeeInfo">
                    <div class="box">
                        <em>취소 가능 마감 시간 : </em><span id="lblCancelTimeInfo" class="red">&nbsp;</span>
                    </div>
                        
					<table class="boardListTypeB tb_w">
                        <colgroup>
                        <col width="33%"  align="center"/>
                        <col width="38%"  align="center"/>
                        <col width="*" />
                        </colgroup>
                        <thead>
                          <tr>
                            <th>내용</th>
                            <th>취소수수료</th>
                            <th>비고</th>
                          </tr>
                         </thead>
                         <tbody>
                          <tr>
                            <td>예매 후 7일 이내</td>
                            <td>없음</td>
                            <td rowspan="5" class="bl_p alignLeft">- 취소 시 예매수수료는 예매 당일 밤 12시 이전까지만 환불됩니다. <br />
                        - 예매 후 7일 이내라도 취소시점이 관람일로부터 10일 이내라면 그에 해당하는 취소수수료가 부과됩니다.  <br />
                        - 관람 당일 취소 가능 상품의 경우 관람 당일 취소 시 티켓금액의 90%가 취소수수수료로 부과됩니다.
                        </td>
                          </tr>
                          <tr>
                            <td>예매 후 8일 ~ 관람일 10일 전까지</td>
                            <td>뮤지컬, 콘서트, 클래식 등: <span class="red">장당 4,000원</span> /<br> 연극, 전시 등: <span class="red">장당 2,000원</span> <br />(단, 티켓 금액의 10% 이내)</td>
                          </tr>
                          <tr>
                            <td>관람일 9일 전 ~ 관람일 7일 전까지</td>
                            <td>티켓금액의 <em class="red">10%</em></td>
                          </tr>
                          <tr>
                            <td>관람일 6일 전 ~ 관람일 3일 전까지</td>
                            <td>티켓금액의 <em class="red">20%</em></td>
                          </tr>
                          <tr>
                            <td>관람일 2일 전 ~ 관람일 1일 전까지</td>
                            <td>티켓금액의 <em class="red">30%</em></td>
                          </tr>  
                        </tbody>
					</table>
                </div>
                
                <div>
                    <!-- //취소수수료 안내 및 약관동의 -->
                    <p class="chkbox">
                    <input id="cbxCancelFeeAgree" type="checkbox" /><label id="chkCancelFeeAgreeText">취소수수료 및 취소기한을 확인하였으며, 동의합니다.</label>
                    <input id="chkinfoAgree" type="checkbox"/><label>제3자 정보제공 내용에 동의합니다. </label>
                    </p>
                </div>
	        </div>
		</div>
    </div>

    <div class="reserve_right">
        <div class="show_info">
            <img src="${showInfo.tfShow.sPoster}">
            <span class="title">${showInfo.tfShow.sGenre } &lt;${showInfo.showDetail.showName}&gt;</span>
            <span class="date">${fn:substring(showInfo.tfShow.sSDate,0,10)} ~ ${fn:substring(showInfo.tfShow.sEDate,0,10)}</span>
            <span class="date">${showInfo.showDetail.showHallName }</span>
        </div>
        <div class="my_seat">
            <h3>선택내역</h3>
            <ul>
                <li>
                    <em>날짜</em>
                    <span>${fn:substring(showInfo.showDetail.showDaytime,0,10)}</span>
                </li>
                <li>
                    <em>시간</em>
                    <span>${fn:substring(showInfo.showDetail.showDaytime,11,16)}</span>
                </li>
                <li>
                    <em>매수</em>
                    <span>${fn:length(showNum)}매</span>
                </li>
                <li>
                    <em>좌석</em>
                    <div id="seatInfo">
                    	<c:forEach var="seat" items="${seatName}" varStatus="s">
                    		<span>${seat}</span>
                    	</c:forEach>
                    </div>
                </li>
            </ul>
        </div>
        <div class="ticket_info">
            <h3>결제내역</h3>
            <div class="ticket_pay">
                <ul>
                    <li class="t_price">
                        <em>티켓금액</em>
                        <c:set var="ticketPrice" value="${showInfo.tfShow.sPrice * fn:length(showNum)}"/>
                        <span><fmt:formatNumber value="${ticketPrice}" type="number"/>원</span>
                    </li>
                    <li class="t_charge">
                        <em>예매수수료</em>
                        <span>1,000원</span>
                    </li>
                    <li class="t_deli">
                        <em>배송료</em>
                        <span>2,500원</span>
                    </li>
                    <li class="t_plus">
                        <em>총 금액</em>
                        <c:set var="total" value="${ticketPrice + 1000 + 2500}"/>
                        <span><fmt:formatNumber value="${total}" type="number"/>원</span>
                    </li>
                </ul>
            </div>
        </div>
        <div class="t_result">
            <span>총 결제금액</span>
            <span><fmt:formatNumber value="${total}" type="number"/>원</span>
        </div>
        

        <div class="reserve_btn">
			<a class="btn1" id="prevBtn">이전</a>
			<a class="btn2" id="nextBtn">좌석선택완료</a>
        </div>
        
        <div id="seatNum">
        	<form action="${pageContext.request.contextPath}/pay.do/${showInfo.showDetail.showNum}" method="post" id="seatForm">
        		<c:forEach var="name" items="${seatName}" varStatus="s">
            		<input type="hidden" name="seatName" value="${name}" />
            	</c:forEach>
            	
            	<c:forEach var="seat" items="${showNum}" varStatus="s">
            		<input type="hidden" name="seatNum" value="${seat}" />
            	</c:forEach>
        	</form>
        </div>
    </div>
    
<script>
    $("#prevBtn").click(function(){
    	if(confirm("현재 선택한 좌석정보가 삭제됩니다. 이동하시겠습니까?")){
    		location.href="${pageContext.request.contextPath}/seat.do/"+${showInfo.showDetail.showNum};
    	}else{
    		return false;
    	}
    });
    
    $("#nextBtn").click(function(){
    	if(!$("#deliver").prop("checked")){
    		alert("수령방법을 선택해주세요.");
    		return false;
    	}
    	
    	if(!$("#site").prop("checked")){
    		alert("결제방법을 선택해주세요.");
    		return false;
    	}
    	
    	if(!$("#cbxCancelFeeAgree").prop("checked") && !$("#chkinfoAgree").prop("checked")){
    		alert("약관에 동의해주세요.");
    		return false;
    	}
    	
    	$("#seatForm").submit();
    });
    
    
    
    
    
  //체크 기능
    $("#termsAllChk").change(function(){
    	var state = $(this).prop("checked");
    	if(state){
    		$("input[type='checkbox']").prop("checked", true);
    	}else{
    		$("input[type='checkbox']").prop("checked", false);
    	}
    });
</script>
</body>
</html>