<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<form:form modelAttribute="question" role="form" method="post" enctype="multipart/form-data" name="question" id="qnaForm" action="${pageContext.request.contextPath}/qna_write">
<div id="qna">
    <div id="section">
        <p class="qnaTitle">1:1 문의하기</p>
        <div class="qnaCont">
            <div class="qnaList">
                <div class="qnaGroupList">
                    <div class="qnaGroupName left">분류</div>
                    <div class="qnaGroupRBtn">
                        <div><label><input type="radio" name="questionCategory" value="myvalue1">예매/결제</label></div>
                        <div><label><input type="radio" name="questionCategory" value="myvalue2">취소/환불</label></div>
                        <div><label><input type="radio" name="questionCategory" value="myvalue3">회원 정보</label></div>
                        <div><label><input type="radio" name="questionCategory" value="myvalue4">기타</label></div>
                    </div>
                </div>
                <div class="qnaTitle">
                    <div class="qnaTitleName left">제목</div>
                    <div class="qnaTitleInput">
                        <input name="questionTitle">
                    </div>
                    <span class="qnaMessage"></span>
                </div>
                <div class="qnaContent">
                    <div class="qnaContentName left">내용</div>
                    <div class="qnaContentInput">
                        <textarea name="questionContents"></textarea>
                    </div>
                    <span class="qnaMessage"></span>
                </div>
                <div class="qnaFile">
                    <div class="qnaFileName left">첨부파일</div>
                    <div class="qnaFileCont">
                        <input class="qnaFileBtn" type="file" name="file"></input>
                        <!-- <div class="qnaFileBtn">파일 선택</div> -->
                        <div class="qnaFileInfo">*사진 파일만 첨부 가능. 첨부 파일은 총 10MB까지 업로드 가능</div>
                    </div>
                </div>
                <div class="qnaPlay">
                    <div class="qnaPlayName left">예매공연</div>
                    <div class="qnaPlayList">
                        <div class="qnaPlayListItem">
                            <input readonly name="questionShow">
                        </div>
                        <div class="qnaPlayListBtn">예매 공연 검색</div>
					    <div id="myModal" class="modal">
					    	<div class="modalCont">
					    		<span class="close">&times;</span>                                                               
						        <div class="modalBar">
						            <div class="Txt1">예매일</div>
						            <div class="Txt2">공연명</div>
						            <div class="Txt3">예매번호</div>
						            <div class="Txt4">상태</div>
						        </div>
						        <!-- <div class="modalList">
						             <div class="Txt1">2020.03.15</div>
						             <div class="Txt2">뮤지컬 〈엑스칼리버〉</div>
						             <div class="Txt3">M32432424</div>
						             <div class="Txt4">예매(완료)<span>선택</span></div>
						        </div> -->
					      	</div>
					    </div>
					    <script type="text/javascript">
					        var modal = document.getElementById('myModal');
						    var btn = document.getElementsByClassName("qnaPlayListBtn")[0];
						    var span = document.getElementsByClassName("close")[0];
						    var userid="${userid}";
						    btn.onclick = function() {
						        $(".modalCont").children('.modalList').remove();
						        modal.style.display = "block";
						        $.ajax({
						        	type: "GET",
						        	url: "qna_show_list?userid="+userid,
						        	success: function(data) {
						        		console.log(data);
						        		for(var i=0; i<data.length; i++) {
											var html="";
											html+="<div class='modalList'>";
											html+="<div class='Txt1'>"+data[i].tfOrder.orderDate.substring(0,10)+"</div>";
											html+="<div class='Txt2'>"+data[i].tfShow.sName+"</div>";
											html+="<div class='Txt3'>"+data[i].tfOrder.orderCode+"</div>";
											html+="<div class='Txt4'>";
											if(data[i].tfOrder.orderDpState=="입금") {
												html+=data[i].tfOrder.orderTicketing+"<span class='shselectBtn'>선택</span>";
											} else {
												html+=data[i].tfOrder.orderDpState+"<span class='shselectBtn'>선택</span>";
											}
											html+="</div>";
											html+="</div>";
											
											$(".modalCont").append(html);
										}
									},
									error: function(xhr) {
										alert("에러코드 = "+xhr.status)
									}
						        });
						    }
						    span.onclick = function() {
						        modal.style.display = "none";
						    }
						    window.onclick = function(event) {
						        if (event.target == modal) {
						            modal.style.display = "none";
						        }
						    }
						    
						    $(document).on("click", ".shselectBtn", function(){
						        var bookCode=$(this).parent().parent().children('.Txt3').text();
						        var bookName=$(this).parent().parent().children('.Txt2').text();
						        $('.qnaPlayListItem').children('input').val(bookCode);
						        $(".qnaPlayListNone").children('input:checkbox').attr("checked",false);
						            modal.style.display = "none";
					    	});
					    </script>
                        <div class="qnaPlayListNone">
                            <input type="checkbox">
                            <span>선택할 공연 없음</span>
                        </div>
                    </div>
                </div>
            </div>
            <input type="hidden" name="questionUserId" value="${userid}">
            <!-- <input type="hidden" name="questionStep" value=0> -->
            <input type="hidden" name="questionState" value="답변미등록">
            <div class="qnaBtnCont">
                <div class="qnaCancelBtn"><a href="${pageContext.request.contextPath }/qna">취소</a></div>
                <div class="qnaSaveBtn" onclick="submitFn()">문의하기</div>
            </div>
            <script type="text/javascript">
            	$(".qnaPlayListNone").children('input:checkbox').click(function() {
            		$('.qnaPlayListItem').children('input').val('');
            	});
            
            	function submitFn() {
	            	var title=$('.qnaTitleInput').children('input').val();
	            	$('.qnaTitleInput').children('input').attr('value',title);
	            	var content=$('.qnaContentInput').children('textarea').val();
	            	$('.qnaContentInput').children('textarea').attr('value',content);
	            	var group=$('.qnaGroupRBtn').find('input:radio[name=questionCategory]:checked').val();
	            	if(group=="myvalue1") { group="예매/결제"; }
	            	if(group=="myvalue2") { group="취소/환불"; }
	            	if(group=="myvalue3") { group="회원 정보"; }
	            	if(group=="myvalue4") { group="기타"; }
	            	$('.qnaGroupRBtn').find('input:radio[name=questionCategory]:checked').attr('value',group);
	            	var checked=$(".qnaPlayListNone").children('input:checkbox').is(":checked");
	            	$(".qnaPlayListNone").children('input:checkbox').attr('value',checked);
	            	var showText=$('.qnaPlayListItem').children('input').val();
	            	$('.qnaPlayListItem').children('input').attr('value',showText);
	            	console.log(title);
	            	console.log(content);
	            	console.log(group);
	            	console.log(checked);
	            	console.log(showText);
	           		var message=$('.qnaMessage').text();
	            		
	           		message="";
           			
           			// 라디오 버튼
           			if(group==null || group=='') {
            			message="분류를 선택해주세요.";
            			alert("분류를 선택해주세요.");
                		return false;
            		}
           		
            		// 제목
            		if(title==null || title=='') {
            			message="제목을 입력해주세요.";
            			alert("제목을 입력해주세요.");
                		return false;
            		}
            		
            		//내용
            		if(content==null || content=='') {
            			message="내용을 입력해주세요.";
            			alert("내용을 입력해주세요.");
                		return false;
            		}
            		
            		// 공연
            		if(checked==false && showText=='') {
                		alert("공연을 선택하거나 [선택할 공연 없음]에 체크해주세요.");
                		return false;
                	}
            		
            		if(checked==true && showText=='') {
            			$('.qnaPlayListItem').children('input').attr('value',"");
                	}
            		
            		$('#qnaForm').submit();
            	}
            </script>
        </div>
    </div>
</div>
</form:form>