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
  <div class="container" style="text-align: center" >
    <div class="row d-flex mb-5 contact-info">
      <div class="col-md-12 mb-4">
        <h2>아이디 찾기</h2>
        <c:if test="${idSearch!=null}">
          <h6 style="color: red;">찾는 아이디: ${idSearch}</h6>
        </c:if>

        <c:if test="${exists !=null}">
          <h6 style="color: red">해당 정보는 없습니다.</h6>
        </c:if>

      </div>

    <div>

        <form:form action="/idSearch" method="post" modelAttribute="memberSearchDto">
          <div class="form-group">
            <h6 style="margin-left: 100px;">이름</h6>
            <input type="text" class="form-control" name="userName" value="${memberSearchDto.userName}" placeholder="이름 입력" style="margin-left: 300px;">
            <div style="margin-left: 160px;">
            <form:errors path="userName" cssStyle="font-weight: bold; color: #e95050" cssClass="text-center" ></form:errors>
            </div>
          </div>

          <h6 style="margin-left: 120px;">이메일</h6>
          <div class="form-group">
            <input type="text" class="form-control" name="email" value="${memberSearchDto.email}" placeholder="이메일 입력" style="margin-left: 300px;">
            <div style="margin-left: 265px;">
            <form:errors path="email"  cssStyle="font-weight: bold; color: #e95050" cssClass="text-center" ></form:errors>
            </div>
          </div>


          <input type="submit" value="아이디찾기" class="btn btn-primary py-3 px-5" style="margin-right: -600px;">


        </form:form>



    </div>




  </div>
  </div>

  <p>이미 아이디를 가지고 계신가요? <a href="/login"> 로그인 </a>click</p>
  <strong> <p> 아직 회원이 아니신가요?  <a href="/register"> 회원가입 </a> click</p></strong>





</section>













  <br/><br/><br/><br/><br/><br/><br/><br/>

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