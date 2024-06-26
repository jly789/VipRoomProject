<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="cp" value="<%=request.getContextPath()%>"/>


<!doctype html>
<html class="no-js" lang="zxx">
<head>
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>VIP ROOM</title>
  <!-- jQuery -->
  <script
          type="text/javascript"
          src="https://code.jquery.com/jquery-1.12.4.min.js"
  ></script>
  <!-- iamport.payment.js -->
  <script
          type="text/javascript"
          src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"
  ></script>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
<jsp:include page="../main/header.jsp"></jsp:include>

<main>




<section class="ftco-section ftco-degree-bg">
<div class="container">
<div class="row">




<div class="col-lg-9">
<div class="row">
<div class="col-md-12 ftco-animate">

<div>

<div class="item">
<c:forEach var="roomSpecificListDto" items="${roomSpecificListDto}">
<%--  <div class="hotel-img" style="background-image: url(${roomSpecificListDto.roomImagePath});"></div>--%>
  <img src="${roomSpecificListDto.roomImagePath}" width="800px;" height="400px;" />

  </div>
  </div>
  </div>
  </div>

  <input type="hidden" id="orderNum" name="orderNum" value="">




  <input type="hidden" id="roomName"  value="${roomSpecificListDto.roomName}"/>


  <div class="col-md-12 hotel-single mt-4 mb-5 ftco-animate">
  <span></span>
  <h2>${roomSpecificListDto.roomName}</h2>

  <p class="rate mb-5">

    <c:if test="${accommodationRoomReviewGrade==null}">
      review(0)

    </c:if>

    <c:if test="${accommodationRoomReviewGrade!=null}">


      <c:if test="${accommodationRoomReviewGrade==1}">
        <i  style="color: gold;"class="icon-star"></i>
        리뷰(${roomReviewTotal})
      </c:if>

      <c:if test="${accommodationRoomReviewGrade==2}">
        <i style="color: gold;" class="icon-star"></i>
        <i style="color: gold;" class="icon-star"></i>
        리뷰(${roomReviewTotal})
      </c:if>

      <c:if test="${accommodationRoomReviewGrade==3}">
        <i style="color: gold;" class="icon-star"></i>
        <i style="color: gold;" class="icon-star"></i>
        <i style="color: gold;" class="icon-star"></i>
        리뷰(${roomReviewTotal})
      </c:if>

      <c:if test="${accommodationRoomReviewGrade==4}">
        <i style="color: gold;" class="icon-star"></i>
        <i style="color: gold;" class="icon-star"></i>
        <i  style="color: gold;"class="icon-star"></i>
        <i style="color: gold;" class="icon-star"></i>
        리뷰(${roomReviewTotal})
      </c:if>

      <c:if test="${accommodationRoomReviewGrade==5}">
        <i style="color: gold;" class="icon-star"></i>
        <i style="color: gold;" class="icon-star"></i>
        <i style="color: gold;" class="icon-star"></i>
        <i style="color: gold;" class="icon-star"></i>
        <i style="color: gold;" class="icon-star"></i>
        리뷰(${roomReviewTotal})
      </c:if>


      <br/>
      <c:forEach var="roomReviewImg" items="${roomReviewImg}">

        <a href="/review/${roomReviewImg.reviewId}">
          <img src="${roomReviewImg.reviewFilePath}" style="width: 100px; height: 100px;"/>

        </a>

      </c:forEach>



    </c:if>




  </p>
  <h6> 기준 ${roomSpecificListDto.standardNumbers}인 / 최대  ${roomSpecificListDto.maximumCapacity}인</h6>




    <p>숙박<br/>


      <br/>





      <br/> <textarea rows="3" cols="90" name="reservationDetails" id="reservationDetails" placeholder="숙소예약에 필요한 정보를 입력"></textarea>



    <div class="col-md-12 hotel-single ftco-animate mb-5 mt-4">
      <h4 class="mb-5">결제하기</h4>
      <div class="fields">
        <div class="row">




          <div class="col-md-6">
            <div class="form-group">
              <h6>Check In</h6>
              <input type="date" name="reservationCheckIn" id="reservationCheckIn"
                     onChange="setendmin(this.value)" class="form-control" value="${reservationFindDto.reservationCheckIn}" readonly
              >
            </div>
          </div>
          <div class="col-md-6">
            <div class="form-group">
              <h6>Check Out</h6>
              <input type="date"  name="reservationCheckOut" id="reservationCheckOut" class="form-control" value="${reservationFindDto.reservationCheckOut}" readonly
              >
            </div>
          </div>



          <div class="col-md-6">
            <div class="form-group">
              <input type="hidden" class="form-control" name="roomId" id="roomId" value="${reservationFindDto.roomId}">
              <input type="hidden" class="form-control" name="accommodationId" id="accommodationId" value="${reservationFindDto.accommodationId}">
              <input type="hidden" class="form-control" name="orderPrice" id="orderPrice" value="${roomSpecificListDto.roomPrice}">


            </div>
          </div>





          <div class="col-md-12">
            <div class="form-group">

              <input type="hidden" name="memberId" id="memberId" value="${memberId}"/>
              <p>금액:${roomSpecificListDto.roomPrice}</p>

              </c:forEach>





    <button class="btn w-100" id="payment">결제하기</button>


  </div>
</div>
</div>
</div>
  </div>
  </div>
  <div class="form-group">
    <input type="button" value="뒤로가기" class="btn btn-primary py-3 px-5" onclick="history_back();" style="margin-left: 340px;">
  </div>

  <script>

    function history_back() {
      history.back();
    }
  </script>
</div>
</div>

</div>
  </section>

  <br/><br/><br/><br/><br/><br/><br/><br/>

<jsp:include page="../main/footer.jsp"></jsp:include>

<script>








  var IMP = window.IMP;
  IMP.init("imp88246600");

  $('#payment').click(function () {


    if($('#reservationCheckOut').val()==''){
      alert('매월 마지막날은 휴무입니다.\n다른 날짜를 선택해주세요');
      return false;
    }




    //pg: "html5_inicis"
    // pg : 'kakaopay.TC0ONETIME',
    // pg : 'danal_tpay',
    //  pg : 'kakaopay.TC0ONETIME'

    IMP.request_pay({
      pg : 'kakaopay.TC0ONETIME',
      pay_method: "card", // 결제방식
      merchant_uid : 'merchant_' + new Date().getTime(), // 주문번호
      name: $('#roomName').val(), // 상품명

      amount: $("#orderPrice").val(),

    },function(data){
      if(data.success){
        var msg = "결제 완료";
        msg += '고유ID : ' + data.imp_uid;                //아임포트 uid는 실제 결제 시 결제 고유번호를 서버와 비교해서 결제처리하는데 필요없긴함.
        msg += '// 상점 거래ID : ' + data.merchant_uid; // 주문번호
        msg += '// 결제 금액 : ' + $("#orderPrice").val();
        // msg += '// 포인트 사용 금액 : ' + data.usePoint;
        msg += '// 카드 승인번호 : ' + data.apply_num;

        $("#orderNum").val(data.merchant_uid);

        $.ajax({
          type: 'post',
          url: '/payment',
          data: {



            impUid: data.imp_uid, // 결제번호
            orderNum: data.merchant_uid, //주문번호
            orderPrice: $('#orderPrice').val(),
            accommodationId: $('#accommodationId').val(),
            roomId: $('#roomId').val(),
            reservationCheckIn: $('#reservationCheckIn').val(),
            reservationCheckOut: $('#reservationCheckOut').val(),
            reservationDetails: $('#reservationDetails').val(),
            memberId:$('#memberId').val(),


          },
          traditional: true,
          dataType: 'JSON',

        });
      }else{
        var msg = "결제 실패"
        msg += "에러 내용" + rsp.error_msg;
      }

      alert("결제성공!");

      window.location.href = "/myReservation";
    });



  });













</script>


</body>

</html>
