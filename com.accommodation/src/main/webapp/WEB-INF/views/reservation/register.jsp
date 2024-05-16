<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>



<c:set var="cp" value="<%=request.getContextPath()%>"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>DirEngine - Free Bootstrap 4 Template by Colorlib</title>
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


<c:forEach var="accommodationDetailList" items="${accommodationDetailList}">

<div class="hero-wrap js-fullheight" style="background-image: url(${accommodationDetailList.accommodationImagePath});">

  </c:forEach>
  <div class="overlay"></div>
  <div class="container">
    <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
      <div class="col-md-9 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
        <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="index.html">Home</a></span> <span class="mr-2"><a href="hotel.html">Hotel</a></span> <span>Hotel Single</span></p>
        <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Hotels Details</h1>
      </div>
    </div>
  </div>
</div>


<section class="ftco-section ftco-degree-bg">
  <div class="container">
    <div class="row">




      <div class="col-lg-9">
        <div class="row">
          <div class="col-md-12 ftco-animate">
            <div class="single-slider owl-carousel">

              <div class="item">
                <c:forEach var="roomSpecificListDto" items="${roomSpecificListDto}">
                <div class="hotel-img" style="background-image: url(${roomSpecificListDto.roomImagePath});"></div>

              </div>
            </div>
          </div>
        </div>



        <div class="col-md-12 hotel-single mt-4 mb-5 ftco-animate">
          <span></span>
          <h2>${roomSpecificListDto.roomName}</h2>

          <p class="rate mb-5">
            <span class="loc"><a href="#"><i class="icon-map"></i></a></span>
            <span class="star">
    							<i class="icon-star"></i>
    							<i class="icon-star"></i>
    							<i class="icon-star"></i>
    							<i class="icon-star"></i>
    							<i class="icon-star-o"></i>
    							8 Rating</span>
          </p>
          <h6> 기준 ${roomSpecificListDto.standardNumbers}인 / 최대  ${roomSpecificListDto.maximumCapacity}인</h6>

        <div class="d-md-flex mt-5 mb-5">




              ${roomSpecificListDto.roomDescription}

          </div>

            <p>숙박<br/>
              ${roomSpecificListDto.roomPrice}원</p>

          <br/>

          <form action="/reservationPayment" method="post">
            <div class="col-md-12 hotel-single ftco-animate mb-5 mt-4">
              <h4 class="mb-5">예약하기</h4>
              <div class="fields">
                <div class="row">


                  <div class="col-md-6">
                    <div class="form-group">
                      <h6>Check In</h6>
                      <input type="date" name="reservationCheckIn" id="reservationCheckIn" class="form-control" v placeholder="체크인">
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group">
                      <h6>Check Out</h6>
                      <input type="date" name="reservationCheckOut" id="reservationCheckOut" class="form-control" placeholder="체크아웃">
                    </div>
                  </div>

                  <div class="col-md-6">
                    <div class="form-group">
                      <input type="hidden" class="form-control" name="roomId" id="roomId" value="${roomSpecificListDto.roomId}">
                      <input type="hidden" class="form-control" name="accommodationId" id="accommodationId" value="${roomSpecificListDto.accommodationId}">
                      <input type="hidden" class="form-control" name="roomPrice" value="${roomSpecificListDto.roomPrice}">

                    </div>
                  </div>



                  <div class="col-md-12">
                    <div class="form-group">
                      <input type="submit" value="예약하기" class="btn btn-primary py-3">
                    </div>
                  </div>
                </div>
              </div>
            </div>

          </form>

         </c:forEach>

<%--          <div class="col-md-12 hotel-single ftco-animate mb-5 mt-4">--%>
<%--            <h4 class="mb-4">Our Rooms</h4>--%>
<%--            <div class="row">--%>
<%--              <c:forEach var="roomMainListDto" items="${roomMainListDto}">--%>
<%--                <div class="col-md-4">--%>
<%--                  <div class="destination">--%>
<%--                    <a href="hotel-single.html" class="img img-2" style="background-image: url(${roomMainListDto.roomImagePath});"></a>--%>
<%--                    <div class="text p-3">--%>
<%--                      <div class="d-flex">--%>
<%--                        <div class="one">--%>
<%--                          <h3><a href="hotel-single.html">${roomMainListDto.roomName}</a></h3>--%>
<%--                          <p class="rate">--%>
<%--                            <i class="icon-star"></i>--%>
<%--                            <i class="icon-star"></i>--%>
<%--                            <i class="icon-star"></i>--%>
<%--                            <i class="icon-star"></i>--%>
<%--                            <i class="icon-star-o"></i>--%>
<%--                            <span>8 Rating</span>--%>
<%--                          </p>--%>
<%--                        </div>--%>
<%--                        <div class="two">--%>
<%--                          <span class="price per-price"><br><small>${roomMainListDto.roomPrice}원</small></span>--%>
<%--                        </div>--%>
<%--                      </div>--%>
<%--                      <p>기준 ${roomMainListDto.standardNumbers}인 / 최대 ${roomMainListDto.maximumCapacity}인 </p>--%>
<%--                      <hr>--%>
<%--                      <p class="bottom-area d-flex">--%>

<%--                        <span style="margin-left: 70px;"><a href="#">예약하기</a></span>--%>
<%--                      </p>--%>
<%--                    </div>--%>
<%--                  </div>--%>
<%--                </div>--%>
<%--              </c:forEach>--%>

<%--            </div>--%>




    </div>


          <div class="col-md-12 hotel-single ftco-animate mb-5 mt-4">
            <h4 class="mb-4">Our Rooms</h4>
            <div class="row">
              <c:forEach var="roomMainListDto" items="${roomMainListDto}">
              <div class="col-md-4">
                <div class="destination">
                  <a href="hotel-single.html" class="img img-2" style="background-image: url(${roomMainListDto.roomImagePath});"></a>
                  <div class="text p-3">
                    <div class="d-flex">
                      <div class="one">
                        <h3><a href="hotel-single.html">${roomMainListDto.roomName}</a></h3>
                        <p class="rate">
                          <i class="icon-star"></i>
                          <i class="icon-star"></i>
                          <i class="icon-star"></i>
                          <i class="icon-star"></i>
                          <i class="icon-star-o"></i>
                          <span>8 Rating</span>
                        </p>
                      </div>
                      <div class="two">
                        <span class="price per-price"><br><small>${roomMainListDto.roomPrice}원</small></span>
                      </div>
                    </div>
                    <p>기준 ${roomMainListDto.standardNumbers}인 / 최대 ${roomMainListDto.maximumCapacity}인 </p>
                    <hr>
                    <p class="bottom-area d-flex">

                      <span style="margin-left: 70px;"><a href="#">예약하기</a></span>
                    </p>
                  </div>
                </div>
              </div>
              </c:forEach>
</section> <!-- .section -->










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