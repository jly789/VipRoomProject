<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="cp" value="<%=request.getContextPath()%>"/>


<!DOCTYPE html>
<html lang="en">
<head>
    <title>VIP ROOM</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
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


<c:if test="${userId==null}">

    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
        <div class="container">
            <a class="navbar-brand" href="/">Home</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="oi oi-menu"></span> Menu
            </button>

            <div class="collapse navbar-collapse" id="ftco-nav" style="margin-right: 400px;">
                <ul class="navbar-nav ml-auto">

                    <li class="nav-item"><a href="/notice" class="nav-link">공지사항</a></li>

                    <li class="nav-item"><a href="/accommodationMain" class="nav-link">호텔</a></li>
                    <li class="nav-item"><a href="/login" class="nav-link">로그인</a></li>
<%--                        <li class="nav-item"><a href="/register" class="nav-link"></a></li>--%>




                </ul>
            </div>
        </div>






    </nav>
    <!-- END nav -->


    <div class="hero-wrap js-fullheight" style="background-image: url('/mainImg/main.jpg');">
        <div class="overlay"></div>
        <div class="container">
            <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-start" data-scrollax-parent="true">
                <div class="col-md-9 ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
                    <h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><strong>VIP<br></strong>Room</h1>
                    <p data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"></p>
                    <div class="block-17 my-4">
                        <form action="/distinctSearch" method="post"  class="d-block d-flex">

                            <div class="fields d-block d-flex">
                                <div class="select-wrap one-third">
                                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>

                                    <select name="accommodationDistrict"  id="accommodationDistrict" class="form-control">

                                            <option value="지역선택" selected="selected"   >지역선택</option>
                                            <option value="서울" >서울</option>
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
                                <div class="select-wrap one-third">
                                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                                    <select name="accommodationCategory"  id="accommodationCategory" class="form-control" >


                                        <option value="숙소선택"   selected="selected" >숙소선택</option>
                                        <option value="호텔">호텔</option>
                                        <option value="리조트">리조트</option>
                                        <option value="펜션/풀빌라">펜션/풀빌라</option>
                                        <option value="모텔">모텔</option>
                                        <option value="글램핑/캠핑">글램핑/캠핑</option>
                                        <option value="게스트하우스">게스트하우스</option>
                                        <option value="가족형숙소">가족형숙소</option>




                                    </select>
                                </div>
                            </div>
                            <input type="submit"  class="search-submit btn btn-primary" value="검색">
                        </form>
                    </div>





                    <p>Click</p>
                    <p class="browse d-md-flex">

                        <span class="d-flex justify-content-md-center align-items-md-center"><a href="/CategorySearch?accommodationCategory=호텔"><i class="flaticon-hotel"></i>호텔</a></span>
                        <span class="d-flex justify-content-md-center align-items-md-center"><a href="/CategorySearch?accommodationCategory=리조트"><i class="flaticon-hotel"></i>리조트</a></span>
                        <span class="d-flex justify-content-md-center align-items-md-center"><a href="/CategorySearch?accommodationCategory=펜션/풀빌라"><i class="flaticon-hotel"></i>펜션/풀빌라</a></span>
                        <span class="d-flex justify-content-md-center align-items-md-center"><a href="/CategorySearch?accommodationCategory=모텔"><i class="flaticon-hotel"></i>모텔</a></span>



                    </p>
                </div>
            </div>
        </div>
    </div>

    <section class="ftco-section services-section bg-light">
        <div class="container">
            <div class="row d-flex">
                <div class="col-md-3 d-flex align-self-stretch ftco-animate">
                    <div class="media block-6 services d-block text-center">
                        <div class="d-flex justify-content-center"><div class="icon"><span class="flaticon-guarantee"></span></div></div>
                        <div class="media-body p-2 mt-2">

                            <h3 class="heading mb-3">2024년 1위</h3>
                            <p>올해 상반기 1위 숙박업소</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 d-flex align-self-stretch ftco-animate">
                    <div class="media block-6 services d-block text-center">
                        <div class="d-flex justify-content-center"><div class="icon"><span class="flaticon-like"></span></div></div>
                        <div class="media-body p-2 mt-2">

                            <h3 class="heading mb-3">최고의 여행</h3>
                            <p>최고의 숙소에서 누리세요</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 d-flex align-self-stretch ftco-animate">
                    <div class="media block-6 services d-block text-center">
                        <div class="d-flex justify-content-center"><div class="icon"><span class="flaticon-detective"></span></div></div>
                        <div class="media-body p-2 mt-2">
                            <h3 class="heading mb-3">숙소가 고민이다</h3>
                            <p>바로 이곳 Vip Room</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 d-flex align-self-stretch ftco-animate">
                    <div class="media block-6 services d-block text-center">
                        <div class="d-flex justify-content-center"><div class="icon"><span class="flaticon-support"></span></div></div>
                        <div class="media-body p-2 mt-2">
                            <h3 class="heading mb-3">고객문의</h3>
                            <p>010-2089-3971</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="ftco-section ftco-destination">
        <div class="container">
            <div class="row justify-content-start mb-5 pb-3">
                <div class="col-md-7 heading-section ftco-animate">

                    <h3 class="mb-4"><strong>숙소</strong></h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="destination-slider owl-carousel ftco-animate">


                        <c:forEach var="accommodationMainList" items="${accommodationMainList}">

                        <div class="item">
                            <div class="destination">
                                <a href="/${accommodationMainList.accommodationId}" class="img d-flex justify-content-center align-items-center" style="background-image: url(${accommodationMainList.accommodationImagePath});">
                                    <div class="icon d-flex justify-content-center align-items-center">
                                        <span class="icon-search2"></span>
                                    </div>
                                </a>
                                <div class="text p-3">
                                    <h3>${accommodationMainList.accommodationName} <span class="listing">(${accommodationMainList.accommodationDistrict})</span>   </h3>



                                    <span><i class="icon-map-o"></i>${accommodationMainList.accommodationCategory}</span>

                                </div>
                            </div>
                        </div>

                        </c:forEach>




                    </div>
                </div>
            </div>
        </div>
    </section>


    <section class="ftco-section ftco-counter img" id="section-counter" style="background-image: url(resources/images/bg_1.jpg);">
        <div class="container">
            <div class="row justify-content-center mb-5 pb-3">
                <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
                    <h2 class="mb-4">실시간</h2>
                    <span class="subheading">5,000개 이상의 숙소 사이트 호스팅</span>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-md-10">
                    <div class="row">
                        <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                            <div class="block-18 text-center">
                                <div class="text">
                                    <strong class="number" data-number="1000000">0</strong><strong class="number">명</strong>
                                    <span>이용자 수</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                            <div class="block-18 text-center">
                                <div class="text">
                                    <strong class="number" data-number="10000">0</strong><strong class="number">명</strong>
                                    <span>실시간 접속자 수</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                            <div class="block-18 text-center">
                                <div class="text">
                                    <strong class="number" data-number="5000">0</strong><strong class="number">개</strong>
                                    <span>영업숙소</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                            <div class="block-18 text-center">
                                <div class="text">
                                    <strong class="number" data-number="100000">0</strong></strong><strong class="number">개</strong>
                                    <span>주변 음식점</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>




    <footer class="ftco-footer ftco-bg-dark ftco-section">
        <div class="container">
            <div class="row mb-5">
                <div class="col-md">
                    <div class="ftco-footer-widget mb-4">
                        <h2 class="ftco-heading-2">GitHub 주소</h2>
                        <p><a style="color: white;" href="https://github.com/jly789">https://github.com/jly789</a></p>
                        <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                            <li class="ftco-animate"><a ><span class="icon-twitter"></span></a></li>
                            <li class="ftco-animate"><a><span class="icon-facebook"></span></a></li>
                            <li class="ftco-animate"><a ><span class="icon-instagram"></span></a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md">
                    <div class="ftco-footer-widget mb-4">
                        <h2 class="ftco-heading-2">연락문의</h2>
                        <div class="block-23 mb-3">
                            <ul>

                                <li><a> <span class="icon icon-map-marker"></span><span class="text">경기도 성남시 태평동 7210</span></a></li>
                                <li><a> <span class="icon icon-phone"></span><span class="text">010-2089-3971</span></a></li>
                                <li><a> <span class="icon icon-envelope"></span><span class="text">jly789@naver.com</span></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 text-center">

                    <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                      <strong>Vip Room </strong>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                </div>
            </div>
        </div>


    </footer>

</c:if>


<c:if test="${userId!=null}">

<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
        <a class="navbar-brand" href="/">Home</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> Menu
        </button>

        <div class="collapse navbar-collapse" id="ftco-nav"  style="margin-right: 400px;">
            <ul class="navbar-nav ml-auto">






                <c:if test="${userId == 'admin'}">
                    <li class="nav-item"><a href="/notice" class="nav-link">공지사항</a></li>
                    <li class="nav-item"><a href="/mypage" class="nav-link">관리자페이지</a></li>
                    <li class="nav-item"><a href="/accommodation" class="nav-link">숙소등록</a></li>
                    <li class="nav-item"><a href="/room" class="nav-link">객실등록</a></li>


                </c:if>

                <c:if test="${userId != 'admin'}">
                    <li class="nav-item"><a href="/notice" class="nav-link">공지사항</a></li>
                <li class="nav-item"><a href="/mypage" class="nav-link">mypage</a></li>

                </c:if>


                <li class="nav-item"><a href="/accommodationMain" class="nav-link">호텔</a></li>
                <li class="nav-item"><a href="/logOut" class="nav-link">로그아웃</a></li>


            </ul>
        </div>
    </div>






</nav>
<!-- END nav -->


<div class="hero-wrap js-fullheight" style="background-image: url('/mainImg/main.jpg');">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-start" data-scrollax-parent="true">
            <div class="col-md-9 ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
                <h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><strong>VIP<br></strong>Room</h1>
                <p data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"></p>
                <div class="block-17 my-4">
                    <form action="/distinctSearch" method="post"  class="d-block d-flex">

                        <div class="fields d-block d-flex">
                            <div class="select-wrap one-third">
                                <div class="icon"><span class="ion-ios-arrow-down"></span></div>

                                <select name="accommodationDistrict"  id="accommodationDistrict" class="form-control">

                                    <option value="지역선택" selected="selected"   >지역선택</option>
                                    <option value="서울" >서울</option>
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
                            <div class="select-wrap one-third">
                                <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                                <select name="accommodationCategory"  id="accommodationCategory" class="form-control" >


                                    <option value="숙소선택"   selected="selected" >숙소선택</option>
                                    <option value="호텔/리조트" >호텔/리조트</option>
                                    <option value="펜션/풀빌라">펜션/풀빌라</option>
                                    <option value="모텔">모텔</option>
                                    <option value="글램핑/캠핑">글램핑/캠핑</option>
                                    <option value="게스트하우스">게스트하우스</option>
                                    <option value="가족형숙소">가족형숙소</option>




                                </select>
                            </div>
                        </div>
                        <input type="submit"  class="search-submit btn btn-primary" value="검색">
                    </form>
                </div>
                <p>Click</p>
                <p class="browse d-md-flex">
                    <span class="d-flex justify-content-md-center align-items-md-center"><a href="/CategorySearch?accommodationCategory=호텔"><i class="flaticon-hotel"></i>호텔</a></span>
                    <span class="d-flex justify-content-md-center align-items-md-center"><a href="/CategorySearch?accommodationCategory=리조트"><i class="flaticon-hotel"></i>리조트</a></span>
                    <span class="d-flex justify-content-md-center align-items-md-center"><a href="/CategorySearch?accommodationCategory=펜션/풀빌라"><i class="flaticon-hotel"></i>펜션/풀빌라</a></span>
                    <span class="d-flex justify-content-md-center align-items-md-center"><a href="/CategorySearch?accommodationCategory=모텔"><i class="flaticon-hotel"></i>모텔</a></span>
                </p>
            </div>
        </div>
    </div>
</div>
    <section class="ftco-section services-section bg-light">
        <div class="container">
            <div class="row d-flex">
                <div class="col-md-3 d-flex align-self-stretch ftco-animate">
                    <div class="media block-6 services d-block text-center">
                        <div class="d-flex justify-content-center"><div class="icon"><span class="flaticon-guarantee"></span></div></div>
                        <div class="media-body p-2 mt-2">

                            <h3 class="heading mb-3">2024년 1위</h3>
                            <p>올해 상반기 1위 숙박업소</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 d-flex align-self-stretch ftco-animate">
                    <div class="media block-6 services d-block text-center">
                        <div class="d-flex justify-content-center"><div class="icon"><span class="flaticon-like"></span></div></div>
                        <div class="media-body p-2 mt-2">

                            <h3 class="heading mb-3">최고의 여행</h3>
                            <p>최고의 숙소에서 누리세요</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 d-flex align-self-stretch ftco-animate">
                    <div class="media block-6 services d-block text-center">
                        <div class="d-flex justify-content-center"><div class="icon"><span class="flaticon-detective"></span></div></div>
                        <div class="media-body p-2 mt-2">
                            <h3 class="heading mb-3">숙소가 고민이다</h3>
                            <p>바로 이곳 Vip Room</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 d-flex align-self-stretch ftco-animate">
                    <div class="media block-6 services d-block text-center">
                        <div class="d-flex justify-content-center"><div class="icon"><span class="flaticon-support"></span></div></div>
                        <div class="media-body p-2 mt-2">
                            <h3 class="heading mb-3">고객문의</h3>
                            <p>010-2089-3971</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>



    <section class="ftco-section ftco-destination">
        <div class="container">
            <div class="row justify-content-start mb-5 pb-3">
                <div class="col-md-7 heading-section ftco-animate">

                    <h3 class="mb-4"><strong>숙소</strong></h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="destination-slider owl-carousel ftco-animate">


                        <c:forEach var="accommodationMainList" items="${accommodationMainList}">

                            <div class="item">
                                <div class="destination">
                                    <a href="/${accommodationMainList.accommodationId}" class="img d-flex justify-content-center align-items-center" style="background-image: url(${accommodationMainList.accommodationImagePath});">
                                        <div class="icon d-flex justify-content-center align-items-center">
                                            <span class="icon-search2"></span>
                                        </div>
                                    </a>
                                    <div class="text p-3">
                                        <h3>${accommodationMainList.accommodationName} <span class="listing">(${accommodationMainList.accommodationDistrict})</span>   </h3>



                                        <span><i class="icon-map-o"></i>${accommodationMainList.accommodationCategory}</span>

                                    </div>
                                </div>
                            </div>

                        </c:forEach>




                    </div>
                </div>
            </div>
        </div>
    </section>



    <section class="ftco-section ftco-counter img" id="section-counter" style="background-image: url(resources/images/bg_1.jpg);">
        <div class="container">
            <div class="row justify-content-center mb-5 pb-3">
                <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
                    <h2 class="mb-4">실시간</h2>
                    <span class="subheading">5,000개 이상의 숙소 사이트 호스팅</span>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-md-10">
                    <div class="row">
                        <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                            <div class="block-18 text-center">
                                <div class="text">
                                    <strong class="number" data-number="1000000">0</strong><strong class="number">명</strong>
                                    <span>이용자 수</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                            <div class="block-18 text-center">
                                <div class="text">
                                    <strong class="number" data-number="10000">0</strong><strong class="number">명</strong>
                                    <span>실시간 접속자 수</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                            <div class="block-18 text-center">
                                <div class="text">
                                    <strong class="number" data-number="5000">0</strong><strong class="number">개</strong>
                                    <span>영업숙소</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                            <div class="block-18 text-center">
                                <div class="text">
                                    <strong class="number" data-number="100000">0</strong></strong><strong class="number">개</strong>
                                    <span>주변 음식점</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>



    <footer class="ftco-footer ftco-bg-dark ftco-section">
        <div class="container">
            <div class="row mb-5">
                <div class="col-md">
                    <div class="ftco-footer-widget mb-4">
                        <h2 class="ftco-heading-2">GitHub 주소</h2>
                        <p><a style="color: white;" href="https://github.com/jly789">https://github.com/jly789</a></p>
                        <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                            <li class="ftco-animate"><a ><span class="icon-twitter"></span></a></li>
                            <li class="ftco-animate"><a><span class="icon-facebook"></span></a></li>
                            <li class="ftco-animate"><a ><span class="icon-instagram"></span></a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md">
                    <div class="ftco-footer-widget mb-4">
                        <h2 class="ftco-heading-2">연락문의</h2>
                        <div class="block-23 mb-3">
                            <ul>

                                <li><a> <span class="icon icon-map-marker"></span><span class="text">경기도 성남시 태평동 7210</span></a></li>
                                <li><a> <span class="icon icon-phone"></span><span class="text">010-2089-3971</span></a></li>
                                <li><a> <span class="icon icon-envelope"></span><span class="text">jly789@naver.com</span></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 text-center">

                    <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        <strong>Vip Room </strong>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                </div>
            </div>
        </div>


    </footer>



</c:if>
<!-- loader -->
<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


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