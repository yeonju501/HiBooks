<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Benco - Furniture Bootstrap 4 HTML Template</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
    <!-- <link rel="stylesheet" href="../assets/css/service-search.css"> -->
    <link rel="stylesheet" href="../assets/css/responsive.css">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <!-- search page css-->
    <script src="../assets/js/vendor/modernizr-2.8.3.min.js"></script>
    <script src="../assets/js/vendor/jquery-1.12.0.min.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js" type="text/javascript"></script>
    <script src="../assets/js/service-search.js"></script>
</head>

<body>
    <div class="wrapper">
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
                                        		<a href="../member/login.do"><span>로그인</span></a>
                                        	</sec:authorize> 
                							<sec:authorize access="isAuthenticated()">
                								<form id="log-out" action = "../member/logout.do" method = 'post'>
                									<a onclick="logoutSubmit()" style="cursor: pointer"><span>로그아웃</span></a>
                									<input type = "hidden" name = "${_csrf.parameterName }" value = "${_csrf.token }"/>
                								</form>
                							</sec:authorize> 
                                        </div>
                                    </li>
                                    <li>
                                        <div class="switcher">
                                             <sec:authorize access="isAnonymous()">
                                        		<a href="../member/join.do"><span> 회원가입</span></a>
                                        	</sec:authorize> 
                                        </div>
                                    </li>
                                    <li>
                                        <div class="switcher">
                                            <a href="../purchase/cart.do"><span> 장바구니</span></a>
                                            
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
                                    <form name="searchinput" method="post" action="../product/search.do">
	                                    <input type="text" class="input_text" id="keyword" name="keyword" placeholder="제목, 저자, 출판사 검색">
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
                                                <li class="active"><a href="../book/shop.do">책</a>
                                                    <ul>
                                                        <li><a href="../book/shop.do?cate=100">소설</a></li>
                                                        <li><a href="../book/shop.do?cate=200">경영/경제</a></li>
                                                        <li><a href="../book/shop.do?cate=300">인문/사회/역사</a></li>
                                                        <li><a href="../book/shop.do?cate=400">자기계발</a></li>
                                                        <li><a href="../book/shop.do?cate=500">에세이/시</a></li>
                                                        
                                                    </ul>
                                                </li>
												
                                                <li><a id="in" href="../recommend/list.do">추천</a></li>
												<li><a id="in" href="">커뮤니티</a></li>
												<li  class="active"><a href="">공지/문의 <i class="ion-ios-arrow-down"></i></a>
												<ul>
													<li><a href="../boardNotice/list.do"> 공지</a></li>
													<li><a href="../boardq/list.do"> 문의</a></li>
                                                    	
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
											<li class="active"><a href="../book/shop.do">책 <i class="ion-ios-arrow-down"></i></a>
												<ul>
													<li><a href="../book/shop.do?cate=100">소설</a></li>
													<li><a href="../book/shop.do?cate=200">경영/경제</a></li>
													<li><a href="../book/shop.do?cate=300">인문/사회/역사</a></li>
													<li><a href="../book/shop.do?cate=400">자기계발</a></li>
													<li><a href="../book/shop.do?cate=500">에세이/시</a></li>
													
												</ul>
											</li>
											<li><a href="../recommend/list.do">추천</a></li>
											<li><a href="">커뮤니티</a></li>
											<li><a href="">공지/문의 <i class="ion-ios-arrow-down"></i></a>
												<ul>
													<li><a href="../boardNotice/list.do"> 공지</a></li>
													<li><a href="../boardq/list.do"> 문의</a></li>
                                                    
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
        
        <div class="shop-wrapper pt-30 pb-60">
            <div class="container">
                <div class="grid-list-product-wrapper">
                    <div class="product-grid product-view">
                        <div class="row">
                        	<div class="col-1"></div>
                        	<div class="col-10">
								<div class="row">
                                    <div class="col-lg-12 col-md-12 col-12 ">
                                        <!-- <div class="shop_top_banner">
                                            <img src="assets/img/banner/shop-banner.jpg" alt="">
                                        </div> -->
                                        <div class="tolbar__area">
                                            <div class="toolbar clearfix">
                                                <div class="toolbar-inner">

                                                    <div class="shop-tab view-mode nav" role=tablist>
                                                        <a class="active" href="#product-grid" data-toggle="tab" role="tab" aria-selected="false">
                                                            <i class="ion-grid"></i>
                                                        </a>
                                                        <a href="#product-list" data-toggle="tab" role="tab" aria-selected="true">
                                                            <i class="ion-navicon"></i>
                                                        </a>
                                                    </div>
                                                    <p class="woocommerce-result-count">
                                                       	 키워드  "${sessionScope.keyword}"의 검색 결과, Showing ${listResult.cp} Page, Total Book: ${listResult.totalCount} results
                                                    </p>
                                                    <!-- <form method="get" class="woocommerce-ordering hidden-xs">
                                                        <div class="orderby-wrapper">
                                                            <label>Sort By :</label>
                                                            <select class="orderby">
                                                                <option >Default sorting</option>
                                                                <option value="popularity">Sort by popularity</option>
                                                                <option value="rating">Sort by average rating</option>
                                                                <option value="date">Sort by newness</option>
                                                                <option value="price">Sort by price: low to high</option>
                                                                <option value="price-desc">Sort by price: high to low</option>
                                                            </select>
                                                        </div>
                                                    </form> -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="shop-product-content tab-content">
                                    <div id="product-grid" class="tab-pane fade active show">
                                        <div class="row">
                                        <c:if test="${empty listResult}">
                                          	<div class="col-lg-3 col-md-6 col-12">
                                                <div class="product-wrapper mb-60">
                                          		검색결과가 없습니다.
                                          		</div>
                                          	</div>
                                        </c:if>
                                        <c:forEach items="${listResult.list}" var="book">
                                            <div class="col-lg-3 col-md-6 col-12">
                                                <div class="product-wrapper mb-60">
                                                <div class="product-img">
                                                        <a href="content.do?itemId=${book.b_itemId }">
                                                            <img alt="" src="${book.b_img}">
                                                        </a>
                                                        <div class="product-action-2">
                                                        	<input type="hidden" id="itemId" value="${book.b_itemId }"/>
                                                            <a href="../purchase/add.do?itemId=${book.b_itemId}" title="Add To Cart"  class="action-plus-2 tooltip">
                                                                <i class="zmdi zmdi-shopping-cart-plus"></i>
                                                            </a>
                                                        </div>
                                                        <div class="rating-box">
                                                             <c:forEach begin="1" end="${book.b_rate-(book.b_rate%1)}">
                                                                 <i class="fa fa-star" style="color: red;"> </i>
                                                             </c:forEach>
                                                             <c:forEach begin="${book.b_rate-(book.b_rate%1)+1}" end="5">
                                                                 <i class="far fa-star"> </i>
                                                             </c:forEach>
                                                        </div>
                                                    </div>
                                                    <div class="product-content text-center">
                                                        <h4>
                                                            <a href="content.do?itemId=${book.b_itemId }">${book.b_title}</a>
                                                        </h4>
                                                        <div class="product-price-2">
                                                            <div class="price-box">
                                                                <ins>
                                                                    <span class="amount">
                                                                        ${book.b_price}<span class="Price-currencySymbol">원</span>
                                                                    </span>
                                                                </ins>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            </c:forEach>
                                            </div>
                                            </div>
                                            
                                            
                                            
                                            
                                            
                                          
                                          

							<!-- 세로형 리스트-->
                                     <div id="product-list" class="tab-pane fade">
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-12">
	                                            <c:if test="${empty listResult}">
	                                          		<div class="col-lg-3 col-md-6 col-12">
		                                                <div class="product-wrapper mb-60">
		                                          		검색결과가 없습니다.
		                                          		</div>
		                                          	</div>
	                                        	</c:if>
                                                <c:forEach items="${listResult.list}" var="book">
                                               <div class="product-wrapper mb-60">
	                                                    <div class="product-img">
	                                                        <a href="content.do?itemId=${book.b_itemId }">
	                                                            <img alt="" src="${book.b_img}">
	                                                        </a>
	                                                    </div>
	                                                    <div class="product-content">
	                                                        <h4>
	                                                            <a href="content.do?itemId=${book.b_itemId }">${book.b_title }</a>
	                                                        </h4>
	                                                        <div class="row" id="row-product-info">
	                                                            <div class="col-md-12" id="col-product-info">
	                                                                <div class="rating-box">
	                                                                    <br>                                                                        
	                                                                    <c:forEach begin="1" end="${book.b_rate-(book.b_rate%1)}">
		                                                                    <i class="fa fa-star" style="color: red;"> </i>
		                                                                </c:forEach>
		                                                                <c:forEach begin="${book.b_rate-(book.b_rate%1)+1}" end="5">
		                                                                    <i class="far fa-star"> </i>
		                                                                </c:forEach>
	                                                                    <span>&nbsp;${book.b_rate }</span>
	                                                                    &nbsp;|&nbsp;
	                                                                    <span>${book.b_writer}</span>&nbsp;|&nbsp;
	                                                                    <span>${book.b_publisher}</span>&nbsp;|&nbsp;
	                                                                    <span>${book.b_cate}</span>&nbsp;|&nbsp;
	                                                                </div>
	                                                            </div>
	                                                            
	
	                                                        </div>
	                                                        
	                                                        <p>
	                                                        <c:choose>
		                                                        <c:when test="${fn:length(book.b_desc) gt 451}">
		                                                           	${fn:substring(book.b_desc, 0, 451)}...
		                                                        </c:when>
		                                                        <c:otherwise>
		                                                        	${book.b_desc}
		                                                        	<c:forEach begin="0" end="${(451- fn:length(book.b_desc)) / 52 + 1}"><br></c:forEach>
		                                                        </c:otherwise>
	                                                        </c:choose>
	                                                        </p>
	                                                        
	                                                        <div class="product-price-2">
	                                                            <div class="price-box">
	                                                                <ins>
	                                                                    <span class="amount">
	                                                                        ${book.b_price}<span class="Price-currencySymbol">원</span>
	                                                                    </span>
	                                                                </ins>
	                                                            </div>
	                                                        </div>
	                                                        <div class="product-action-2">
	                                                            <a href="../purchase/add.do?itemId=${book.b_itemId}" title="Add To Cart"  class="action-plus-2 list_bg_add tooltip">
	                                                                <i class="zmdi zmdi-shopping-cart-plus"></i> 장바구니 담기
	                                                            </a>
	                                                         </div>
	                                                    </div>
	
	                                                </div>
                                                </c:forEach>
                                                </div>
                                                </div>
                                                </div>
                                    </div>
                              </div>
                         	<div class="col-1"></div>
                          </div>
                       

                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-12">
                                        <div class="pagination-style text-center">
                                            <ul>
                                            	<c:if test="${listResult.prev}">
	                                                <li>
	                                                    <a href="search.do?cp=${listResult.cp - 1}">
	                                                        <i class="ion-chevron-left"></i>
	                                                    </a>
	                                                </li>
	                                            </c:if>
                                                <c:forEach begin="${listResult.startPage }" end="${listResult.endPage }" var="i"> 
	                                                <c:if test="${i == listResult.cp }">
		                                                <li>
		                                                    <a class="active" href="search.do?cp=${i}">${i}</a>
		                                                </li>
	                                                </c:if>
	                                                <c:if test="${i != listResult.cp }">
		                                                <li>
		                                                    <a href="search.do?cp=${i}">${i}</a>
		                                                </li>
	                                                </c:if>                            
                                                </c:forEach>
                                                <c:if test="${listResult.next }">
	                                                <li>
	                                                    <a href="search.do?cp=${listResult.cp + 1}">
	                                                        <i class="ion-chevron-right"></i>
	                                                    </a>
	                                                </li>
	                                            </c:if>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            
        
        
        <!-- Slider Start -->
       
        <!-- Slider End -->
       
        <!-- douball product start -->
       
        <!-- Hot deals area start -->
      
        <!-- Tab Products Start -->
        
        <!-- store area start -->
        
        <!-- Home Blog area start -->
        
        <!-- Brand area start -->
        
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
                                        <h3>H!BooKs</h3>
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
                        <p>&copy; Copyright Banco All Rights Reserved</p>
                    </div>
                </div>
                <!--Footer Bottom Area End-->
            </div>
        </footer>
        <!-- modal -->
        
    </div>

    <!-- all js here -->
    <script src="../assets/js/vendor/jquery-1.12.0.min.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js" type="text/javascript"></script>
    <script src="../assets/js/popper.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
    <script src="../assets/js/isotope.pkgd.min.js"></script>
    <script src="../assets/js/imagesloaded.pkgd.min.js"></script>
    <script src="../assets/js/jquery.counterup.min.js"></script>
    <script src="../assets/js/waypoints.min.js"></script>
    <script src="../assets/js/tippy.min.js"></script>
    <script src="../assets/js/ajax-mail.js"></script>
    <script src="../assets/js/owl.carousel.min.js"></script>
    <script src="../assets/js/plugins.js"></script>
    <script src="../assets/js/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    
    </body>

</html>
