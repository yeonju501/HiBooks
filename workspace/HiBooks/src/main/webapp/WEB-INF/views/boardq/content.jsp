<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0, user-scalable=no"  name="viewport">
  <title>HiBooks</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="../img/favicon.png" rel="icon">
  <link href="../img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
  

  <!-- Vendor CSS Files -->
  <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="../vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="../vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="../vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="../vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="../vendor/line-awesome/css/line-awesome.min.css" rel="stylesheet">
  <link href="../vendor/venobox/venobox.css" rel="stylesheet">
  <link href="../vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="../vendor/aos/aos.css" rel="stylesheet">
  <link href="../vendor/slick/slick-theme.css" rel="stylesheet">
  <link href="../vendor/slick/slick.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="../css/style.css" rel="stylesheet">
  <link href="../css/gnb.css" rel="stylesheet">
  <link href="../css/bootstrap.css" rel="stylesheet"> 
  
      <!-- include default css -->
    <link rel="stylesheet" href="../css/global.css" />
    <!-- //include default css -->
    <link rel="stylesheet" href="../css/sub.css" />
  <!-- =======================================================
  * Template Name: Selecao - v3.0.0
  * Template URL: https://bootstrapmade.com/selecao-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top d-flex align-items-center">
    <div class="container d-flex align-items-center justify-content-between">

      <div class="logo">
        <h1 class="text-light"><a href="index.html">H!Books</a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
      </div>

      <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li class="active"><a href="index.html">홈</a></li>
          <li><a href="signin.html">로그인</a></li>
          <li><a href="signup.html">회원가입</a></li>
          <li class="drop-down"><a href="javascript:void(0);">마이페이지</a>
            <ul>
              <li><a href="javascript:void(0);">Drop Down 1</a></li>
              <li class="drop-down"><a href="javascript:void(0);">Drop Down 2</a>
                <ul>
                  <li><a href="javascript:void(0);">Deep Drop Down 1</a></li>
                  <li><a href="javascript:void(0);">Deep Drop Down 2</a></li>
                  <li><a href="javascript:void(0);">Deep Drop Down 3</a></li>
                  <li><a href="javascript:void(0);">Deep Drop Down 4</a></li>
                  <li><a href="javascript:void(0);">Deep Drop Down 5</a></li>
                </ul>
              </li>
              <li><a href="javascript:void(0);">Drop Down 3</a></li>
              <li><a href="javascript:void(0);">Drop Down 4</a></li>
              <li><a href="javascript:void(0);">Drop Down 5</a></li>
            </ul>
          </li>

        </ul>
      </nav><!-- .nav-menu -->

    </div>
  </header><!-- End Header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex flex-column justify-content-end align-items-center">
    
    <form class="search-container">
      <input type="text" id="search-bar" placeholder="저자, 출판사, 책이름 검색">
      <a href="javascript:void(0);"><img class="search-icon" src="http://www.endlessicons.com/wp-content/uploads/2012/12/search-icon.png"></a>
    </form>

    <div id="gnb" class="gnb">
      <ul class="gnb-dep01-list">
        <li>
          <a href="javascript:void(0);" class="gnb-toggle"><i class="fa fa-bars"></i></a>
          <div class="gnb-dep02">
            <div class="gnb-dep02-inner">
              <ul class="gnb-dep02-list">
                <li>
                  <a href="javascript:void(0);" class="gnb-dep02-list-title">전체</a>
                </li>
                <li>
                  <a href="javascript:void(0);" class="gnb-dep02-list-title">인문학</a>
                </li>
              </ul>
            </div>
          </div>
        </li>
        <li>
          <a href="javascript:void(0);">베스트</a>
        </li>
        <li>
          <a href="javascript:void(0);">신간</a>
        </li>
        <li>
          <a href="javascript:void(0);">추천</a>
        </li>
        <li>
          <a href="javascript:void(0);">커뮤니티</a>
        </li>
        <li>
          <a href="javascript:void(0);">문의</a>
        </li>
      </ul>
    </div>
  </section><!-- End Hero -->
  
   
    <!-- contents -->
       <div class="contents" id="content">
        <!-- sub -->
        <section class="sub sub--notice" style="padding-top:0px;">

            <!-- section__01 -->
            <!-- <div class="section section__01">
                <div class="thumbnail"></div>
                <div class="title__wrap">
                    <h1 class="title title--h1">공지사항</h1>
                </div>
            </div> -->
            <!-- //section__01 -->

            <!-- section__02 -->
            <!-- <div class="section section__02">
               <ul class="breadcrumb">
                    <li class="breadcrumb__item breadcrumb__item--home">
                        <a href="#"><span class="hidden">HOME</span></a>
                    </li>
                    <li class="breadcrumb__item">
                        <a href="javascript:void(0);"><span>공지사항</span></a>
                    </li>
                </ul>
            </div> -->
            <!-- //section__02 -->

            <!-- section__03 -->
            <div class="section section__03">
                <div class="title__wrap">
                    <h2 class="title title--h2" data-title="QNA" style="font-size:35px;padding-top:10px;
                    padding-bottom:30px;padding-right:10px;border-bottom: unset;"><span>Q&A</span></h2>
                </div>
                <div class="board">
                    <div class="board__head" style="padding-top:10px;padding-bottom:10px;padding-left:30px">
                        <h3 class="title title--h3" style="font-size:20px;padding-bottom:10px;">${contentResult.boardq.qb_subject}</h3>
                        <div class="info">
                            <span class="info__item info__item--date">${contentResult.boardq.qb_rdate}</span>
                            <span class="info__item info__item--author">${contentResult.boardq.m_email}</span>
                            <!-- <a class="info__item info__item--link"><i class="icon icon--download"><span class="hidden">다운로드</span></i>공시송달 공고문(2018년 상반기).hwp</a> -->
                        </div>
                    </div>
                    <div class="board__body" style="padding-left: 30px;">
                        <p class="board__text">${contentResult.boardq.qb_content}</p>
                    </div>
                    <div class="board__footer">
                    <a href='del.do?qb_seq=${contentResult.boardq.qb_seq}'><button type="button" class="button button--list" >삭제</button></a>
                    <a href="list.do"><button type="button" class="button button--list" >목록</button></a>
                        <a href="reply.do?qb_ref=${contentResult.boardq.qb_ref}&qb_lev=${contentResult.boardq.qb_lev}&qb_sun=${contentResult.boardq.qb_sun}">
                        <button type="button" class="button button--list">답글</button></a>
                        <%-- <div class="navigation">
                            <table class="table">
                                <colgroup>
                                    <col>
                                    <col>
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th>이전글</th>
                                        <td><a href="#" class="bar">석유 및 석유대체연료사업법 위반 석유판매업(주유소) 행정처분 공표</a></td>
                                    </tr>
                                    <tr>
                                        <th>다음글</th>
                                        <td><a href="#" class="bar">공개감사 안내문</a></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div> --%>
                    </div>
                </div>
            </div>
            <!-- //section__03 -->
        </section>
        <!-- //sub -->
    </div>
  <!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="container">
      <h3>HiBooks</h3>
      <p>Et aut eum quis fuga eos sunt ipsa nihil. Labore corporis magni eligendi fuga maxime saepe commodi placeat.</p>
      <div class="social-links">
        <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
        <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
        <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
        <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
        <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
      </div>
      <div class="copyright">
        &copy; Copyright <strong><span>highfive</span></strong>. All Rights Reserved
      </div>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top"><i class="ri-arrow-up-line"></i></a>

  <!-- Vendor JS Files -->
  <script src="../vendor/jquery/jquery.min.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="../vendor/php-email-form/validate.js"></script>
  <script src="../vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="../vendor/venobox/venobox.min.js"></script>
  <script src="../vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="../vendor/aos/aos.js"></script>
  <script src="../vendor/slick/slick.js"></script>

  <!-- Template Main JS File -->
  <script src="../js/main.js"></script>
  <script src="../js/common.js"></script>
	<script src="../js/vendor.js"></script>

  <script type="text/javascript">
    $(document).ready(function(){
      $('.gnb-toggle').on('click', function(e){
        e.preventDefault();
        e.stopImmediatePropagation();
        console.log('테스트')
        $('.gnb-dep02-list').toggle('is-active');
      })
    });
  </script>

</body>
</html>
