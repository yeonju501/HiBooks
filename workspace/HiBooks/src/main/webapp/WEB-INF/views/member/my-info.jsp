<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="bit.hibooks.setting.MemberModeSet"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="../assets/css/service-my-info.css">
    <link rel="stylesheet" href="../assets/css/responsive.css">

    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script src="../assets/js/vendor/modernizr-2.8.3.min.js"></script>
    <script src="../assets/js/vendor/jquery-1.12.0.min.js"></script>
</head>
<body>
	<sec:authentication property="principal.member" var="loginUserInfo"/>
	<div class="wrapper">
		<header id="header_background">
            <div class="header-topbar header-topbar-style-1">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-6 col-xs-12">
                            <div class="header-top-left">
                                <ul>
                                    <li>
                                        <h3 id="logo"><a href="/">H!Books${checkPwdCode}</a></h3>
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
                                        		<a href="member/join.do"><span> 회원가입</span></a>
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
                                                            <a href="moveMyInfo.do">내 정보</a>
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
		<div class="main">
            <!-- Sign up form -->
            <section class="sign-up">
                <div class="container">
                    <div class="signup-content">
                        <div class="signup-form">
                            <h2 class="form-title">회원정보 </h2>
                            <c:choose>
                            	<c:when test="${checkPwdCode!= 15 && !empty checkPwdCode}">
                            		<form method="post" name="my_info_input" class="register-form" id="info-register" action="updateMemberInfo.do">
		                                
		                                <div class="form-group">
		                                    <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
		                                    <input type="text" name="m_name" id="name" value="${loginUserInfo.m_name }" readonly />
		                                </div>
		                                <div class="form-group">
		                                    <label for="email"><i class="zmdi zmdi-email"></i></label>
		                                    <input type="email" name="m_email" id="email" value="${loginUserInfo.m_email }" readonly/>
		                                </div>
		                                <br><br><br>
		                                <h4>선택정보</h4>
		                                <div class="form-group">
		                                    <label for="phone"><i class="zmdi zmdi-smartphone-android"></i></label>
		                               		<input value="${loginUserInfo.m_phone}" type="text" name="m_phone" id="phone" placeholder="전화번호"/>
		                                </div>
		                                <div class="form-group">
		                                    <div class="form-group form-two-input">
		                                        <label for="zipNo"><i class="zmdi zmdi-navigation"></i></label>
		                                        <input value="${loginUserInfo.m_zipNum}" placeholder="우편번호" type="text"  id="zipNo"  name="m_zipNum" style="width:200px;" readonly>
		                                        <input type="button" id="addr" onClick="goPopup();" value="주소 찾기" class="form-submit">
		                                    </div>
		                                    <br/>
		                                    <label for="s_addr"><i class="zmdi zmdi-home"></i></label>
		                                    <input value="${loginUserInfo.m_addr1}" placeholder="기본주소" type="text" name="m_addr1"  id="roadFullAddr">
		                                </div>
		                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		                                <div class="form-group form-button">
		                                    <input type="submit" id="signup" class="form-submit" value="입력"/>
		                                </div>
		                            </form>
                            	</c:when>
                            	<c:otherwise>
                            		<form method="post" name="my_info_input" class="register-form" id="info-register" action="updateMemberInfo.do">
		                                <h5 style="text-align: end;"><a href="moveUpdate.do">정보수정</a></h5>
		                                <div class="form-group">
		                                    <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
		                                    <input type="text" name="m_name" id="name" value="${loginUserInfo.m_name }" readonly />
		                                </div>
		                                <div class="form-group">
		                                    <label for="email"><i class="zmdi zmdi-email"></i></label>
		                                    <input type="email" name="m_email" id="email" value="${loginUserInfo.m_email }" readonly/>
		                                </div>
		                                <br><br><br>
		                                <h4>선택정보</h4>
		                                <div class="form-group">
		                                    <label for="phone"><i class="zmdi zmdi-smartphone-android"></i></label>
		                               		<input value="${loginUserInfo.m_phone}" type="text" name="m_phone" id="phone" placeholder="전화번호" readonly/>
		                                </div>
		                                <div class="form-group">
		                                    <div class="form-group form-two-input">
		                                        <label for="zipNo"><i class="zmdi zmdi-navigation"></i></label>
		                                        <input value="${loginUserInfo.m_zipNum}" placeholder="우편번호" type="text"  id="zipNo"  name="m_zipNum" style="width:200px;" readonly>
		                                        <input type="button" id="addr" value="주소 찾기" class="form-submit">
		                                    </div>
		                                    <br/>
		                                    <label for="s_addr"><i class="zmdi zmdi-home"></i></label>
		                                    <input value="${loginUserInfo.m_addr1}" placeholder="기본주소" type="text" name="m_addr1"  id="roadFullAddr" readonly>
		                                </div>
		                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		                                <div class="form-group form-button">
		                                    <input onclick="" type="hidden" id="signup" class="form-submit" value="입력"/>
		                                </div>
		                            </form>
                            	</c:otherwise>
                            </c:choose>
                            
                            <c:if test="${checkPwdCode!= 15 && !empty checkPwdCode}">
	                            <form method="POST" class="register-form" id="pwd-update" action="updatePwd.do">
	                                <h4>비밀번호 변경</h4>
	                                <div class="form-group">
	                                    <label for="pass"><i class="zmdi zmdi-lock"></i></label>
	                                    <input type="hidden" name="m_email" value="${loginUserInfo.m_email }">
	                                    <input type="password" name="m_pwd" id="pass" placeholder="새 비밀번호"/>
	                                    <span class="error_next_box" id="passMsg" style="" aria-live="assertive"></span>
	                                </div>
	                                <div class="form-group">
	                                    <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
	                                    <input oninput="checkRePass()" type="password" name="re_pass" id="re_pass" placeholder="새 비밀번호확인"/>
	                                    <span class="error_next_box" id="re_passMsg" style="" aria-live="assertive"></span>
	                                </div>
	                                <div class="form-group form-button">
	                                	<input type = "hidden" name = "${_csrf.parameterName }" value = "${_csrf.token }"/>
	                                    <input type="button" name="signup" id="pwd-up-button" class="form-submit" value="입력"/>
	                                </div>
	                            </form>
                            </c:if>
                        </div>
                        
                    </div>
                </div>
            </section>
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
	<script src="../assets/js/service-my-info.js"></script>
	<input type="hidden" id="checkPwdCode" value="${checkPwdCode}">
	<script type="text/javascript">
		let checkPwdCode = $("#checkPwdCode").val();
		if(checkPwdCode == <%=MemberModeSet.UPDATE_PWD_SUC %>){
			alert("비밀번호가 변경되었습니다, 다시 로그인 해주세요");
			location.href = "logout.do";
		}else if(checkPwdCode == <%=MemberModeSet.UPDATE_ACCESS_FAIL %>){
			alert("비밀번호가 틀렸습니다, 다시 시도해주세요");
		}else if(checkPwdCode == <%=MemberModeSet.UPDATE_INFO_SUC%>){
			alert("회원정보가 수정되었습니다");
		}
	</script>
		
</body>

</html>