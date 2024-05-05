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











<div style="text-align: center;">

  <section class="ftco-section contact-section ftco-degree-bg">
    <div class="container" style="text-align: center" >
      <div class="row d-flex mb-5 contact-info">
        <div class="col-md-12 mb-4">
          <h2>회원가입</h2>
        </div>

        <div>

          <form:form action="/register_success" method="post" modelAttribute="memberInsertDto">
            <div class="form-group">
              <input type="text" class="form-control" name="userId" id="userId" value="${memberInsertDto.userId}" placeholder="아이디 입력" style="margin-left: 300px;"/>
              <form:errors path="userId" cssStyle="font-weight: bold; color: #e95050"></form:errors>


            <input type="button" id="btnCheck" value="중복검사" class="btn btn-primary py-3 px-5" style="margin-left: 220px;" />
            </div>
            <span id="result"></span>
<%--            result = 중복확인시 텍스트값을 뿌려준다--%>

            <input type="hidden" id="checkId" value=""/>
<%--            checkId =중복확인 값 0일시 중복확인클릭x 1일시 중복확인클릭o--%>


            <div class="form-group">
              <input type="text" class="form-control" name="pwd" value="${memberInsertDto.pwd}" placeholder="비밀번호 입력" style="margin-left: 300px;"/>
              <form:errors path="pwd" cssStyle="font-weight: bold; color: #e95050"></form:errors>
            </div>

            <div class="form-group">
              <input type="text" class="form-control" name="userName" value="${memberInsertDto.userName}" placeholder="이름 입력" style="margin-left: 300px;"/>
              <form:errors path="userName" cssStyle="font-weight: bold; color: #e95050"></form:errors>
            </div>

            <div class="form-group">
              <input type="text" class="form-control" name="nickName" value="${memberInsertDto.nickName}" placeholder="닉네임 입력" style="margin-left: 300px;"/>
              <form:errors path="nickName" cssStyle="font-weight: bold; color: #e95050"></form:errors>
            </div>

            <div class="form-group">
              <input type="date" class="form-control" name="birth" value="${memberInsertDto.birth}" placeholder="생일 입력" style="margin-left: 300px;"/>
              <form:errors path="birth" cssStyle="font-weight: bold; color: #e95050"></form:errors>
            </div>

            <div class="form-group">
              <input type="tel" class="form-control" name="tel" value="${memberInsertDto.tel}" placeholder="전화번호 입력" style="margin-left: 300px;"/>
              <form:errors path="tel" cssStyle="font-weight: bold; color: #e95050"></form:errors>
            </div>

            <div class="form-group">
              <input type="text" class="form-control" name="postcode" value="${memberInsertDto.postcode}" placeholder="우편번호 입력" style="margin-left: 300px;"/>
              <form:errors path="postcode" cssStyle="font-weight: bold; color: #e95050"></form:errors>
            </div>

            <div class="form-group">
              <input type="text" class="form-control" name="address" value="${memberInsertDto.address}" placeholder="주소 입력" style="margin-left: 300px;"/>
              <form:errors path="address" cssStyle="font-weight: bold; color: #e95050"></form:errors>
            </div>

            <div class="form-group">
              <input type="text" class="form-control" name="detailAddress" value="${memberInsertDto.detailAddress}"  placeholder="상세주소 입력" style="margin-left: 300px;"/>
              <form:errors path="detailAddress" cssStyle="font-weight: bold; color: #e95050"></form:errors>
            </div>

            <div class="form-group">
              <input type="text" class="form-control" name="extraAddress" value="${memberInsertDto.extraAddress}" placeholder="참고사항 입력" style="margin-left: 300px;"/>
              <form:errors path="extraAddress" cssStyle="font-weight: bold; color: #e95050"></form:errors>
            </div>

            <div class="form-group">
              <input type="email" class="form-control" name="email"  value="${memberInsertDto.email}" placeholder="이메일 입력" style="margin-left: 300px;"/>
              <form:errors path="email" cssStyle="font-weight: bold; color: #e95050"></form:errors>
            </div>





            <input type="submit" id="register" value="회원가입" class="btn btn-primary py-3 px-5" style="margin-right: -600px;">

          </form:form>



        </div>

      </div>
    </div>


  </section>


  <script>

    $('#register').click(function (){

      if($('#checkId').val()!=1){

        alert('중복확인을 누르세요.');
        return false;
      }

      if($('#result').text()=='이미 사용중인 아이디입니다.'){

        alert('이미사용중인 아이디');
        return false;
      }


    });




    $('#btnCheck').click(function () {

      if($('#userId').val() !=''){

        $.ajax({

          type:'POST',
          url: '/idCheck',
          data: 'userId=' + $('#userId').val(),
          dataType: 'json',

          success:function (result){

            if(result=='1'){
              $('#result').text('사용 가능한 아이디입니다.');
              $('#checkId').val(1);

              document.getElementById('result').style.color ="black";
            }

            else {
              $('#result').text('이미 사용중인 아이디입니다.');
              $('#checkId').val(1);
              document.getElementById('result').style.color ="red";
            }

          },
          error: function (a,b,c){
            console.log(a,b,c);
          }

        });

      } else{
        alert('아이디를 입력하세요');
        $('#userId').focus();
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