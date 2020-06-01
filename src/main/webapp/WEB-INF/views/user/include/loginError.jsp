<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
#error {text-align: center; margin:300px;}
.message {
	color: red;
	font-size: 1.5em;
	margin-bottom: 40px;
}
</style>
<div id="error">
    <div>
        <p class="message">로그인 회원만 접근 가능한 페이지입니다.</p>
        <button type="button" onclick="location.href='${pageContext.request.contextPath}/login';">로그인 페이지 이동</button>
        <button type="button" onclick="location.href='${pageContext.request.contextPath}/';">메인 페이지 이동</button>
    </div>
</div>
