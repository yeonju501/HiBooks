/**
 * 
 */
var goPopup = function(){
	var pop = window.open("popup/jusoPopup.do","pop","width=570,height=420,left=500,top=100, scrollbars=yes, resizable=yes");		
}

var jusoCallBack = function(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	document.my_info_input.roadFullAddr.value = roadFullAddr;
	document.my_info_input.zipNo.value = zipNo;
	$("#register-form").focus();
}


var checkPass = function(){
	let reg_num = /[0-9]/g;	// 숫자 포함
	let reg_eng = /[a-z]/ig;	// 영문 포함
	let reg_spe = /[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi;	//특수기호 포함
	let reg_spc = /\s/;	// 공백은 있으면 안됨
	let pass = document.getElementById("pass").value;
	if(pass.length > 15 || pass.length < 10){
		document.getElementById("passMsg").innerHTML = "비밀번호는 10~15자 입니다";
		document.getElementById("passMsg").style.display = "block";
		return false;
	}else{
		if( !(reg_num.test(pass) && reg_eng.test(pass) && reg_spe.test(pass) && !reg_spc.test(pass)) ){
			document.getElementById("passMsg").innerHTML = "숫자와 영어, 특수기호 조합, 공백은 허용하지 않습니다";
			document.getElementById("passMsg").style.display = "block";
			return false;
		}else{
			document.getElementById("passMsg").style.display = "none";
			return true;
		}	
	}
}

var checkRePass = function(){
    let oPwd = document.getElementById("pass").value;
    let cPwd = document.getElementById("re_pass").value;
    if(cPwd != oPwd){
        document.getElementById("re_passMsg").innerHTML = "비밀번호가 일치하지 않습니다";
        document.getElementById("re_passMsg").style.display = "block";
        return false;
    }else{
        document.getElementById("re_passMsg").style.display = "none";
        return true;
    }
}
$(function(){
	$(document).on("input","#pass",function(){
		checkPass();
	});
	$(document).on("input","#re_pass",function(){
		checkRePass();
	});
	$(document).on("click","#pwd-up-button",function(){
		if(!checkPass()){
			document.getElementById("pass").focus();
		}else if(!checkRePass()){
			document.getElementById("re_pass").focus();
		}else{
			document.getElementById("pwd-update").submit();
		}
	});
});
	



