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


    .design{

      width: 270px;
      height: 200px;
      border: 1px solid #ccc;
      margin-left:575px;
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
  <form action="/noticeInsert" method="post"  id="myform">
    <div style="text-align: center">
      <div class="comment-form">
        <h3>리뷰</h3>
        <br/><br/>
        <c:forEach var="reviewDetailList" items="${reviewDetailList}">



        <div class="row">
          <div class="col-12">
            <div class="form-group">

              <div class="col-sm-6">
                <div class="form-group">



                  <fieldset id="grade" >
                    <span class="text-bold"  style="margin-right: 1355px;" ></span>
                    <input type="hidden" placeholder="평점"  value="평점"
                           style="margin-left: 30px;"/>

                    <h5 style="margin-right: 150px;">평점</h5>

                    <c:if test="${reviewDetailList.reviewId==1}">

                      <input type="radio" name="grade"  value="5" id="rate1"><label
                            for="rate1" style="color: gold;">★</label>

                    </c:if>

                    <c:if test="${reviewDetailList.reviewId==2}">

                      <input type="radio" name="grade"  value="5" id="rate1"><label
                            for="rate1" style="color: gold;">★</label>
                      <input type="radio" name="grade"  value="5" id="rate1"><label
                            for="rate1" style="color: gold;">★</label>
                      <input type="radio" name="grade"  value="5" id="rate1"><label
                            for="rate1" style="color: gold;">★</label>
                      <input type="radio" name="grade"  value="5" id="rate1"><label
                            for="rate1" style="color: gold;">★</label>
                      <input type="radio" name="grade"  value="5" id="rate1"><label
                            for="rate1" style="color: gold;">★</label>

                    </c:if>

                    <c:if test="${reviewDetailList.reviewId==3}">

                      <input type="radio" name="grade"  value="5" id="rate1"><label
                            for="rate1" style="color: gold;">★</label>
                      <input type="radio" name="grade"  value="5" id="rate1"><label
                            for="rate1" style="color: gold;">★</label>
                      <input type="radio" name="grade"  value="5" id="rate1"><label
                            for="rate1" style="color: gold;">★</label>

                    </c:if>

                    <c:if test="${reviewDetailList.reviewId==4}">

                      <input type="radio" name="grade"  value="5" id="rate1"><label
                            for="rate1" style="color: gold;">★</label>
                      <input type="radio" name="grade"  value="5" id="rate1"><label
                            for="rate1" style="color: gold;">★</label>
                      <input type="radio" name="grade"  value="5" id="rate1"><label
                            for="rate1" style="color: gold;">★</label>
                      <input type="radio" name="grade"  value="5" id="rate1"><label
                            for="rate1" style="color: gold;">★</label>
                    </c:if>

                    <c:if test="${reviewDetailList.reviewId==5}">

                      <input type="radio" name="grade"  value="5" id="rate1"><label
                            for="rate1" style="color: gold;">★</label>
                      <input type="radio" name="grade"  value="5" id="rate1"><label
                            for="rate1" style="color: gold;">★</label>
                      <input type="radio" name="grade"  value="5" id="rate1"><label
                            for="rate1" style="color: gold;">★</label>
                      <input type="radio" name="grade"  value="5" id="rate1"><label
                            for="rate1" style="color: gold;">★</label>
                      <input type="radio" name="grade"  value="5" id="rate1"><label
                            for="rate1" style="color: gold;">★</label>

                    </c:if>





                  </fieldset>




                  <div contentEditable="true" id="design" class="design"><p style="text-align: left;">


                  </p>
                    <img src="${reviewDetailList.reviewFilePath}" style="width: 270px; height: 200px; margin-top: -15px; " />
                  </div>
                  <br/>


                  <input class="form-control" name="noticeSubject" id="noticeSubject"  type="text" placeholder="제목" readonly
                         style="width : 500px; height : 40px; margin-left: 575px;" value="${reviewDetailList.reviewSubject}" >

                </div>
              </div>


              <textarea  name="reviewContent" id="reviewContent"  cols="100" rows="15" readonly
              >${reviewDetailList.reviewContent}</textarea>

            </div>
          </div>

<%--          <textarea   name="noticeContent" id="noticeContent"  cols="100" rows="15" readonly>--%>


<%--          </textarea>--%>



        </c:forEach>






          <div class="form-group">
            <input type="button" value="뒤로가기" class="btn btn-primary py-3 px-5" onclick="history_back();" style="margin-left: 885px;">
          </div>



        </div>
        <%--                        </form>--%>
      </div>
    </div>
  </form>
</div>
<!-- Blog Area End -->
</main>



<br/><br/><br/><br/><br/><br/><br/>
<br/><br/><br/><br/>

<jsp:include page="../main/footer.jsp"></jsp:include>


<script>





$('#noticeInsert').click(function (){

  if($('#noticeSubject').val()==''){

    alert('제목을 입력하세요');
    return false;
  }

  if($('#noticeContent').val()==''){

    alert('내용을 입력하세요');
    return false;
  }


  if($('#noticeType').val()=='선택'){

    alert('공지유형을 선택하세요\n\nex)공지,중요');
    return false;
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