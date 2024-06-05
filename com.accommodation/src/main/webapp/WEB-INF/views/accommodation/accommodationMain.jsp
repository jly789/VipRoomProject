<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

  <style>

    a:link {
      color: red;
      text-decoration: none;
    }

    a:visited {
      color: black;
      text-decoration: none;
    }

    /* paginate */
    .paginate {
      padding: 0;
      line-height: normal;
      text-align: center;
      position: relative;
      margin: 20px 0 20px 0;
      z-index: 1;
    }

    .paginate .paging {
      text-align: center;
    }

    .paginate .paging a, .paginate .paging strong {
      margin: 0;
      padding: 0;
      width: 20px;
      height: 24px;
      line-height: 24px;
      text-align: center;
      color: #848484;
      display: inline-block;
      vertical-align: middle;
      text-align: center;
      font-size: 12px;
    }

    .paginate .paging a:hover, .paginate .paging strong {
      color: #DAA520;
      font-weight: 600;
      font-weight: normal;
    }

    .paginate .paging .direction {
      z-index: 3;
      vertical-align: middle;
      background-color: none;
      margin: 0 2px;
      border: 1px solid #777;
      border-radius: 2px;
      width: 28px;
    }

    .paginate .paging .direction:hover {
      border: 1px solid #C40639;
    }

    .paginate .paging .direction.prev {
      margin-right: 4px;
    }

    .paginate .paging .direction.next {
      margin-left: 4px;
      cursor: pointer;
    }

    .paginate .paging img {
      vertical-align: middle;
    }

    .paginate .right {
      position: absolute;
      top: 0;
      right: 0;
    }

    .bottom-left, .bottom-right {
      position: relative;
      z-index: 5;
    }

    .paginate ~ .bottom {
      margin-top: -50px;
    }


    .bottom select {
      background: transparent;
      color: #aaa;
      cursor: pointer;
    }


    /* paginate */
    .paginate {
      padding: 0;
      line-height: normal;
      text-align: center;
      position: relative;
      margin: 20px 0 20px 0;
    }

    .paginate .paging {
      text-align: center;
    }

    .paginate .paging a, .paginate .paging strong {
      margin: 0;
      padding: 0;
      width: 20px;
      height: 28px;
      line-height: 28px;
      text-align: center;
      color: #999;
      display: inline-block;
      vertical-align: middle;
      text-align: center;
      font-size: 14px;
    }

    .paginate .paging a:hover, .paginate .paging strong {
      color: #C40639;
      font-weight: 600;
      font-weight: normal;
    }

    .paginate .paging .direction {
      z-index: 3;
      vertical-align: middle;
      background-color: none;
      margin: 0 2px;
    }

    .paginate .paging .direction:hover {
      background-color: transparent;
    }

    .paginate .paging .direction.prev {
      margin-right: 4px;
    }

    .paginate .paging .direction.next {
      margin-left: 4px;
    }

    .paginate .paging img {
      vertical-align: middle;
    }

    .paginate .right {
      position: absolute;
      top: 0;
      right: 0;
    }


    .slidecontainer {
      width: 300px;
      margin-top: 100px;
    }

    .slider {
      -webkit-appearance: none; /* 기본 CSS 스타일을 적용하지 않기 위해서 */
      width: 170px; /* 슬라이더 길이 */
      height: 8px; /* 슬라이더 두께 */
      border-radius: 1px; /* 슬라이더 모서리를 약간 둥글게 */
      background: #ccc; /* 슬라이더 색상 */
      outline: none; /* 슬라이더 테두리 없이 */
    }

    /* 슬라이더 핸들(클릭해서 드래그하는 부분) 커스텀
    (Chrome, Opera, Safari, Edge 브라우저를 위해서는 -webkit-을,
    Firefox 브라우저를 위해서는 -moz- 를 사용하세요 */
    .slider::-webkit-slider-thumb {
      -webkit-appearance: none; /* 기본 CSS 스타일을 적용하지 않기 위해서 */
      appearance: none; /* 기본 CSS 스타일을 적용하지 않기 위해서 */
      width: 25px; /* 슬라이더 핸들 길이 */
      height: 25px; /* 슬라이더 핸들 높이 */
      border-radius: 50%; /* 핸들 모양을 원모양으로 만들기 위함 */
      background: gray; /* 슬라이더 핸들 색상 */
      cursor: pointer; /* 슬라이더 핸들에 마우스를 갖다대면 포인터로 변경 */
    }

    .slider::-moz-range-thumb {
      width: 100px; /* 슬라이더 핸들 길이 */
      height: 25px; /* 슬라이더 핸들 높이 */
      border-radius: 50%; /* 핸들 모양을 원모양으로 만들기 위함 */
      background: #00f; /* 슬라이더 핸들 색상 */
      cursor: pointer; /* 슬라이더 핸들에 마우스를 갖다대면 포인터로 변경 */
    }

  </style>

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
                <input type="submit" id="submit" value="검색" class="btn btn-primary py-3 px-5">
              </div>
            </div>
          </form:form>
        </div>


      </div>


      <div class="col-lg-9">
        <div class="row">



          <c:choose>


            <c:when test="${fn:length(accommodationMainList) < 2}">



            <c:forEach var="accommodationMainList" items="${accommodationMainList}">

            <div class="col-md-4 ftco-animate">
              <div class="destination">
                <a href="${accommodationMainList.accommodationId}" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url(accommodationImg/${accommodationMainList.accommodationImage});">
                  <div class="icon d-flex justify-content-center align-items-center">
                    <span class="icon-search2"></span>
                  </div>
                </a>
                <div class="text p-3">
                  <div class="d-flex">
                    <div class="one">
                      <h3>${accommodationMainList.accommodationName}</h3>

                    </div>
                    <div class="two">
                        <%--                    <span class="price per-price"><br><small>${accommodationMainList.roomPrice}원</small></span>--%>
                    </div>
                  </div>
                  <p></p>
                  <hr>
                  <p class="bottom-area d-flex">
                    <span><i class="icon-map-o"></i>${accommodationMainList.accommodationCategory}</span>
                    <span class="ml-auto"><a href="${accommodationMainList.accommodationId}">예약하기</a></span>
                  </p>
                </div>
              </div>
            </div>

            </c:forEach>








            </c:when>




          <c:when test="${fn:length(accommodationMainList) >= 4}">



          <c:forEach var="accommodationMainList" items="${accommodationMainList}">

          <div class="col-md-4 ftco-animate">
            <div class="destination">
              <a href="${accommodationMainList.accommodationId}" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url(accommodationImg/${accommodationMainList.accommodationImage});">
                <div class="icon d-flex justify-content-center align-items-center">
                  <span class="icon-search2"></span>
                </div>
              </a>
              <div class="text p-3">
                <div class="d-flex">
                  <div class="one">
                    <h3>${accommodationMainList.accommodationName}</h3>

                  </div>
                  <div class="two">
<%--                    <span class="price per-price"><br><small>${accommodationMainList.roomPrice}원</small></span>--%>
                  </div>
                </div>
                <p></p>
                <hr>
                <p class="bottom-area d-flex">
                  <span><i class="icon-map-o"></i>${accommodationMainList.accommodationCategory}</span>
                  <span class="ml-auto"><a href="${accommodationMainList.accommodationId}">예약하기</a></span>
                </p>
              </div>
            </div>
          </div>

          </c:forEach>


            <!--paginate -->
            <div class="paginate" >
              <div class="paging" style="margin-left: 200px;">
                <a class="direction prev" href="javascript:void(0);" style="color: black;"
                   onclick="movePage(1,${pagination.cntPerPage},${pagination.pageSize});">
                  &lt;&lt; </a> <a class="direction prev" href="javascript:void(0);"
                                   style="color: black;"
                                   onclick="movePage(${pagination.currentPage}<c:if
                                           test="${pagination.hasPreviousPage == true}">-1</c:if>,${pagination.cntPerPage},${pagination.pageSize});">
                &lt; </a>

                <c:forEach begin="${pagination.firstPage}"
                           end="${pagination.lastPage}" var="idx">
                  <a
                          style="color: black;
                            <c:out value="${pagination.currentPage == idx ? 'black; font-weight:700; margin-bottom: 2px;' : ''}"/> "
                          href="javascript:void(0);"
                          onclick="movePage(${idx},${pagination.cntPerPage},${pagination.pageSize});"><c:out
                          value="${idx}"/></a>
                </c:forEach>
                <a class="direction next" href="javascript:void(0);" style="color: black;"
                   onclick="movePage(${pagination.currentPage}<c:if
                           test="${pagination.hasNextPage == true}">+1</c:if>,${pagination.cntPerPage},${pagination.pageSize});">
                  &gt; </a> <a class="direction next" href="javascript:void(0);"
                               style="color: black;"
                               onclick="movePage(${pagination.totalRecordCount},${pagination.cntPerPage},${pagination.pageSize});">
                &gt;&gt; </a>
              </div>
            </div>
            <!-- /paginate -->




            </c:when>








            <c:otherwise>

            </c:otherwise>



            </c:choose>




</section> <!-- .section -->



<div class="form-group">
  <input type="button" value="뒤로가기" class="btn btn-primary py-3 px-5" onclick="history_back();" style="margin-left: 1020px;">
</div>

<script>

  //페이지 이동
  function movePage(currentPage, cntPerPage, pageSize) {

    var url = "${pageContext.request.contextPath}/accommodationMain";
    url = url + "?currentPage=" + currentPage;
    url = url + "&cntPerPage=" + cntPerPage;
    url = url + "&pageSize=" + pageSize;

    location.href = url;
  }

  function history_back() {
    history.back();
  }
</script>

<br/><br/><br/><br/><br/><br/><br/><br/>

  <jsp:include page="../main/footer.jsp"></jsp:include>


<script>

  $('#submit').click(function (){

    if($('#accommodationDistrictOption').val()==null){
      alert('도시를 선택해주세요')
      return false;
    }

  });



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