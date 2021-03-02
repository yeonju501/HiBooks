
//대댓글 입력 폼 보이게 하기
$(document).on("click",".re-reply[seq]",function(){
	let bSeq = $(this).attr("seq");
	$("div[seq="+bSeq+"]").toggleClass("show");
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

$(function(){
	// 댓글 작성
	$("#review").on("submit",function(e){
		e.preventDefault();	// 원래 submit을 했을 때 동기형식으로 넘어가잖아. 그걸 막아주는 역할이야! 대신 밑에 있는 로직을 실행하겠다는 거지.
		let token = $("meta[name='_csrf']").attr("content");
		let header = $("meta[name='_csrf_header']").attr("content");
		let formData = $(this).serialize();
		$.ajax({
			url:"review.do",
			type:"Post",
			data: formData,
			dataType:"json",
			beforeSend :function(xhr) {
            	xhr.setRequestHeader(header,token);
            },
			success: function(result){
				//alert("success: "+ result);
				setReviewListHtml(result);
				
			},
			error: function(a,b,c){
				alert("XMLHttpRequest: "+ a.responseText);
				alert("예외 원인: "+ c);
			}
		});
		
		
	});
	
	
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
//ajax로 바뀌는 부분
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
			html += '<i class="fa fa-star" aria-hidden="true"></i>';
			html += '<i class="fa fa-star" aria-hidden="true"></i>';
			html += '<i class="fa fa-star" aria-hidden="true"></i>';
			html += '<i class="fa fa-star-half-o" aria-hidden="true"></i>';
			html += '<i class="fa fa-star-o" aria-hidden="true"></i>';
			html += '</div>';
			html += '<strong>'+list[i].m_email+'</strong>';//
			html += '<p class="meta"><span>'+list[i].br_rDate+'</span></p>';//
			html += '</div>';
			html += '<div class="col-lg-10">';
			html += '<div class="product-comment-content">';
			html += '<div class="description"><p>'+list[i].br_comment+'</p></div> ';//
			html += '<div class="reply-and-like">';
			html += '<button class="re-reply" seq='+list[i].br_seq+'>댓글 </button>';
			html += '<button id="re-like-it">좋아요!</button>';
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