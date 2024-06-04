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
  <form action="/noticeInsert" method="post">
    <div style="text-align: center">
      <div class="comment-form">
        <h3>공지사항</h3>

        <c:forEach var="noticeDetailList" items="${noticeDetailList}">
        <select name="noticeType" id="noticeType" readonly="" >
          <option value="${noticeDetailList.noticeType}">${noticeDetailList.noticeType}</option>


        </select>

        <br/><br/><br/>

        <div class="row">
          <div class="col-12">
            <div class="form-group">

              <div class="col-sm-6">
                <div class="form-group">




                  <input class="form-control" name="noticeSubject" id="noticeSubject"  type="text" placeholder="제목" readonly
                         style="width : 500px; height : 40px; margin-left: 575px;" value="${noticeDetailList.noticeSubject}" >

                </div>
              </div>




              <textarea  name="noticeContent" id="noticeContent"  cols="100" rows="15" readonly
                          >${noticeDetailList.noticeContent}</textarea>
            </div>
          </div>


          </c:forEach>





          <div class="form-group">
            <input type="button" value="뒤로가기" class="btn btn-primary py-3 px-5" onclick="history_back();" style="margin-left: 885px;">
          </div>

          <script>

            function history_back() {
              history.back();
            }
          </script>


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