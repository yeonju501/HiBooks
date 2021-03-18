<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="bit.hibooks.setting.MemberModeSet"%>
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
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />  
    <link rel="stylesheet" href="../assets/css/summernote-lite.css">
    <link rel="stylesheet" href="../assets/css/summernote-lite.min.css"> 
 <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
  <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css" rel="stylesheet">

    <script src="../assets/js/vendor/modernizr-2.8.3.min.js"></script>
    <script src="../assets/js/vendor/jquery-1.12.0.min.js"></script>
    <script type="text/javascript" language="javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	 <script src="../assets/js/service-admin.js"></script> 
	 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script>
	function ajaxData() {
		$.ajax({
			url: './chartData.json',
			dataType: "json",
			type: 'post',
			async: false,
			success: function(list) {
				google.charts.load('current', {'packages':['corechart']});
				google.charts.setOnLoadCallback(drawChart);
				function drawChart() {
					var dataChart = [['Task', 'Hours per Day']];
					if(list.length != 0) {
						$.each(list, function(i, item){
							dataChart.push([item.item, item.number]);
						});
					}else {
						dataChart.push(['입력해주세요', 1]);
					}
					var data = google.visualization.arrayToDataTable(dataChart);
					var view = new google.visualization.DataView(data);
					var options = {
							title: "제목",
							width: 900, // 넓이 옵션
							height: 200, // 높이 옵션
					};
					var chart1 = new google.visualization.PieChart(
							document.getElementById('piechart'));
					var chart2 = new google.visualization.LineChart(
							document.getElementById('linechart'));
					var chart3 = new google.visualization.BarChart(
							document.getElementById('barchart'));
					var chart4 = new google.visualization.ColumnChart(
							document.getElementById('columnchart'));
					
					chart1.draw(view, options);
					chart2.draw(view, options);
					chart3.draw(view, options);
					chart4.draw(view, options);
				}
			}
		});
	}
	
	$(document).ready(function(){
		ajaxData();
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
		
		$(document).ready(function() {
			//여기 아래 부분
			$('#summernote').summernote({
				  height: 300,                 // 에디터 높이
				  minHeight: null,             // 최소 높이
				  maxHeight: null,             // 최대 높이
				  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
				  lang: "ko-KR",					// 한글 설정
				  placeholder: '최대 2048자까지 쓸 수 있습니다',
				  callbacks : { 
		            	onImageUpload : function(files, editor, welEditable) {
		            // 파일 업로드(다중업로드를 위해 반복문 사용)
		            for (var i = files.length - 1; i >= 0; i--) {
		            uploadSummernoteImageFile(files[i],
		            this);
		            		}
		            	}
		            }
		          
			});
		});
		
		function uploadSummernoteImageFile(file, editor) {
			data = new FormData();
			data.append("file", file);
			$.ajax({
				data : data,
				type : "POST",
				url : "upload.do",
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(data) {
					$('#summernote').summernote('editor.insertImage', data.url);
				}
			});
		}
	
		$("div.note-editable").on('drop',function(e){
	         for(i=0; i< e.originalEvent.dataTransfer.files.length; i++){
	         	uploadSummernoteImageFile(e.originalEvent.dataTransfer.files[i],$("#summernote")[0]);
	         }
	        e.preventDefault();
	   })

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
                                    <a class="nav-link" data-toggle="tab" href="#address">배송관리</a>
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
                                    <h3>오버뷰 </h3>
                                    <input type="button" value="데이터호출" onclick="ajaxData()"/>
                                    <p>From your account dashboard. you can easily check &amp; view your
                                        <a href="#">recent orders</a>, manage your
                                        <a href="#">shipping and billing addresses</a> and
                                        <a href="#">edit your password and account details.</a>
                                    </p>
                                </div>
                             
                                <div id="recommend" class="tab-pane">
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
                                    ${fn:length(list)} 건의 책
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
                                             <c:forEach items="${list}" var="book" varStatus="status">
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
                                                        <button class="select"id="select${status.count}" name="${status.count}" value="${book.b_seq}">선택</button>
                                                    </td>
                                                </tr>
												  </c:forEach>

                                            </tbody>
                                        </table>
                                    </div>
                                    <br>
                                    <!-- 선택한 책 -->
                                    <form method="post" action="sendrecom.do">
                                
                                           <div class="col-lg-12">
                                     
                                                <div class="input-group">
                                                  <input type="text" name="re_title" class="form-control" aria-label="...">
                                                  <div class="input-group-btn">
                                                     <select name="re_loc" >
													    <option value="0">=== 선택 ===</option>
													    <option value="1">1</option>
													    <option value="2">2</option>
													    <option value="3">3</option>
													    <option value="4">4</option>
													    <option value="5">5</option>
													    </select>
                                                   </div>
                                                </div>
                                            </div>
                                  
                                        
                                        <div class="row" style="max-height:400px;overflow-y:scroll;">
                                        <div id="Recommend-ajax">
                                    <!--          <div class="col-lg-3 col-md-6 col-12">
                                                <div class="product-wrapper mb-60">
                                                    <div class="product-img">
                                                        <a href="product-details.html">
                                                            <img alt="" src="../assets/img/products/11.jpg">
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
                                                            <a href="#" title="Add To Cart" class="action-plus-2 tooltip">
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
                                                            <a href="product-details.html">Minar acct sem</a>
                                                        </h4>
                                                        <div class="product-price-2">
                                                            <div class="price-box">
                                                                <ins>
                                                                    <span class="amount">
                                                                        <span class="Price-currencySymbol">$</span>95.00</span>
                                                                </ins>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div> 
                                        </div> -->
                                        </div> 
                                        </div>
                                        <div class="btn-group-lg" role="group" aria-label="...">
                                        <input type = "hidden" name = "${_csrf.parameterName }" value = "${_csrf.token }"/>
                                            <button type="submit" class="btn btn-default" style="font-size:10px;">입력</button>
                                        </div> 
                                    </form>
                                </div>
                                <div id="address" class="tab-pane">

                                </div>
                                <div id="account-details" class="tab-pane">
                                    <form method="post">
                                    &nbsp;<h3>공지사항 작성</h3>
                                     <select name="nb_subject" >
									    <option value="0">말머리</option>
									    <option value="1">1</option>
									    <option value="2">2</option>
									    <option value="3">3</option>
									    <option value="4">4</option>
									    <option value="5">5</option>
								    </select>
								    <br/><br/><br/>
								    &nbsp;<label>제목</label>
                                    <input type="text" name="nb_title" class="form-control">
                                    <br/>
									 <div id="summernote" class="note-editable" contenteditable="true" role="textbox" 
									 aria-multiline="true" spellcheck="true">Hello Summernote</div>
									   <br/>
									  <button type="submit" class="btn btn-primary">등록</button>
									 

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
	 <script src="../assets/js/summernote-lite.js"></script>
    <script src="../assets/js/summernote-lite.min.js"></script>
	<script src="../assets/js/summernote-ko-KR.js"></script>
	
</body>

</html>