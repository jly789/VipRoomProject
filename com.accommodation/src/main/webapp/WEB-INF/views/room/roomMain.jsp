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




<section class="ftco-section ftco-degree-bg">
  <div class="container">
    <div class="row">
      <div class="col-lg-3 sidebar">
        <div class="sidebar-wrap bg-light ftco-animate">
          <h3 class="heading mb-4">도시 검색</h3>
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
                <input type="submit" value="검색" class="btn btn-primary py-3 px-5">
              </div>
            </div>
          </form:form>
        </div>

      </div>
      <div class="col-lg-9">
        <div class="row">
          <div class="col-md-12 ftco-animate">
            <div class="">

              <div class="item">
                <c:forEach var="accommodationDetailList" items="${accommodationDetailList}">

                <img src="${accommodationDetailList.accommodationImagePath}" width="800px;" height="400px;" />

              </div>
            </div>
            </div>
          </div>



          <div class="col-md-12 hotel-single mt-4 mb-5 ftco-animate">
            <span>${accommodationDetailList.accommodationCategory}</span>
            <h2>${accommodationDetailList.accommodationName}</h2>
            <p class="rate mb-5">
              <span class="loc">${accommodationDetailList.accommodationAddress}</span> <br/><br/>
              <span class="star">



        <c:if test="${accommodationReviewGrade==null}">
          리뷰(0)

        </c:if>


        <c:if test="${accommodationReviewGrade!=null}">


           <c:if test="${accommodationReviewGrade==1}">
             <i  style="color: gold;"class="icon-star"></i>
             리뷰(${accommodationReviewTotal})
           </c:if>

          <c:if test="${accommodationReviewGrade==2}">
            <i style="color: gold;" class="icon-star"></i>
            <i style="color: gold;" class="icon-star"></i>
            리뷰(${accommodationReviewTotal})
          </c:if>

          <c:if test="${accommodationReviewGrade==3}">
            <i style="color: gold;" class="icon-star"></i>
            <i style="color: gold;" class="icon-star"></i>
            <i style="color: gold;" class="icon-star"></i>
            리뷰(${accommodationReviewTotal})
          </c:if>

          <c:if test="${accommodationReviewGrade==4}">
            <i style="color: gold;" class="icon-star"></i>
            <i style="color: gold;" class="icon-star"></i>
            <i  style="color: gold;"class="icon-star"></i>
            <i style="color: gold;" class="icon-star"></i>
            리뷰(${accommodationReviewTotal})
          </c:if>

          <c:if test="${accommodationReviewGrade==5}">
            <i class="icon-star"></i>
            <i class="icon-star"></i>
            <i class="icon-star"></i>
            <i class="icon-star"></i>
            <i class="icon-star"></i>
            리뷰(${accommodationReviewTotal})
          </c:if>

          <br/>
        <c:forEach var="accommodationReviewImg" items="${accommodationReviewImg}">

          <a href="/review/${accommodationReviewImg.reviewId}">
            <img src="${accommodationReviewImg.reviewFilePath}" style="width: 100px; height: 100px;"/>

          </a>

        </c:forEach>

        </c:if>









    							</span>
            </p>
            <p><strong>



                  ${accommodationDetailList.accommodationInformation}<br/><br/>


              ※ 체크인 15시 체크아웃 11시 <br/>
              익스프레스 체크아웃: 추가 결제 금액이 없는 경우 로비 키 드롭 박스에 객실 키를 반납하실 수 있습니다.  <br/><br/>
              ※스마트 체크인 서비스 도입 안내  <br/>
              비대면으로 빠르게 체크인 가능 | 키오스크 위치: 1층 로비, 지하 1층 주차장 <br/>
              체크인 당일 오전 10시 이후 알림문자 전송 <br/>
              모바일 체크인 및 키오스크에서 객실키 수령 후 체크인 진행 <br/><br/>
              ※ 주차(발렛) 요금 <br/>
              투숙객 10,000원/박 | 체크아웃 당일 12시까지 | 객실 당 1대 정산 및 출차 요청은 지하 1층 주차데스크에서 가능합니다 |<br/> 문의 010 2089 3971 <br/>
              주차불가 상품 및 추가 차량은 1대 당 45,000원의 비용이 발생합니다. <br/>
              체크아웃 시간대에는 출차가 지연될 수 있습니다 많은 양해 부탁드립니다. <br/><br/>
              ※인원 추가 정보 <br/>
              기준 인원 외 추가 시, 1인 22,000원 (영유아 포함) <br/>
              영유아 인원수 포함 / 최대 인원 초과 불가 <br/>
              침구 추가 가능 (유료 / 사전 문의 필수) <br/>
              현장 결제 및 추가 비용 호텔 프론트 문의 <br/><br/>
              ※ 필 (必) 환경 캠페인 <br/>
              일회용품 칫솔&고체 치약 세트 1EA 2,500원 / 면도기 1EA 1,000원 프런트데스크에서 구매 가능합니다. <br/><br/>
              ※ 인터넷 | 와이파이 <br/>
              아이디: GLAD COEX / 비밀번호: 없음 <br/><br/>
              ※ 금연 <br/>
              흡연 구역(10층 야외 부스)외 호텔 객실 및 복도에서 흡연하시면 특별 정비 비용 20만원이 부과됩니다. <br/><br/>
              ※ 부대시설 <br/>
              조식 (지하 2층 - 프로젝트룸) 07:00 ~ 09:30 (Last Order 09:00) 기본메뉴: 아메리칸 브렉퍼스트 <br/>
              변경 가능 메뉴: 한식 메뉴 (변경 원할시, 체크인시 프론트 사전 요청 필수) <br/>
              카페 지(1층)
              월~금 08:00 ~ 18:00 | 토~일 휴무 | 브레이크 타임 14:00 ~ 15:00 <br/>
              갓포아키(지하2층)
              월~토 17:30 ~ 24:30 (Last Order 23:20) | 일요일 휴무 | 월~목 투숙객 10% 할인 (21시 이후) <br/>
              헬스장(지하2층) 24시간 운영 / 세탁실(지하2층) 세탁 4,000원(세제 포함), 건조 4,000원 | 24시간 운영 <br/>
              루프 탑(옥상) 08:00 ~ 22:00 / 비즈니스 라운지(1층) 24시간 운영 <br/><br/>
              ※1박 / 연박 모두 동일하게 고객 노쇼 시, 1박 비용이 부과됩니다. <br/>
              노쇼(NO-SHOW): 예약을 하고 예약 취소를 하지 않은 채 투숙하지 않은 것을 의미합니다. <br/><br/>
              ※객실 체크인시 신분증 확인 및 게런티(Deposit)카드가 요청됩니다. <br/><br/>
              ※ 기타 <br/>
              친환경, 위생, 보안 문제 등을 예방하고 쾌적한 환경을 위해 호텔내 외부 배달 음식 반입은 자제해 주세요! <br/>
              기물(얼음, 식기류, 일회용품 등) 대여 서비스는 불가합니다. <br/>
              호텔 시설, 비품 파손 및 분실에 대한 비용을 청구될 수 있습니다. <br/>
              미성년자 숙박은 관련 서류 증빙 시에만 투숙 가능하며 관련 이용 기준 외 투숙 적발 시 퇴실 조치됩니다. <br/>
              객실 내 화기 물질(촛불, 라이터, 성냥 등) 사용은 불가합니다. <br/>



            </strong>


            </p>


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

                      </div>
                        <br/>
                        <p style="color: red;">${roomMainListDto.roomPrice}원</p>

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


              <h4 class="mb-4">주변 호텔</h4>
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
                              (${relatedHotels.accommodationDistrict})

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



<div class="form-group">
  <input type="button" value="뒤로가기" class="btn btn-primary py-3 px-5" onclick="history_back();" style="margin-left: 885px;">
</div>

<script>

  function history_back() {
    history.back();
  }
</script>






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


        // if(result=='1'){
        //   $('#result').text('사용 가능한 아이디입니다.');
        //   $('#checkId').val(1);


        // accommodationCityOption


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