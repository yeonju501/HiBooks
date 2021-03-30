/**
 * 
 */
$(document).on("click","#in-wish-list",function(){
	let loginUser = $("#login-user-for-js").val();
	let b_itemId = $("#itemId").val();
	if(loginUser == undefined){
		alert("로그인이 필요한 서비스입니다.");
		location.href = "../member/login.do";
		return false;
	}
	$.ajax({
		url : "../wishList/addItem.do",
		type : "Get",
		data : {b_itemId : b_itemId, m_email : loginUser},
		dataType : "text",
		success : function(selectWish){
			//alert(selectWish);
			let html = '';
			if(selectWish == "selected"){
				html += '<i class="zmdi zmdi-favorite" style="color:red"></i>';
			}else{
				html += '<i class="zmdi zmdi-favorite-outline"></i>';
			}
			$("#in-wish-list").html(html);
			if(selectWish == "selected" ){
				if(confirm("위시리스트 페이지로 이동하시겠습니까?")==true){
					location.href = "../wishList/moveWishPage.do";
				}else{
					return false;
				}
			}
		},
		error : function(a,b,c){
			alert("실패 :" + a.responseText);
			alert("실패 :" + c);
		}
	});
});