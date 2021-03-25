<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="bit.hibooks.setting.MemberModeSet"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!doctype html>
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
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
	
    <!-- all css here -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="assets/css/chosen.min.css">
    <link rel="stylesheet" href="assets/css/themify-icons.css">
    <link rel="stylesheet" href="assets/css/fontawesome-all.css">
    <link rel="stylesheet" href="assets/css/ionicons.min.css">
    <link rel="stylesheet" href="assets/css/material-design-iconic-font.css">
    <link rel="stylesheet" href="assets/css/meanmenu.min.css">
    <link rel="stylesheet" href="assets/css/tippy.css">
    <link rel="stylesheet" href="assets/css/bundle.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/service-index.css">
    <link rel="stylesheet" href="assets/css/responsive.css">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <link rel="stylesheet" href="assets/css/header.css">
    
    <script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
    <script src="assets/js/vendor/jquery-1.12.0.min.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js" type="text/javascript"></script>
    <script src="assets/js/service-search-index.js"></script>
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
                                    	<sec:authorize access="hasRole('ROLE_USER')">
	                                    	<sec:authentication property="principal.member" var="loginUser"/>
                                    		<span>${loginUser.m_name} 님, 환영합니다</span>
                                    	</sec:authorize>
                                    	</div>
                                    </li>
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
                                                            <a href="member/moveMyInfo.do">내 정보</a>
                                                        </li>
                                                        <li class="switcher-menu-item">
                                                            <a href="wishList/moveWishPage.do">위시리스트</a>
                                                        </li>
                                                        <sec:authorize access="isAuthenticated()">
	                                                        <sec:authorize access="hasRole('ROLE_ADMIN')"> 
		                                                        <li class="switcher-menu-item">
		                                                            <a href="admin/recommend.do">관리자페이지</a>
		                                                        </li>
		                                                    </sec:authorize>
		                                                </sec:authorize>
                                                        <li class="switcher-menu-item">
                                                            <a href="purchase/orderComplete.do">결제내역</a>
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
                                                <li class="active"><a href="book/shop.do?cate=1000">책</a>
                                                    <ul>
                                                        <li><a href="book/shop.do?cate=100">소설</a></li>
                                                        <li><a href="book/shop.do?cate=200">경영/경제</a></li>
                                                        <li><a href="book/shop.do?cate=300">인문/사회/역사</a></li>
                                                        <li><a href="book/shop.do?cate=400">자기계발</a></li>
                                                        <li><a href="book/shop.do?cate=500">에세이/시</a></li>
                                                        
                                                    </ul>
                                                </li>
												
												
                                                <li><a id="in" href="recommend/list.do">추천</a></li>
												
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
											
											<li><a href="recommend/list.do">추천</a></li>
											
											<li><a href="">커뮤니티</a></li>
											
											<li><a href="">공지/문의 <i class="ion-ios-arrow-down"></i></a>
												<ul>
													<li><a href="boardNotice/list.do"> 공지</a></li>
													<li><a href="boardq/list.do"> 문의</a></li>
                                  
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
        <div>
        <div>
        <div>
       <%-- <div>               
                      <!-- may also like product start -->
        <div class="product-area pb-65   product-padding" style="padding-bottom: 0px;">
            <div class="container">
                <div class="section-title-2 text-center mb-25">
                    <br/>
                    <h2 class="m-0">${indexLR.titleSec1}</h2>
                  <!--   <p></p> -->
                </div>
                <div class="row">
                    <div class="product-slider-active owl-carousel">
                    <c:forEach items="${indexLR.sec1}" var="book">
                        <div class="col-lg-4 col-md-6 col-12" style="max-width:80%;">
                            <div class="product-wrapper mb-35">
                                <div class="product-img">
                                    <a href="product-details.html">
                                     <!--    <span class="onsale"></span> -->
                                        <img alt="" src="${book.b_img}" style="height:300px;" >
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
                                        <a href="#" title="1 star">
                                            <i class="far fa-star"></i>
                                        </a>
                                        <a href="#" title="2 star">
                                            <i class="far fa-star"></i>
                                        </a>
                                        <a href="#" title="3 star">
                                            <i class="far fa-star"></i>
                                        </a>
                                        <a href="#" title="4 star">
                                            <i class="far fa-star"></i>
                                        </a>
                                        <a href="#" title="5 star">
                                            <i class="far fa-star"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="product-content text-center">
                                    <h4>
                                        <a href="product-details.html">${book.b_title}</a>
                                    </h4>
                                    <div class="product-price-2">
                                        <div class="price-box">
                                            <del>
                                                <span class="amount">
                                                    <span class="Price-currencySymbol"></span>${book.b_price}</span>
                                            </del>
                                            <ins>
                                                <span class="amount">
                                                    <span class="Price-currencySymbol"></span>${book.b_price}</span>
                                            </ins>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                         </c:forEach>

                        
                    </div>
                </div>
            </div>
        </div>  
     </div>               
       <div>                --%>
                    <!-- may also like product start -->
        <c:set value="${updateLR.listNovel}" scope="page" var="novel"></c:set>
        <c:set value="${updateLR.listEconomy}" scope="page" var="economy"></c:set>
        <c:set value="${updateLR.listSociety}"  scope="page" var="society"></c:set>
        <c:set value="${updateLR.listSelf}" scope="page" var="self"></c:set>
        <c:set value="${updateLR.listEssay}" scope="page" var="essay"></c:set>
        <div class="product-area pb-0   product-padding">
            <div class="container">
                <div class="section-title-2 text-center mb-25">
                <br/>
                    <h3 class="ui header">집 앞 서점에, 이번 주 나온 신간</h3>
                  <!--   <p></p> -->
                </div>

                <div class="row">
                    <div class="product-slider-active owl-carousel" >
                    <c:forEach begin="1" end="2" var="i">
                        <div class="col-lg-4 col-md-6 col-12" style="margin-left:50px;max-width:70%;">
                            <div class="product-wrapper mb-35">
                                <div class="product-img">
                                    <a href="book/content.do?itemId=${novel[i].b_itemId}">
                                        <img alt="" src="${novel[i].b_img}" style="height:250px;" >
                                    </a>
                                    <div class="product-action-2">
                                        <a href="purchase/add.do?itemId=${novel[i].b_itemId}" title="Add To Cart"  class="action-plus-2 tooltip">
                                            <i class="zmdi zmdi-shopping-cart-plus"></i>
                                        </a>
                                    </div>
                                    <div class="rating-box">
                                        <c:forEach begin="1" end="${novel[i].b_rate-(novel[i].b_rate%1)}">
                                            <i class="fa fa-star" style="color: red;"> </i>
                                        </c:forEach>
                                        <c:forEach begin="${novel[i].b_rate-(novel[i].b_rate%1)+1}" end="5">
                                            <i class="far fa-star"> </i>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="product-content text-center">
                                    <h4>
                                        <a href="book/content.do?itemId=${novel[i].b_itemId}">${novel[i].b_title}</a>
                                    </h4>
                                    <div class="product-price-2">
                                        <div class="price-box">
                                            <ins>
                                                <span class="amount">
                                                    ${novel[i].b_price}<span class="Price-currencySymbol">원</span></span>
                                            </ins>
                                        </div>
                                    </div>
                                </div>
                            </div>
                         </div>
                         <div class="col-lg-4 col-md-6 col-12" style="margin-left:50px;max-width:70%;">
                            <div class="product-wrapper mb-35">
                                <div class="product-img">
                                    <a href="book/content.do?itemId=${economy[i].b_itemId}">
                                        <img alt="" src="${economy[i].b_img}" style="height:250px;" >
                                    </a>
                                    <div class="product-action-2">
                                        <a href="purchase/add.do?itemId=${economy[i].b_itemId}" title="Add To Cart"  class="action-plus-2 tooltip">
                                            <i class="zmdi zmdi-shopping-cart-plus"></i>
                                        </a>
                                    </div>
                                    <div class="rating-box">
                                        <c:forEach begin="1" end="${economy[i].b_rate-(economy[i].b_rate%1)}">
                                            <i class="fa fa-star" style="color: red;"> </i>
                                        </c:forEach>
                                        <c:forEach begin="${economy[i].b_rate-(economy[i].b_rate%1)+1}" end="5">
                                            <i class="far fa-star"> </i>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="product-content text-center">
                                    <h4>
                                        <a href="book/content.do?itemId=${economy[i].b_itemId}">${economy[i].b_title}</a>
                                    </h4>
                                    <div class="product-price-2">
                                        <div class="price-box">
                                            <ins>
                                                <span class="amount">
                                                    ${economy[i].b_price}<span class="Price-currencySymbol">원</span></span>
                                            </ins>
                                        </div>
                                    </div>
                                </div>
                            </div>
                         </div>
                         <div class="col-lg-4 col-md-6 col-12" style="margin-left:50px;max-width:70%;">
                            <div class="product-wrapper mb-35">
                                <div class="product-img">
                                    <a href="book/content.do?itemId=${society[i].b_itemId}">
                                        <img alt="" src="${society[i].b_img}" style="height:250px;" >
                                    </a>
                                    <div class="product-action-2">
                                        <a href="purchase/add.do?itemId=${society[i].b_itemId}" title="Add To Cart"  class="action-plus-2 tooltip">
                                            <i class="zmdi zmdi-shopping-cart-plus"></i>
                                        </a>
                                    </div>
                                    <div class="rating-box">
                                        <c:forEach begin="1" end="${society[i].b_rate-(society[i].b_rate%1)}">
                                            <i class="fa fa-star" style="color: red;"> </i>
                                        </c:forEach>
                                        <c:forEach begin="${society[i].b_rate-(society[i].b_rate%1)+1}" end="5">
                                            <i class="far fa-star"> </i>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="product-content text-center">
                                    <h4>
                                        <a href="book/content.do?itemId=${society[i].b_itemId}">${society[i].b_title}</a>
                                    </h4>
                                    <div class="product-price-2">
                                        <div class="price-box">
                                            <ins>
                                                <span class="amount">
                                                    ${society[i].b_price}<span class="Price-currencySymbol">원</span></span>
                                            </ins>
                                        </div>
                                    </div>
                                </div>
                            </div>
                         </div>
                         <div class="col-lg-4 col-md-6 col-12" style="margin-left:50px;max-width:70%;">
                            <div class="product-wrapper mb-35">
                                <div class="product-img">
                                    <a href="book/content.do?itemId=${self[i].b_itemId}">
                                        <img alt="" src="${self[i].b_img}" style="height:250px;" >
                                    </a>
                                    <div class="product-action-2">
                                        <a href="purchase/add.do?itemId=${self[i].b_itemId}" title="Add To Cart"  class="action-plus-2 tooltip">
                                            <i class="zmdi zmdi-shopping-cart-plus"></i>
                                        </a>
                                    </div>
                                    <div class="rating-box">
                                        <c:forEach begin="1" end="${self[i].b_rate-(self[i].b_rate%1)}">
                                            <i class="fa fa-star" style="color: red;"> </i>
                                        </c:forEach>
                                        <c:forEach begin="${self[i].b_rate-(self[i].b_rate%1)+1}" end="5">
                                            <i class="far fa-star"> </i>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="product-content text-center">
                                    <h4>
                                        <a href="book/content.do?itemId=${self[i].b_itemId}">${self[i].b_title}</a>
                                    </h4>
                                    <div class="product-price-2">
                                        <div class="price-box">
                                            <ins>
                                                <span class="amount">
                                                    ${self[i].b_price}<span class="Price-currencySymbol">원</span></span>
                                            </ins>
                                        </div>
                                    </div>
                                </div>
                            </div>
                         </div>
                         <div class="col-lg-4 col-md-6 col-12" style="margin-left:50px;max-width:70%;">
                            <div class="product-wrapper mb-35">
                                <div class="product-img">
                                    <a href="book/content.do?itemId=${essay[i].b_itemId}">
                                        <img alt="" src="${essay[i].b_img}" style="height:250px;" >
                                    </a>
                                    <div class="product-action-2">
                                        <a href="purchase/add.do?itemId=${essay[i].b_itemId}" title="Add To Cart"  class="action-plus-2 tooltip">
                                            <i class="zmdi zmdi-shopping-cart-plus"></i>
                                        </a>
                                    </div>
                                    <div class="rating-box">
                                        <c:forEach begin="1" end="${essay[i].b_rate-(essay[i].b_rate%1)}">
                                            <i class="fa fa-star" style="color: red;"> </i>
                                        </c:forEach>
                                        <c:forEach begin="${essay[i].b_rate-(essay[i].b_rate%1)+1}" end="5">
                                            <i class="far fa-star"> </i>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="product-content text-center">
                                    <h4>
                                        <a href="book/content.do?itemId=${essay[i].b_itemId}">${self[i].b_title}</a>
                                    </h4>
                                    <div class="product-price-2">
                                        <div class="price-box">
                                            <ins>
                                                <span class="amount">
                                                    ${essay[i].b_price}<span class="Price-currencySymbol">원</span></span>
                                            </ins>
                                        </div>
                                    </div>
                                </div>
                            </div>
                         </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div> 
      </div>     
      
      <div> 
      
      		<!--Pricing Table Area Start-->
		<div class="pricing-table-area pt-50 pb-50">
			<div class="container">
				<div class="row">
					<c:forEach items="${NoticeList}" var="notice">
					<!--Single Pricing Table Start-->
					<div class="col-md-6 col-lg-3">
						<div class="single-pricing mb-35">
							<div class="pricing-body">
								<a href="boardNotice/content.do?bn_seq=${notice.bn_seq }">
									<img alt="" src="board-notice-img/file-added/${notice.nf_fname }" style="width:270px;height:220px;">
								</a>
							</div>
							<div class="pricing-head">
							<h4>${notice.bn_topic}</h4>
							</div>
						</div>
					</div>
					<!--Single Pricing Table End-->
					</c:forEach>
				</div>
			</div>
		</div>
		<!--Pricing Table Area End-->
      
       <!-- Brand area start -->
                    
    </div>
     	
     		 <!-- 그리드 -->
    <div>
     		 <!--Our Service Area Start-->
		<div class="our-service-area pt-50 pb-40" style="padding-left:50px;">
			<div class="container">
			<h3 class="ui header">베스트 셀러</h3>
				<div class="row">
					<c:forEach items="${BestBookList }" var="BestBook">
					<!--Single Service Start-->
					<div class="col-xl-3 col-lg-3 col-md-12 col-12">
						<div class="single-service single-service-2 mb-25">
							<div class="service-icon">
								<img alt="" src="${BestBook.b_img }" style="width:80px;height:114px;">
							</div>
							<div class="service-info" style="padding-top:30px;">
								<h3><a href="book/content.do?itemId=${BestBook.b_itemId}">${BestBook.b_title }</a></h3>
								<p>${BestBook.b_price}원</p>
								<c:forEach begin="1" end="${BestBook.b_rate-(BestBook.b_rate%1)}">
                                     <i class="fa fa-star" style="color: red;"> </i>
                                </c:forEach>
                                <c:forEach begin="${BestBook.b_rate-(BestBook.b_rate%1)+1}" end="5">
                                     <i class="far fa-star"> </i>
                                </c:forEach>
							</div>
						</div>
					</div>
				
					<!--Single Service End-->
					</c:forEach>
				</div>
			</div>
		</div>
		<!--Our Service Area End-->
     		 </div>
      
      
                </div>
            </div>
        </div>
        <!--Service Item Area End-->     
        
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
        <!-- modal -->
        
        </div>
    </div>

    <!-- all js here -->
    <script src="assets/js/vendor/jquery-1.12.0.min.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js" type="text/javascript"></script>
    <script src="assets/js/popper.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/isotope.pkgd.min.js"></script>
    <script src="assets/js/imagesloaded.pkgd.min.js"></script>
    <script src="assets/js/jquery.counterup.min.js"></script>
    <script src="assets/js/waypoints.min.js"></script>
    <script src="assets/js/tippy.min.js"></script>
    <script src="assets/js/ajax-mail.js"></script>
    <script src="assets/js/owl.carousel.min.js"></script>
    <script src="assets/js/plugins.js"></script>
    <script src="assets/js/main.js"></script>
    <script src="assets/js/package.js"></script>
	

</body>

</html>
