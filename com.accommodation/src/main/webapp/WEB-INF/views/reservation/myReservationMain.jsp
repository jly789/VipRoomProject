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




    </div>
    <table class="table">
      <thead>
      <tr>
        <th scope="col">예약번호</th>
        <th scope="col">예약자</th>
        <th scope="col">예약숙소</th>
        <th scope="col">주문금액</th>
        <th scope="col">체크인</th>
        <th scope="col">체크아웃</th>
        <th scope="col">리뷰상태 </th>
        <th scope="col">주문상세</th>

      </tr>
      </thead>
      <tbody>


    <c:forEach var="myReservationList" items="${myReservationList}">

      <tr>



        <td>
          <div class="media">

            <div class="media-body">


                ${myReservationList.reservationId}


            </div>
          </div>
        </td>


        <td style="color:black">
            ${userId}
        </td>

        <td style="color:black">
          <a style="color: black;" href="/reservation?roomId=${myReservationList.roomId}&accommodationId=${myReservationList.accommodationId}">${myReservationList.accommodationName}(${myReservationList.roomName})</a>

        </td>

        <td style="color:black">
            ${myReservationList.roomPrice}
        </td>




        <td style="color:black">
        ${myReservationList.reservationCheckIn}
        </td>



        <td style="color:black">
            ${myReservationList.reservationCheckOut}
        </td>

        <c:if test="${myReservationList.reviewState=='리뷰완료'}">
          <td style="color:red">
            <a href="/review/${myReservationList.reviewId}">${myReservationList.reviewState}</a>
          </td>
        </c:if>

        <c:if test="${myReservationList.reviewState==null && myReservationList.reservationStatus=='예약중' }">

        <c:if test="${myReservationList.reservationStatus=='예약취소'}">

        </c:if>


          <td style="color:black">

            <form action="/reviewInsert" method="get">

              <input type="hidden" name="memberId" value="${myReservationList.memberId}">
              <input type="hidden" name="accommodationId" value="${myReservationList.accommodationId}">
              <input type="hidden" name="roomId" value="${myReservationList.roomId}">
              <input type="hidden" name="reservationId" id="reservationId" value="${myReservationList.reservationId}">

            <input type="submit" id="reviewInsert" value="리뷰등록">
            </form>
          </td>
        </c:if>


        <c:if test="${myReservationList.reservationStatus=='예약취소'}">

          <td style="color:black;">
              ${myReservationList.reservationStatus}
            <input type="hidden" id="reservationDelete[text]" value="예약취소"></input>
          </td>


          <td style="color:black;">
              ${myReservationList.reservationStatus}
                <input type="hidden" id="reservationDelete[text]" value="예약취소"></input>
          </td>
        </c:if>


        <c:if test="${myReservationList.reservationStatus=='예약중'}">
        <td style="color:black">
          ${myReservationList.reservationStatus}          <input type="button" id="reservationDelete[text]" onclick="reservationDelete(${myReservationList.reservationId})" value="예약취소"></input>



        </td>

        </c:if>












      </tr>

    </c:forEach>
      </tbody>

    </table>
  </div>




</section>
<div class="form-group">
  <input type="button" value="뒤로가기" class="btn btn-primary py-3 px-5" onclick="history_back();" style="margin-left: 885px;">
</div>

<script>

  function history_back() {
    history.back();
  }
</script>

<br/><br/><br/><br/>



<br/><br/><br/>


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

function reservationDelete(reservationId){

  if (!confirm("정말 예약취소 하시겠습니까?\n확인(예) 또는 취소(아니오)를 선택해주세요.")) {
    return false; //아니오 버튼 클릭 시 이벤트
  } else

    var_width='1000';
  var_height='600';


  var reservationId = reservationId;





  var_left=Math.ceil((window.screen.width-var_width)/2);
  var_top=Math.ceil((window.screen.height -var_height)/2);

  window.open('/loginCheck/'+ reservationId +'','Child','width='+var_width+',height='+var_height+',left='+var_left+',top='+var_top);








    return true;

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