<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
    <link rel="stylesheet" href="../assets/css/service-search.css">
    <link rel="stylesheet" href="../assets/css/responsive.css">
    <!-- search page css-->
        <script src="../assets/js/vendor/modernizr-2.8.3.min.js"></script>
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
                                                            <a href="">내 정보</a>
                                                        </li>
                                                        <li class="switcher-menu-item">
                                                            <a href="">위시리스트</a>
                                                        </li>
                                                        <li class="switcher-menu-item">
                                                            <a href="">커뮤니티</a>
                                                        </li>
                                                        <li class="switcher-menu-item">
                                                            <a href="">...</a>
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
                                    <form name="searchinput" method="post" action="search.do">
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
												
                                                <li><a id="in" href="">베스트</a></li>
												
                                                <li><a id="in" href="">추천</a></li>
												
                                                <li><a id="in" href="">커뮤니티</a></li>

                                                <li class="active"><a href="">공지/문의</a>
                                                    <ul>
                                                        <li><a href="">공지</a></li>
                                                        <li><a href="../boardq/list.do">문의</a></li>
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
											
											<li><a href="">베스트 </a></li>
											
											<li><a href="">추천</a></li>
											
											<li><a href="">커뮤니티</a></li>
											
											<li><a href="">공지/문의 <i class="ion-ios-arrow-down"></i></a>
												<ul>
													<li><a href=""> 공지</a></li>
													<li><a href="../boardq/list.do"> 문의</a></li>
                                                    <li><a href=""> ....</a></li>
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
        <!-- breadcrumbs area start -->
        <!-- <div class="title-breadcrumbs">
            <div class="title-breadcrumbs-inner">
                <div class="container">
                    <nav class="woocommerce-breadcrumb">
                        <a href="#">Home</a>
                        <span class="separator">/</span> Shop
                    </nav>
                </div>
            </div>
        </div> -->
        <!-- breadcrumbs area End -->
        <div class="shop-wrapper pt-100 pb-60">
            <div class="container">

                <div class="grid-list-product-wrapper">
                    <div class="product-grid product-view">
                        <div class="row">
                            <!-- <div class="col-xl-3 col-lg-3 col-md-12 col-12">
                                <div class="row_products_side">
                                    <div class="product_left_sidbar">

                                        <div class="product-filter  mb-30">
                                            <h5> Product Categories </h5>
                                            <ul class="product-categories">
                                                <li class="cat-item">
                                                    <a href="#">Accessories</a>
                                                    <span class="count">(5)</span>
                                                </li>
                                                <li class="cat-item">
                                                    <a href="#">Bedroom</a>
                                                    <span class="count">(4)</span>
                                                </li>
                                                <li class="cat-item">
                                                    <a href="#">Decor &amp; Furniture</a>
                                                    <span class="count">(12)</span>
                                                </li>
                                                <li class="cat-item">
                                                    <a href="#">Electronics &amp; Computer</a>
                                                    <span class="count">(13)</span>
                                                </li>
                                                <li class="cat-item">
                                                    <a href="#">Fashion &amp; clothings</a>
                                                    <span class="count">(13)</span>
                                                </li>
                                                <li class="cat-item">
                                                    <a href="#">Furniture</a>
                                                    <span class="count">(4)</span>
                                                </li>
                                                <li class="cat-item">
                                                    <a href="#">Home, Garden &amp; Tools</a>
                                                    <span class="count">(14)</span>
                                                </li>
                                                <li class="cat-item">
                                                    <a href="#">Laptops &amp; Desktops</a>
                                                    <span class="count">(7)</span>
                                                </li>
                                                <li class="cat-item">
                                                    <a href="#">Livingroom</a>
                                                    <span class="count">(4)</span>
                                                </li>
                                                <li class="cat-item">
                                                    <a href="#">Men</a>
                                                    <span class="count">(4)</span>
                                                </li>
                                                <li class="cat-item">
                                                    <a href="#">Mobiles &amp; Tablets</a>
                                                    <span class="count">(6)</span>
                                                </li>
                                                <li class="cat-item">
                                                    <a href="#">Sport &amp; Outdoors</a>
                                                    <span class="count">(7)</span>
                                                </li>
                                                <li class="cat-item">
                                                    <a href="#">Toy, Kids &amp; Baby</a>
                                                    <span class="count">(7)</span>
                                                </li>
                                                <li class="cat-item">
                                                    <a href="#">Uncategorized</a>
                                                    <span class="count">(0)</span>
                                                </li>
                                                <li class="cat-item">
                                                    <a href="#">Women</a>
                                                    <span class="count">(4)</span>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="product-filter  mb-30">
                                            <h5>Color</h5>
                                            <ul class="product-categories">
                                                <li class="cat-item">
                                                    <a href="#">Black</a>
                                                    <span class="count">(5)</span>
                                                </li>
                                                <li class="cat-item">
                                                    <a href="#">Blue</a>
                                                    <span class="count">(4)</span>
                                                </li>
                                                <li class="cat-item">
                                                    <a href="#">Gold</a>
                                                    <span class="count">(12)</span>
                                                </li>
                                                <li class="cat-item">
                                                    <a href="#">Red</a>
                                                    <span class="count">(13)</span>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="product-filter mb-30">
                                            <h5>Filter by price</h5>
                                            <div id="price-range"></div>
                                            <div class="price-values">
                                                <div class="price_text_btn">
                                                    <span>Price:</span>
                                                    <input type="text" class="price-amount">
                                                </div>
                                                <button class="button" type="submit">Filter</button>
                                            </div>
                                        </div>
                                        <div class="product-filter mb-30">
                                            <h5>Top Rated Products</h5>
                                            <ul class="product_list_widget">
                                                <li>
                                                    <div class="product-image">
                                                        <a title="Phasellus vel hendrerit" href="#">
                                                            <img alt="" src="assets/img/products/side_p_1.jpg">
                                                        </a>
                                                    </div>
                                                    <div class="product-info">
                                                        <a title="Phasellus vel hendrerit" href="#">
                                                            <span class="product-title">Phasellus vel hendrerit</span>
                                                        </a>
                                                        <div class="star-rating">
                                                            <div class="rating-box">
                                                                <a href="#">
                                                                    <i class="far fa-star"> </i>
                                                                </a>
                                                                <a href="#">
                                                                    <i class="far fa-star"> </i>
                                                                </a>
                                                                <a href="#" title="3 star">
                                                                    <i class="far fa-star"> </i>
                                                                </a>
                                                                <a href="#" title="4 star">
                                                                    <i class="far fa-star"> </i>
                                                                </a>
                                                                <a href="#" title="5 star">
                                                                    <i class="far fa-star"> </i>
                                                                </a>
                                                            </div>
                                                        </div>
                                                        <span class="woocommerce-Price-amount amount">
                                                            <span class="woocommerce-Price-currencySymbol">$</span>55.00</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="product-image">
                                                        <a title="Phasellus vel hendrerit" href="#">
                                                            <img alt="" src="assets/img/products/side_p_2.jpg">
                                                        </a>
                                                    </div>
                                                    <div class="product-info">
                                                        <a title="Phasellus vel hendrerit" href="#">
                                                            <span class="product-title">Phasellus vel hendrerit</span>
                                                        </a>
                                                        <div class="star-rating">
                                                            <div class="rating-box">
                                                                <a href="#">
                                                                    <i class="far fa-star"> </i>
                                                                </a>
                                                                <a href="#">
                                                                    <i class="far fa-star"> </i>
                                                                </a>
                                                                <a href="#" title="3 star">
                                                                    <i class="far fa-star"> </i>
                                                                </a>
                                                                <a href="#" title="4 star">
                                                                    <i class="far fa-star"> </i>
                                                                </a>
                                                                <a href="#" title="5 star">
                                                                    <i class="far fa-star"> </i>
                                                                </a>
                                                            </div>
                                                        </div>
                                                        <span class="woocommerce-Price-amount amount">
                                                            <span class="woocommerce-Price-currencySymbol">$</span>55.00</span>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="product-filter mb-30">
                                            <h5>product tags</h5>
                                            <div class="product-tags">
                                                <a href="#">New </a>
                                                <a href="#">brand</a>
                                                <a href="#">black</a>
                                                <a href="#">white</a>
                                                <a href="#">chire</a>
                                                <a href="#">table</a>
                                                <a href="#">Lorem</a>
                                                <a href="#">ipsum</a>
                                                <a href="#">dolor</a>
                                                <a href="#">sit</a>
                                                <a href="#">amet</a>
                                            </div>
                                        </div>


                                    </div>
                                </div>
                            </div> -->

                            <div class=" col-xl-9 col-lg-9 col-md-12 col-12">

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
                                                        Showing ${listResult.ps} of ${listResult.totalCount} results
                                                    </p>
                                                    <form method="get" class="woocommerce-ordering hidden-xs">
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
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="shop-product-content tab-content">
                                    <div id="product-grid" class="tab-pane fade active show">
                                        <div class="row">
                                        <c:if test="${empty listResult}">
                                          	데이터가 하나도 없음
                                        </c:if>
                                        <c:forEach items="${listResult.list}" var="book">
                                            <div class="col-lg-3 col-md-6 col-12">
                                                <div class="product-wrapper mb-60">
                                                    <div class="product-img">
                                                        <a href="product-details.html">
                                                            <img alt="" src="${book.b_img}">
                                                        </a>
                                                        <div class="product-action-2">
                                                            <a href="#" title="Add to Compare" class="action-plus-2 tooltip">
                                                                <i class="zmdi zmdi-refresh"></i>
                                                            </a>
                                                            <a href="#" title="Add to Wishlist" class="action-plus-2 tooltip">
                                                                <i class="zmdi zmdi-favorite-outline"></i>
                                                            </a>
                                                            <a href="#" title="Quick View" data-target="#exampleModal" data-toggle="modal" class="action-plus-2 tooltip">
                                                                <i class="zmdi zmdi-search"></i>
                                                            </a>
                                                            <a href="#" title="Add To Cart"  class="action-plus-2 tooltip">
                                                                <i class="zmdi zmdi-shopping-cart-plus"></i>
                                                            </a>
                                                        </div>
                                                        <div class="rating-box">
                                                            <a href="#" class="rated" title="1 star">
                                                                <i class="far fa-star"> </i>
                                                            </a>
                                                            <a href="#" class="rated" title="2 star">
                                                                <i class="far fa-star"> </i>
                                                            </a>
                                                            <a href="#" title="3 star">
                                                                <i class="far fa-star"> </i>
                                                            </a>
                                                            <a href="#" title="4 star">
                                                                <i class="far fa-star"> </i>
                                                            </a>
                                                            <a href="#" title="5 star">
                                                                <i class="far fa-star"> </i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="product-content text-center">
                                                        <h4>
                                                            <a href="product-details.html">${book.b_title}</a>
                                                        </h4>
                                                        <div class="product-price-2">
                                                            <div class="price-box">
                                                                <ins>
                                                                    <span class="amount">
                                                                        <span class="Price-currencySymbol">￦</span>${book.b_price}</span>
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
	                                          	데이터가 하나도 없음
	                                        	</c:if>
                                                <c:forEach items="${listResult.list}" var="book">
                                                <div class="product-wrapper mb-60">
                                                    <div class="product-img">
                                                        <a href="product-details.html">
                                                            <img alt="" src="${book.b_img}">
                                                        </a>
                                                    </div>
                                                    <div class="product-content">
                                                        <h4>
                                                            <a href="product-details.html">${book.b_title}</a>
                                                        </h4>
                                                        <div class="product-price-2">
                                                            <div class="price-box">
                                                                <ins>
                                                                    <span class="amount">
                                                                        <span class="Price-currencySymbol">￦</span>${book.b_price}</span>
                                                                </ins>
                                                            </div>
                                                        </div>

                                                        <div class="rating-box">
                                                            <a href="#" class="rated" title="1 star">
                                                                <i class="far fa-star"> </i>
                                                            </a>
                                                            <a href="#" class="rated" title="2 star">
                                                                <i class="far fa-star"> </i>
                                                            </a>
                                                            <a href="#" title="3 star">
                                                                <i class="far fa-star"> </i>
                                                            </a>
                                                            <a href="#" title="4 star">
                                                                <i class="far fa-star"> </i>
                                                            </a>
                                                            <a href="#" title="5 star">
                                                                <i class="far fa-star"> </i>
                                                            </a>
                                                        </div>
                                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce posuere
                                                            metus vitae arcu imperdiet, id aliquet ante scelerisque. Sed
                                                            sit amet sem vitae urna fringilla tempus.</p>
                                                        <div class="product-action-2">
                                                            <a href="#" title="Add To Cart"  class="action-plus-2 list_bg_add tooltip">
                                                                <i class="zmdi zmdi-shopping-cart-plus"></i> Add to cart
                                                            </a>
                                                            <a href="#" title="Add to Compare" class="action-plus-2 tooltip">
                                                                <i class="zmdi zmdi-refresh"></i>
                                                            </a>
                                                            <a href="#" title="Add to Wishlist" class="action-plus-2 tooltip">
                                                                <i class="zmdi zmdi-favorite-outline"></i>
                                                            </a>
                                                            <a href="#" title="Quick View" data-target="#exampleModal" data-toggle="modal" class="action-plus-2 tooltip">
                                                                <i class="zmdi zmdi-search"></i>
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
                                                </div>
                       

                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-12">
                                        <div class="pagination-style text-center">
                                            <ul>
                                             <c:forEach begin="1" end="${listResult.totalPageCount}" var="i">
                                                    <a href="search.do?cp=${i}">
                                                    <c:choose>
                                                    <c:when test="${i==listResult.cp}">
                                                      <li><strong>${i}</strong></li>
                                                     </c:when>
                                                     <c:otherwise>
                                                     <li>${i}</li>
											        </c:otherwise>
											        </c:choose>
											        </a>
											        </c:forEach>
                                                <li>
                                                    <a href="#">
                                                        <i class="ion-chevron-right"></i>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer>
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
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog" role="document">

                <div class="modal-content">
                    <div class="modal-body">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span class="ion-android-close" aria-hidden="true"></span>
                        </button>
                        <div class="qwick-view-left">
                            <div class="quick-view-learg-img">
                                <div class="quick-view-tab-content tab-content">
                                    <div class="tab-pane active show fade" id="modal1" role="tabpanel">
                                        <img src="../assets/img/quick-view/l1.jpg" alt="">
                                    </div>
                                    <div class="tab-pane fade" id="modal2" role="tabpanel">
                                        <img src="../assets/img/quick-view/l2.jpg" alt="">
                                    </div>
                                    <div class="tab-pane fade" id="modal3" role="tabpanel">
                                        <img src="../assets/img/quick-view/l3.jpg" alt="">
                                    </div>
                                </div>
                            </div>
                            <div class="quick-view-list nav" role="tablist">
                                <a class="active" href="#modal1" data-toggle="tab" role="tab" aria-selected="true">
                                    <img src="../assets/img/quick-view/s1.jpg" alt="">
                                </a>
                                <a href="#modal2" data-toggle="tab" role="tab" aria-selected="false">
                                    <img src="../assets/img/quick-view/s2.jpg" alt="">
                                </a>
                                <a href="#modal3" data-toggle="tab" role="tab" aria-selected="false">
                                    <img src="../assets/img/quick-view/s3.jpg" alt="">
                                </a>
                            </div>
                        </div>
                        <div class="qwick-view-right">
                            <div class="qwick-view-content">
                                <h3>Handcrafted Supper Mug</h3>
                                <div class="price">
                                    <span class="new">$90.00</span>
                                    <span class="old">$120.00 </span>
                                </div>
                                <div class="rating-number">
                                    <div class="quick-view-rating">
                                        <i class="ion-ios-star red-star"></i>
                                        <i class="ion-ios-star red-star"></i>
                                        <i class="ion-ios-star red-star"></i>
                                        <i class="ion-ios-star red-star"></i>
                                        <i class="ion-ios-star red-star"></i>
                                    </div>
                                </div>
                                <p>Lorem ipsum dolor sit amet, consectetur adip elit, sed do tempor incididun ut labore et dolore
                                    magna aliqua. Ut enim ad mi , quis nostrud veniam exercitation .</p>
                                <div class="quick-view-select">
                                    <div class="select-option-part">
                                        <label>Size*</label>
                                        <select class="select">
                                            <option value="">- Please Select -</option>
                                            <option value="">900</option>
                                            <option value="">700</option>
                                        </select>
                                    </div>
                                    <div class="select-option-part">
                                        <label>Color*</label>
                                        <select class="select">
                                            <option value="">- Please Select -</option>
                                            <option value="">orange</option>
                                            <option value="">pink</option>
                                            <option value="">yellow</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="quickview-plus-minus">
                                    <div class="cart-plus-minus">
                                        <input type="text" value="02" name="qtybutton" class="cart-plus-minus-box">
                                    </div>
                                    <div class="quickview-btn-cart">
                                        <a class="btn-style cr-btn" href="#">
                                            <span>add to cart</span>
                                        </a>
                                    </div>
                                    <div class="quickview-btn-wishlist">
                                        <a class="btn-hover cr-btn" href="#">
                                            <span>
                                                <i class="ion-ios-heart-outline"></i>
                                            </span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- all js here -->
    <script src="../assets/js/vendor/jquery-1.12.0.min.js"></script>
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
    <script src="../assets/js/service-search.js"></script>
</body>

</html>
