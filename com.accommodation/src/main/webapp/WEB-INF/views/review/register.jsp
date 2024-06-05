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


  <style>

    #myform fieldset{
      display: inline-block;
      direction: rtl;
      border:0;
    }
    #myform fieldset legend{
      text-align: right;
    }
    #myform input[type=radio]{
      display: none;
    }
    #myform label{
      font-size: 3em;
      color: transparent;
      text-shadow: 0 0 0 #f0f0f0;
    }
    #myform label:hover{
      text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
    }
    #myform label:hover ~ label{
      text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
    }
    #myform input[type=radio]:checked ~ label{
      text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
    }
    #reviewContents {
      width: 100%;
      height: 150px;
      padding: 10px;
      box-sizing: border-box;
      border: solid 1.5px #D3D3D3;
      border-radius: 5px;
      font-size: 16px;
      resize: none;
    }
  </style>
</head>
<body>


<jsp:include page="../main/header.jsp"></jsp:include>


<br/><br/><br/>
<div>
  <!-- Hero area Start-->
  <div class="container">
    <div class="row">
      <div class="col-xl-12">
        <div class="slider-area">

          <div class="hero-caption hero-caption2">


          </div>
        </div>
      </div>
    </div>
  </div>

  <!--  Hero area End -->
  <!-- Blog Area Start -->
  <form:form class="mb-3" name="reviewInsert" action="/reviewInsert" id="myform" method="post"  modelAttribute="reviewInsertDto"  novalidate="novalidate"
        enctype="multipart/form-data">
    <div style="text-align: center">
      <div class="comment-form">
        <h3>리뷰등록</h3>
        <input type="hidden" name="memberId" value="${reviewInsertDto.memberId}"/>
        <input type="hidden" name="reservationId" value="${reviewInsertDto.reservationId}"/>
        <input type="hidden" name="accommodationId" value="${reviewInsertDto.accommodationId}"/>
        <input type="hidden" name="roomId" value="${reviewInsertDto.roomId}"/>





        <br/><br/><br/>

        <div class="row">
          <div class="col-12">
            <div class="form-group">

              <div class="col-sm-6">
                <div class="form-group">

                  <div class="col-sm-6">
                    <div class="form-group">




                      <fieldset id="grade" >
                        <span class="text-bold"  style="margin-right: 1330px;" ></span>
                        <input type="hidden" placeholder="평점"  value="평점"
                                style="margin-left: 30px;"/>

                        <h5 style="margin-right: 160px;">평점</h5>
                        <input type="radio" name="grade"  value="5" id="rate1"><label
                              for="rate1">★</label>
                        <input type="radio" name="grade" value="4" id="rate2"><label
                              for="rate2">★</label>
                        <input type="radio" name="grade" value="3" id="rate3"><label
                              for="rate3">★</label>
                        <input type="radio" name="grade" value="2" id="rate4"><label
                              for="rate4">★</label>
                        <input type="radio" name="grade" value="1" id="rate5"><label
                              for="rate5">★</label>
                      </fieldset>


                    </div>
                  </div>
                  <div class='addInput'>
                  <input type="file" name="file" id="fileList" style="margin-left: 500px;">
                  </div>

                  <br/> <br/>

                  <input class="form-control" name="reviewSubject" id="reviewSubject"  type="text" placeholder="제목"
                         style="width : 500px; height : 40px; margin-left: 575px;" >

                </div>
              </div>




              <textarea  name="reviewContent" id="reviewContent" cols="100" rows="15"
                         placeholder=" 내용: "></textarea>
            </div>
          </div>



            <br/>


          <div class="form-group" style="margin-left: 800px;" >
            <input type="submit" id="reviewInsert" value="리뷰등록" class="btn btn-primary py-3 px-5">
          </div>

          <div class="form-group">
            <input type="button" value="뒤로가기" class="btn btn-primary py-3 px-5" onclick="history_back();">
          </div>



        </div>
        <%--                        </form>--%>
      </div>
    </div>
  </form:form>
</div>
<!-- Blog Area End -->
</main>



<br/><br/><br/><br/><br/><br/><br/>
<br/><br/><br/><br/>

<jsp:include page="../main/footer.jsp"></jsp:include>


<script>


  $('#fileList').change(function (){

    $('#imgDelete').remove();

    $('.addInput').append('<a id="imgDelete" style="color: red; margin-right: 30px;" onclick="imgDelete();">X</a>');



  });
  function imgDelete() {
    $('#imgDelete').remove();
    $('#fileList').val('');
  }






$('#reviewInsert').click(function (){



  if($('#reviewSubject').val()==''){

    alert('리뷰제목을 입력하세요');
    return false;
  }

  if($('#reviewContent').val()==''){

    alert('리뷰내용을 입력하세요');
    return false;

    if($('#fileList').val()==''){
      alert('이미지 파일을 선택하세요!');
      return false;
    }
  }








});


function history_back() {
  history.back();
}

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