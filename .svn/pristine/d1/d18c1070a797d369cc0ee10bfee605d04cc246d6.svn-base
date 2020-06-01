<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="csInfo">
    <div id="section01">
        <p class="csTitle">고객 센터</p>
    </div>
    <div id="section02">
        <div class="csTab">
            <div class="csTab1"><a href="${pageContext.request.contextPath}/cs" class="on">공지사항</a></div>
            <div class="csTab2"><a>이용안내</a></div>
            <div class="csTab3"><a href="${pageContext.request.contextPath}/faq">FAQ</a></div>
            <div class="csTab4"><a href="${pageContext.request.contextPath}/qna">1:1 문의</a></div>
        </div>
    </div>
    <div id="section03">
        <div class="notice on">
            <div class="noticeListCont">
                <div class="noticeListPart">
                    <span>NO</span>
                    <span>분류</span>
                    <span>제목</span>
                    <span>등록일</span>
                </div>
                <div class="noticeList">
                    <div class="noticeNo">${rn }</div>
                    <div class="noticeGroup">${csInfoList.csCategory }</div>
                    <div class="noticeTitle">${csInfoList.csTitle }</div>
                    <div class="noticeDate">${csInfoList.csDate }</div>
                </div>
                <div class="noticeInfo">
                    ${csInfoList.csContents }
                </div>
                <div class="noticeListBtn">
                    <a href="${pageContext.request.contextPath}/cs"><span>목록</span></a>
                </div>
            </div>
        </div>
    </div>
</div>