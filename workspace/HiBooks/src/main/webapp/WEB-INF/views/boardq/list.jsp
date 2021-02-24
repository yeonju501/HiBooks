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
           <!--  <div class="section section__01">
                <div class="thumbnail"></div>
                <div class="title__wrap">
                    <h1 class="title title--h1">공지사항</h1>
                </div>
            </div> -->
            <!-- //section__01 -->

            <!-- section__02 -->
           <!--  <div class="section section__02">
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
            <div class="section section__03"">
                <div class="title__wrap">
                    <h2 class="title title--h2" data-title="QNA" style="font-size:35px;padding-top:10px;padding-bottom:30px;padding-right:10px;border-bottom: unset;"><span>Q&A</span></h2>
                </div>
               <!--  <div class="search__wrap" style="padding-top:20px;padding-bottom:20px;">
                    <div class="search__item">
                        <div class="title"><span>검색</span></div>
                        <div class="input input--select">
                            <div class="input__group">
                                <div class="input__item input__item--select">
                                    <select>
                                        <option value="제목">제목</option>
                                        <option value="내용">내용</option>
                                        <option value="제목+내용">제목+내용</option>
                                    </select>
                                </div>
                                <div class="input__item input__item--text">
                                    <input type="text">
                                </div>
                            </div>
                        </div>
                        <a href="#" class="button button--search"><span>검색</span></a>
                    </div>
                </div>
            </div> -->
            <!-- //section__03 -->

            <!-- section__04 -->
             <div class="section section__04">
                <!-- <div class="support">
                    등록수 총 <span class="support__num">10</span> 건
                </div> -->
                <!-- pc -->
                <div class="table__wrap">
                    <table>
                        <caption class="caption hidden">Q&A</caption>
                        <colgroup>
                            <col style="width:30px;">
                            <col style="width:60px;">
                            <col style="width:250px;">
                            <col style="width:100px;">
                            <col style="width:60px;">
                            <col style="width:30px;">
                        </colgroup>
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>카테고리</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>날짜</th>
                                <th>조회수</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:if test="${empty listResult}">
							<tr align="center" noshade>
							   <td colspan="5">데이터가 하나도 없음</td>
							</tr>
						</c:if>
                        <c:forEach items="${listResult.list}" var="boardq">
                            <tr>
                                <td>${boardq.qb_seq}</td>
                                
                                <c:choose>
								<c:when test="${boardq.qb_cat == 0}">
								<td style="padding-right:0px;text-align:center;color:#888;">상품 문의</td>
								</c:when>
								<c:when test="${boardq.qb_cat == 1}">
								<td style="padding-right:0px;text-align:center;color:#888;">배송 문의</td>
								</c:when>
								<c:when test="${boardq.qb_cat == 2}">
								<td style="padding-right:0px;text-align:center;color:#888;">결제 문의</td>
								</c:when>
								<c:when test="${boardq.qb_cat == 3}">
								<td style="padding-right:0px;text-align:center;color:#888;">기타</td>
								</c:when>
								</c:choose>
								<td>
									<c:forEach begin="1" end="${boardq.qb_lev}">
				                   	&nbsp;&nbsp;&nbsp;
								</c:forEach>
								<a href="content.do?qb_seq=${boardq.qb_seq}" >
									<c:if test="${boardq.qb_lev > 0}"><img class="reple" src="../img/icon_bbs_answer.gif">Re:</c:if>
									${boardq.qb_subject}
								</a>
								</td>
								<td>${boardq.m_email}</td>
								<td>${boardq.qb_rdate}</td>
								<td>${boardq.qb_count}</td>
							   </tr> 
						</c:forEach> 
                        </tbody>
                    </table>
                </div>
                	<a class="btn btn-default" href="write.do">글쓰기</a>
                <div class="pagination">
                    <a href="#" class="pagination__item"><i class="icon icon--first"><span class="hidden">FIRST</span></i></a>
                    <a href="#" class="pagination__item"><i class="icon icon--prev"><span class="hidden">PREV</span></i></a>
                    <div class="pagination__item pagination__item--page">
                       <c:forEach begin="1" end="${listResult.totalPageCount}" var="i">
                        <a href="list.do?cp=${i}">
                        <c:choose>
						<c:when test="${i==listResult.cp}">
                        <strong>${i}</strong>
						</c:when>
						<c:otherwise>
				        	${i}
				        </c:otherwise>
				        </c:choose>
				        </a>
				        </c:forEach>
                    </div>
                    <a href="#" class="pagination__item"><i class="icon icon--next"><span class="hidden">NEXT</span></i></a>
                    <a href="#" class="pagination__item"><i class="icon icon--last"><span class="hidden">LAST</span></i></a>
                </div>
			       <div class="container" style="padding-top:10px;padding-bottom:30px;"> 
			    <select id="psId" name="ps" onchange="f(this)">
			    	<c:choose>
			    		<c:when test="${listResult.ps == 10}">
			    		   <option value="10" selected>10개 보기</option>
					       <option value="15">15개 보기</option>
					       <option value="20">20개 보기</option>
			    		</c:when>
			    		<c:when test="${listResult.ps == 15}">
			    		   <option value="10">10개 보기</option>
					       <option value="15" selected>15개 보기</option>
					       <option value="20">20개 보기</option>
			    		</c:when>
			    		<c:when test="${listResult.ps == 20}">
			    		   <option value="10">10개 보기</option>
					       <option value="15">15개 보기</option>
					       <option value="20" selected>20개 보기</option>
			    		</c:when>
			    	</c:choose>
			    </select>
			    <br/>
			    <script language="javascript">
			       function f(select){
			           //var el = document.getElementById("psId");
			           var ps = select.value;
			           //alert("ps : " + ps);
			           location.href="list.do?ps="+ps;
			       }
			    </script>
			    </div>     
                <!-- // pc -->

                <!-- mo -->
               <!--  <div class="table__list">
                    <div class="table__item">
                        <a href="#" class="table__item--head">2018년 희망 리턴패키지 제기교육 참여자 모집리턴패키지 제기교육 참여자 모집리턴패키지 제기교육 참여자 모집리턴패키지 제기교육 참여자 모집리턴패키지 제기교육 참여자 모집</a>
                        <div class="table__item--foot">
                            <span class="table__cell">2018-11-30</span>
                            <span class="table__cell"><i class="icon icon--download"><span class="hidden">다운로드</span></i></span>
                        </div>
                    </div>
                    <div class="table__item">
                        <a href="#" class="table__item--head">2018년 희망 리턴패키지</a>
                        <div class="table__item--foot">
                            <span class="table__cell">2018-11-30</span>
                            <span class="table__cell"><i class="icon icon--download"><span class="hidden">다운로드</span></i></span>
                        </div>
                    </div>
                    <div class="table__item">
                        <a href="#" class="table__item--head">2018년 희망 리턴패키지 제기교육 참여자 모집</a>
                        <div class="table__item--foot">
                            <span class="table__cell">2018-11-30</span>
                            <span class="table__cell"><i class="icon icon--download"><span class="hidden">다운로드</span></i></span>
                        </div>
                    </div>
                    <div class="table__item">
                        <a href="#" class="table__item--head">2018년 리턴패키지 제기교육 참여자 모집</a>
                        <div class="table__item--foot">
                            <span class="table__cell">2018-11-30</span>
                            <span class="table__cell"><i class="icon icon--download"><span class="hidden">다운로드</span></i></span>
                        </div>
                    </div>
                    <div class="table__item">
                        <a href="#" class="table__item--head">2018년 희망모집</a>
                        <div class="table__item--foot">
                            <span class="table__cell">2018-11-30</span>
                            <span class="table__cell"><i class="icon icon--download"><span class="hidden">다운로드</span></i></span>
                        </div>
                    </div>
                    <a href="#" class="button button--more">
                        <i class="icon icon--more"><span>더보기</span></i>
                    </a>
                </div> -->
                <!-- // mo -->
            </div>
            <!-- //section__04 -->
        </section>
        <!-- //sub -->
    </div>
    <!-- //contents -->
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
