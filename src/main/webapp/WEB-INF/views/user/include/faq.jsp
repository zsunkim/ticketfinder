<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="cs">
    <div id="section01">
        <p class="csTitle">고객 센터</p>
    </div>
    <div id="section02">
        <div class="csTab">
            <div class="csTab1"><a href="${pageContext.request.contextPath}/cs">공지사항</a></div>
            <div class="csTab2"><a>이용안내</a></div>
            <div class="csTab3"><a class="on">FAQ</a></div>
            <div class="csTab4"><a href="${pageContext.request.contextPath}/qna">1:1 문의</a></div>
        </div>
    </div>
    <div id="section03">
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
        <div class="faq on">
            <div class="faqSearch">
                <input id="faqSearchInput" type="text">
                <a><img src="${pageContext.request.contextPath}/images/cs/searchBtn.png" onclick="searchFn()"></a>
            </div>
            <div class="faqTab">
                <div class="faqTab1 on">전체</div>|
                <div class="faqTab2">티켓예매</div>|
                <div class="faqTab3">취소/환불</div>|
                <div class="faqTab4">회원</div>
            </div>
            <div class="faqCont">
                <div class="faqList">
                    <ul class="faq">
                    </ul>
                </div>
                <div class="faqPageNum">
                    <div class="faqPagecont">
                        <div class="faqPageBtnBox">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        var page=1;
		var faqCategory="전체";
		boardDisplay(page,faqCategory);
		
		//게시글 목록을 요청하여 출력하는 함수
		function boardDisplay(pageNum,faqCategory) {
			$("ul.faq>a").remove();
			page=pageNum;
			faqCategory=faqCategory;
			$.ajax({
				type: "GET",
				url: "faq_list",
				data: {"faqCategory":faqCategory, "pageNum":pageNum},
				dataType: "json",
				success: function(json) {
					var total=json.totalBoard;
					var page=total
					for(var i=0; i<json.faqBoardList.length; i++) {
						var html="";
						html+="<a>";
						html+="<li class='faqItem' onclick='itemFn()'>";
						html+="<div class='faqItemLi'>";						
						html+="<div class='faqNo'>"+(json.faqBoardList[i].rn)+"</div>";
						html+="<div class='faqGroup'>"+json.faqBoardList[i].faq.faqCategory+"</div>";
						html+="<div class='faqTitle'>"+json.faqBoardList[i].faq.faqTitle+"</div>";
						html+="</div>";
						html+="<div class='faqAnswer'>";
						html+="<div>"+json.faqBoardList[i].faq.faqContents+"</div>";
						html+="</div>";
						html+="</li>";
						html+="</a>";
						
						$("ul.faq").append(html);
					}
					pageDisplay(json.pager,faqCategory);
				},
				error: function(xhr) {
					alert("에러코드 = "+xhr.status)
				}
			});
		}
		
		//페이지 번호를 출력하기 위한 함수
		function pageDisplay(pager,faqCategory) {
			var html="";
			if(pager.startPage>pager.blockSize) {
				html+="<span href='javascript:clickFn(1);' class='firstBtn'>&lt;&lt;</span>";
				html+="<span href='javascript:clickFn("+pager.prevPage+");' class='prevBtn'>&lt;</span>";
			} else {
				html+="<span class='firstBtnx'>&lt;&lt;</span><span class='prevBtnx'>&lt;</span>";
			}
			
			for(var i=pager.startPage;i<=pager.endPage;i++) {
				if(pager.pageNum!=i) {
					html+="<span onclick='clickFn(this)' class='"+faqCategory+"' id='"+i+"' style='cursor: pointer;'>"+i+"</span>";
				} else {
					html+="<span class='selected' onclick='clickFn(this)' id='"+i+"'>"+i+"</span>";
				}
			}
			
			if(pager.endPage!=pager.totalPage) {
				html+="<span href='javascript:boardDisplay("+pager.nextPage+");' class='nextBtn'>&gt;</span>";
				html+="<span href='javascript:boardDisplay("+pager.totalPage+");' class='endBtn'>&gt;&gt;</span>";
			} else {
				html+="<span class='nextBtnx'>&gt;</span><span class='endBtnx'>&gt;&gt;</span>";
			}
			
			$(".faqPageBtnBox").html(html);
		}
		
		function clickFn(obj) {
	   		$("ul.faq>a").remove();
	   		var type=$(obj).attr('id');
	   		var text=$(obj).attr('class');
			if(text == "전체" || text == "티켓예매" || text == "취소/환불" || text == "회원") {
		   		boardDisplay(type,text);
			} else {
				keywordDisplay(type,text);				
			}	
	   	    return false;
		}
		
		function searchFn() {
    		var faq=$('#faqSearchInput').val();
    		$("ul.faq>a").remove();
    		pageNum=1;
    		page=pageNum;
			keywordDisplay(page, faq);
    	}
    
    	function keywordDisplay(pageNum, faq) {
    		$.ajax({
    			type: "GET",
				url: "faq_search",
				data: {"faq":faq, "pageNum":pageNum},
				dataType: "json",
				success: function(json) {
					var total=json.totalBoard;
					var page=total
					console.log(json);
					for(var i=0; i<json.faqKeywordList.length; i++) {
						var html="";
						html+="<a>";
						html+="<li class='faqItem' onclick='itemFn()'>";
						html+="<div class='faqItemLi'>";
						html+="<div class='faqNo'>"+(json.faqKeywordList[i].rn)+"</div>";
						html+="<div class='faqGroup'>"+json.faqKeywordList[i].faq.faqCategory+"</div>";
						html+="<div class='faqTitle'>"+json.faqKeywordList[i].faq.faqTitle+"</div>";
						html+="</div>";
						html+="<div class='faqAnswer'>";
						html+="<div>"+json.faqKeywordList[i].faq.faqContents+"</div>";
						html+="</div>";
						html+="</li>";
						html+="</a>";
						
						$("ul.faq").append(html);
					}
					pageDisplay(json.pager,faq);
				},
				
				error: function(xhr) {
					alert("에러코드 = "+xhr.status)
				}
    		});
    	}
		
    	
    	$(document).on("click", ".faqItem", function(){
    		console.log('실행중');
	        $(this).toggleClass('on');
	        $(this).children('.faqAnswer').toggleClass('on');
    	});
	        
	        /* $.ajax({
    			type: "GET",
				url: "faq_search",
				data: {"faq":faq, "pageNum":pageNum},
				dataType: "json",
				success: function(json) {
					
				},
				error: function(xhr) {
					alert("에러코드 = "+xhr.status)
				}
    		}); */
		
		$('.faqTab').children().click(function() {
			$('.faqTab').children().removeClass('on');
			$(this).addClass('on');
        	var faqCategory=$(this).text();
        	boardDisplay(1,faqCategory);
        });
    </script>
    <script type="text/javascript">
    $('.csTab2').click(function(){
    	$('.csTab').find('a').removeClass('on');
		$(this).children('a').addClass('on');
        $('#section03').children('div.on').removeClass( 'on' );
        $('.faqItem').removeClass( 'on' );
        $('.faqAnswer').removeClass( 'on' );
        $('.how').addClass('on');
    });
    $('.csTab3').click(function(){
    	$('.csTab').find('a').removeClass('on');
		$(this).children('a').addClass('on');
        $('#section03').children('div.on').removeClass( 'on' );
        $('.faq').addClass('on');
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