<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="cs">
    <div id="section01">
        <p class="csTitle">고객 센터</p>
    </div>
    <div id="section02">
        <div class="csTab">
            <div class="csTab1"><a class="on">공지사항</a></div>
            <div class="csTab2"><a>이용안내</a></div>
            <div class="csTab3"><a href="${pageContext.request.contextPath}/faq">FAQ</a></div>
            <div class="csTab4"><a href="${pageContext.request.contextPath}/qna">1:1 문의</a></div>
        </div>
        <script type="text/javascript">
			$('.csTab1').click(function(){
			   $('.csTab').find('a').removeClass('on');
			   $('.csTab1').children('a').addClass('on');
		   });
		   $('.csTab2').click(function(){
			   $('.csTab').find('a').removeClass('on');
			   $('.csTab2').children('a').addClass('on');
		   });
	   </script>
    </div>
    <div id="section03">
        <div class="notice on">
            <div class="select">
                <select id="selectBox">
                    <option>전체</option>
                    <option value="서비스 점검">서비스 점검</option>
                    <option value="안내">안내</option>
                    <option value="서비스 소식">서비스 소식</option>
                </select>
            </div>
            
            <div class="noticeListCont">
                <div class="noticeListPart">
                    <span>NO</span>
                    <span>분류</span>
                    <span>제목</span>
                    <span>등록일</span>
                </div>
                <div class="noticeListWrap">
                </div>
                <div class="noticePageNum">
                    <div class="noticePagecont">
                        <div class="noticePageBtnBox">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
		var page=1;
        
		boardDisplay(page);
		
		//게시글 목록을 요청하여 출력하는 함수
		function boardDisplay(pageNum) {
			$(".noticeListWrap>a").remove();
			page=pageNum;
			$.ajax({
				type: "GET",
				url: "cs_list?pageNum="+pageNum,
				dataType: "json",
				success: function(json) {
					var total=json.totalBoard;
					var page=total
					for(var i=0; i<5; i++) {
						var html="";
						html+="<a href='${pageContext.request.contextPath}/csRe/"+pageNum+"/"+json.csBoardList[i].cs.csNum+"/"+(total-json.csBoardList[i].rn+1)+"'>";
						html+="<div class='noticeList'>";
						html+="<div class='noticeNo'>"+(total-json.csBoardList[i].rn+1)+"</div>";
						html+="<div class='noticeGroup'>"+json.csBoardList[i].cs.csCategory+"</div>";
						html+="<div class='noticeTitle'>"+json.csBoardList[i].cs.csTitle+"</div>";
						html+="<div class='noticeDate'>"+json.csBoardList[i].cs.csDate.substring(0,10)+"</div>";
						html+="</div>";
						html+="</a>";
						
						$(".noticeListWrap").append(html);
					}
					pageDisplay(json.pager);
				},
				error: function(xhr) {
					alert("에러코드 = "+xhr.status)
				}
			});
		}
		
		//페이지 번호를 출력하기 위한 함수
		function pageDisplay(pager) {
			var html="";
			if(pager.startPage>pager.blockSize) {
				html+="<span href='javascript:clickFn(1);' class='firstBtn'>&lt;&lt;</span>";
				html+="<span href='javascript:clickFn("+pager.prevPage+");' class='prevBtn'>&lt;</span>";
			} else {
				html+="<span class='firstBtn'>&lt;&lt;</span><span class='prevBtn'>&lt;</span>";
			}
			
			for(var i=pager.startPage;i<=pager.endPage;i++) {
				if(pager.pageNum!=i) {
					html+="<span onclick='clickFn(this)' id='"+i+"'>"+i+"</span>";
				} else {
					html+="<span class='selected' onclick='clickFn(this)' id='"+i+"'>"+i+"</span>";
				}
			}
			
			if(pager.endPage!=pager.totalPage) {
				html+="<span href='javascript:boardDisplay("+pager.nextPage+");' class='nextBtn'>&gt;</span>";
				html+="<span href='javascript:boardDisplay("+pager.totalPage+");' class='endBtn'>&gt;&gt;</span>";
			} else {
				html+="<span class='nextBtn'>&gt;</span><span class='endBtn'>&gt;&gt;</span>";
			}
			
			$(".noticePageBtnBox").html(html);
		}
		
		function clickFn(obj) {
    		$(".noticeListWrap>a").remove();
    		var type=$(obj).attr('id');
    		boardDisplay(type);
    	    return false;
		}
		</script>
		<script type="text/javascript">
           	$('#selectBox').on("change",function() {
          		var page=1;
           		var csCategory=$('#selectBox option:selected').val();
           		
                if(csCategory=='전체') {
                	boardDisplay(1);
                	return false;
                }
           		cateDisplay(page, csCategory);
           	});
           		
           		//게시글 목록을 요청하여 출력하는 함수
           		function cateDisplay(pageNum, csCategory) {
           			$(".noticeListWrap>a").remove();
           			page=pageNum;
           			$.ajax({
           				type: "GET",
           				url: "csCate",
           				data: {"csCategory":csCategory, "pageNum":pageNum},
           				dataType: "json",
           				success: function(json) {
           					console.log(json.pager);
           					var total=json.totalBoard;
           					for(var i=0; i<json.csBoardList.length; i++) {
           						var html="";
           						html+="<a href='${pageContext.request.contextPath}/csRe/"+pageNum+"/"+json.csBoardList[i].cs.csNum+"/"+(total-json.csBoardList[i].rn+1)+"'>";
           						html+="<div class='noticeList'>";
           						html+="<div class='noticeNo'>"+(total-json.csBoardList[i].rn+1)+"</div>";
           						html+="<div class='noticeGroup'>"+json.csBoardList[i].cs.csCategory+"</div>";
           						html+="<div class='noticeTitle'>"+json.csBoardList[i].cs.csTitle+"</div>";
           						html+="<div class='noticeDate'>"+json.csBoardList[i].cs.csDate.substring(0,10)+"</div>";
           						html+="</div>";
           						html+="</a>";
           						
           						$(".noticeListWrap").append(html);
           					}
           					
           					pageCDisplay(json.pager);
           				},
           				error: function(xhr) {
           					alert("cate에러코드 = "+xhr.status)
           				}
           			});
           		}
           		
           		//페이지 번호를 출력하기 위한 함수
           		function pageCDisplay(pager) {
           			var html="";
           			if(pager.startPage>pager.blockSize) {
           				html+="<span href='javascript:clickCFn(1);' class='firstBtn'>&lt;&lt;</span>";
           				html+="<span href='javascript:clickCFn("+pager.prevPage+");' class='prevBtn'>&lt;</span>";
           			} else {
           				html+="<span class='firstBtn'>&lt;&lt;</span><span class='prevBtn'>&lt;</span>";
           			}
           			
           			for(var i=pager.startPage;i<=pager.endPage;i++) {
           				if(pager.pageNum!=i) {
           					html+="<span onclick='clickCFn(this)' id='"+i+"'>"+i+"</span>";
           				} else {
           					html+="<span class='selected' onclick='clickCFn(this)' id='"+i+"'>"+i+"</span>";
           				}
           			}
           			
           			if(pager.endPage!=pager.totalPage) {
           				html+="<span href='javascript:cateDisplay("+pager.nextPage+");' class='nextBtn'>&gt;</span>";
           				html+="<span href='javascript:cateDisplay("+pager.totalPage+");' class='endBtn'>&gt;&gt;</span>";
           			} else {
           				html+="<span class='nextBtn'>&gt;</span><span class='endBtn'>&gt;&gt;</span>";
           			}
           			
           			$(".noticePageBtnBox").html(html);
           		}
           		
           		function clickCFn(obj) {
               		$(".noticeListWrap>a").remove();
               		var type=$(obj).attr('id');
               		var csCategory=$('#selectBox option:selected').val();
               		cateDisplay(type, csCategory);
               	    return false;
           		}
           </script>
        <div class="how">
            <div class="howTab">
                <div class="how1 on">예매방법</div>|
                <div class="how2">취소/환불</div>|
                <div class="how3">발권/배송</div>
            </div>
            <div class="howCont">
                <div class="how1Img on"><img src="${pageContext.request.contextPath}/images/cs/how1.png"></div>
                <div class="how2Img"><img src="${pageContext.request.contextPath}/images/cs/how2.png"></div>
                <div class="how3Img"><img src="${pageContext.request.contextPath}/images/cs/how3.PNG"></div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
     $('.csTab1').click(function(){
        $('#section03').children('div.on').removeClass('on');
        $('.notice').addClass('on');
    });
    $('.csTab2').click(function(){
        $('#section03').children('div.on').removeClass( 'on' );
        $('.how').addClass('on');
    });
    $('.how1').click(function(){
        $('.howCont').children('div.on').removeClass( 'on' );
        $('.howTab').children('div.on').removeClass( 'on' );
        $('.how1').addClass('on');
        $('.how1Img').addClass('on');
    });
    $('.how2').click(function(){
        $('.howCont').children('div.on').removeClass( 'on' );
        $('.howTab').children('div.on').removeClass( 'on' );
        $('.how2').addClass('on');
        $('.how2Img').addClass('on');
    });
    $('.how3').click(function(){
        $('.howCont').children('div.on').removeClass( 'on' );
        $('.howTab').children('div.on').removeClass( 'on' );
        $('.how3').addClass('on');
        $('.how3Img').addClass('on');
    });
    </script>
</div>