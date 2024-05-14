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
      <div class="col-lg-3 sidebar">
        <div class="sidebar-wrap bg-light ftco-animate">
          <h3 class="heading mb-4">Find City</h3>
          <form action="#">
            <div class="fields">
              <div class="form-group">
                <input type="text" class="form-control" placeholder="Destination, City">
              </div>
              <div class="form-group">
                <div class="select-wrap one-third">
                  <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                  <select name="" id="" class="form-control" placeholder="Keyword search">
                    <option value="">Select Location</option>
                    <option value="">San Francisco USA</option>
                    <option value="">Berlin Germany</option>
                    <option value="">Lodon United Kingdom</option>
                    <option value="">Paris Italy</option>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <input type="text" id="checkin_date" class="form-control" placeholder="Date from">
              </div>
              <div class="form-group">
                <input type="text" id="checkin_date" class="form-control" placeholder="Date to">
              </div>
              <div class="form-group">
                <div class="range-slider">
		              		<span>
										    <input type="number" value="25000" min="0" max="120000"/>	-
										    <input type="number" value="50000" min="0" max="120000"/>
										  </span>
                  <input value="1000" min="0" max="120000" step="500" type="range"/>
                  <input value="50000" min="0" max="120000" step="500" type="range"/>
                  </svg>
                </div>
              </div>
              <div class="form-group">
                <input type="submit" value="Search" class="btn btn-primary py-3 px-5">
              </div>
            </div>
          </form>
        </div>
        <div class="sidebar-wrap bg-light ftco-animate">
          <h3 class="heading mb-4">Star Rating</h3>
          <form method="post" class="star-rating">
            <div class="form-check">
              <input type="checkbox" class="form-check-input" id="exampleCheck1">
              <label class="form-check-label" for="exampleCheck1">
                <p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i></span></p>
              </label>
            </div>
            <div class="form-check">
              <input type="checkbox" class="form-check-input" id="exampleCheck1">
              <label class="form-check-label" for="exampleCheck1">
                <p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i></span></p>
              </label>
            </div>
            <div class="form-check">
              <input type="checkbox" class="form-check-input" id="exampleCheck1">
              <label class="form-check-label" for="exampleCheck1">
                <p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
              </label>
            </div>
            <div class="form-check">
              <input type="checkbox" class="form-check-input" id="exampleCheck1">
              <label class="form-check-label" for="exampleCheck1">
                <p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
              </label>
            </div>
            <div class="form-check">
              <input type="checkbox" class="form-check-input" id="exampleCheck1">
              <label class="form-check-label" for="exampleCheck1">
                <p class="rate"><span><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
              </label>
            </div>
          </form>
        </div>
      </div>
      <div class="col-lg-9">
        <div class="row">
          <div class="col-md-12 ftco-animate">
            <div class="single-slider owl-carousel">

              <div class="item">
                <c:forEach var="accommodationDetailList" items="${accommodationDetailList}">
                <div class="hotel-img" style="background-image: url(${accommodationDetailList.accommodationImagePath});"></div>
                </c:forEach>
              </div>
            </div>
            </div>
          </div>



          <div class="col-md-12 hotel-single mt-4 mb-5 ftco-animate">
            <span>Our Best hotels &amp; Rooms</span>
            <h2>Luxury Hotel in Paris</h2>
            <p class="rate mb-5">
              <span class="loc"><a href="#"><i class="icon-map"></i> 291 South 21th Street, Suite 721 New York NY 10016</a></span>
              <span class="star">
    							<i class="icon-star"></i>
    							<i class="icon-star"></i>
    							<i class="icon-star"></i>
    							<i class="icon-star"></i>
    							<i class="icon-star-o"></i>
    							8 Rating</span>
            </p>
            <p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.</p>
            <div class="d-md-flex mt-5 mb-5">
              <ul>
                <li>The Big Oxmox advised her not to do so</li>
                <li>When she reached the first hills of the Italic Mountains</li>
                <li>She had a last view back on the skyline of her hometown </li>
                <li>Bookmarksgrove, the headline of Alphabet </li>
              </ul>
              <ul class="ml-md-5">
                <li>Question ran over her cheek, then she continued</li>
                <li>Pityful a rethoric question ran</li>
                <li>Mountains, she had a last view back on the skyline</li>
                <li>Headline of Alphabet Village and the subline</li>
              </ul>
            </div>
            <p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.</p>
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

          </div>

          <form action="/reservation" method="get">
          <div class="col-md-12 hotel-single ftco-animate mb-5 mt-4">
            <h4 class="mb-5">Check Availability &amp; Booking</h4>
            <div class="fields">
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <input type="text" class="form-control" placeholder="Name">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <input type="text" class="form-control" placeholder="Email">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <input type="text" id="checkin_date" class="form-control" placeholder="Date from">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <input type="text" id="checkin_date" class="form-control" placeholder="Date to">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <div class="select-wrap one-third">
                      <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                      <select name="" id="" class="form-control" placeholder="Guest">
                        <option value="0">Guest</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                      </select>
                    </div>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <div class="select-wrap one-third">
                      <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                      <select name="" id="" class="form-control" placeholder="Children">
                        <option value="0">Children</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                      </select>
                    </div>
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
          <div class="col-md-12 hotel-single ftco-animate mb-5 mt-4">
            <h4 class="mb-4">Review &amp; Ratings</h4>
            <div class="row">
              <div class="col-md-6">
                <form method="post" class="star-rating">
                  <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1">
                    <label class="form-check-label" for="exampleCheck1">
                      <p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i> 100 Ratings</span></p>
                    </label>
                  </div>
                  <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1">
                    <label class="form-check-label" for="exampleCheck1">
                      <p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i> 30 Ratings</span></p>
                    </label>
                  </div>
                  <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1">
                    <label class="form-check-label" for="exampleCheck1">
                      <p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i> 5 Ratings</span></p>
                    </label>
                  </div>
                  <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1">
                    <label class="form-check-label" for="exampleCheck1">
                      <p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i> 0 Ratings</span></p>
                    </label>
                  </div>
                  <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1">
                    <label class="form-check-label" for="exampleCheck1">
                      <p class="rate"><span><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i> 0 Ratings</span></p>
                    </label>
                  </div>
                </form>
              </div>
            </div>
          </div>
          <div class="col-md-12 hotel-single ftco-animate mb-5 mt-5">
            <h4 class="mb-4">Related Hotels</h4>


            <div class="row">
              <div class="col-md-4">
                <div class="destination">
                  <a href="hotel-single.html" class="img img-2"></a>
                  <div class="text p-3">
                    <div class="d-flex">
                      <div class="one">
                        <h3><a href="hotel-single.html">Hotel, Italy</a></h3>
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
                        <span class="price per-price">$40<br><small>/night</small></span>
                      </div>
                    </div>
                    <p>Far far away, behind the word mountains, far from the countries</p>
                    <hr>
                    <p class="bottom-area d-flex">
                      <span><i class="icon-map-o"></i> Miami, Fl</span>
                      <span class="ml-auto"><a href="#">Book Now</a></span>
                    </p>
                  </div>
                </div>
              </div>
              <div class="col-md-4">
                <div class="destination">
                  <a href="hotel-single.html" class="img img-2" style="background-image: url(images/hotel-2.jpg);"></a>
                  <div class="text p-3">
                    <div class="d-flex">
                      <div class="one">
                        <h3><a href="hotel-single.html">Hotel, Italy</a></h3>
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
                        <span class="price per-price">$40<br><small>/night</small></span>
                      </div>
                    </div>
                    <p>Far far away, behind the word mountains, far from the countries</p>
                    <hr>
                    <p class="bottom-area d-flex">
                      <span><i class="icon-map-o"></i> Miami, Fl</span>
                      <span class="ml-auto"><a href="#">Book Now</a></span>
                    </p>
                  </div>
                </div>
              </div>
              <div class="col-md-4">
                <div class="destination">
                  <a href="hotel-single.html" class="img img-2" style="background-image: url(images/hotel-3.jpg);"></a>
                  <div class="text p-3">
                    <div class="d-flex">
                      <div class="one">
                        <h3><a href="hotel-single.html">Hotel, Italy</a></h3>
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
                        <span class="price per-price">$40<br><small>/night</small></span>
                      </div>
                    </div>
                    <p>Far far away, behind the word mountains, far from the countries</p>
                    <hr>
                    <p class="bottom-area d-flex">
                      <span><i class="icon-map-o"></i> Miami, Fl</span>
                      <span class="ml-auto"><a href="#">Book Now</a></span>
                    </p>

                  </div>

                </div>

              </div>

            </div>

          </div>

        </div>

      </div> <!-- .col-md-8 -->

    </div>
  </div>
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