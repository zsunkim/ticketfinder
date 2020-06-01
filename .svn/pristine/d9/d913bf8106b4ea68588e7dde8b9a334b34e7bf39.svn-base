<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="reviewMore">
	<div id="section01">
      <div class="cont">
        <h2>나의 후기</h2>
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
        <div class="reviewBox">
          <table>
            <thead>
              <tr>
                <td>NO.</td>
                <td>공연정보</td>
                <td>후기내용</td>
                <td>평점</td>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td class="reviewNo">1</td>
                <td class="reviewShow">
                  <img src="images/main/main_rank_musical01.jpg" alt="booking">
                  <p class="showTit">뮤지컬 &lt;미드나잇&gt;</p>
                  <p class="showDate">2020.02.11 ~ 2020.05.03</p>
                  <p class="showPlace">대학로 아트원씨어터 2관</p>
                </td>
                <td class="reviewContent">
                  <p>
                    리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용
                  </p>
                </td>
                <td class="reviewState">
                  5점
                </td>
              </tr>
            </tbody>
          </table>
        </div><!-- ticketBox End -->
        <div class="noReviewBox">
          <p>후기 내역이 없습니다.</p>
        </div>
        --%>
      </div>
    </div><!-- section02 End -->

    <div id="section03">
      <div class="cont">
        <div class="pageBtnBox">
        </div>
      </div>
    </div><!-- section03 End -->
</div>

<script type="text/javascript">
var page=1;
var month=6;
reviewListDisplay(1, 6);

$(".monthBtn li a").click(function(){
	month=$(this).attr("value");
	
	reviewListDisplay(page, month);
});

function reviewListDisplay(pageNum, period){
	page=pageNum;
	month=period;
	$.ajax({
		type:"get",
		url:"review_list?pageNum="+pageNum+"&month="+period,
		dataType:"json",
		success:function(json){
			console.log(json);
			$("#section02 .cont").empty();
			if(json.userReviewList.length==0){
				var html="<div class='noReviewBox'><p>후기 내역이 없습니다.</p></div>";
				$("#section02 .cont").append(html);
				return false;
			}

			var reviewBox="<div class='reviewBox'>";
			reviewBox+="<table><thead><tr>";
			reviewBox+="<td>NO.</td><td>공연정보</td><td>후기내용</td><td>평점</td>";
			reviewBox+="</tr></thead>";
            reviewBox+="<tbody id='tableBody'></tbody>";
            reviewBox+="</table></div>";

			$("#section02 .cont").append(reviewBox);

               $(json.userReviewList).each(function(index){
               		var list="";
                    list+="<tr>";
                    list+="<td class='reviewNo'>"+(index+1)+"</td>";
                    list+="<td class='reviewShow'>";
                    list+="<img src='"+this.userReviewList.tfShow.sPoster+"' alt='"+this.userReviewList.tfShow.sName+"'>";
                    list+="<p class='showTit'>"+this.userReviewList.tfShow.sGenre+"&lt;"+this.userReviewList.tfShow.sName+"&gt;</p>";
                    list+="<p class='showDate'>"+this.userReviewList.tfShow.sSDate.substring(0,10)+" ~ "+this.userShowList.tfShow.sEDate.substring(0,10)+"</p>";
                    list+="<p class='showPlace'>"+this.userReviewList.showDetail.showHallName+"</p>";
                    list+="</td>";
                    list+="<td class='reviewContent'>";
                    list+="<p>"+this.userReviewList.review.reviewContents+"</p>";
                    list+="</td>";
                    list+="<td class='reviewState'>"+this.userReviewList.review.reviewGrade+"</td>";
                    list+="</td></tr>";

                    $("#tableBody").append(list);
               });
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




