# ticketfinder 티켓 예매 사이트
Spring MVC Web Project


# 설명

현재 운영되고 있는 티켓 예매 사이트를 모방하여 만든 티켓 예매 사이트.

Spring Framework 와 다양한 기술을 활용하여 웹 사이트 구축.


# 개발환경
HTML5 & CSS3 & JavaScript & JQuery

Spring F/W, Mybatis, AJAX, webpack

Oracle SQL Developer

Apache Tomcat 9.0.6



# 프로젝트 내용
### 메인페이지
- 로그인 상태와 권한에 따라 다른 메뉴 출력, 검색 기능
- 상단 배너 : 좌우 화살표 및 하단 포스터 선책으로 매너 이동 - 전체 장르 중 최신 인기 공연 출력


![image](https://user-images.githubusercontent.com/66250890/152121477-85268c7e-e6e4-4990-b470-f067686cf680.png)

### 장르별 페이지
- 포스터 클릭 시 해당 공연의 상세 페이지로 이동
- 장르별 주간 랭킹 출력 
- 지역을 나눠서 3가지 공연 랜덤 출력
- 장르별 주간랭킹순, 신상품순, 종료임박순, 상품명순 선택 출력


![image](https://user-images.githubusercontent.com/66250890/152121682-e3b073ed-bb6d-44d0-b48a-309704b5c861.png)

### 랭킹페이지
- 장르별 판매 순위 출력 
- 공연 포스터 클릭 시 해당 공연 상세페이지 이동
- 장르 TAB 클릭 시 장르별 판매 순위 변경
- 일간, 주간, 월간 클릭 시 판매 순위 변경


![image](https://user-images.githubusercontent.com/66250890/152122063-f433e0b4-6304-4d1a-acbe-bec8f8989464.png)

### 예매 결제 페이지 - 좌석선택
- 상단에 선택 공연에 대한 정보 출력
- 예매된 좌석은 옅은 회색을 출력되면 선택 불가, 좌석 선택 시 빨간색으로 변경. 재클릭 시 선택 해제 가능
- 우측 선택 좌석 정보 출력


![image](https://user-images.githubusercontent.com/66250890/152122272-84834c60-1dd6-4b86-a9e4-44e305e96bf5.png)

### 예매 결제 페이지 - 결제
- 좌측 영역 : 수령방법, 주문자 정보 확인, 결제 방법 영역
- 약관 미선택 시 경고창 발생
- 우측 영역 : 예매중인 공연의 상세 정보 출력
- 이전 버튼 클릭 시 선택한 좌석 정보 초기화
- 좌석 선택 완료 버튼 클릭 시 결제 창이 닫히고 예매 상세 페이지로 이동


![image](https://user-images.githubusercontent.com/66250890/152122364-7e5407af-22c2-46b4-841c-32bdccd1e55e.png)

### 관리자 페이지
- 웹 네비게이션을 통해 페이지 이동
- 현재 상영 중인 공연 목록 출력
- 오늘 주문, 미입금, 티켓 발권 필요 수, 티켓 발송 건수 확인
- 오늘, 어제 취소, 환불, 매출, 가입자(가입자는 오늘만) 출력
- 10일 전 ~ 오늘까지의 날짜별 주문 액수 그래프 출력
- 10일 전 ~ 오늘까지의 장르별 주문 건수 그래프 출력


![image](https://user-images.githubusercontent.com/66250890/152122443-dd0f134a-1cf8-4187-843a-c0923b2185b1.png)



# 데이터 베이스
![티켓파인더 PPT pptx](https://user-images.githubusercontent.com/66250890/100743406-98602380-341f-11eb-892f-7f8b54e41d92.png)
