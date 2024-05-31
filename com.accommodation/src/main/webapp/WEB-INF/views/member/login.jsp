<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <h2>로그인</h2>

      </div>

    <div>

        <form action="/" method="post">
          <div class="form-group">
            <h6 style="margin-left: 100px;">아이디</h6>
            <input type="text" class="form-control" name="userId" placeholder="아이디 입력" style="margin-left: 300px;">
          </div>

          <h6 style="margin-left: 120px;">비밀번호</h6>
          <div class="form-group">
            <input type="text" class="form-control" name="pwd" placeholder="비밀번호 입력" style="margin-left: 300px;">
          </div>


          <input type="submit" value="로그인" class="btn btn-primary py-3 px-5" style="margin-right: -600px;">


        </form>



    </div>




  </div>
  </div>

  <strong><a href="/idSearch" style="color: black; text-align: end"  >계정 찾기 / </a>
  <a href="/pwdSearch" style="color: black;" >비밀번호 찾기</a></strong>
  <br/><br/>



  <strong> <p> 아직 회원이 아니신가요?  <a href="/register"> 회원가입 </a> click</p></strong>


</section>















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