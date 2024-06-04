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








<form:form action="/accommodation" method="post" modelAttribute="accommodationInsertDto" enctype="multipart/form-data">


<div style="text-align: center;">

  <section class="ftco-section contact-section ftco-degree-bg">
    <div class="container" style="margin-right: 300px; >
      <div class="row d-flex mb-5 contact-info">
        <div class="col-md-12 mb-4">
          <h2>숙소등록</h2>
        </div>

        <div>






            <div class="form-group">
              <input type="text" class="form-control" name="accommodationName" id="accommodationName" value="${accommodationInsertDto.accommodationName}" placeholder="숙소이름 입력" />
              <form:errors path="accommodationName" cssStyle="font-weight: bold; color: #e95050" cssClass="text-center" ></form:errors>
            </div>


            <div class="form-group" style="text-align: left;">
              <select id="accommodationDistrictOption">
                <option value="선택" selected="selected">선택</option>
                <option value="서울">서울</option>
                <option value="부산">부산</option>
                <option value="제주">제주</option>
                <option value="경기">경기</option>
                <option value="인천">인천</option>
                <option value="강원">강원</option>
                <option value="경상">경상</option>
                <option value="전라">전라</option>
                <option value="충청">충청</option>


              </select>

            </div>



            <div class="form-group">
              <input type="text" class="form-control" name="accommodationDistrict" id="accommodationDistrict" value="" placeholder="숙소지역구 입력"/>

            </div>


<%--            <div  id="subCategory">--%>



            </div>

            <div class="form-group" style="text-align: left;">
              <select id="subCategory">

                <option value="선택" selected="selected" id="accommodationCityOption">선택</option>



              </select>

            </div>




            <div class="form-group">
              <input type="text" class="form-control" name="accommodationCity" id="accommodationCity"  value="${accommodationInsertDto.accommodationCity}" placeholder="숙소도시 입력"/>
              <form:errors path="accommodationCity" cssStyle="font-weight: bold; color: #e95050"></form:errors>
            </div>


            <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="margin-right: 1500px;"><br>



            <div class="form-group">
              <input type="text" class="form-control" name="accommodationAddress" id="sample6_address" value="${accommodationInsertDto.accommodationAddress}" placeholder="주소 입력" />
              <form:errors path="accommodationAddress" cssStyle="font-weight: bold; color: #e95050"></form:errors>
            </div>

            <div class="form-group">
              <input type="hidden" class="form-control" name="detailAddress" id="sample6_detailAddress"   placeholder="상세주소 입력"/>

            </div>

            <div class="form-group">
              <input type="hidden" class="form-control" name="extraAddress" id="sample6_extraAddress"  placeholder="참고사항 입력" />

            </div>



    <div class="form-group" style="text-align: left;">
      <select id="accommodationCategory" name="accommodationCategory">
        <option selected="selected">숙소유형</option>
        <option value="모텔">모텔</option>
        <option value="호텔/리조트">호텔/리조트</option>
        <option value="펜션/풀빌라">펜션/풀빌라</option>
        <option value="글램핑/캠핑">글램핑/캠핑</option>
        <option value="가족형숙소">가족형숙소</option>
        <option value="게스트하우스">게스트하우스</option>



      </select>
      <form:errors path="accommodationCategory" cssStyle="font-weight: bold; color: #e95050"></form:errors>

    </div>

<%--            <div class="form-group">--%>
<%--              <input type="text" class="form-control" name="accommodationCategory" value="${accommodationInsertDto.accommodationCategory}" placeholder="숙박유형 입력"/>--%>
<%--              <form:errors path="accommodationCategory" cssStyle="font-weight: bold; color: #e95050"></form:errors>--%>
<%--            </div>--%>


            <div class="form-group">
              <input type="text" class="form-control" name="accommodationInformation" id="accommodationInformation"  value="${accommodationInsertDto.accommodationInformation}" placeholder="숙소정보 입력" />

              <form:errors path="accommodationInformation" cssStyle="font-weight: bold; color: #e95050"></form:errors>
            </div>


    <div class="row">
      <div class="col-lg-4">
        <div class="checkout__input">
          <div class='addInput'>
            <p>상품 이미지<span>*</span></p>
            <input type="file" name="file" id="fileList" onchange="readURL(this);">
          </div>
<%--          <button type="button" class="btnAdd">이미지 추가</button>--%>
        </div>
      </div>

        <br/>




        </div>

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

      if($('#accommodationName').val()==''){
        alert('숙소이름을 선택하세요!');
        return false;
      }

      if($('#accommodationDistrict').val()==''){
        alert('숙소지역구를 선택하세요!');
        return false;
      }

      if($('#accommodationCity').val()==''){
        alert('숙소도시를 선택하세요!');
        return false;
      }

      if($('#sample6_address').val()==''){
        alert('주소를 입력하세요!');
        return false;
      }


      if($('#accommodationCategory').val()=='숙소유형'){
        alert('숙소유형을 선택하세요!');
        return false;
      }

      if($('#accommodationInformation').val()==''){
        alert('숙소정보를 선택하세요!');
        return false;
      }



      if($('#fileList').val()==''){
          alert('이미지 파일을 선택하세요!');
          return false;
      }

    });






    $('#accommodationDistrictOption').change(function () {

      $('#accommodationCity').val('');

      const accommodationDistrict = '';
      const accommodationDistrictOption = $('#accommodationDistrictOption').val();

      $('#accommodationDistrict').val(accommodationDistrictOption)





        $.ajax({

          type:'POST',
          url: '/accommodationDistrict',
          data: 'accommodationDistrict=' +  accommodationDistrictOption,
          dataType: 'json',

          success:function (cityDtoList){

            // if(result=='1'){
            //   $('#result').text('사용 가능한 아이디입니다.');
            //   $('#checkId').val(1);


           // accommodationCityOption


            $('#subCategory').empty();


            for(let i = 0; i < cityDtoList.length; i++) {
              let subCategoryDTO = cityDtoList[i]


             let option = $('<option value="' + subCategoryDTO.cityName + '">' + subCategoryDTO.cityName + '</option>')



              $('#subCategory').append(option)

            }


            $('#subCategory').niceSelect('update')


          },
          error: function (a,b,c){
            console.log(a,b,c);
          }



        });





    });


    $('#subCategory').change(function () { //subCategory는 지역구를 선택할시 select id값인 subCategory에 해당지역구의 도시 나열


      let accommodationCity = $('#subCategory').val();


      $('#accommodationCity').val(accommodationCity);

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


          } else {

          }

          // 우편번호와 주소 정보를 해당 필드에 넣는다.

          document.getElementById("sample6_address").value = addr;

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