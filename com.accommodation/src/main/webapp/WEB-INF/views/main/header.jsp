<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <style>


        ul.submenu{position:absolute;width:170px;background:#fff;left:0;top:90%;visibility:hidden;opacity:0;box-shadow:0 0 10px 3px rgba(0,0,0,0.05);padding:17px 0;border-radius:5px 5px 0 0;-webkit-transition:all .2s ease-out 0s;-moz-transition:all .2s ease-out 0s;-ms-transition:all .2s ease-out 0s;-o-transition:all .2s ease-out 0s;transition:all .2s ease-out 0s}.header-bottom .main-menu ul ul.submenu>li{margin-left:7px;display:block}.header-bottom .main-menu ul ul.submenu>li>a{padding:6px 10px !important;font-size:14px;color:#0b1c39;text-transform:capitalize;text-align:left}.header-bottom .main-menu ul ul.submenu>li>a:hover{color:#FF1616;background:none;letter-spacing:0.5px}
        ul>li:hover>ul.submenu{visibility:visible;opacity:1;top:100%}.top-bg{background:#000000}
        .nav-item{display:block}@media (max-width: 575px){.nav-button .nav-tabs .nav-item{font-size:18px}}
    </style>
</head>
<body>



<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
        <a class="navbar-brand" href="/">dirEngine.</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> Menu
        </button>



        <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active"><a href="/" class="nav-link">Home</a></li>

                <c:if test="${userId==null}">
                <li class="nav-item"><a href="/login" class="nav-link">로그인</a></li>
                <li class="nav-item"><a href="/register" class="nav-link">회원가입</a></li>
                </c:if>

                <c:if test="${userId!=null}">


                    <c:if test="${userId == 'admin'}">
                        <li class="nav-item"><a href="/mypage" class="nav-link">관리자페이지</a></li>
                        <li class="nav-item"><a href="/accommodation" class="nav-link">숙소등록</a></li>
                        <li class="nav-item"><a href="/room" class="nav-link">객실등록</a></li>
                        <li class="nav-item"><a href="/logOut" class="nav-link">로그아웃</a></li>

                    </c:if>

                <c:if test="${userId != 'admin'}">

                    <li class="nav-item"><a href="/mypage" class="nav-link">mypage</a></li>
                    <li class="nav-item"><a href="/logOut" class="nav-link">로그아웃</a></li>
                </c:if>
                </c:if>





                <li class="nav-item"><a href="/accommodationMain" class="nav-link">Hotel</a></li>

                <li class="nav-item"><a href="/notice" class="nav-link">공지사항</a>





                </li>

            </ul>
        </div>
    </div>






</nav>

<!-- END nav -->






<div class="hero-wrap js-fullheight" style="background-image: url('/mainImg/main.jpg');">

</div>







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