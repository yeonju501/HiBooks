<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="../assets/css/jquery-ui.css">
    <link rel="stylesheet" href="../assets/css/material-design-iconic-font.css">
    <link rel="stylesheet" href="../assets/css/meanmenu.min.css">
    <link rel="stylesheet" href="../assets/css/tippy.css">
    <link rel="stylesheet" href="../assets/css/bundle.css">
    <link rel="stylesheet" href="../assets/css/style.css">
    <link rel="stylesheet" href="../assets/css/responsive.css">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <link rel="stylesheet" href="../assets/css/service-search.css">
    <script src="../assets/js/vendor/modernizr-2.8.3.min.js"></script>
    <script src="../assets/js/vendor/jquery-1.12.0.min.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js" type="text/javascript"></script>
    <script src="../assets/js/service-search.js"></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    
</head>

<body>
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.member" var="loginUser"/>
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
	                                    <input type = "hidden" name = "${_csrf.parameterName }" value = "${_csrf.token }"/>
	                                    <input type="text" class="input_text" id="keyword" name="keyword" placeholder="제목, 저자, 출판사 검색">
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
        <!-- breadcrumbs area start -->
        <!-- breadcrumbs area End -->
 <script>
 	$(document).ready(function(){
		var name=""; var phone="";var zipNum="";var addr1 = "";
		var m_name = $("#m_name").val();
		var m_phone = $("#m_phone").val();
		var m_zipNum ="${loginUser.m_zipNum}";
		var m_addr1 ="${loginUser.m_addr1}";
		$("#fill").change(function(){         
		        if($("#fill").is(":checked")){
		             $("#s_name").val(m_name);
		             $("#s_phone").val(m_phone);
		             $("#s_zipNo").val(m_zipNum);
		             $("#roadFullAddr").val(m_addr1);
		        }else{
		        	 $("#s_name").val(name);
			         $("#s_phone").val(phone);
			         $("#s_zipNo").val(zipNum);
			         $("#roadFullAddr").val(addr1);
		        }
		    });
		});
	function goPopup(){
		var pop = window.open("jusoPopup.do","pop","width=570,height=420,left=500,top=100, scrollbars=yes, resizable=yes");
	}
	function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.purchaseinput.roadFullAddr.value = roadFullAddr;
		document.purchaseinput.s_zipNo.value = zipNo;
	}
</script>

 <!--Checkout Area Start-->
        <div class="checkout-area pt-50 pb-50">
            <div class="container" style="max-width:1000px;">
                <div class="row">
                    <div class="col-12">
                        <div class="pg___title">
                          <!--   <h3>주문목록</h3> -->
                        </div>
                        <br/>
                        <div class="coupon-accordion">
                            <!--Accordion Start-->
                                <h3><i class="fas fa-calendar" style="color:#084B84"></i> 주문정보
                            </h3>
                            <div id="checkout-login" class="coupon-content" style="display:block;">
                                <div class="coupon-info">
                                    <form action="#">
                                        <p class="form-row-first">
                                            <label>주문하시는 분
                                                <span class="required">*</span>
                                            </label>
                                            <input type="text" id="m_name" value="${loginUser.m_name}" readonly>
                                        </p>
                                        <p class="form-row-last">
                                            <label>휴대전화
                                                <span class="required">*</span>
                                            </label>
                                            <input type="text" id="m_phone" value="${loginUser.m_phone}" readonly>
                                        </p>
                                         <p class="form-row-last">
                                            <label>이메일
                                                <span class="required">*</span>
                                            </label>
                                            <input type="text" id="m_email" value="${loginUser.m_email}" readonly>
                                        </p>
                                        
                                        <!-- <p class="form-row">
                                            <input value="Login" type="submit">
                                            <label>
                                                <input type="checkbox"> Remember me
                                            </label>
                                        </p>
                                        <p class="lost-password">
                                            <a href="#">Lost your password?</a>
                                        </p> -->
                                    </form>
                                </div>
                            </div>
                            <!--Accordion End-->

                            <!--Accordion Start-->
                            <h3> <i class="fas fa-calendar" style="color:#084B84"></i> 추가정보  
                            </h3>
                            <!-- <div id="checkout_coupon" class="coupon-checkout-content" style="display:block;">
                                <div class="coupon-info">
                                    <form action="#">
                                        <p class="checkout-coupon">
                                            <input placeholder="Coupon code" type="text">
                                            <input value="Apply Coupon" type="submit">
                                        </p>
                                    </form>
                                </div>
                            </div>
 -->                            <!--Accordion End-->
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-lg-6 col-12">
                        <form name="purchaseinput" method="post" action="" >
                            <div class="checkbox-form">
                                <h3>배송정보&nbsp; <label style="font-size:17px;display:float;width:200px;">주문자 정보와 동일 <input type="checkbox" name="fill" id="fill" value="1" style="height:15px;width:10%"></label></h3>
                                </h3> 
                                <div class="row">
                                    <div class="col-md-12">
                                        
                                    </div>
                                    <div class="col-md-6">
                                        <div class="checkout-form-list">
                                            <label>받으시는 분
                                                <span class="required">*</span>
                                            </label>
                                            <input type="text" id="s_name" name="s_name" value="">
                                            
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="checkout-form-list">
                                            <label>주소 
                                                <span class="required">*</span>
                                                 <input type="button"  onClick="goPopup();" value="우편번호" style="padding-left:3px;height:30px;font-size:10px;width:10%">
                                            </label>
		                                     <input placeholder="우편번호" value="" type="text"  id="s_zipNo"  name="s_zipNo" style="width:100px;margin-bottom:10px;">
		                                     <br/>
		                                     <input placeholder="기본주소" value="" type="text" name="s_addr"  id="roadFullAddr"> 
                                        </div>
                                        
                                    </div>
                                    <div class="col-md-12">
                                        <div class="checkout-form-list">
                                            <label>휴대전화
                                                <span class="required">*</span>
                                            </label>
                                            <input type="text" id="s_phone" name="s_phone" value="">
                                        </div>
                                    </div>
                                    </div>
                                     
                            		<div class="order-notes">
                                        <div class="checkout-form-list">
                                            <label>배송메세지</label>
                                            <textarea id="s_msg" name="s_msg"cols="30" rows="10"></textarea>
                                        </div>
                                    </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-lg-6 col-12">
                        <div class="your-order">
                            <h3>주문 목록</h3>
                            <div class="your-order-table table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th class="cart-product-name">상품</th>
                                            <th class="cart-product-volume">수량</th>
                                            <th class="cart-product-total">합계</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:set var = "sum" value = "0" />
                                    <c:forEach items="${list}" var="cartVo">
                                        <tr class="cart_item">
                                            <td class="cart-product-name"> ${cartVo.book.b_title}</td>
                                                <td><strong class="product-quantity"> ${cartVo.vol}</strong>
                                            </td>
                                            <td class="cart-product-total">
                                                <span class="amount">${cartVo.total}원</span>
                                            </td>
                                        </tr>
                                        <c:set var= "sum" value="${sum + cartVo.total}"/>
                                        </c:forEach>
                                    </tbody>
                                    <tfoot>
                                        <tr class="cart-subtotal">
                                            <th>총 주문 금액</th>
                                            <td></td>
                                            <td>
                                                <span class="amount"><c:out value="${sum}원"/> </span>
                                            </td>
                                        </tr>
                                        <tr class="order-total">
                                            <th>결제 금액</th>
                                             <td></td>
                                            <td>
                                                <strong>
                                                    <span id="amount" class="amount"><c:out value="${sum}원"/> </span>
                                                </strong>
                                            </td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <div class="payment-method">
                                <div class="payment-accordion">
                                  <!--   <div id="accordion">
                                        <div class="card">
                                            <div class="card-header" id="#payment-1">
                                                <h5 class="panel-title">
                                                    <a class="" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                                        Direct Bank Transfer.
                                                    </a>
                                                </h5>
                                            </div>
                                            <div id="collapseOne" class="collapse show" data-parent="#accordion">
                                                <div class="card-body">
                                                    <p>Make your payment directly into our bank account. Please use your Order ID as
                                                        the payment reference. Your order won’t be shipped until the funds have cleared
                                                        in our account.</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card">
                                            <div class="card-header" id="#payment-2">
                                                <h5 class="panel-title">
                                                    <a class="collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                                        Cheque Payment
                                                    </a>
                                                </h5>
                                            </div>
                                            <div id="collapseTwo" class="collapse" data-parent="#accordion">
                                                <div class="card-body">
                                                    <p>Make your payment directly into our bank account. Please use your Order ID as
                                                        the payment reference. Your order won’t be shipped until the funds have cleared
                                                        in our account.</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card">
                                            <div class="card-header" id="#payment-3">
                                                <h5 class="panel-title">
                                                    <a class="collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                                        PayPal
                                                    </a>
                                                </h5>
                                            </div>
                                            <div id="collapseThree" class="collapse" data-parent="#accordion">
                                                <div class="card-body">
                                                    <p>Make your payment directly into our bank account. Please use your Order ID as
                                                        the payment reference. Your order won’t be shipped until the funds have cleared
                                                        in our account.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div> -->
                                    <div class="order-button-payment">
                                        <input id="place-order" type="button" value="주문하기">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Checkout Area End-->

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
    
    <!-- javascript -->
    <script>
    const swalWithBootstrapButtons = Swal.mixin({
  	  customClass: {
  	    confirmButton: 'btn btn-primary',
  	    cancelButton: 'btn btn-default',
  	  },
  	  buttonsStyling: false
 	})
    $("#place-order").click(function(){
		for(var i=0; i<document.purchaseinput.elements.length; i++)
		{
			if(document.purchaseinput.elements[i].value == "")
			{
				alert("모든 값을 입력 하셔야 합니다. ");
				document.purchaseinput.elements[i].focus();
				return false;
			}
		}
		let m_email = $("#m_email").val();
		let s_name = $("#s_name").val();
		let s_addr = $("#roadFullAddr").val();
		let s_phone = $("#s_phone").val();
		let s_msg = $("#s_msg").val();
		let s_zipNo = $("#s_zipNo").val();
		//alert(m_email +s_name +s_addr +s_phone +s_msg +s_zipNo);
		
		var IMP = window.IMP; // 생략가능
		IMP.init('imp55458654');
		IMP.request_pay({
			//pg: 'inicis', // version 1.1.0부터 지원.
			pay_method: 'card',
			merchant_uid: new Date().getTime(),
			name: '주문명 : 하이북스 테스트',
			amount: 100,	//테스트 완료 후 가격정보 넣기
			buyer_email: m_email,
			buyer_name: s_name,
			buyer_tel: s_phone,
			buyer_addr: s_addr,
			buyer_postcode: s_zipNo
			}, function (rsp) {
				
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					/* msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num; */
					let purchaseVo = {
							m_email: m_email,
							s_name: s_name,
							s_addr: s_addr,
							s_phone: s_phone,
							s_msg: s_msg,
							s_zipNo: s_zipNo,
							o_shipno: rsp.merchant_uid,
							o_paidAmount: rsp.paid_amount,
							o_paytype: rsp.pay_method
						}
					
					$.ajax({
						url : "placeorder.do",
						type : "get",
						data : purchaseVo,
						dataType : "text",
						success : function(result){
							if(result == "y") {
								swalWithBootstrapButtons.fire({
									text : msg,
									icon : 'success',
									confirmButtonText : 'OK'
								}).then((result) => {
									if(result.isConfirmed){
										location.href = "orderComplete.do";
									}
								});
							}else{
								swalWithBootstrapButtons.fire({
									text: "디비입력실패",
									icon: "error"
								});
								return false;
							}
						},
						error : function(a,b,c){}
					});
				} else {
					var msg = '결제에 실패하였습니다. : ';
					msg += rsp.error_msg;
				}
				swalWithBootstrapButtons.fire({
					text : msg,
					icon : 'error'
				});
				
			});
		});
    </script>
</body>

</html>