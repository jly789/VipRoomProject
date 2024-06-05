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








<form:form action="/roomInsert" method="post" modelAttribute="roomInsertDto" enctype="multipart/form-data">


<div style="text-align: center;">

  <section class="ftco-section contact-section ftco-degree-bg">
    <div class="container" style="margin-right: 300px; >
      <div class="row d-flex mb-5 contact-info">
        <div class="col-md-12 mb-4">
          <h2>객실등록</h2>


        </div>




        <div>


          <select name="accommodationId" id="accommodationId">
            <option value="숙소선택" selected="selected" id="">숙소선택</option>
            <c:forEach var="accommodationFindList" items="${accommodationFindList}">
              <option value="${accommodationFindList.accommodationId}">${accommodationFindList.accommodationName}</option>
            </c:forEach>
          </select>

        <br/>   <br/>


            <div class="form-group">
              <h5 style="text-align: left;">이름</h5>
              <input type="text" class="form-control" name="roomName" id="roomName" value="${roomInsertDto.roomName}" placeholder="이름 입력" />
              <form:errors path="roomName" cssStyle="font-weight: bold; color: #e95050" cssClass="text-center" ></form:errors>
            </div>



            <div class="form-group">
              <h5 style="text-align: left;">객실 1박당 가격</h5>
              <input type="text" class="form-control" name="roomPrice" id="roomPrice"  value="${roomInsertDto.roomPrice}" placeholder="객실 1박당 가격 입력"/>

            </div>


          <div class="form-group">
            <h5 style="text-align: left;">기준인원 수</h5>
            <input type="text" class="form-control" name="standardNumbers" id="standardNumbers" value="${roomInsertDto.standardNumbers}" placeholder="객실 수 입력" />


          </div>




    <div class="form-group">
      <h5 style="text-align: left;">최대 숙박인원</h5>
      <input type="text" class="form-control" name="maximumCapacity" id="maximumCapacity"  value="${roomInsertDto.maximumCapacity}" placeholder="최대 숙박인원 입력" />


    </div>


    <div class="form-group">
      <h5 style="text-align: left;">객실소개</h5>
      <input type="text" class="form-control" name="roomDescription" id="roomDescription"  value="${roomInsertDto.roomDescription}" placeholder="객실소개 입력" />

      <form:errors path="roomDescription" cssStyle="font-weight: bold; color: #e95050"></form:errors>
    </div>


    <div class="row">
      <div class="col-lg-4">
        <div class="checkout__input">
          <div class='addInput'>
            <p>상품 이미지<span>*</span></p>
            <input type="file" name="file" id="fileList" onchange="readURL(this);">
          </div>
          <button type="button" class="btnAdd">이미지 추가</button>
        </div>
      </div>

        <br/>





      </div>
    <input type="submit" id="register" value="숙박등록" class="btn btn-primary py-3 px-5" >
    <br/>   <br/>

</form:form>


  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

  <script>


    //파일 리스트 추가
    $(document).ready(function() {
      $('.btnAdd').click(function () {
        $('.addInput').append(
                '<input type="file" name="file" id="fileList" onchange="readURL(this);"/><button type="button" class="btnRemove">삭제</button>'
        );//input file
        $('.btnRemove').on('click',function(){//this='.btnRemove'
          $(this).prev().remove();// .prev()=input file을 가리키고 remove()실행
          $(this).next().remove();//<br> 삭제
          $(this).remove();//버튼 삭제
        });
      });

    });


    $('#register').click(function (){

      if($('#accommodationId').val()=='숙소선택'){
        alert('등록할 숙소를 선택하세요!');
        return false;
      }

      if($('#roomName').val()==''){
        alert('등록할 객실이름을 입력하세요!');
        return false;
      }

      if($('#roomPrice').val()==''){
        alert('객실 1박당 가격을 입력하세요!');
        return false;
      }

      if($('#standardNumbers').val()==''){
        alert('기준 인원 수를 입력하세요!');
        return false;
      }




      if($('#maximumCapacity').val()==''){
        alert('최대 숙박인원을 입력하세요!');
        return false;
      }



      if($('#roomDescription').val()==''){
        alert('객실소개를 입력하세요!');
        return false;
      }



      if($('#fileList').val()==''){
          alert('이미지 파일을 선택하세요!');
          return false;
      }

    });




  </script>












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