<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="modifyPw">
	<div id="section">
	    <div id="mopwHeader">
	        <div id="headerArea">
	            <h1>
	                <img src="images/common/logo2.png">
	                <div class="moditit">
	                    <span>비밀번호 변경</span>
	                </div>
	            </h1>
	        </div>
	    </div>
	    <div class="cont">
	    <form id="modifyPw" method="post" action="modifyPw">
	        <div class="findPwForm">
	            <div>
	                <div class="info_input">
	                    <div class="info_Box">
                            <input type="hidden" id="id" class="id" name="userId">
	                        <div>
	                            <input type="password" id="passwd" class="passwd" name="userPw" placeholder="새 비밀번호">
	                        </div>
	                        <p id="passwdMsg" class="error"></p>
	                        <div>
	                            <input type="password" id="repasswd" class="repasswd" placeholder="새 비밀번호 확인">
	                        </div>
	                        <p id="repassMsg" class="error"></p>
	                    </div>
	                </div>
	            </div>
	            
	            <div class="wrap_btn">
	            	<button type="submit" class="modify_btn" id="modify_btn">변경</button>
	            </div>
	        </div>
	    </form>
	    </div>
	</div>
</div>
<script type="text/javascript">
$("#modify_btn").submit(function() {
	if($("#passwd").val()=="") {
		$("#passwdMsg").text("비밀번호를 입력해 주세요.");
		$("#passwd").focus();
		return false;
	}
	var passwdReg=/^(?=.*[a-zA-Z])(?=.*[0-9]).{6,12}$/g;
	if(!passwdReg.test($("#passwd").val())) {
		$("#passwdMsg").text("비밀번호를 형식에 맞게 입력해 주세요.");
		$("#passwd").focus();
		return false;
	}
	
	if($("#repasswd").val()=="") {
		$("#repassMsg").text("비밀번호를 입력해 주세요.");
		$("#repasswd").focus();
		return false;
	}
	if($("#passwd").val()!=$("#repasswd").val()){
		$("#repassMsg").text("입력한 비밀번호가 다릅니다.");
		$("#repasswd").focus();
		return false;		
	}
	
	return true;
});
</script>
