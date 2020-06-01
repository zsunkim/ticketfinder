<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.errot {color: red;}
</style>
<div id="findId">
	<div id="section">
	    <div id="findIdHeader">
	        <div id="headerArea">
	            <h1>
	                <img src="images/common/logo2.png">
	                <div class="finderBox">
	                    <a href="#">아이디 찾기</a>
	                    <a href="${pageContext.request.contextPath}/findPw" class="on">비밀번호 찾기</a>
	                </div>
	            </h1>
	        </div>
	    </div>
	    <div class="cont">
	    <!-- <form method="post" id="findId" action="findId"> -->
	        <div class="findIdForm">
	            <div>
	                <div class="info_input">
	                    <div class="info_Box">
	                        <div class="authNum"></div>
	                        <div class="userId"></div>
	                        <div>
	                            <input type="text" id="name" class="name" name="userName" placeholder="이름">
	                        </div>
           					<p id="nameMsg" class="error"></p>					
	                        <div>
	                            <span>
	                            	<input type="text" id="email" class="email" name="userEmail" placeholder="이메일을 입력해주세요.">
	                            </span>
	                            <span>
	                            	<a type="button" class="numBtn" id="numBtn">인증번호 요청</a>
	                            </span>
	                        </div>
           					<p id="emailMsg" class="error"></p>					
           					<p id="errorMsg" class="error">${message}</p>					
	                        <div>
	                            <input type="text" id="num" class="num" placeholder="인증번호 (6자리)">
	                            <%-- <input type="hidden" id="num" class="num" value="${authNum }"> --%>
	                        </div>
           					<p id="numMsg" class="error"></p>					
	                    </div>
	                </div>
	            </div>
	            
	            <div class="wrap_btn">
	                <button type="button" class="idCheck" id="idCheck">확인</button>
	            </div>
	        </div>
	    <!-- </form> -->
	    </div>
	    <%-- <script src="${pageContext.request.contextPath}/js/findId.js"></script> --%>
	</div>
</div>
 
<script type="text/javascript">

//이메일 입력 후 인증번호 받기 버튼 클릭 시
$("#numBtn").click(function() {
	var email = $("#email").val();
	alert("이메일을 확인해주세요.");
	//alert(email);
	find(email);
});
 

function find(email) {
	$.ajax({
		type:"GET",
		url:"email?email="+email,
		dataType:"json",
		success:function(data) {
			console.log(data);
			
			var html="<input type='hidden' id='authnum' class='authnum' name='authnum' value='"+data+"'>";
			$(".authNum").append(html);
			
		}, 
		error:function(xhr) {
			alert("응답요류 = "+xhr.status);
		}
	   });
}


//인증번호 입력 후 버튼 클릭 시
$("#idCheck").click(function() {
	var authnum = $("#authnum").val();
	//alert("authnum="+authnum);
	if($("#num").val()!=$("#authnum").val()) {
		$("#numMsg").empty();
		$("#numMsg").text("인증번호가 일치하지 않습니다.");
		$("#num").focus();
		return false;		
	}
	
	result();
});

function result() {
	var userName = $("#name").val();
	var userEmail = $("#email").val();
	//var authnum = $("#authnum").val();	
	//alert("authnum="+authnum);
	
	$.ajax({
		type:"get",
		url:"findId1?userName="+userName+"&userEmail="+userEmail,
		//dataType:allData,
		//data:{"userName":userName,"userEmail":userEmail},
		success:function(data) {
			//console.log(data);
			//alert("성공,"+data);
			
			//var path = getContextPath();
			var html="<input type='hidden' id='id' class='id' name='id' value='"+data+"'>";
			$(".userId").append(html);
			
			window.location.href="${pageContext.request.contextPath}/id?data="+data;
		}, 
		error:function(request,status,error){
	        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
	    }
	   });
}

/*
function getContextPath() {
  var hostIndex = location.href.indexOf(location.host) + location.host.length;
  return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
}
*/


</script>
