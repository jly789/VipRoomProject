<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html class="no-js" lang="zxx">
<head>
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>Book Shop</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">



</head>

<style>

  a:link {
    color: red;
    text-decoration: none;
  }

  a:visited {
    color: black;
    text-decoration: none;
  }

  /* paginate */
  .paginate {
    padding: 0;
    line-height: normal;
    text-align: center;
    position: relative;
    margin: 20px 0 20px 0;
    z-index: 1;
  }

  .paginate .paging {
    text-align: center;
  }

  .paginate .paging a, .paginate .paging strong {
    margin: 0;
    padding: 0;
    width: 20px;
    height: 24px;
    line-height: 24px;
    text-align: center;
    color: #848484;
    display: inline-block;
    vertical-align: middle;
    text-align: center;
    font-size: 12px;
  }

  .paginate .paging a:hover, .paginate .paging strong {
    color: #DAA520;
    font-weight: 600;
    font-weight: normal;
  }

  .paginate .paging .direction {
    z-index: 3;
    vertical-align: middle;
    background-color: none;
    margin: 0 2px;
    border: 1px solid #777;
    border-radius: 2px;
    width: 28px;
  }

  .paginate .paging .direction:hover {
    border: 1px solid #C40639;
  }

  .paginate .paging .direction.prev {
    margin-right: 4px;
  }

  .paginate .paging .direction.next {
    margin-left: 4px;
    cursor: pointer;
  }

  .paginate .paging img {
    vertical-align: middle;
  }

  .paginate .right {
    position: absolute;
    top: 0;
    right: 0;
  }

  .bottom-left, .bottom-right {
    position: relative;
    z-index: 5;
  }

  .paginate ~ .bottom {
    margin-top: -50px;
  }


  .bottom select {
    background: transparent;
    color: #aaa;
    cursor: pointer;
  }


  /* paginate */
  .paginate {
    padding: 0;
    line-height: normal;
    text-align: center;
    position: relative;
    margin: 20px 0 20px 0;
  }

  .paginate .paging {
    text-align: center;
  }

  .paginate .paging a, .paginate .paging strong {
    margin: 0;
    padding: 0;
    width: 20px;
    height: 28px;
    line-height: 28px;
    text-align: center;
    color: #999;
    display: inline-block;
    vertical-align: middle;
    text-align: center;
    font-size: 14px;
  }

  .paginate .paging a:hover, .paginate .paging strong {
    color: #C40639;
    font-weight: 600;
    font-weight: normal;
  }

  .paginate .paging .direction {
    z-index: 3;
    vertical-align: middle;
    background-color: none;
    margin: 0 2px;
  }

  .paginate .paging .direction:hover {
    background-color: transparent;
  }

  .paginate .paging .direction.prev {
    margin-right: 4px;
  }

  .paginate .paging .direction.next {
    margin-left: 4px;
  }

  .paginate .paging img {
    vertical-align: middle;
  }

  .paginate .right {
    position: absolute;
    top: 0;
    right: 0;
  }
</style>

<body>

<jsp:include page="../main/header.jsp"></jsp:include>
<main>


  <!-- services-area End-->
  <!--Books review Start -->
  <section class="our-client section-padding best-selling">
    <div class="container">
      <div class="row">
        <div class="offset-xl-1 col-xl-10">
          <div class="nav-button f-left">

            <!--Nav Button  -->
            <c:if test="${memberId==1}">
              <nav>
                <div class="nav nav-tabs " id="nav-tab" role="tablist">

                  <a class="nav-link active" id="nav-one-tab" data-bs-toggle="tab" href="#nav-one"
                     role="tab" aria-controls="nav-one" aria-selected="true">공지사항</a>

                  <a class="nav-link" id="nav-three-tab" data-bs-toggle="tab" href="#nav-three" role="tab" aria-controls="nav-three" aria-selected="false">리뷰</a>

                  <a class="nav-link" href="/noticeAdd">공지등록</a>

                </div>
              </nav>
            </c:if>

            <c:if test="${memberId !=1}">
              <nav>
                <div class="nav nav-tabs " id="nav-tab" role="tablist">

                  <a class="nav-link active" id="nav-one-tab" data-bs-toggle="tab" href="#nav-one"
                     role="tab" aria-controls="nav-one" aria-selected="true">공지사항</a>

                  <a class="nav-link" id="nav-three-tab" data-bs-toggle="tab" href="#nav-three" role="tab" aria-controls="nav-three" aria-selected="false">리뷰</a>



                </div>
              </nav>
            </c:if>



          </div>
        </div>
      </div>
    </div>


    <div class="container">
      <!-- Nav Card -->
      <div class="tab-content" id="nav-tabContent">
        <div class="tab-pane fade show active" id="nav-one" role="tabpanel" aria-labelledby="nav-one-tab">
          <!-- Tab 1 -->
          <div class="container">
            <div class="cart_inner">
              <div class="table-responsive">
                <table class="table">
                  <thead>
                  <tr>
                    <th scope="col">공지번호</th>
                    <th scope="col">공지상태</th>
                    <th scope="col">제목</th>
                    <th scope="col">작성자</th>
                    <th scope="col">작성날짜</th>
                  </tr>
                  </thead>
                  <tbody>




                  <tr>
                    <td>
                      <div class="media">

                        <div class="media-body">


                        </div>
                      </div>
                    </td>


                    <td>
                      <h5 style="color: red;"><strong></strong></h5>

                    </td>



                    <td>
                      <h5 style="color: black;"><strong></strong></h5>

                    </td>


                    <td>

                    </td>


                    <td style="color:black">





                    </td>

                    <td style="">




                    </td>









                  </tr>
                  </tbody>

                </table>













  </section>



        <!-- Hero area Start-->




    <!--  Hero area End -->
    <!--================Cart Area =================-->

  <!--================End Cart Area =================-->
</main>

<script>


  //페이지 이동
  function movePage(currentPage, cntPerPage, pageSize) {

    var url = "${pageContext.request.contextPath}/notice";
    url = url + "?currentPage=" + currentPage;
    url = url + "&cntPerPage=" + cntPerPage;
    url = url + "&pageSize=" + pageSize;

    location.href = url;
  }


  $("#nav-one-tab").click(function (){
    location.href = '/notice';
    return;
  });

  $("#nav-three-tab").click(function (){
    location.href = '/noticeReview';
    return;
  });



</script>



<jsp:include page="../main/footer.jsp"></jsp:include>
<!-- Scroll Up -->


<!-- JS here -->
<!-- Jquery, Popper, Bootstrap -->


</body>
</html>

