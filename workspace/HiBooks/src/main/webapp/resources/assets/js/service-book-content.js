//안되는 이유를 알고 싶다.
//function addWishList(b_itemId, m_email){
//	alert("hi");
//	$.ajax({
//		url : "../wishList/addItem.do",
//		type : "Get",
//		data : {b_itemId : b_itemId, m_email : m_email},
//		dataType : "text",
//		success : function(selectWish){
//			let html = '';
//			html += '<span>';
//			if(selectWish =="selected"){
//				html += '<i class="ion-ios-heart"></i>';
//			}else{
//				html += '<i class="ion-ios-heart-outline"></i>';
//			}
//			html += '</span>';
//			$("#in-wish-list").html(html);
//			if(selectWish=="selected"){
//				if(confirm("위시리스트 페이지로 이동하시겠습니까?")==true){
//					location.href = "../wishList/moveWishPage.do";
//				}else{
//					return false;
//				}
//			}
//		},
//		error : function(a,b,c){
//			alert("실패 :" + a.responseText);
//			alert("실패 :" + c);
//		}
//	});
//}

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
			html += '<span>';
			if(selectWish == "selected"){
				html += '<i class="ion-ios-heart" style="color:red"></i>';
			}else{
				html += '<i class="ion-ios-heart-outline"></i>';
			}
			html += '</span>';
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
//대댓글 입력 폼 보이게 하기(대댓글 일단 보류)
$(document).on("click",".re-reply[seq]",function(){
	let bSeq = $(this).attr("seq");
	$("div[seq="+bSeq+"]").toggleClass("show");
});

//좋아요
$(document).on("click","#re-like-it",function(){
	let seq = $(this).attr("seq");
	let review_Writer = $("#whose-review[seq="+seq+"]").val();
	let loginUser = $("#login-user-for-js").val();
	if(loginUser == review_Writer){
		alert("자기 리뷰에 좋아요 금지");
		return false;
	}
	let b_itemId = $("#itemId").val();
	$.ajax({
		url : "re-like.do",
		type : "Get",
		data : {br_seq: seq, m_email: loginUser, itemId: b_itemId},
		dataType : "json",
		success : function(result){
			setReviewListHtml(result);
		},
		error : function(a,b,c){
			alert("같은 댓글에 좋아요는 한번만!");
		} 
	});
});

//댓글 수정 버튼 수정 폼 보이기
$(document).on("click", "#review-update-form",function(){
	$("#your-comment").removeAttr("readonly");
	$(this).attr("type","hidden");
	$("#review-update-submit").attr("type","button");
});
//댓글 수정
$(document).on("click","#review-update-submit",function(){
	if($("#your-rate").val().length == 0){
		alert("별점을 입력해주세요");
		return false;
	}
	if($("#your-comment").val().trim().length == 0){
		alert("내용을 입력해주세요");
		$("#your-comment").val("");
		return false;
	}
	let token = $("meta[name='_csrf']").attr("content");
	let header = $("meta[name='_csrf_header']").attr("content");
	let loginUser = $("#login-user-for-js").val();
	let formData = $("#review").serialize();
	$.ajax({
		url : "re-update.do",
		type : "Post",
		data : formData,
		dataType : "json",
//		beforeSend :function(xhr) {
//        	xhr.setRequestHeader(header,token);
//        },
		success : function(result){
			for(var review in result.reviewList){
				if(review.m_email == loginUser){
					document.getElementById("your-rate").value = review.br_rate;
					document.getElementById("your-comment").value = review.br_comment;
				}
			}
			$("#review-delete").attr("type","button");
			$("#review-update-form").attr("type","button");
			$("#review-update-submit").attr("type","hidden");
			$("#your-comment").attr("readonly","true");
			setReviewListHtml(result);
		},
		error : function(a,b,c){
			alert("실패 :" + a.responseText);
		}
	});
});
//댓글 삭제
$(document).on("click","#review-delete",function(){
	let b_itemId = $("#itemId").val();
	let m_email = $("#login-check").val();
	$.ajax({
		url : "re-delete.do",
		type : "Get",
		data : {b_itemId : b_itemId, m_email : m_email},
		dataType : "json",
		success : function(result){
			document.getElementById("your-rate").value = 0;
			//$("#your-rate").val(0);
			$("#review-write").attr("type","button");
			$("#review-delete").attr("type","hidden");
			$("#review-update-form").attr("type","hidden");
			$("#review-update-submit").attr("type","hidden");
			$("#your-comment").removeAttr("readonly");
			document.getElementById("your-comment").value = "";
			//$("#your-comment").val("");
			setReviewListHtml(result);
		},
		error : function(a,b,c){
			alert("실패 :" + a.responseText);
		}	
	});
});
//댓글 더보기 버튼
$(document).on("click","button.more_review_button",function(){
	
	let rcp = Number($("#hidden-rcp").text()) + 1 ;
	let rps = Number($("#hidden-rps").text());
	let itemId = $("#itemId").val();
	//alert(rcp +" "+ rps +" "+ itemId);
	let reviewVo = { rcp : rcp, rps : rps, itemId : itemId};
	//alert(reviewVo.rcp +" "+ reviewVo.rps +" "+ reviewVo.itemId);
	
	$.ajax({
		url : "review.do",
		type : "Get",
		data : { rcp : rcp, rps : rps, itemId : itemId},
		dataType : "json",
		success : function(result){
			//alert("결과값 : "+ result);
			setReviewListHtml(result);
		},
		error : function(a,b,c){
			alert("실패 :" + a.responseText);
		}
	});
});

//댓글 작성
$(document).on("click","#review-write",function(e){
	if($("#login-check").val().length == 0){
		let goLogin = confirm("로그인이 필요한 서비스 입니다");
		if(goLogin){
			location.href="../member/login.do";
			return false;
		}else{
			$("#your-rate").val("");
			$("#your-comment").text("");
			return false;
		}
	}
	if($("#your-rate").val().length == 0){
		alert("별점을 입력해주세요");
		return false;
	}
	if($("#your-comment").val().trim().length == 0){
		alert("내용을 입력해주세요");
		$("#your-comment").val("");
		return false;
	}
	let token = $("meta[name='_csrf']").attr("content");
	let header = $("meta[name='_csrf_header']").attr("content");
	let loginUserRate = $("#your-rate").val();
	let formData = $("#review").serialize();
	
	$.ajax({
		url:"review.do",
		type:"Post",
		data: formData,
		dataType:"json",
		success: function(result){
			//alert("success: "+ result);
			setReviewListHtml(result);
			$("#your-rate").val(loginUserRate);
			$("#review-write").attr("type","hidden");
			$("#review-delete").attr("type","button");
			$("#review-update-form").attr("type","button");
			$("#your-comment").attr("readonly","true");
		},
		error: function(a,b,c){
			alert("XMLHttpRequest: "+ a.responseText);
			alert("예외 원인: "+ c);
		}
	});
});



$(function(){
	// 평점, 별 클릭 시 점수값 입력
	$("#star1").click(function(){
        $("#star1").attr("class","fa fa-star");
        $("#star2").attr("class","far fa-star");
        $("#star3").attr("class","far fa-star");
        $("#star4").attr("class","far fa-star");
        $("#star5").attr("class","far fa-star");
        $("#your-rate").attr("value",1);
    });
    $("#star2").click(function(){
        $("#star1").attr("class","fa fa-star");
        $("#star2").attr("class","fa fa-star");
        $("#star3").attr("class","far fa-star");
        $("#star4").attr("class","far fa-star");
        $("#star5").attr("class","far fa-star");
        $("#your-rate").attr("value",2);
    });
    $("#star3").click(function(){
        $("#star1").attr("class","fa fa-star");
        $("#star2").attr("class","fa fa-star");
        $("#star3").attr("class","fa fa-star");
        $("#star4").attr("class","far fa-star");
        $("#star5").attr("class","far fa-star");
        $("#your-rate").attr("value",3);
    });
    $("#star4").click(function(){
        $("#star1").attr("class","fa fa-star");
        $("#star2").attr("class","fa fa-star");
        $("#star3").attr("class","fa fa-star");
        $("#star4").attr("class","fa fa-star");
        $("#star5").attr("class","far fa-star");
        $("#your-rate").attr("value",4);
    });
    $("#star5").click(function(){
        $("#star1").attr("class","fa fa-star");
        $("#star2").attr("class","fa fa-star");
        $("#star3").attr("class","fa fa-star");
        $("#star4").attr("class","fa fa-star");
        $("#star5").attr("class","fa fa-star");
        $("#your-rate").attr("value",5);
    });
    
    
});

//ajax로 바뀌는 부분 (댓글리스팅) html
var setReviewListHtml = function(result){
	let html = "";
	html += "<h2>"+ result.reviewCnt + " 개의 리뷰가 있습니다</h2>";
	html += '<ul>';
	let list = result.reviewList;
	if(list.length != 0){	
		for(var i=0; i<list.length; i++){
			html += '<li>';
			html += '<div class="product-comment">';
			html += '<div class="col-md-12">';
			html += '<div class="row">';
			html += '<div class="col-lg-2">';
			html += '<div class="product-reviews">';
			//html += result[i].br_rate;
			for(var k=1; k<6; k++){
				if(k <= list[i].br_rate){
					html += '<i class="fa fa-star" aria-hidden="true"></i>';
				}else{
					html += '<i class="far fa-star" aria-hidden="true"></i>';
				}
			}			
			html += '</div>';
			html += '<strong>'+list[i].m_email+'</strong>';//
			html += '<p class="meta"><span>'+list[i].br_rDate+'</span></p>';//
			html += '</div>';
			html += '<div class="col-lg-10">';
			html += '<div class="product-comment-content">';
			html += '<div class="description"><p>'+list[i].br_comment+'</p></div> ';//
			html += '<div class="reply-and-like">';
			//html += '<button class="re-reply" seq='+list[i].br_seq+'>댓글 </button>';
			html += '<input type="hidden" id="whose-review" seq="'+list[i].br_seq+'" value="'+list[i].m_email+'">';
			html += '<button id="re-like-it" seq="'+ list[i].br_seq +'">좋아요! &nbsp; '+ list[i].br_like +'</button>';
			html += '</div>';
			html += '<div class="input-element re-reply-input" seq='+list[i].br_seq+'>';
			html += '<div class="comment-form-comment">';
			html += '<textarea name="br_comment" cols="40" rows="8"></textarea>';
			html += '</div>';
			html += '<div class="comment-submit">';
			html += '<input type="submit" class="submit" id="re-submit" value="댓글 작성">';
			html += '<input type="button" class="submit" id="re-del" value="삭제">';
			html += '<input type="button" class="submit" id="re-up" value="수정">';
			html += '</div>';
			html += '</div>';
			html += '</div>';
			html += '</div>';
			html += '</div>';
			html += '</div>';
			html += '</div>';
			html += '</li>';
		}
		if(result.totalPage > result.rcp){
			html += '<li>';
			html += '<button type="button" class="more_review_button" id="get-more-review" >'
			html += '<span style="display:none" id="hidden-rcp">'+result.rcp+'</span>';
			html += '<span style="display:none" id="hidden-rps">'+result.rps+'</span>';
			html += '<span class="more_num js_more_num">더보기</span>';
			html += '</button></li>';
		}
	}
	html +=	'</ul>';
	
	$("#review-ajax").html(html);
	$(".product-review-tab .product-reviews >i").css("margin-right","2px");
}