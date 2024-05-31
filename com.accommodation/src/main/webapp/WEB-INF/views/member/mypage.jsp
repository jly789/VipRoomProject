<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>



<c:set var="cp" value="<%=request.getContextPath()%>"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>VIP ROOM</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


  <link href="https://fonts.googleapis.com/css?family=Alex+Brush" rel="stylesheet">

  <link rel="stylesheet" href="/resources/css/open-iconic-bootstrap.min.css">
  <link rel="stylesheet" href="/resources/css/animate.css">

  <link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
  <link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">
  <link rel="stylesheet" href="/resources/css/magnific-popup.css">

  <link rel="stylesheet" href="/resources/css/aos.css">

  <link rel="stylesheet" href="/resources/css/ionicons.min.css">

  <link rel="stylesheet" href="/resources/css/bootstrap-datepicker.css">
  <link rel="stylesheet" href="/resources/css/jquery.timepicker.css">


  <link rel="stylesheet" href="/resources/css/flaticon.css">
  <link rel="stylesheet" href="/resources/css/icomoon.css">
  <link rel="stylesheet" href="/resources/css/style.css">

</head>
<body>


<jsp:include page="../main/header.jsp"></jsp:include>











<div style="text-align: center;">

  <section class="ftco-section contact-section ftco-degree-bg">
    <div class="container" style="margin-right: 300px; >
      <div class="row d-flex mb-5 contact-info">
    <div class="col-md-12 mb-4">
      <h2>내 정보</h2>
      <div class="form-group" >
        <form action="/myReservation" method="get">
        <input type="submit" id="notice" value="My 예약" class="btn btn-primary py-3 px-5"style="margin-left: 950px;">
        </form>

      </div>
    </div>

    <div>

      <form:form action="/mypageUpdate" method="post">
        <c:forEach items="${memberFindDto}" var="memberFindDto">
        <div class="form-group">
          <h6 style="margin-right: 1060px; color: red;">아이디</h6>
         <input type="text" readonly class="form-control" name="userId" id="userId" value="${memberFindDto.userId}" placeholder="아이디 입력"/>




        </div>

        <%--            result = 중복확인시 텍스트값을 뿌려준다--%>


        <div class="form-group">
          <h6 style="margin-right: 1045px; color: red;">비밀번호</h6>
          <input type="text" readonly class="form-control" name="pwd" value="${memberFindDto.pwd}" placeholder="비밀번호 입력" />

        </div>

        <div class="form-group">
          <h6 style="margin-right: 1060px; color: red;">이름</h6>
          <input type="text" readonly class="form-control" name="userName" value="${memberFindDto.userName}" placeholder="이름 입력"/>

        </div>

        <div class="form-group">
          <h6 style="margin-right: 1060px; color: red;">닉네임</h6>
          <input type="text" readonly class="form-control" name="nickName" value="${memberFindDto.nickName}" placeholder="닉네임 입력"/>

        </div>

        <div class="form-group">
          <h6 style="margin-right: 1060px; color: red;">생일</h6>
          <input type="date" readonly class="form-control" name="birth" value="${memberFindDto.birth}" placeholder="생일 입력" />

        </div>

        <div class="form-group">
          <h6 style="margin-right: 1045px; color: red;">전화번호</h6>
          <input type="tel" readonly class="form-control" name="tel" value="${memberFindDto.tel}" placeholder="전화번호 입력"/>

        </div>



        <div class="form-group">
          <h6 style="margin-right: 1045px; color: red;">우편번호</h6>
          <input type="text" readonly class="form-control" name="postcode" id="sample6_postcode" value="${memberFindDto.postcode}" placeholder="우편번호 입력" />


        </div>



        <div class="form-group">
          <h6 style="margin-right: 1060px; color: red;">주소</h6>
          <input type="text" readonly class="form-control" name="address" id="sample6_address" value="${memberFindDto.address}" placeholder="주소 입력" />

        </div>

        <div class="form-group">
          <h6 style="margin-right: 1045px; color: red;">상세주소</h6>
          <input type="text" readonly class="form-control" name="detailAddress" id="sample6_detailAddress" value="${memberFindDto.detailAddress}"  placeholder="상세주소 입력"/>

        </div>

        <div class="form-group">
          <h6 style="margin-right: 1045px; color: red;">참고사항</h6>
          <input type="text" readonly class="form-control" name="extraAddress" id="sample6_extraAddress" value="${memberFindDto.extraAddress}" placeholder="참고사항 입력" />

        </div>

        <div class="form-group">
          <h6 style="margin-right: 1045px; color: red;">이메일</h6>
          <input type="email" readonly class="form-control" name="email"  value="${memberFindDto.email}" placeholder="이메일 입력" />

        </div>

        </c:forEach>


        <input type="submit" id="register" value="정보 수정하기" class="btn btn-primary py-3 px-5" >


      </form:form>



    </div>

</div>
</div>


</section>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>













<jsp:include page="../main/footer.jsp"></jsp:include>

<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/jquery-migrate-3.0.1.min.js"></script>
<script src="/resources/js/popper.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery.easing.1.3.js"></script>
<script src="/resources/js/jquery.waypoints.min.js"></script>
<script src="/resources/js/jquery.stellar.min.js"></script>
<script src="/resources/js/owl.carousel.min.js"></script>
<script src="/resources/js/jquery.magnific-popup.min.js"></script>
<script src="/resources/js/aos.js"></script>
<script src="/resources/js/jquery.animateNumber.min.js"></script>
<script src="/resources/js/bootstrap-datepicker.js"></script>
<script src="/resources/js/jquery.timepicker.min.js"></script>
<script src="/resources/js/scrollax.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="/resources/js/google-map.js"></script>
<script src="/resources/js/main.js"></script>

</body>
</html>