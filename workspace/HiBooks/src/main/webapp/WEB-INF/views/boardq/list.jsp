<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Hibooks</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- security and ajax 403 -->
	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">
	
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="../assets/img/favicon.png">
	
    <!-- all css here -->
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/animate.css">
    <link rel="stylesheet" href="../assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="../assets/css/chosen.min.css">
    <link rel="stylesheet" href="../assets/css/themify-icons.css">
    <link rel="stylesheet" href="../assets/css/fontawesome-all.css">
    <link rel="stylesheet" href="../assets/css/ionicons.min.css">
    <link rel="stylesheet" href="../assets/css/material-design-iconic-font.css">
    <link rel="stylesheet" href="../assets/css/meanmenu.min.css">
    <link rel="stylesheet" href="../assets/css/tippy.css">
    <link rel="stylesheet" href="../assets/css/bundle.css">
    <link rel="stylesheet" href="../assets/css/style.css">
    <link rel="stylesheet" href="../assets/css/service-index.css">
    <link rel="stylesheet" href="../assets/css/responsive.css">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script src="../assets/js/vendor/modernizr-2.8.3.min.js"></script>
    <script src="../assets/js/vendor/jquery-1.12.0.min.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js" type="text/javascript"></script>
    <script src="../assets/js/service-search.js"></script>
    
</head>

<body>

<!-- header start -->
        <header id="header_background">
            <div class="header-topbar header-topbar-style-1">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-6 col-xs-12">
                            <div class="header-top-left">
                                <ul>
                                    <li>
                                        <h3 id="logo"><a href="/">H!Books</a></h3>
                                    </li>
                                    <li>
                                        
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-6  col-xs-12 ">
                            <div class="header-top-right">
                                <ul>
                                    <li>
                                        <div class="switcher">
                                  
                                        	<sec:authorize access="isAnonymous()">
                                        		<a href="member/login.do"><span>로그인</span></a>
                                        	</sec:authorize> 
                							<sec:authorize access="isAuthenticated()">
                								<form id="log-out" action = "member/logout.do" method = 'post'>
                									<a onclick="logoutSubmit()" style="cursor: pointer"><span>로그아웃</span></a>
                									<input type = "hidden" name = "${_csrf.parameterName }" value = "${_csrf.token }"/>
                								</form>
                							</sec:authorize> 
                                        </div>
                                    </li>
                                    <li>
                                        <div class="switcher">
                                        	<sec:authorize access="isAnonymous()">
                                        		<a href="member/join.do"><span> 회원가입</span></a>
                                        	</sec:authorize> 
                							
                                        </div>
                                    </li>
                                    <li>
                                        <div class="switcher">
                                            <a href="purchase/cart.do"><span> 장바구니</span></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="switcher menu_page my_acc">
                                            <ul>
                                                <li class="switcher-menu-active">
                                                    <a >마이페이지</a>
                                                    <ul class="switcher__menus">
                                                        <li class="switcher-menu-item">
                                                            <a href="../member/moveMyInfo.do">내 정보</a>
                                                        </li>
                                                        <li class="switcher-menu-item">
                                                            <a href="../wishList/moveWishPage.do">위시리스트</a>
                                                        </li>  
                                                        <sec:authorize access="isAuthenticated()">
	                                                        <sec:authorize access="hasRole('ROLE_ADMIN')">
	                                                        <li class="switcher-menu-item">
	                                                            <a href="../admin/recommend.do">관리자페이지</a>
	                                                        </li>
	                                                        </sec:authorize>
                                                        </sec:authorize>
                                                        <li class="switcher-menu-item">
                                                            <a href="../purchase/orderComplete.do">결제내역</a>
                                                        </li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="header-topbar header-topbar-style-1">
                <div class="container-fluid">
                    <div class="row">
                        
                        <div class="col-md-3"></div>
                        <div class="col-md-6">
                            <div class="search__sidbar">
                                <div class="input_form">
                                    <form name="searchinput" method="post" action="product/search.do">
	                                    <input type="text" id="keyword" class="input_text" name="keyword" placeholder="제목, 저자, 출판사 검색">
	                                    <input type = "hidden" name = "${_csrf.parameterName }" value = "${_csrf.token }"/>
	                                    <button id="searchinput" type="button" class="button">
	                                        <i class="fa fa-search fa-lg"></i>
	                                    </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-3"></div>
                        
                    </div>
                </div>
            </div>
            <div class="header_area hdr_1">
                <div class="container-fluid">
                    <div class="row">
                        
                        <div class="col-md-8 col-xs-12">
                            <div class="main_menu_area">
                                <div class="main-menu">
									<nav>
                                            <ul id="main-custom">
                                                <li class="active"><a href="book/shop.do">책</a>
                                                    <ul>
                                                        <li><a href="book/shop.do?cate=100">소설</a></li>
                                                        <li><a href="book/shop.do?cate=200">경영/경제</a></li>
                                                        <li><a href="book/shop.do?cate=300">인문/사회/역사</a></li>
                                                        <li><a href="book/shop.do?cate=400">자기계발</a></li>
                                                        <li><a href="book/shop.do?cate=500">에세이/시</a></li>
                                                        
                                                    </ul>
                                                </li>
												
                                                <li><a id="in" href="recommend/list.do"">추천</a></li>
												
                                                <li><a id="in" href="">커뮤니티</a></li>

                                                <li class="active"><a href="">공지/문의</a>
                                                    <ul>
                                                        <li><a href="boardNotice/list.do">공지</a></li>
                                                        <li><a href="boardq/list.do">문의</a></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </nav>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2 col-xs-12">
                        </div>
                        <div class="col-md-2 col-xs-12">
                        </div>
                        <div class="mobile-menu-area ">
                            <div class="mobile-menu">
                                    <nav id="mobile-menu-active">
                                        <ul class="menu-overflow">
											<li class="active"><a href="book/shop.do">책 <i class="ion-ios-arrow-down"></i></a>
												<ul>
													<li><a href="book/shop.do?cate=100">소설</a></li>
													<li><a href="book/shop.do?cate=200">경영/경제</a></li>
													<li><a href="book/shop.do?cate=300">인문/사회/역사</a></li>
													<li><a href="book/shop.do?cate=400">자기계발</a></li>
													<li><a href="book/shop.do?cate=500">에세이/시</a></li>
													
												</ul>
											</li>
											
											<li><a href="">추천</a></li>
											
											<li><a href="">커뮤니티</a></li>
											
											<li><a href="">공지/문의 <i class="ion-ios-arrow-down"></i></a>
												<ul>
													<li><a href="portfolio.html"> 공지</a></li>
													<li><a href="boardq/list.do"> 문의</a></li>
                                                    <li><a href="service.html"> ....</a></li>
												</ul>
											</li>
											
											
                                        </ul>
                                    </nav>  
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </header>
        <!-- header end -->

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
    
    <!--  footer -->
  <footer class="footer-color">
            <div class="footer-container">
                <!--Footer Top Area Start-->
                <div class="footer-top-area ptb-90 text-center">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-10 offset-lg-1 col-12">
                                <!--Footer Logo Start-->
                                <div class="footer-logo">
                                    <a href="/">
                                        <h3>H!Books</h3>
                                    </a>
                                </div>
                                <!--Footer Logo End-->
                                <!--Footer Nav Start-->
                                <div class="footer-nav">
                                    <nav>
                                        <ul>
                                            <li>
                                                <a href="#">Home</a>
                                            </li>
                                            <li>
                                                <a href="#">Shop</a>
                                            </li>
                                            <li>
                                                <a href="#">Policies</a>
                                            </li>
                                            <li>
                                                <a href="#">About Us</a>
                                            </li>
                                            <li>
                                                <a href="#">Contact</a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                                <!--Footer Nav End-->
                                <!--Footer Social Icon Start-->
                                <div class="footer-social">
                                    <ul>
                                        <li>
                                            <a href="#">
                                                <i class="fab fa-facebook-f"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fab fa-twitter"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fab fa-instagram"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fab fa-linkedin"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fas fa-rss"></i>
                                            </a>
                                        </li>

                                    </ul>
                                </div>
                                <!--Footer Social Icon End-->
                                <!--Footer Newsletter Start-->
                                <!-- <div class="footer-newsletter"> -->
                                    <!-- Newsletter Form -->
                                <!-- </div> -->
                                <!--Footer Newsletter End-->
                            </div>
                        </div>
                    </div>
                </div>

                <!--Footer Top Area End-->
                <!--Footer Bottom Area Start-->
                <div class="footer-bottom-area">
                    <div class="container text-center">
                        <p>&copy; Copyright Hi-Five All Rights Reserved</p>
                    </div>
                </div>
                <!--Footer Bottom Area End-->
            </div>
        </footer>

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
