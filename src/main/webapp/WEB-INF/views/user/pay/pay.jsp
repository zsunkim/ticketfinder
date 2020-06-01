<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Ticket Finder 결제화면</title>
	<%-- jQuery 라이브러리 및 Fontawesome 라이브러리 --%>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	
	<%-- 공통 CSS 및 JS 파일 --%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/book.css"/>
	
	<%-- 파비콘 link 태그 --%>
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/common/favicon.ico" type="image/x-icon">
</head>
<body id="pay">
	<script>
		opener.location.href="${pageContext.request.contextPath}/book_detail/${orderCode}";
		window.close();
		//window.location.href="${pageContext.request.contextPath}/book_detail/${orderCode}";
	</script>
</body>




