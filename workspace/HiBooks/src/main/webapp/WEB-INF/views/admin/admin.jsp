<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="bit.hibooks.setting.MemberModeSet"%>
<%@ page import="bit.hibooks.controller.AdminController" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!doctype html>
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
   	<link rel="stylesheet" href="../assets/css/service-admin.css">
    <link rel="stylesheet" href="../assets/css/responsive.css">
    <link rel="stylesheet" href="../assets/css/semantic.css">
    <link rel="stylesheet" href="../assets/css/dropdown.css">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />  
    <link rel="stylesheet" href="../assets/summernote/summernote-lite.css">
    <link rel="stylesheet" href="../assets/summernote/summernote-lite.min.css"> 
 
    <script src="../assets/js/vendor/modernizr-2.8.3.min.js"></script>
    <script src="../assets/js/vendor/jquery-1.12.0.min.js"></script>
    <script type="text/javascript" language="javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="../assets/js/semantic.js"></script> 
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	 <script src="../assets/js/service-admin.js"></script> 
	  <script src="../assets/js/dropdown.js"></script>
	 
	<script>
	$(document).ready(function(){
		ajaxData();
		ajaxDataCate2();
	});
	
	</script>
</head>
<body>
	
	<div class="wrapper">
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
		</header>
	<script>
		$(function(){ 
			
			$("ul.dashboard-list > li > a").on("shown.bs.tab", function(e) {
				  var id = $(e.target).attr("href").substr(1);
				  window.location.hash = id;
				});
			
			var hash = window.location.hash;
			$('#admintab a[href="' + hash + '"]').tab('show');
			/*  $("button[name='add']").on("click", function () {
					alert("클릭됨");
				  $('#target').submit(); 
					 $('.nav flex-column dashboard-list').find('li').eq(2).addClass('active').siblings().removeClass(); 
				     $('.tab-content dashboard-content').find('#recommend').addClass('active in').siblings().removeClass('active in');
			     });  */
			 });			
		</script>
		
		<div class="my-account white-bg ptb-100">
            <div class="container">
                <div class="account-dashboard">
                    <div class="row">
                        <div class="col-md-12 col-lg-2">
                            <!-- Nav tabs -->
                            <ul class="nav flex-column dashboard-list" role="tablist" id="admintab">
                                <li>
                                    <a class="nav-link active" data-toggle="tab" href="#dashboard">오버뷰</a>
                                </li>
                                <li>
                                    <a class="nav-link" data-toggle="tab" href="#recommend">추천상품선택</a>
                                </li>
                                <li>
                                    <a class="nav-link" data-toggle="tab" href="#address">신간 업데이트</a>
                                </li>
                                <li>
                                    <a class="nav-link" data-toggle="tab" href="#account-details">공지사항 작성</a>
                                </li>
                                <li>
                                    <a class="nav-link" href="login-register.html">로그아웃</a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-md-12 col-lg-10">
                            <!-- Tab panes -->
                            <div class="tab-content dashboard-content">
                                <div id="dashboard" class="tab-pane active in">
                              
							        <h1>Google Chart</h1>
							        &nbsp;&nbsp;
							
								    <br/><br/>
									<div class="row">
										<div id="columnchart" class="col-12"></div>
										<div id="cate2-0" class="col-6"></div>
										<div id="cate2-1" class="col-6"></div>
										<div id="cate2-2" class="col-6"></div>
										<div id="cate2-3" class="col-6"></div>
										<div id="cate2-4" class="col-6"></div>
									</div>
								
                                </div>
                           
                             
                                <div id="recommend" class="tab-pane fade">
                                    <h4>추천상품선택</h4>
                                    <!-- 분류 -->
                                    <form method="post" action="recomsearch.do#recommend">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <input type="text" class="form-control" name="keyword" placeholder="키워드를 입력해주세요">
                                                    <span class="input-group-btn">
                                                    <input type = "hidden" name = "${_csrf.parameterName }" value = "${_csrf.token }"/>
                                                      <button id="select-keyword" name="add" class="btn btn-default" >검색</button>
                                                    </span>
                                                </div>
                                            </div>
                                             <div class="col-md-2">
                                                
                                                <h6>소설</h6>
                                                <div class="input-group cate" >
                                                    <input class="cate-cbox" type="checkbox" aria-label="k-novel" name="cat" value="한국소설">
                                                    <label aria-label="k-novel">한국소설</label><br>
                                                </div>
                                                <div class="input-group cate" >
                                                    <input class="cate-cbox" type="checkbox" aria-label="k-novel" name="cat" value="영미소설">
                                                    <label aria-label="k-novel">영미소설</label><br>
                                                </div>
                                                <div class="input-group cate" >
                                                    <input class="cate-cbox" type="checkbox" aria-label="k-novel" name="cat" value="일본소설">
                                                    <label aria-label="k-novel">일본소설</label><br>
                                                </div>
                                                <div class="input-group cate" >
                                                    <input class="cate-cbox" type="checkbox" aria-label="k-novel" name="cat" value="중국소설">
                                                    <label aria-label="k-novel">중국소설</label><br>
                                                </div>
                                                <div class="input-group cate" >
                                                    <input class="cate-cbox" type="checkbox" aria-label="k-novel" name="cat" value="북유럽소설">
                                                    <label aria-label="k-novel">북유럽소설</label><br>
                                                </div>
												 <div class="input-group cate" >
                                                    <input class="cate-cbox" type="checkbox" aria-label="k-novel" name="cat" value="독일소설">
                                                    <label aria-label="k-novel">독일소설</label><br>
                                                </div>
                                                <div class="input-group cate" >
                                                    <input class="cate-cbox" type="checkbox" aria-label="k-novel" name="cat" value="프랑스소설">
                                                    <label aria-label="k-novel">프랑스소설</label><br>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <h6>소설</h6>
                                                <div class="input-group cate" >
                                                    <input class="cate-cbox" type="checkbox" aria-label="k-novel" name="cat" value="기타 국가소설">
                                                    <label aria-label="k-novel">기타 국가소설</label><br>
                                                </div>
                                                <div class="input-group cate" >
                                                    <input class="cate-cbox" type="checkbox" aria-label="k-novel" name="cat" value="추리/미스터리/스릴러">
                                                    <label aria-label="k-novel">추리/미스터리/스릴러</label><br>
                                                </div>
                                                <div class="input-group cate" >
                                                    <input class="cate-cbox" type="checkbox" aria-label="k-novel" name="cat" value="SF소설">
                                                    <label aria-label="k-novel">SF소설</label><br>
                                                </div>
                                                <div class="input-group cate" >
                                                    <input class="cate-cbox" type="checkbox" aria-label="k-novel" name="cat" value="국내판타지소설">
                                                    <label aria-label="k-novel">국내판타지소설</label><br>
                                                </div>
                                                <div class="input-group cate" >
                                                    <input class="cate-cbox" type="checkbox" aria-label="k-novel" name="cat" value="해외 역사소설">
                                                    <label aria-label="k-novel">해외 역사소설</label><br>
                                                </div>
												<div class="input-group cate" >
                                                    <input class="cate-cbox" type="checkbox" aria-label="k-novel" name="cat" value="동양 역사소설">
                                                    <label aria-label="k-novel">동양 역사소설</label><br>
                                                </div>
                                                <div class="input-group cate" >
                                                    <input class="cate-cbox" type="checkbox" aria-label="k-novel" name="cat" value="서양 고전문학">
                                                    <label aria-label="k-novel">서양 고전문학</label><br>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <h6>경영/경제</h6>
                                                <div class="input-group cate" >
                                                    <input class="cate-cbox" type="checkbox" aria-label="k-novel" name="cat" value="경영일반">
                                                    <label aria-label="k-novel">경영일반</label><br>
                                                </div>
                                                <div class="input-group cate" >
                                                    <input class="cate-cbox" type="checkbox" aria-label="k-novel" name="cat" value="경제일반">
                                                    <label aria-label="k-novel">경제일반</label><br>
                                                </div>
                                                <div class="input-group cate" >
                                                    <input class="cate-cbox" type="checkbox" aria-label="k-novel" name="cat" value="마케팅/세일즈">
                                                    <label aria-label="k-novel">마케팅/세일즈</label><br>
                                                </div>
                                                <div class="input-group cate" >
                                                    <input class="cate-cbox" type="checkbox" aria-label="k-novel" name="cat" value="재테크/금융/부동산">
                                                    <label aria-label="k-novel">재테크/금융/부동산</label><br>
                                                </div>
                                                <div class="input-group cate" >
                                                    <input class="cate-cbox" type="checkbox" aria-label="k-novel" name="cat" value="CEO/리더십">
                                                    <label aria-label="k-novel">CEO/리더십</label><br>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <h6>인문/사회/역사</h6>
                                                <div class="input-group cate" >
                                                    <input class="cate-cbox" type="checkbox" aria-label="k-novel" name="cat" value="인문">
                                                    <label aria-label="k-novel">인문</label><br>
                                                </div>
                                                <div class="input-group cate" >
                                                    <input class="cate-cbox" type="checkbox" aria-label="k-novel" name="cat" value="정치/사회">
                                                    <label aria-label="k-novel">정치/사회</label><br>
                                                </div>
                                                <div class="input-group cate" >
                                                    <input class="cate-cbox" type="checkbox" aria-label="k-novel" name="cat" value="예술/문화">
                                                    <label aria-label="k-novel">예술/문화</label><br>
                                                </div>
                                                <div class="input-group cate" >
                                                    <input class="cate-cbox" type="checkbox" aria-label="k-novel" name="cat" value="역사">
                                                    <label aria-label="k-novel">역사</label><br>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <h6>자기계발</h6>
                                                <div class="input-group cate" >
                                                    <input class="cate-cbox" type="checkbox" aria-label="k-novel" name="cat" value="성공/삶의자세">
                                                    <label aria-label="k-novel">성공/삶의자세</label><br>
                                                </div>
                                                <div class="input-group cate" >
                                                    <input class="cate-cbox" type="checkbox" aria-label="k-novel" name="cat" value="기획/창의/리더십">
                                                    <label aria-label="k-novel">기획/창의/리더십</label><br>
                                                </div>
                                                <div class="input-group cate" >
                                                    <input class="cate-cbox" type="checkbox" aria-label="k-novel" name="cat" value="설득/화술/협상">
                                                    <label aria-label="k-novel">설득/화술/협상</label><br>
                                                </div>
                                                <div class="input-group cate" >
                                                    <input class="cate-cbox" type="checkbox" aria-label="k-novel" name="cat" value="취업/창업">
                                                    <label aria-label="k-novel">취업/창업</label><br>
                                                </div>
                                                <div class="input-group cate" >
                                                    <input class="cate-cbox" type="checkbox" aria-label="k-novel" name="cat" value="여성">
                                                    <label aria-label="k-novel">여성</label><br>
                                                </div>
												  <div class="input-group cate" >
                                                    <input class="cate-cbox" type="checkbox" aria-label="k-novel" name="cat" value="인간관계">
                                                    <label aria-label="k-novel">인간관계</label><br>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <h6>에세이/시</h6>
                                                <div class="input-group cate" >
                                                    <input class="cate-cbox" type="checkbox" aria-label="k-novel" name="cat">
                                                    <label aria-label="k-novel">에세이</label><br>
                                                </div>
                                                <div class="input-group cate" >
                                                    <input class="cate-cbox" type="checkbox" aria-label="k-novel" name="cat">
                                                    <label aria-label="k-novel">시</label><br>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    ${fn:length(recomList)} 건의 책
                                    <div class="table-responsive" style="height:800px;">
                                        
                                        <!-- 리스팅 -->
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th style="width:10%">책커버</th>
                                                    <th style="width:20%">제목</th>
                                                    <th style="width:60%">책소개</th>
                                                    <th style="width:10%">선택</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                             <c:forEach items="${recomList}" var="book" varStatus="status">
 												<tr>
                                                    <td><img style="display:block;width:100%;" src="${book.b_img}"></td>
                                                    <td> (${status.count})&nbsp;${book.b_title}</td>
                                                   <c:choose>
                                                    <c:when test="${fn:length(book.b_desc) gt 200}">
                                                    <td><c:out value="${fn:substring(book.b_desc, 0, 200)}"></c:out>...</td>
                                                    </c:when><c:otherwise>
                                                     <td><c:out value="${book.b_desc}"></c:out></td>
       												</c:otherwise>
													</c:choose>
                                                    <td>
                                                        <input type="button" class="selectRecom"id="select${status.count}" name="${book.b_seq}" value="선택">
                                                    </td>
                                                </tr>
												  </c:forEach>

                                            </tbody>
                                        </table>
                                    </div>
                                    <br>
                                    <!-- 선택한 책 -->
                                    <form id="formRecom" method="post" action="sendrecom.do" >
                                           <div class="col-lg-12">
                                                <div class="input-group">
                                                  <input type="text" name="re_title" class="form-control" aria-label="...">
                                                  <div class="input-group-btn">
                                                     <select name="re_loc" >
													    <option value="0">선택</option>
													    <option value="1">1</option>
													    <option value="2">2</option>
													    <option value="3">3</option>
													    <option value="4">4</option>
													    <option value="5">5</option>
													    </select>
                                                   </div>
                                                </div>
                                            </div>
                                        <div class="row" style="overflow-y:scroll;max-height:400px;">
                                        <div class="container-fluid" id="Recommend-ajax" style="display:flex;flex-wrap:wrap;">
                                        <c:if test="${!empty recomSession}">
                                        <c:forEach items="${recomSession}" var="book" varStatus="status">
                                           <div class="col-lg-3 col-md-6 col-3" id="recom">
                                                <div class="product-wrapper mb-60">
                                                    <div class="product-img">
                                               			<input type="hidden" name="re_seq${status.count}" value="${book.b_seq}">
                                                            <img alt="" src="${book.b_img}">
                                                    <div class="product-content text-center">
                                                        <h4>
                                                            <a href="product-details.html">${book.b_title}</a>
                                                        </h4>
                                                        <div class="product-price-2">
                                                            <div class="price-box">
                                                                &ensp;<input type="button" id="${book.b_seq}" class="delete" value="삭제" style="width: 50px;height: 30px;padding-left: 5px;">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div> 
                                        </div>
                                        </c:forEach>
                                        </c:if>
                                        </div> 
                                        </div> 
                                        <div class="btn-group-lg" role="group" aria-label="...">
                                        <input type = "hidden" name = "${_csrf.parameterName }" value = "${_csrf.token }"/>
                                            <input type="button" value="등록" style="width:50px;" onclick="recomSubmit()">
                                        </div> 
                                    </form>
                                </div>
                                <div id="address" class="tab-pane">
                                <div class="container">
								  <div class="row">
								    <div class="col-xs-12">
								    <h3 style="width:700px;">이 달의 신간</h3>
								   <select name="gender" >
									  <option value="novel">소설</option>
									  <option value="economy">경제</option>
									  <option value="society">사회</option>
									  <option value="self">자기계발</option>
									  <option value="essay">시/에세이</option>
									</select>
								    <br/><br/><br/>
								      <table class="table table-bordered table-hover dt-responsive" style="max-width:100%;">
								        <thead>
								          <tr>
								            <th style="width:20%">책 제목</th>
								            <th style="width:10%">이미지</th>
								            <th style="width:40%">소개</th>
								            <th style="width:20%">작가</th>
								            <th style="width:10%">가격</th>
								          </tr>
								        </thead>
								        <tbody>
								         <c:forEach items="${updateLR.listNovel}" var="book" varStatus="status">
								          <tr id="novel" >
								            <td>${book.b_title}</td>
								            <td><img style="display:block;width:100%;" src="${book.b_img}"></td>
								            <c:choose>
                                             <c:when test="${fn:length(book.b_desc) gt 100}">
                                             <td><c:out value="${fn:substring(book.b_desc, 0, 100)}"></c:out>...</td>
                                             </c:when><c:otherwise>
                                              <td><c:out value="${book.b_desc}"></c:out></td>
												</c:otherwise>
											</c:choose>
								            <td>${book.b_writer}, ${book.b_translator}</td>
								        	<td>${book.b_price}원</td>
								          </tr>
								          </c:forEach>
								          <c:forEach items="${updateLR.listEconomy}" var="book" varStatus="status">
								          <tr id="economy">
								            <td>${book.b_title}</td>
								            <td><img style="display:block;width:100%;" src="${book.b_img}"></td>
								            <c:choose>
                                             <c:when test="${fn:length(book.b_desc) gt 100}">
                                             <td><c:out value="${fn:substring(book.b_desc, 0, 100)}"></c:out>...</td>
                                             </c:when><c:otherwise>
                                              <td><c:out value="${book.b_desc}"></c:out></td>
												</c:otherwise>
											</c:choose>
								            <td>${book.b_writer}, ${book.b_translator}</td>
								        	<td>${book.b_price}원</td>
								          </tr>
								          </c:forEach>
								          <c:forEach items="${updateLR.listSociety}" var="book" varStatus="status">
								          <tr id="society">
								            <td>${book.b_title}</td>
								            <td><img style="display:block;width:100%;" src="${book.b_img}"></td>
								            <c:choose>
                                             <c:when test="${fn:length(book.b_desc) gt 100}">
                                             <td><c:out value="${fn:substring(book.b_desc, 0, 100)}"></c:out>...</td>
                                             </c:when><c:otherwise>
                                              <td><c:out value="${book.b_desc}"></c:out></td>
												</c:otherwise>
											</c:choose>
								            <td>${book.b_writer}, ${book.b_translator}</td>
								        	<td>${book.b_price}원</td>
								          </tr>
								          </c:forEach>
								         <c:forEach items="${updateLR.listSelf}" var="book" varStatus="status">
								          <tr id="self">
								            <td>${book.b_title}</td>
								            <td><img style="display:block;width:100%;" src="${book.b_img}"></td>
								            <c:choose>
                                             <c:when test="${fn:length(book.b_desc) gt 100}">
                                             <td><c:out value="${fn:substring(book.b_desc, 0, 100)}"></c:out>...</td>
                                             </c:when><c:otherwise>
                                              <td><c:out value="${book.b_desc}"></c:out></td>
												</c:otherwise>
											</c:choose>
								            <td>${book.b_writer}, ${book.b_translator}</td>
								        	<td>${book.b_price}원</td>
								          </tr>
								          </c:forEach>
								         <c:forEach items="${updateLR.listEssay}" var="book" varStatus="status">
								          <tr id="essay">
								            <td>${book.b_title}</td>
								            <td><img style="display:block;width:100%;" src="${book.b_img}"></td>
								            <c:choose>
                                             <c:when test="${fn:length(book.b_desc) gt 100}">
                                             <td><c:out value="${fn:substring(book.b_desc, 0, 100)}"></c:out>...</td>
                                             </c:when><c:otherwise>
                                              <td><c:out value="${book.b_desc}"></c:out></td>
												</c:otherwise>
											</c:choose>
								            <td>${book.b_writer}, ${book.b_translator}</td>
								        	<td>${book.b_price}원</td>
								          </tr>
								          </c:forEach>
								        </tbody>
								      </table>
								    </div>
								  </div>
								</div>
								
                                </div>
                                <div id="account-details" class="tab-pane">
                                    <form name="input" method="post" action ="../boardNotice/write.do" enctype="multipart/form-data">
		                                &nbsp;<h3>공지사항 작성</h3>
		                                <select name="bn_topic" >
										    <option value="">말머리</option>
										    <option value="이벤트">이벤트</option>
										    <option value="하이셀렉트">하이셀렉트</option>
										    <option value="인터뷰">인터뷰</option>
										    <option value="뉴스">뉴스</option>
										    
									    </select>
									    <br/><br/><br/>
									    &nbsp;<label>제목</label>
		                                   <input type="text" name="bn_subject" class="form-control">
		                                   <br/>
		                                   <input type="text" class="form-control" name="bn_writer" value="관리자">
		                                   <br/>
										 <textarea id="summernote" class="note-editable" contenteditable="true" role="textbox" 
										 aria-multiline="true" spellcheck="true" name="bn_content"></textarea>
										   <br/>
										 <input id="fs" type ="file" name="fs" value="" multiple>
										 <div class="preview">
										 <p></p>
										</div>		                                
										<div class="contact-submit">
		                                    <input type="submit" value="글쓰기 등록" class="wpcf7-form-control wpcf7-submit button">
		                                </div>
                            		</form>
                                </div>
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
                                   
                                        <h3>H!Books</h3>
                                  
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
    
	<script src="../assets/summernote/summernote-lite.js"></script>
    <script src="../assets/summernote/lang/summernote-ko-KR.js"></script>
	
    <script type="text/javascript">
	    $(document).ready(function() {
			//여기 아래 부분
			$('#summernote').summernote({
				  height: 300,                 // 에디터 높이
				  minHeight: null,             // 최소 높이
				  maxHeight: null,             // 최대 높이
				  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
				  lang: "ko-KR",					// 한글 설정
				  placeholder: '최대 2048자까지 쓸 수 있습니다',
				  callbacks: {
			  			onImageUpload : function(files, editor, welEditable){
			  				for (var i = files.length - 1; i >= 0; i--) {
			  		            uploadSummernoteImageFile(files[i], editor, welEditable);
			  				}
			  			}
			  		}
			});
		});
		function uploadSummernoteImageFile(file, editor, welEditable ) {
			data = new FormData();
			data.append("file", file);
			$.ajax({
				data : data,
				type : "POST",
				url : "../boardNotice/uploadImgTemp.do",
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(result){
					result = JSON.parse(result);
					$("#summernote").summernote('insertImage', result.url);
				}
			});
		}
		
		var fs = document.querySelector('#fs');
		var preview = document.querySelector('.preview');
		fs.addEventListener('change', showTextFile);
		function showTextFile() {
			while(preview.hasChildNodes()){
				preview.removeChild(preview.firstChild);
			}
			var sF = fs.files;
			var list = document.createElement('ul');
			preview.appendChild(list);
			for(var i=0; i< sF.length; i++) {
				let file = sF[i];
				var listItem = document.createElement('li');
				var summary = document.createElement('div');
				summary.textContent = '파일명 : '+ file.name + ' , 파일 크기 : ' + returnFileSize(file.size);
				listItem.appendChild(summary);
				list.appendChild(listItem);
			}
		}
		
		function returnFileSize(number) {
			if(number < 1024) {
				return number + 'bytes';
			} else if(number > 1024 && number < 1048576) {
				return (number/1024).toFixed(1) + 'KB';
			} else if(number > 1048576) {
				return (number/1048576).toFixed(1) + 'MB';
			}
		}
		
		$(document).on("click",".option", function(){
			let selectedCate = $(this).attr("data-value");
			$("tbody>tr").css('display','none');
			$("tr#"+selectedCate).css('display','table-row');
		});
		

		$(document).on("click",".delete", function (){
			$.ajax({
				url: "../admin/deletebook.do",
				type: "GET",
				data: {re_seq: $(this).attr("id")},
				success: function(responseData){}
			});
			var a = $(this).parents("#recom").next().find("#recombook");
			console.log(a);
			$(this).parents("#recom").remove();
			var index = sessionStorage.getItem("index");
		 	 index--;
			 sessionStorage.setItem("index", index);
	   });
	</script>
</body>

</html>