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





<section class="ftco-section ftco-degree-bg">
  <div class="container">
    <div class="row">









                  <div class="form-group" >
                    <input type="button" id="notice" value="공지" class="btn btn-primary py-3 px-5">

                  </div>



                  <div class="form-group">
                    <input type="button" id="review" value="리뷰" class="btn btn-primary py-3 px-5">
                  </div>



      <c:if test="${userId=='admin'}">
        <div >
          <input type="button" id="noticeInsert" value="공지등록" class="btn btn-primary py-3 px-5">

        </div>


      </c:if>




    </div>
    <table class="table">
      <thead>
      <tr>
        <th scope="col">리뷰번호</th>
        <th scope="col">숙소</th>
        <th scope="col">제목</th>
        <th scope="col">작성자</th>
        <th scope="col">작성날짜</th>
      </tr>
      </thead>
      <tbody>


    <c:forEach var="reviewList" items="${reviewList}">
    <c:set var="i" value="${i+1}"/>
      <tr>
        <td style="color:black">
         ${i}

        </td>



        <td style="color:black">
          <a href="/${reviewList.accommodationId}" style="color: black;"> ${reviewList.accommodationName}</a>

        </td>





        <td style="color:black">
          <a href="/review/${reviewList.reviewId}" style="color: black;">${reviewList.reviewSubject}</a>
        </td>


        <td style="color:black">
            ${reviewList.userId}
        </td>

        <td style="color:black">
            ${reviewList.reviewDate}
        </td>

















      </tr>

    </c:forEach>
      </tbody>

    </table>
  </div>




</section>


<br/><br/><br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/><br/><br/>

<jsp:include page="../main/footer.jsp"></jsp:include>


<script>

$('#notice').click(function (){




  location.href='/notice';


});

$('#review').click(function (){


  location.href='/review';


});

$('#noticeInsert').click(function (){


  location.href='/noticeInsert';


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