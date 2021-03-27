<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Hibooks</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="../assets/img/favicon.png">
	
	<!-- security and ajax 403 -->
	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">
	
    <!-- all css here -->
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/animate.css">
    <link rel="stylesheet" href="../assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="../assets/css/chosen.min.css">
    <link rel="stylesheet" href="../assets/css/themify-icons.css">
    <link rel="stylesheet" href="../assets/css/fontawesome-all.css">
    <link rel="stylesheet" href="../assets/css/ionicons.min.css">
    <link rel="stylesheet" href="../assets/css/jquery-ui.css">
    <link rel="stylesheet" href="../assets/css/material-design-iconic-font.css">
    <link rel="stylesheet" href="../assets/css/meanmenu.min.css">
    <link rel="stylesheet" href="../assets/css/tippy.css">
    <link rel="stylesheet" href="../assets/css/bundle.css">
    <link rel="stylesheet" href="../assets/css/easyzoom.css">
    <link rel="stylesheet" href="../assets/css/style.css">
    <link rel="stylesheet" href="../assets/css/product-details.css">
    <link rel="stylesheet" href="../assets/css/responsive.css">
    <link rel="stylesheet" href="../assets/css/header.css">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script src="../assets/js/vendor/modernizr-2.8.3.min.js"></script>
    <script src="../assets/js/vendor/jquery-1.12.0.min.js"></script>
    <script src="../assets/js/service-search.js"></script>
    
    <script src="https://use.fontawesome.com/5fb42bb368.js"></script>
    
	
	
	
</head>

<body>
	<!-- login user in session by spring security -->
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.username" var="loginUser"/>
		<input type="hidden" value="${loginUser}" id="login-user-for-js">
		<c:forEach items="${reviewResult.reviewList}" var="review">
			<c:if test="${review.m_email == loginUser}">
				<c:set value="${review}" var="loginUserReview"></c:set>
				
			</c:if>
		</c:forEach>
	</sec:authorize>
	
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
                                                <li class="active"><a href="shop.do">책</a>
                                                    <ul>
                                                        <li><a href="shop.do?cate=100">소설</a></li>
                                                        <li><a href="shop.do?cate=200">경영/경제</a></li>
                                                        <li><a href="shop.do?cate=300">인문/사회/역사</a></li>
                                                        <li><a href="shop.do?cate=400">자기계발</a></li>
                                                        <li><a href="shop.do?cate=500">에세이/시</a></li>
                                                        
                                                    </ul>
                                                </li>
                                                <li><a id="in" href="../recommend/list.do">추천</a></li>
                                                <li><a id="in" href="">커뮤니티</a></li>
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
											<li class="active"><a href="shop.do">책 <i class="ion-ios-arrow-down"></i></a>
												<ul>
													<li><a href="shop.do?cate=100">소설</a></li>
													<li><a href="shop.do?cate=200">경영/경제</a></li>
													<li><a href="shop.do?cate=300">인문/사회/역사</a></li>
													<li><a href="shop.do?cate=400">자기계발</a></li>
													<li><a href="shop.do?cate=500">에세이/시</a></li>
													
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
        <!-- breadcrumbs area start -->
        <!-- breadcrumbs area End -->
        <!-- product details area start -->
        <div class="product-details-area hm-3-padding pt-50 pb-50">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="product-details-img-content">
                            <div class="product-details-tab">
                                <div class="product-details-large tab-content" style="width:200px;height:300px;">
                                    <div class="tab-pane active" id="pro-details1" style="width:200px;height:300px;">
                                    	<img src="${book.b_img}" alt="" style="width:270px;height:400px;margin-left:200px;">
                                    </div>
                                </div>
                           	</div>
                        </div>
                    </div>
                    <div class="col-lg-6" style="height:400px;">
                        <div class="product-details-content">
                     <h5>
                      <c:choose>
				         <c:when test = "${book.b_cate == 100}">
				            	소설
				         </c:when>
				         <c:when test = "${book.b_cate == 200}">
				            	경영/경제
				         </c:when>
				         <c:when test = "${book.b_cate == 300}">
				            	인문/사회/역사
				         </c:when>
				         <c:when test = "${book.b_cate == 400}">
				            	자기계발
				         </c:when>
				         <c:when test = "${book.b_cate == 500}">
				            	에세이/시
				         </c:when>
				         </c:choose>
				         > ${book.b_cate2}</h5>
                            <h2>${book.b_title}</h2>
                            <div class="product-overview">
                                <h5 class="pd-sub-title">
                                    <div class="product-rating">
                                        <c:forEach begin="1" end="${book.b_rate-(book.b_rate%1)}">
                                            <i class="fa fa-star" style="color: red;"> </i>
                                        </c:forEach>
                                        <c:forEach begin="${book.b_rate-(book.b_rate%1)+1}" end="5">
                                            <i class="far fa-star"> </i>
                                        </c:forEach>
                                        <span> ${book.b_rate}</span>
                                    </div>
                                </h5>
                                <p>${book.b_writer}</p>
                                <p>${book.b_publisher}</p>
                            </div>
                            <div class="product-button">
	                            <div class="product-price">
	                                <span>${book.b_price}원</span>
	                            </div>
	                            <br/><br/><br/>
	                            <div class="quickview-plus-minus">
	                            	<form id="input-cart-form" method="post" action="../purchase/add.do?itemId=${book.b_itemId}">	
		                                <div class="cart-plus-minus">
		                                    <input type="text" value="1" name="vol" class="cart-plus-minus-box" >
		                                </div>
		                                <div class="quickview-btn-cart">
		                                    <input type = "hidden" name = "${_csrf.parameterName }" value = "${_csrf.token }"/>
		                                    <input type="submit" class="btn-style cr-btn" value="장바구니 담기">
		                                </div>
	                                </form>
	                             
	                              <br/><br/><br/>   
	                            </div>
	                            <div class="quickview-plus-minus">
	                                <div class="quickview-btn-wishlist">
	                                    <%-- <a id="in-wish-list" class="btn-hover cr-btn" href="javascript:void(0);" onclick="addWishList(${book.b_itemId},${loginUser});"> --%>
	                                    <a id="in-wish-list" class="btn-hover cr-btn" href="javascript:void(0);">
	                                        <span>
	                                        	<c:if test="${selectWish eq 'selected'}"><i class="ion-ios-heart" style="color:red"></i></c:if>
	                                        	<c:if test="${selectWish eq 'unselected'}"><i class="ion-ios-heart-outline"></i></c:if>	
	                                        </span>
	                                    </a>
	                                </div>
	                                <div class="quickview-btn-cart" style="margin-left: 53px;">
	                                    <a class="btn-style cr-btn" id="purchase-rightnow" href="../purchase/purchase.do?itemId=${book.b_itemId}">
	                                        <span>바로 구매하기</span>
	                                    </a>
	                                </div>
	                            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- product details area End -->
        
        <!--Product Description Review Area Start-->
        <div class="product-description-review-area pb-20">
            <div class="container" style="max-width:1000px;">
                <div class="row">
                    <div class="col-md-12">
                        <div class="product-review-tab">
                            <!--Review And Description Tab Menu Start-->
                            <ul class="nav dec-and-review-menu">
                                <li>
                                    <a class="active" data-toggle="tab" href="#description">Description</a>
                                </li>
                                <li>
                                    <a data-toggle="tab" href="#reviews">Reviews</a>
                                </li>
                            </ul>
                            <!--Review And Description Tab Menu End-->
                            <!--Review And Description Tab Content Start-->
                            <div class="tab-content product-review-content-tab" id="myTabContent-4">
                                <div class="tab-pane fade active show" id="description">
                                    <div class="single-product-description">
                                        <p>${book.b_desc }</p>
                                    </div>
                                </div>
                                <!-- 댓글 서비스 AJAX -->
                                <div class="tab-pane fade" id="reviews">
                                        <!-- 댓글 작성 부분 >> 한 상품에 한사람 당 한 댓글 >> 작성한 사람은 자신의 댓글 수정 폼-->
                                        <div class="review-form-wrapper">
                                            <div class="review-form">
                                                <span class="comment-reply-title">리뷰를 남겨주세요</span>
                                                <form id="review" action="">
                                                    <div class="row">
                                                        <div class="col-md-2">
                                                            <div class="comment-form-rating">
                                                                <label>Your rating</label>
                                                                <div class="rating">
	                                                                <c:forEach begin="1" end="5" var='k'>    
	                                                                    <c:if test="${empty loginUserReview}">
	                                                                    	<i id="star${k}" class="far fa-star"></i>
	                                                                    </c:if>
	                                                                    <c:if test="${k <= loginUserReview.br_rate}">
	                                                                    	<i id="star${k}" class="fa fa-star"></i>
	                                                                    </c:if>
	                                                                    <c:if test="${k > loginUserReview.br_rate}">
	                                                                    	<i id="star${k}" class="far fa-star"></i>
	                                                                    </c:if>
	                                                                </c:forEach>
                                                                    <sec:authorize access="isAnonymous()">
                                                                		<input type="hidden" value="" name="br_rate" id="your-rate"> 
                                                                	</sec:authorize>
                                                                    <sec:authorize access="isAuthenticated()">
                                                                		<c:if test="${empty loginUserReview }">
                                                                			<input type="hidden" value="" name="br_rate" id="your-rate">
                                                                		</c:if>
                                                                		<c:if test="${!empty loginUserReview }">
                                                                			<input type="hidden" value="${loginUserReview.br_rate }" name="br_rate" id="your-rate">
                                                                		</c:if>
                                                                	</sec:authorize>
                                                                                               
                                                               	 </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-10">
                                                            <div class="input-element">
                                                                <div class="comment-form-comment">
                                                                    <label>Comment</label>
                                                                    <sec:authorize access="isAnonymous()">
                                                                		<textarea id="your-comment" name="br_comment" cols="40" rows="8"></textarea>
                                                                	</sec:authorize>
                                                                    <sec:authorize access="isAuthenticated()">
                                                                		<c:if test="${empty loginUserReview }">
                                                                			<textarea id="your-comment" name="br_comment" cols="40" rows="8"></textarea>
                                                                		</c:if>
                                                                		<c:if test="${!empty loginUserReview }">
                                                                			<textarea id="your-comment" name="br_comment" cols="40" rows="8" readonly>${loginUserReview.br_comment}</textarea>
                                                                		</c:if>
                                                                	</sec:authorize>
                                                                </div>
                                                                <div class="comment-submit">
                                                                	<input type="hidden" id="itemId" name="itemId" value="${book.b_itemId}">
                                                                	<input type="hidden" name="b_itemId" value="${book.b_itemId}">
                                                                	
                                                                	<sec:authorize access="isAnonymous()">
                                                                		<input id="login-check" type="hidden" name="m_email" value="${loginUser}">
                                                                		<input type="button" class="submit" id="review-write" value="리뷰 작성">
                                                                	</sec:authorize>
                                                                	<sec:authorize access="isAuthenticated()">
                                                                		<c:if test="${empty loginUserReview }">
                                                                			<input id="login-check" type="hidden" name="m_email" value="${loginUser}">
                                                                    		<input type="button" class="submit" id="review-write" value="리뷰 작성">
                                                                    		<input type="hidden" class="submit" id="review-delete" value="삭제">
                                                                    		<input type="hidden" class="submit" id="review-update-form" value="수정">
                                                                    		<input type="hidden" class="submit" id="review-update-submit" value="수정하기">
                                                                		</c:if>
                                                                		<c:if test="${!empty loginUserReview }">
                                                                			<input id="login-check" type="hidden" name="m_email" value="${loginUser}">
                                                                			<input type="hidden" class="submit" id="review-write" value="리뷰 작성">
                                                                			<input type="button" class="submit" id="review-delete" value="삭제">
                                                                    		<input type="button" class="submit" id="review-update-form" value="수정">
                                                                    		<input type="hidden" class="submit" id="review-update-submit" value="수정하기">
                                                                		</c:if>
                                                                	</sec:authorize>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                </form>
                                            </div>
                                        </div>
                                        <!-- 댓글 리스트 부분 >> 대댓글 계층형 -->
                                        <div class="review-page-comment" id="review-ajax">
                                            <h2>${reviewResult.reviewCnt } 개의 리뷰가 있습니다</h2>
                                            <ul>
                                                <!-- 리뷰 반복 부분 -->
                                                <c:forEach items="${reviewResult.reviewList}" var="bookReview">
		                                                
		                                                <li>
		                                                   <div class="product-comment">
		                                                       <div class="col-md-12">
		                                                           <div class="row">
		                                                               <div class="col-lg-2">
		                                                                   <div class="product-reviews">
		                                                                       <c:forEach begin="1" end="5" var="k">
		                                                                       		<c:if test="${k <= bookReview.br_rate}">
		                                                                       			<i class="fa fa-star" aria-hidden="true"></i>
		                                                                       		</c:if>
		                                                                       		<c:if test="${k > bookReview.br_rate}">
		                                                                       			<i class="far fa-star" aria-hidden="true"></i>
		                                                                       		</c:if>
		                                                                       </c:forEach>
																		   </div>
		                                                                   <strong>${bookReview.m_email }</strong>
		                                                                   <p class="meta">
		                                                                       <span>${bookReview.br_rDate }</span>
		                                                                   </p>
		                                                               </div>
		                                                               <div class="col-lg-10">
		                                                                   <div class="product-comment-content">
		                                                                       <div class="description">
		                                                                           <p>${bookReview.br_comment }</p>
		                                                                       </div>
		                                                                       <div class="reply-and-like">
		                                                                           <%-- <button class="re-reply" seq="${bookReview.br_seq}">댓글 </button> --%>
			                                                                       <sec:authorize access="isAuthenticated()">
			                                                                           <input type="hidden" id="whose-review" seq="${bookReview.br_seq}" value="${bookReview.m_email }">
			                                                                           <button id="re-like-it" seq="${bookReview.br_seq}">좋아요! &nbsp; ${bookReview.br_like} </button>
			                                                                       </sec:authorize>
			                                                                   </div>
			                                                                    <!-- 대댓글 작성 우선 취소-->   	
	                                                                           	<div class="input-element re-reply-input" seq="${bookReview.br_seq}">
					                                                                <div class="comment-form-comment">
																						<textarea name="br_comment" cols="40" rows="8"></textarea>
					                                                                </div>
					                                                                <div class="comment-submit">	
					                                                                	<input type="submit" class="submit" id="re-submit" value="댓글 작성">
					                                                                    <input type="button" class="submit" id="re-del" value="삭제">
					                                                                    <input type="button" class="submit" id="re-up" value="수정">
					                                                                </div>
				                                                            	</div>
		                                                                   </div>
		                                                                  
		                                                               </div>
		                                                           </div>
		                                                       </div>
		                                                    </div>
		                                                </li>
                                                </c:forEach>
                                                <!-- 더보기 버튼 만들기 (토탈페이지 계산하자...) -->
	                                            <c:if test="${reviewResult.totalPage > 1}">
		                                            <li>    
		                                                <button type="button" class="more_review_button" id="get-more-review" >
		          											<span style="display:none" id="hidden-rcp">${reviewResult.rcp}</span>
		          											<span style="display:none" id="hidden-rps">${reviewResult.rps}</span>
		          											<span class="more_num js_more_num">더보기</span> 
		          										</button>
		        									</li>
	        									</c:if>
                                            </ul>
                                        </div>
                                </div>
                            </div>
                            <!--Review And Description Tab Content End-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Product Description Review Area Start-->
        
        <!-- may also like product start -->
        <div class="product-area pb-30 product-padding">
            <div class="container" style="max-width:1000px;">
                <div class="section-title-2 text-center mb-25">
                    <h3 class="ui header">이 책과 유사한 책</h3>
                   
                </div>
				<c:choose>
				<c:when test="${fn:length(recommandedList) <=3 }">
					
					<div class="product-wrapper mb-35">
					<div class="row">
					<c:forEach items="${recommandedList}" var="recomBook">
                        	 <div class="col-3">
                                <div class="product-img">
                                    <a href="content.do?itemId=${recomBook.b_itemId}">
                                        <img alt="" src="${recomBook.b_img}">
                                    </a>
                                    <div class="product-action-2">
                                        <a href="../purchase/add.do?itemId=${recomBook.b_itemId }" title="Add To Cart"  class="action-plus-2 tooltip">
                                            <i class="zmdi zmdi-shopping-cart-plus"></i>
                                        </a>
                                    </div>
                                    <div class="rating-box">
                                        <c:forEach begin="1" end="${recomBook.b_rate-(recomBook.b_rate%1)}">
                                            <i class="fa fa-star" style="color: red;"> </i>
                                        </c:forEach>
                                        <c:forEach begin="${recomBook.b_rate-(recomBook.b_rate%1)+1}" end="5">
                                            <i class="far fa-star"> </i>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="product-content text-center">
                                    <h4>
                                        <a href="content.do?itemId=${recomBook.b_itemId}">${recomBook.b_title}</a>
                                    </h4>
                                    <div class="product-price-2">
                                        <div class="price-box">
                                            <ins>
                                                <span class="amount">
                                                    ${recomBook.b_price}<span class="Price-currencySymbol">원</span></span>
                                            </ins>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        
                   </c:forEach>
                   </div>
                   </div>
                   
				</c:when>
                <c:otherwise>
                <div class="row">
                    <div class="product-slider-active owl-carousel" >
                        <c:forEach items="${recommandedList}" var="recomBook">
                        <div class="col-lg-4 col-md-6 col-12" style="max-width:70%;margin:50px;">
                            <div class="product-wrapper mb-35">
                                <div class="product-img">
                                    <a href="content.do?itemId=${recomBook.b_itemId}">
                                        <img alt="" src="${recomBook.b_img}" style="height:200px;">
                                    </a>
                                    <div class="product-action-2">
                                        <a href="../purchase/add.do?itemId=${recomBook.b_itemId }" title="Add To Cart"  class="action-plus-2 tooltip">
                                            <i class="zmdi zmdi-shopping-cart-plus"></i>
                                        </a>
                                    </div>
                                    <div class="rating-box">
                                        <c:forEach begin="1" end="${recomBook.b_rate-(recomBook.b_rate%1)}">
                                            <i class="fa fa-star" style="color: red;"> </i>
                                        </c:forEach>
                                        <c:forEach begin="${recomBook.b_rate-(recomBook.b_rate%1)+1}" end="5">
                                            <i class="far fa-star"> </i>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="product-content text-center">
                                    <h4>
                                        <a href="content.do?itemId=${recomBook.b_itemId}">${recomBook.b_title}</a>
                                    </h4>
                                    <div class="product-price-2">
                                        <div class="price-box">
                                            <ins>
                                                <span class="amount">
                                                    ${recomBook.b_price}<span class="Price-currencySymbol">원</span></span>
                                            </ins>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                </div>
                </c:otherwise>
                </c:choose>
            </div>
        </div>
        
        <!--Our Service Area Start-->
      	<div class="our-service-area pt-0 pb-40" style="padding-left:50px;">
         <div class="container" style="max-width:1000px;">
         <h3 class="ui header">작가의 저서</h3>
            <div class="row">
               
               <!--Single Service Start-->
               <c:forEach items="${writerBookList}" var="writerBook">
               <div class="col-xl-3 col-lg-3 col-md-12 col-12">
                  <div class="single-service single-service-2 mb-25">
                     <div class="service-icon">
                        <a href="content.do?itemId=${writerBook.b_itemId }">
                        	<img alt="" src="${writerBook.b_img}" style="width:80px;height:114px;">
                        </a>
                     </div>
                     <div class="service-info" style="padding-top:30px;">
                        
                        	<h3><a href="content.do?itemId=${writerBook.b_itemId }">${writerBook.b_title}</a></h3>
                        
                        <p>${writerBook.b_price}</p>
                     </div>
                  </div>
               </div>
               </c:forEach>
               <!--Single Service End-->
        	
        	</div>
        </div>
    	</div>
        <!-- footer -->
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
    <script src="../assets/js/ajax-mail.js"></script>
    <script src="../assets/js/owl.carousel.min.js"></script>
    <script src="../assets/js/plugins.js"></script>
    <script src="../assets/js/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script src="../assets/js/service-book-content.js"></script>
    <script src="../assets/js/package.js"></script>
    
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js" type="text/javascript"></script>
    <script src="../assets/js/service-search.js"></script>
    <script>
    
    	var rightNow = $("#purchase-rightnow").attr("href");
    
	    $(".qtybutton").on("click", function() {
	    	var $button = $(this); 
	    	var vol = $button.parent().find("input").val();
	    	//alert(rightNow +"&vol="+vol);
	    	$("#purchase-rightnow").attr("href",rightNow +"&vol="+vol);
	    });
    
    </script>
    
</body>

</html>