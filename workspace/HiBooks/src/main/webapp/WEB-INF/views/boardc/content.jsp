<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html class="no-js" lang="zxx">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Hibooks</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
    
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
        <link rel="stylesheet" href="../assets/css/responsive.css">
        <link rel="stylesheet" href="../assets/css/communitycontentstyle.css">
        <script src="../assets/js/vendor/modernizr-2.8.3.min.js"></script>
    </head>

<body>
	
	<input type="hidden" id="board-cb_seq" value="${board.cb_seq }" >
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
                                            <li><a id="in" href="../boardc/list.do">커뮤니티</a></li>
                                            <li class="active"><a href="">공지/문의</a>
                                                <ul>
                                                    <li><a href="../boardNotice/list.do">공지</a></li>
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
        <!-- header end -->
        
        <!--My Account Area Strat-->
        <div class="my-account white-bg ptb-100">
            <div class="container">
                <div class="account-dashboard">
                    <div class="dashboard-upper-info">
                        <div class="row align-items-center no-gutters">
                            <div class="col-lg-1 col-md-12">
                                <div class="d-single-info">
                                    <p class="user-name">${board.cb_seq}</p>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-12">
                                <div class="d-single-info">
                                    <p>${board.m_email}</p>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-12">
                                <div class="d-single-info">
                                    <p>${board.cb_subject}</p>
                                </div>
                            </div>
                         </div>
                    </div>
                    <div class="row">
                        <div class="col-md-11 col-lg-12">
                            <!-- Tab panes -->
                            <div class="tab-content dashboard-content">
                                <div id="dashboard" class="tab-pane fade show active">
                                    <h3>내용</h3>
                                    <p>
                                    ${board.cb_content}                                    
                                    </p>
                                </div>
                            </div>
                           <%--  <div class="col-lg-5 col-md-12">
                                <div class="d-single-info text-lg-center">
                                    <p>${board.cb_count}</p>
                                </div>
                            </div> --%>
                            
                        <div class="col-xl-9 col-lg-9 col-md-12 col-12">
                        <div class="comments-area" id="comments-area">
	                    	
	                    
	                    </div>
                       <div class="comment-respond">
                            <h5>댓글 쓰기</h5>
                            <small>의견을 남겨 주세요.</small>
                            <!-- <form action="#"> -->
                                <div class="text-filds">
                                    <textarea id="comment" name="comment" cols="45" rows="8" maxlength="65525" required="required"></textarea>
                                </div>
                                <div class="form-submit">
                                    <input name="submit" type="button" id="test" class="submit" value="댓글 등록">
                                </div>
                            <!-- </form> -->
                        </div>
                    </div>
	                       <div class="contact-submit">
	                            	<a href ='list.do'><input type="submit" value="목록으로" class="wpcf7-form-control wpcf7-submit button"></a>
	                                <a href ='update.do?seq=${board.cb_seq}'><input type="submit" value="수정" class="wpcf7-form-control wpcf7-submit button"></a>
	                                <a href ='del.do?seq=${board.cb_seq}'><input type="submit" value="삭제" class="wpcf7-form-control wpcf7-submit button"></a>
	                       </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <footer class="footer-color">
            <div class="footer-container">
                <!--Footer Top Area Start-->
                <div class="footer-top-area ptb-90 text-center">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-10 offset-lg-1 col-12">
                                <!--Footer Logo Start-->
                                <div class="footer-logo">
                                    <a href="index.html">
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
                                        <img src="assets/img/quick-view/l1.jpg" alt="">
                                    </div>
                                    <div class="tab-pane fade" id="modal2" role="tabpanel">
                                        <img src="assets/img/quick-view/l2.jpg" alt="">
                                    </div>
                                    <div class="tab-pane fade" id="modal3" role="tabpanel">
                                        <img src="assets/img/quick-view/l3.jpg" alt="">
                                    </div>
                                </div>
                            </div>
                            <div class="quick-view-list nav" role="tablist">
                                <a class="active" href="#modal1" data-toggle="tab">
                                    <img src="assets/img/quick-view/s1.jpg" alt="">
                                </a>
                                <a href="#modal2" data-toggle="tab">
                                    <img src="assets/img/quick-view/s2.jpg" alt="">
                                </a>
                                <a href="#modal3" data-toggle="tab">
                                    <img src="assets/img/quick-view/s3.jpg" alt="">
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
    <script src="../assets/js/ajax-mail.js"></script>
    <script src="../assets/js/owl.carousel.min.js"></script>
    <script src="../assets/js/plugins.js"></script>
    <script src="../assets/js/main.js"></script>
    <script src="../assets/js/rating.js"></script>
    <script src="../assets/js/boardc.js"></script>
</body>

</html>