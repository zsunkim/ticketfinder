<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="findPw">
	<div id="section">
	    <div id="findPwHeader">
	        <div id="headerArea">
	            <h1>
	                <img src="images/common/logo2.png">
	                <div class="finderBox">
	                    <a href="${pageContext.request.contextPath}/findId" class="on">아이디 찾기</a>
	                    <a href="#">비밀번호 찾기</a>
	                </div>
	            </h1>
	        </div>
	    </div>
	    <div class="cont">
	    <form action="findPw" method="post">
	        <div class="findPwForm">
	            <div>
	                <div class="info_input">
	                    <div class="info_Box">
	                        <div>
	                            <input type="text" id="name" class="name" name="userName" placeholder="이름">
	                        </div>
	                        <p id="nameMsg" class="error"></p>
	                        <div>
	                            <input type="email" id="email" class="email" name="userEmail" placeholder="이메일 주소">
	                        </div>
	                        <p id="emailMsg" class="error"></p>
	                        <div class="error">${message}</div>
	                    </div>
	                </div>
	            </div>
	            
	            <div class="wrap_btn">
	                <button type="submit" class="pwCheck" id="pwCheck">확인</button>
	            </div>
	        </div>
	    </form>
	    </div>
	</div>
</div>
<script type="text/javascript">
$("#pwCheck").submit(function() {
	if($("#name").val()=="") {
		$("#nameMsg").text("비밀번호를 입력해 주세요.");
		$("#name").focus();
		return false;
	}
	
	if($("#email").val()=="") {
		$("#emailMsg").text("비밀번호를 입력해 주세요.");
		$("#email").focus();
		return false;
	}
	
	return true;
});

</script>
