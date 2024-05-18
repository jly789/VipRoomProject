<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="cp" value="<%=request.getContextPath()%>"/>


<!doctype html>
<html class="no-js" lang="zxx">
<head>
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>Book Shop</title>
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


  <div>

    <input type="hidden" id="orderNum" name="orderNum" value="">




    <input type="hidden" id="purchaseBook"  value="아잉"/>




    <input type="hidden" id="finaltotalPrice" value="1"/>




    <span></span>




    <button class="btn w-100" id="payment">결제하기</button>


  </div>
  </section>

  <!--End Checkout Area -->
</main>

<script>








  var IMP = window.IMP;
  IMP.init("imp88246600");

  $('#payment').click(function () {







    //pg: "html5_inicis"
    // pg : 'kakaopay.TC0ONETIME',
    // pg : 'danal_tpay',
    //  pg : 'kakaopay.TC0ONETIME'

    IMP.request_pay({
      pg : 'kakaopay.TC0ONETIME',
      pay_method: "card", // 결제방식
      merchant_uid : 'merchant_' + new Date().getTime(), // 주문번호
      name: $('#purchaseBook').val(), // 상품명

      amount: $("#finaltotalPrice").val(),

    },function(data){
      if(data.success){
        var msg = "결제 완료";
        msg += '고유ID : ' + data.imp_uid;                //아임포트 uid는 실제 결제 시 결제 고유번호를 서버와 비교해서 결제처리하는데 필요없긴함.
        msg += '// 상점 거래ID : ' + data.merchant_uid; // 주문번호
        msg += '// 결제 금액 : ' + $("#finaltotalPrice").val();
        // msg += '// 포인트 사용 금액 : ' + data.usePoint;
        msg += '// 카드 승인번호 : ' + data.apply_num;

        $("#orderNum").val(data.merchant_uid);

        $.ajax({
          type: 'post',
          url: '/payment',
          data: {


          },
          traditional: true,
          dataType: 'JSON',

        });
      }else{
        var msg = "결제 실패"
        msg += "에러 내용" + rsp.error_msg;
      }

      alert("결제성공!");

      window.location.href = "/myOrder";
    });



  });













</script>

<jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>
