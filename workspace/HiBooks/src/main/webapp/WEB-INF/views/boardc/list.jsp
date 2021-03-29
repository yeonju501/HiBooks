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
    <link rel="stylesheet" href="../assets/css/header.css">
    
    <script src="../assets/js/vendor/modernizr-2.8.3.min.js"></script>
    <script src="../assets/js/vendor/jquery-1.12.0.min.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js" type="text/javascript"></script>
    <script src="../assets/js/service-search-index.js"></script>
</head>

<body>
<center>
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
                                    <h3 id="logo">H!Books</h3>
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
                                        <span>로그인</span>
            
                                    </div>
                                </li>
                                <li>
                                    <div class="switcher">
                                        <span>회원가입</span>
                                        
                                    </div>
                                </li>
                                <li>
                                    <div class="switcher">
                                        <span>장바구니</span>
                                        
                                    </div>
                                </li>
                                <li>
                                    <div class="switcher menu_page my_acc">
                                        <ul>
                                            <li class="switcher-menu-active">
                                                <a >마이페이지</a>
                                                <ul class="switcher__menus">
                                                    <li class="switcher-menu-item">
                                                        <a >내 정보</a>
                                                    </li>
                                                    <li class="switcher-menu-item">
                                                        <a >위시리스트</a>
                                                    </li>
                                                    <li class="switcher-menu-item">
                                                        <a >커뮤니티</a>
                                                    </li>
                                                    <li class="switcher-menu-item">
                                                        <a >...</a>
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
                                <input type="text" id="search_input" name="s" placeholder="제목, 저자, 출판사 검색" class="input_text">
                                <button id="blogsearchsubmit" type="submit" class="button">
                                    <i class="fa fa-search fa-lg"></i>
                                </button>
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
                                            <li class="active"><a href="#"> <i class="zmdi zmdi-view-column zmdi-hc-lg"></i></a>
                                                <ul>
                                                    <li><a href="index.html">소설</a></li>
                                                    <li><a href="index-2.html">경영/경제</a></li>
                                                    <li><a href="index-3.html">인문/사회/역사</a></li>
                                                    <li><a href="index-4.html">자기계발</a></li>
                                                    <li><a href="index-5.html">에세이/시</a></li>
                                                    
                                                </ul>
                                            </li>
                                            
                                            <li><a id="in" href="shop.html">추천</a></li>
                                            
                                            <li><a id="in" href="blog.html">커뮤니티</a></li>

                                            <li class="active"><a href="contact.html">공지/문의</a>
                                                <ul>
                                                    <li><a href="index.html">공지</a></li>
                                                    <li><a href="index-2.html">문의</a></li>
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
                                        <li class="active"><a href="#">카테고리 <i class="ion-ios-arrow-down"></i></a>
                                            <ul>
                                                <li><a href="index.html">소설</a></li>
                                                <li><a href="index-2.html">경영/경제</a></li>
                                                <li><a href="index-3.html">인문/사회/역사</a></li>
                                                <li><a href="index-4.html">자기계발</a></li>
                                                <li><a href="index-5.html">에세이/시</a></li>
                                                
                                            </ul>
                                        </li>
                                                                                
                                        <li><a href="shop.html">추천</a></li>
                                        
                                        <li><a href="blog.html">커뮤니티</a></li>
                                        
                                        <li><a href="#">공지/문의 <i class="ion-ios-arrow-down"></i></a>
                                            <ul>
                                                <li><a href="portfolio.html"> 공지</a></li>
                                                <li><a href="service.html"> 문의</a></li>
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
    <!-- breadcrumbs area start -->
    <div class="title-breadcrumbs">
        <div class="title-breadcrumbs-inner">
            <div class="container">
                <nav class="woocommerce-breadcrumb">
                    <a href="index.html">Home</a>
                    <span class="separator">/</span> Community
                </nav>
            </div>
        </div>
    </div>
    <!-- breadcrumbs area End -->
    <!--Wishlist Area Strat-->
    <div class="wishlist-area ptb-50">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="pg___title">
                        <h2>COMMUNITY</h2>
                    </div>
                    <form action="#">
                        <div class="grid-list-product-wrapper">
                            <div class="product-grid product-view">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="row_products_side">
                                            <div class="product_left_sidbar">
        
                                                <div class="product-filter  mb-30">
                                                    <h5> * Notice </h5>
                                                    <table class="table table-hober">
                                                        <thead>
                                                            <tr>
                                                                <th>글번호</th>                                                    
                                                                <th>작성자</th>
                                                                <th>제목</th>
                                                                <th>작성일</th>
                                                                <th>조회수</th>
                                                            </tr>
                                                        </thead>
                                                    <tbody>
                                                        <tr>
                                                        <c:if test="${empty listResult}">
                                                        <tr align = "center" noshade>
                                                        <td colspan = "5"> 데이터가 하나도 없음</td>
                                                        </tr>
                                                        </c:if>
                                                        <c:forEach items="${listResult.list}" var="board">
                                                        <tr align='center' noshade>
                                                            <td> ${board.cb_seq} </td>
                                                            <td> ${board.m_email} </td>
                                                            <td> <a href ="content.do?seq=${board.cb_seq}"> ${board.cb_subject}</a> </td>
                                                            <td> ${board.cb_rdate} </td>
                                                            <td> ${board.cb_count} </td>
                                                        </tr>
                                                        </c:forEach>                                                       
                                                    </tbody>
                                                    </table>
                                                </div>
                                           </div>        
                                           <a href='write.do'>글쓰기</a><br/>
                                        <div class="row">
                                            <div class="col-lg-10 col-md-10 col-10">                                            
                                                <div class="pagination-style text-center">
                                                   	<%-- 총 페이지 : ${listResult.totalPageCount} --%>
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
                                                   <div class="col-lg-2 col-md-2 col-2">      
                                                   	<select id="psId" name ="ps" onchange"f(this)">
                                                   	<c:choose>
                                                   	<c:when test="${listResult.ps == 3}">
                                                   		<option value = "3" selected>3</option>
                                                   		<option value = "5">5</option>
                                                   		<option value = "10">10</option>
                                                   	</c:when>
                                                   	<c:when test="${listResult.ps == 5}">
                                                   		<option value = "3">3</option>
                                                   		<option value = "5" selected>5</option>
                                                   		<option value = "10" >10</option>
                                                   	</c:when>
                                                   <c:when test="${listResult.ps == 10}">
    		   											<option value="3">3</option>
												        <option value="5">5</option>
												        <option value="10" selected>10</option>
										     	   </c:when>
                                                   	</c:choose>
                                                   </select>
                                                   </div>
	                                        	</div>
	                                        </div>
	                                  </div>        
													<form action="">																											
														<div class ="row">
															<div class = "col-lg-3 col-md-3 col-3">
																<select name="catgo">
																	<option value="subject">제목</option>
																	<option value="writer">글쓴이</option>
																	<option value="content">내용</option>
																</select>
															</div>
																<div class="col-lg-7 col-md-7 col-7"> 
																	<input type="text" name="keyword" size="40" required="required" /> 
																</div>	
																	<div class = "col-lg-2 col-md-2 col-2">
																		<button>검색</button>
																	</div>
														</div>
													</form>  
                                                </div>
                                            
                                        </div>
        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--Wishlist Area End-->
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
    <script src="../assets/js/package.js"></script>
    <script language="javascript">
       function f(select){
           //var el = document.getElementById("psId");
           var ps = select.value;
           //alert("ps : " + ps);
           location.href="list.do?ps="+ps;
       }
    </script>    
    </center>
</body>

</html>