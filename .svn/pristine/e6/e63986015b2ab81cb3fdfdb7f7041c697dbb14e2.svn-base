<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div id="bookMore">
	<div id="section01">
      <div class="cont">
        <div class="tapWrapper">
          <div class="tapBtn">
            <button type="button" class="checkBtn selected">예매 확인</button>
            <button type="button" class="cancleBtn">예매 취소</button>
          </div>
        </div>
        <div class="monthWrapper">
          <ul class="monthBtn">
            <li class="on"><a href="#" value="6">6개월</a></li>
            <li><a href="#" value="12">12개월</a></li>
            <li><a href="#" value="24">24개월</a></li>
          </ul>
        </div>
      </div>
    </div><!-- section01 End -->

    <div id="section02">
      <div class="cont">
      	<%-- 
        <div class="ticketBox">
          <table>
            <thead>
              <tr>
                <td>예매일</td>
                <td>공연정보</td>
                <td>예매정보</td>
                <td>상태</td>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td class="bookDate">2020.02.01</td>
                <td class="bookShow">
                  <img src="images/main/main_rank_musical01.jpg" alt="booking">
                  <p class="showTit">뮤지컬 &lt;미드나잇&gt;</p>
                  <p class="showDate">2020.02.11 ~ 2020.05.03</p>
                  <p class="showPlace">대학로 아트원씨어터 2관</p>
                </td>
                <td class="bookDetail">
                  <dl>
                    <dt>예매번호</dt>
                    <dd>M1112223</dd>
                    <dt>관람일</dt>
                    <dd>2020.02.11(화) 17:00</dd>
                    <dt>매수</dt>
                    <dd>1매</dd>
                    <dt>취소일</dt>
                    <dd>2020.02.12(수) 17:00</dd>
                  </dl>
                </td>
                <td class="bookState">
                  <p>예매상태(결제방식)</p>
                  <a href="#">예매상세 +</a>
                </td>
              </tr>
            </tbody>
          </table>
        </div><!-- ticketBox End -->
        <div class="noTicketBox">
          <p>예매 확인 내역이 없습니다.</p>
        </div>
        --%>
      </div>
    </div><!-- section02 End -->

    <div id="section03">
      <div class="cont">
        <div class="pageBtnBox">
        	<%-- 
          	<a href="#" class="firstBtn">&lt;&lt;</a>
          	<a href="#" class="prevBtn">&lt;</a>
          	<a href="#" class="selected">1</a>
          	<a href="#">2</a>
          	<a href="#" class="nextBtn">&gt;</a>
          	<a href="#" class="endBtn">&gt;&gt;</a>
          	--%>
        </div>
      </div>
    </div><!-- section03 End -->

    <div id="section04">
      <div class="cont">
        <div class="info">
          <p>최소 안내</p>
          <ul>
            <li>예매상세에서 상세내역 확인 및 취소를 진행하실 수 있습니다.</li>
            <li>배송이 시작된 경우 취소마감시간이전까지 멜론티켓 고객센터로 티켓을 반환해주셔야 환불이 가능하며, 도착한 일자 기준으로 취소수수료가 부과됩니다. <br>
(* 단, 반환된 티켓의 배송료는 환불되지 않으며 일괄배송 상품의 경우 취소에 대한 자세한 문의는 고객센터로 문의해 주시기 바랍니다.)</li>
          </ul>
        </div>
      </div>
    </div>
</div>

<script type="text/javascript">
var page=1;
var month=6;
var state=1;
bookingDisplay(1, 6);

$(".tapBtn button").click(function(){
	if($(this).hasClass("cancleBtn")){
		state=0;
	}else if($(this).hasClass("checkBtn")){
		state=1;
	}
	
	bookingDisplay(page, month, state);
});


$(".monthBtn li a").click(function(){
	month=$(this).attr("value");
	
	bookingDisplay(page, month, state);
});



function bookingDisplay(pageNum, period, state){
	page=pageNum;
	month=period;
	$.ajax({
		type:"get",
		url:"book_list?pageNum="+pageNum+"&month="+period+"&state="+state,
		dataType:"json",
		success:function(json){
			console.log(json);
			$("#section02 .cont").empty();
			$(".pageBtnBox").empty();
			if(json.userOrderList.length==0){
				var html="<div class='noTicketBox'><p>해당 내역이 없습니다.</p></div>";
				$("#section02 .cont").append(html);
				return false;
			}

			var ticketBox="<div class='ticketBox'>";
			ticketBox+="<table><thead><tr>";
			ticketBox+="<td>예매일</td><td>공연정보</td><td>예매정보</td><td>상태</td>";
			ticketBox+="</tr></thead>";
            ticketBox+="<tbody id='tableBody'></tbody>";
            ticketBox+="</table></div>";

			$("#section02 .cont").append(ticketBox);

            
            for(var i=0; i<json.userOrderList.length; i++){
            		console.log(i);
            		var list="";
            	     list += "<tr>";
            	     list += "<td class='bookDate'>"+json.userOrderList[i].tfOrder.orderDate.substring(0, 10) + "</td>";
            	     list += "<td class='bookShow'>";
            	     list += "<img src='" + json.userShowList[i].tfShow.sPoster + "' alt='" + json.userShowList[i].tfShow.sName + "'>";
            	     list += "<p class='showTit'>" + json.userShowList[i].tfShow.sGenre + "&lt;" + json.userShowList[i].showDetail.showName + "&gt;</p>";
            	     list += "<p class='showDate'>" + json.userShowList[i].tfShow.sSDate.substring(0, 10) + " ~ " + json.userShowList[i].tfShow.sEDate.substring(0, 10) + "</p>";
            	     list += "<p class='showPlace'>" + json.userShowList[i].showDetail.showHallName + "</p>";
            	     list += "</td>";
            	     list += "<td class='bookDetail'><dl>";
            	     list += "<dt>예매번호</dt><dd>" + json.userOrderList[i].tfOrder.orderCode + "</dd>";
            	     list += "<dt>관람일</dt><dd>" + json.userShowList[i].showDetail.showDaytime.substring(0, 16) + "</dd>";
            	     list += "<dt>매수</dt><dd>" + json.userOrderList[i].tfOrder.orderQty+"매</dd>";
            	     if (json.userOrderList[i].tfOrder.orderDpState != "입금") {
            	          list += "<dt>"+json.userOrderList[i].refund.refundState+"일</dt>" 
            	          +"<dd>"+json.userOrderList[i].refund.refundDate.substring(0, 16)+"</dd>";
            	     }else{
            	    	 list += "<dt>예매일</dt>" 
           	          +"<dd>"+json.userOrderList[i].tfOrder.orderDate.substring(0, 16)+"</dd>";
            	     }
            	     list += "</td>";
            	     list += "<td class='bookState'>";
            	     list += "<p>" + json.userOrderList[i].tfOrder.orderDpState + "(" + json.userOrderList[i].tfOrder.orderPayment + ")</p>";
            	     list += "<a href='${pageContext.request.contextPath}/book_detail/"+json.userOrderList[i].tfOrder.orderCode +"'>예매상세 +</a>";
            	     list += "</td></tr>";
            	     list+=i;
            	     $("#tableBody").append(list);
               }
               pageDisplay(json.pager, month, state);
		},
		error:function(xhr){
			alert("응답 에러코드 = "+xhr.status);
		}
	});
}

//페이지 번호를 출력하는 함수
function pageDisplay(pager, month, state) {
     var html = "";
     if (pager.startPage > pager.blockSize) {
          html += "<a href='javascript:bookingDisplay(1,"+month+","+state+")' class='firstBtn'>&lt;&lt;</a>";
          html += "<a href='javascript:bookingDisplay(" + pager.prevPage + ","+month+","+state+") class='prevBtn'>&lt;</a>";
     } else {
          html += "<span class='firstBtn'>&lt;&lt;</span> <span class='prevBtn'>&lt;</span>";
     }

     for (var i = pager.startPage; i <= pager.endPage; i++) {
          if (pager.pageNum != i) {
               html += "<a href='javascript:bookingDisplay(" + i + ","+month+","+state+");'>" + i + "</a>";
          } else {
               html +="<span class='selected'>"+i+"</span>";
          }
     }

     if (pager.endPage != pager.totalPage) {
          html += "<a href='javascript:bookingDisplay(" + pager.nextPage + ","+month+","+state+ ")'>&gt;</a>";
          html += "<a href='javascript:bookingDisplay(" + pager.totalPage + ","+month+","+state+ ")'>&gt;&gt;</a>";
     } else {
          html += "<span class='nextBtn'>&gt;</span> <span class='endBtn'>&gt;&gt;</span>";
     }

     $(".pageBtnBox").html(html);
}
</script>



















