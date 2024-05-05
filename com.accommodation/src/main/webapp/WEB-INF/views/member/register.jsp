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
    <div class="container" style="margin-right: 300px; >
      <div class="row d-flex mb-5 contact-info">
        <div class="col-md-12 mb-4">
          <h2>회원가입</h2>
        </div>

        <div>

          <form:form action="/register_success" method="post" modelAttribute="memberInsertDto">
            <div class="form-group">
              <input type="text" class="form-control" name="userId" id="userId" value="${memberInsertDto.userId}" placeholder="아이디 입력"/>
              <input type="button" id="btnCheck" value="중복검사" class="btn btn-primary py-3 px-5"  />
              <span id="result"></span>
              <form:errors path="userId" cssStyle="font-weight: bold; color: #e95050"></form:errors>


            </div>

<%--            result = 중복확인시 텍스트값을 뿌려준다--%>

            <input type="hidden" id="checkId" value=""/>
<%--            checkId =중복확인 값 0일시 중복확인클릭x 1일시 중복확인클릭o--%>


            <div class="form-group">
              <input type="text" class="form-control" name="pwd" value="${memberInsertDto.pwd}" placeholder="비밀번호 입력" />
              <form:errors path="pwd" cssStyle="font-weight: bold; color: #e95050" cssClass="text-center" ></form:errors>
            </div>

            <div class="form-group">
              <input type="text" class="form-control" name="userName" value="${memberInsertDto.userName}" placeholder="이름 입력"/>
              <form:errors path="userName" cssStyle="font-weight: bold; color: #e95050"></form:errors>
            </div>

            <div class="form-group">
              <input type="text" class="form-control" name="nickName" value="${memberInsertDto.nickName}" placeholder="닉네임 입력"/>
              <form:errors path="nickName" cssStyle="font-weight: bold; color: #e95050"></form:errors>
            </div>

            <div class="form-group">
              <input type="date" class="form-control" name="birth" value="${memberInsertDto.birth}" placeholder="생일 입력" />
              <form:errors path="birth" cssStyle="font-weight: bold; color: #e95050"></form:errors>
            </div>

            <div class="form-group">
              <input type="tel" class="form-control" name="tel" value="${memberInsertDto.tel}" placeholder="전화번호 입력"/>
              <form:errors path="tel" cssStyle="font-weight: bold; color: #e95050"></form:errors>
            </div>

            <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="margin-right: 1500px;"><br>

            <div class="form-group">
              <input type="text" class="form-control" name="postcode" id="sample6_postcode" value="${memberInsertDto.postcode}" placeholder="우편번호 입력" />

              <form:errors path="postcode" cssStyle="font-weight: bold; color: #e95050"></form:errors>
            </div>



            <div class="form-group">
              <input type="text" class="form-control" name="address" id="sample6_address" value="${memberInsertDto.address}" placeholder="주소 입력" />
              <form:errors path="address" cssStyle="font-weight: bold; color: #e95050"></form:errors>
            </div>

            <div class="form-group">
              <input type="text" class="form-control" name="detailAddress" id="sample6_detailAddress" value="${memberInsertDto.detailAddress}"  placeholder="상세주소 입력"/>
              <form:errors path="detailAddress" cssStyle="font-weight: bold; color: #e95050"></form:errors>
            </div>

            <div class="form-group">
              <input type="text" class="form-control" name="extraAddress" id="sample6_extraAddress" value="${memberInsertDto.extraAddress}" placeholder="참고사항 입력" />
              <form:errors path="extraAddress" cssStyle="font-weight: bold; color: #e95050"></form:errors>
            </div>

            <div class="form-group">
              <input type="email" class="form-control" name="email"  value="${memberInsertDto.email}" placeholder="이메일 입력" />
              <form:errors path="email" cssStyle="font-weight: bold; color: #e95050"></form:errors>
            </div>





            <input type="submit" id="register" value="회원가입" class="btn btn-primary py-3 px-5" style="margin-right: -600px;">

          </form:form>



        </div>

      </div>
    </div>


  </section>

  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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








    function sample6_execDaumPostcode() {

      new daum.Postcode({
        oncomplete: function(data) {
          // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

          // 각 주소의 노출 규칙에 따라 주소를 조합한다.
          // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
          var addr = ''; // 주소 변수
          var extraAddr = ''; // 참고항목 변수

          //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
          if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
            addr = data.roadAddress;
          } else { // 사용자가 지번 주소를 선택했을 경우(J)
            addr = data.jibunAddress;
          }

          // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
          if(data.userSelectedType === 'R'){
            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
              extraAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
              extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraAddr !== ''){
              extraAddr = ' (' + extraAddr + ')';
            }
            // 조합된 참고항목을 해당 필드에 넣는다.
            document.getElementById("sample6_extraAddress").value = extraAddr;

          } else {
            document.getElementById("sample6_extraAddress").value = '';
          }

          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.getElementById('sample6_postcode').value = data.zonecode;
          document.getElementById("sample6_address").value = addr;
          // 커서를 상세주소 필드로 이동한다.
          document.getElementById("sample6_detailAddress").focus();
        }
      }).open();
    }

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