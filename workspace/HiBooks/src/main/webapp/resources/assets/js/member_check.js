

var checkName = function(){
	let reg_name = /^[가-힣]{2,20}$/;	//정확한 한글, 2~20자
	let reg_spc = /\s/;	// 공백은 있으면 안됨
	let name = document.getElementById("name").value;
	if( !( reg_name.test(name) && !reg_spc.test(name) ) ){
		document.getElementById("nameMsg").innerHTML = "정확한 이름을 입력하세요(2~20글자)";
		document.getElementById("nameMsg").style.display = "block";
		return false;
	}else{
		document.getElementById("nameMsg").style.display = "none";
		return true;
	}
}

var checkEmail = function(){
	 let reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	 let written_email = document.getElementById("email").value;
	 if(written_email.length < 0){
		 document.getElementById("emailMsg").innerHTML = "필수 입력 사항입니다";
		 document.getElementById("emailMsg").style.display = "block";
		 return false;
	 }else if(!reg_email.test(written_email)){
		 document.getElementById("emailMsg").innerHTML = "이메일 형식이 맞지 않습니다";
		 document.getElementById("emailMsg").style.display = "block";
		 return false;
	 }else{
		 if(written_email.length > 50){
			 document.getElementById("emailMsg").innerHTML = "이메일이 너무 깁니다";
			 document.getElementById("emailMsg").style.display = "block";
			 return false;
		 }else{
			 document.getElementById("emailMsg").style.display = "none";
			 return true;
		 }
	 }
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


var checkPhone = function(){
	let reg_phno = /^[0-9]{2,3}[0-9]{3,4}[0-9]{4}$/;
	let phone = document.getElementById("phone").value;
	if(!reg_phno.test(phone)){
		document.getElementById("phoneMsg").style.color = "red";
		document.getElementById("phoneMsg").style.display = "block";
		return false;
	}else{
		document.getElementById("phoneMsg").style.display = "none";
		return true;
	}
}
var checkAll = function(){
    //document.getElementById("print").innerHTML = "가입";
	if(!checkName()){
		document.getElementById("name").focus();
	}else if(!checkEmail()){
		document.getElementById("email").focus();
	}else if(!checkPass()){
		document.getElementById("pass").focus();
	}else if(!checkRePass()){
		document.getElementById("re_pass").focus();
	}else{
		document.getElementById("register-form").submit();
	}
}
var checkLogin = function(){
    //document.getElementById("print").innerHTML = "가입";
	if(!checkEmail()){
		document.getElementById("email").focus();
	}else if(!checkPass()){
		document.getElementById("pass").focus();
	}else{
		document.getElementById("login-form").submit();
	}
}