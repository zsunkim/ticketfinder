$(document).ready(function() {
	
function searchAddr() {
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ''; // 주소 변수
			var extraAddr = ''; // 참고항목 변수

			//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			if(data.userSelectedType === 'R'){
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
					extraAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if(data.buildingName !== '' && data.apartment === 'Y'){
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if(extraAddr !== ''){
					extraAddr = ' (' + extraAddr + ')';
				}
				// 조합된 참고항목을 해당 필드에 넣는다.
				//document.getElementById("sample6_extraAddress").value = extraAddr;
				document.getElementById("add1").value = addr+extraAddr;
			
			} else {
				//document.getElementById("sample6_extraAddress").value = '';
				document.getElementById("add2").value = addr;
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('post').value = data.zonecode;
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("add2").focus();
		}
	}).open();
}

document.querySelector('.postBtn').addEventListener('click', function(){
	searchAddr();
});

document.querySelector('#post').addEventListener('click', function(){
	searchAddr();
});



//생년월일 출력 함슈
//옵션 태그 생성하는 함수
function makeOptions(){
	var date=new Date();
	var currYear=date.getFullYear();

	var year=document.querySelector('#year');
	var month=document.querySelector('#month');
	var date=document.querySelector('#date');

	var yearIndex=0, monthIndex=0, dateIndex=0;

	//반복문으로 현재 년 - 100 까지 option 태그 생성
	for(var i=currYear-100; i<=currYear; i++){ //2020년부터 내림차순 정렬
		year.add(new Option(i+"년", i), yearIndex++);
	}

	//반복문으로 1~12월 option 태그 생성
	for(var i=12; i>=1; i--){ //1월부터 오름차순 정렬
		month.add(new Option(i+"월", i), monthIndex++);
	}

	//년도 선택 시
	year.addEventListener('change', function(){	
		makeDateOption(isLeapYear(year.value), maxDate(month.value));
	});

	//월 선택 시
	month.addEventListener('change', function(){
		makeDateOption(isLeapYear(year.value), maxDate(month.value));
	});

	//년, 월 선택에 따라 다른 option 태그를 생성하는 함수
	function makeDateOption(y, d){
		//년, 월 선택에 따른 option 태그 생성을 위한 초기화
		$('#date option').remove();
		
		//년 혹은 월 값이 없는 경우
		if(y==undefined || !Number.isInteger(d)){ 
			return;
		}
		
		//윤년 2월인 경우
		if(y==true && d==28){
			d=29;
		}
		
		//년, 월에 따라 일수 다르게 출력
		for(var i=d; i>=1; i--){ //1부터 오름차순 정렬
			date.add(new Option(i+"일", i), dateIndex++);
		}
	}//makeDateOption end


	//선택한 년도를 전달받아 윤년인지 아닌지 확인하는 함수
	function isLeapYear(y){
		if(y%4==0 && y/100!=0 || y%400==0){ //윤년일 경우
			return true;
		}
		return false;
	}//isLeapYear end


	//선택한 월을 전달받아 최대 일수를 반환하는 함수
	function maxDate(m){
		var thirty = [4, 6, 9, 11]; //일수가 30일인 달
		var thirtyOne = [1, 3, 5, 7, 8, 10, 12]; //일수가 31일인 달
		
		for(i in thirty){
			if(thirty[i]==m) return 30;
		}
		
		for(i in thirtyOne){
			if(thirtyOne[i]==m) return 31;
		}
		
		if(m==2) return 28; //2월인 경우
	}//maxDate end
}
    
makeOptions();




//체크 기능
$("#termsAllChk").change(function(){
	var state = $(this).prop("checked");
	if(state){
		$("input[type='checkbox']").prop("checked", true);
	}else{
		$("input[type='checkbox']").prop("checked", false);
	}
});



//유효성 검샤
$("#male").prop("checked", true);
/*
$("#joinForm").submit(function() {
	
	if($("#id").val()=="") {
		$("#idMsg").text("아이디를 입력해주세요.");
		$("#id").focus();
		return false;
	}
	
	var idCheck=$("#idCheckBtn").val();
	if(idCheck=="N"){
		$("#idMsg").text("아이디 중복확인을 해주세요.");		
		return false;
	}
	
	var idReg =/^[a-zA-Z0-9]\w{5,19}$/g;
	if(!idReg.test($("#id").val())) {
		$("#idMsg").text("아이디를 형식에 맞게 입력해주세요.");
		$("#id").focus();
		return false;
	}
	
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
	
	if($("#passwd").val()!=$("#repass").val()){
		$("#repassMsg").text("입력한 비밀번호가 다릅니다.");
		$("#repass").focus();
		return false;		
	}

	if($("#name").val()=="") {
		$("#nameMsg").text("이름을 입력해 주세요.");
		$("#name").focus();
		return false;
	}
	var nameReg=/^[가-힣]{2,10}$/g;
	if(!nameReg.test($("#name").val())) {
		$("#nameMsg").text("이름을 형식에 맞게 입력해 주세요.");
		$("#name").focus();
		return false;
	}
	
	if($("#phone").val()=="") {
		$("#phoneMsg").text("전화번호를 입력해 주세요.");
		$("#phone").focus();
		return false;
	}
	var phoneReg=/^[0-9]{10,11}$/g;
	if(!phoneReg.test($("#phone").val())) {
		$("#phoneMsg").text("전화번호를 형식에 맞게 입력해 주세요.");
		$("#phone").focus();
		return false;
	}

	if($("#email").val()=="") {
		$("#emailMsg").text("이메일을 입력해 주세요.");
		$("#email").focus();
		return false;
	}
	var emailReg=/^([a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+(\.[-a-zA-Z0-9]+)+)*$/g;
	if(!emailReg.test($("#email").val())) {
		$("#emailMsg").text("이메일을 형식에 맞게 입력해 주세요.");
		$("#email").focus();
		return false;
	}
	
	if($("#post").val()=="") {
		$("#postMsg").text("주소를 입력해 주세요.");
		$("#post").focus();
		return false;
	}
	if($("#add1").val()=="") {
		$("#postMsg").text("주소를 입력해 주세요.");
		$("#post").focus();
		return false;
	}
	if($("#add2").val()=="") {
		$("#postMsg").text("주소를 입력해 주세요.");
		$("#post").focus();
		return false;
	}
	
	//생일 유효성 검사
	var y=year.value;
	var m=month.value;
	var d=date.value;
	if(!Number.isInteger(Number(y)) || !Number.isInteger(Number(m)) || !Number.isInteger(Number(d))){
		$("#birthMsg").text("생년월일을 입력해 주세요.");
		$("#year").focus();
		console.log(Number.isInteger(y)+", "+Number.isInteger(m)+", "+Number.isInteger(d));
		return false;
	}
	
	if($("input:checkbox[name=checkBox]").is(":checked")==false) {
		$("#joinMsg").text("약관에 동의를 해주세요.");
		return false;
	}
	
	return true;
	
});
*/



$("#idCheckBtn").click(function() {
	var userId=$("#id").val();
	//alert(userId);
	$.ajax({
		type:"get",
		url:"idCheck?userId="+userId,
		dataType:"json",
		success:function(data) {
			if(data==1 && $("#id").val!=null){
				$("#idMsg").empty();
				$("#idMsg").text("사용불가능한 아이디 입니다.");
			} else if(data==0){				
				$("#idCheckBtn").attr("value","Y");
				$("#idMsg").empty();
				$("#idMsg").text("사용가능한 아이디 입니다.");
			}
		}, 
		error:function(xhr) {
			alert("응답요류 = "+xhr.status);
		}
	});
})
	



});



