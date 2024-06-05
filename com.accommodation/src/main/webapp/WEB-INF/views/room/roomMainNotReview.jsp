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
          <form:form action="/accommodationMainSearchCity" method="post" modelAttribute="accommodationMainListDto">
            <div class="fields">

              <div class="form-group">
                <div class="select-wrap one-third">
                  <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                  <select name="accommodationDistrict" id="accommodationDistrictOption"  class="form-control" placeholder="Keyword search">
                    <c:if test="${accommodationMainListDto.accommodationDistrict!=null}">
                    <option value="${accommodationMainListDto.accommodationDistrict}" selected="selected" >${accommodationMainListDto.accommodationDistrict}</option>
                    <option value="전체">전체</option>
                    <option value="서울">서울</option>
                    <option value="부산">부산</option>
                    <option value="제주">제주</option>
                    <option value="경기">경기</option>
                    <option value="인천">인천</option>
                    <option value="강원">강원</option>
                    <option value="경상">경상</option>
                    <option value="전라">전라</option>
                    <option value="충청">충청</option>

                  </select>
                  </c:if>

                  <c:if test="${accommodationMainListDto.accommodationDistrict==null}">
                    <option value="선택" selected="selected" disabled>선택</option>
                    <option value="전체">전체</option>
                    <option value="서울">서울</option>
                    <option value="부산">부산</option>
                    <option value="제주">제주</option>
                    <option value="경기">경기</option>
                    <option value="인천">인천</option>
                    <option value="강원">강원</option>
                    <option value="경상">경상</option>
                    <option value="전라">전라</option>
                    <option value="충청">충청</option>
                    </select>
                  </c:if>
                </div>
              </div>

              <div class="select-wrap one-third">
                <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                <c:if test="${accommodationMainListDto.accommodationCity!=null}">
                  <select name="accommodationCity" id="subCategory" class="form-control" placeholder="지역선택">
                    <option value="${accommodationMainListDto.accommodationCity}" selected="selected" >${accommodationMainListDto.accommodationCity}</option>


                  </select>
                </c:if>

                <c:if test="${accommodationMainListDto.accommodationCity==null}">
                  <select name="accommodationCity" id="subCategory" class="form-control" placeholder="지역선택">
                    <option value="선택" selected="selected" >선택</option>


                  </select>
                </c:if>
              </div>



              <div class="form-group">
                <input type="submit" value="Search" class="btn btn-primary py-3 px-5">
              </div>
            </div>
          </form:form>
        </div>

      </div>
      <div class="col-lg-9">
        <div class="row">
          <div class="col-md-12 ftco-animate">
            <div class="single-slider owl-carousel">

              <div class="item">
                <c:forEach var="accommodationDetailList" items="${accommodationDetailList}">
                <div class="hotel-img" style="background-image: url(${accommodationDetailList.accommodationImagePath});"></div>

              </div>
            </div>
            </div>
          </div>



          <div class="col-md-12 hotel-single mt-4 mb-5 ftco-animate">
            <span>${accommodationDetailList.accommodationCategory}</span>
            <h2>${accommodationDetailList.accommodationName}</h2>
            <p class="rate mb-5">
              <span class="loc"><a href="#"><i class="icon-map"></i>${accommodationDetailList.accommodationAddress}</a></span>
              <span class="star">














    							</span>
            </p>
            <p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.</p>
            <div class="d-md-flex mt-5 mb-5">

                ${accommodationDetailList.accommodationInformation}

            </div>

        </c:forEach>

          <div class="col-md-12 hotel-single ftco-animate mb-5 mt-4">
            <h4 class="mb-4">방 종류</h4>
            <div class="row">
              <c:forEach var="roomMainListDto" items="${roomMainListDto}">
              <div class="col-md-4">
                <div class="destination">
                  <a href="/reservation?roomId=${roomMainListDto.roomId}&accommodationId=${roomMainListDto.accommodationId}" class="img img-2" style="background-image: url(${roomMainListDto.roomImagePath});"></a>
                  <div class="text p-3">
                    <div class="d-flex">
                      <div class="one">
                        <h3>${roomMainListDto.roomName}</h3>
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

                      <span style="margin-left: 70px;"><a href="/reservation?roomId=${roomMainListDto.roomId}&accommodationId=${roomMainListDto.accommodationId}">예약하기</a></span>
                    </p>
                  </div>
                </div>
              </div>
              </c:forEach>

          </div>


              <h4 class="mb-4">같은 지역 호텔</h4>
              <div class="row">


                <c:forEach var="relatedHotels" items="${relatedHotels}">

                  <div class="col-md-4 ftco-animate">
                    <div class="destination">
                      <a href="${relatedHotels.accommodationId}" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url(accommodationImg/${relatedHotels.accommodationImage});">
                        <div class="icon d-flex justify-content-center align-items-center">
                          <span class="icon-search2"></span>
                        </div>
                      </a>
                      <div class="text p-3">
                        <div >

                            <h3>${relatedHotels.accommodationName}</h3>


                          <div class="two">

                          </div>
                        </div>
                        <p></p>
                        <hr>
                        <p class="bottom-area d-flex">
                          <span><i class="icon-map-o"></i>${relatedHotels.accommodationCategory}</span>
                          <span class="ml-auto"><a href="${relatedHotels.accommodationId}">예약하기</a></span>
                        </p>
                      </div>
                    </div>
                  </div>

                </c:forEach>

              </div>


            </div>

          </div>

        </div>

      </div> <!-- .col-md-8 -->

    </div>
  </div>
</section> <!-- .section -->










  <jsp:include page="../main/footer.jsp"></jsp:include>



<script>

  $('#accommodationDistrictOption').change(function () {


    if($('#accommodationDistrictOption').val()=='전체'){

      $('#subCategory').hide();
    }

    if($('#accommodationDistrictOption').val()!='전체'){

      $('#subCategory').show();
    }

    $('#accommodationCity').val('');

    const accommodationDistrict = '';
    const accommodationDistrictOption = $('#accommodationDistrictOption').val();

    $('#accommodationDistrict').val(accommodationDistrictOption)





    $.ajax({

      type:'POST',
      url: '/accommodationDistrict',
      data: 'accommodationDistrict=' +  accommodationDistrictOption,
      dataType: 'json',

      success:function (cityDtoList){




        $('#subCategory').empty();


        for(let i = 0; i < cityDtoList.length; i++) {
          let subCategoryDTO = cityDtoList[i]


          let option = $('<option value="' + subCategoryDTO.cityName + '">' + subCategoryDTO.cityName + '</option>')



          $('#subCategory').append(option)
        }


        $('#subCategory').niceSelect('update')
      },
      error: function (a,b,c){
        console.log(a,b,c);
      }

    });





  });

</script>

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