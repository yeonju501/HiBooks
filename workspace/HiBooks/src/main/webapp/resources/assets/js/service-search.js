/**
 *  메인페이지의 검색창 관련 자바스크립트
 */

function check()
	{
	var key=document.searchinput.keyword.value;
		      if(key == "")
			  {
			     alert("검색어를 입력해주세요.");
				 return false;
			  }
		   document.searchinput.submit();
	}

$(function(){
	$("#searchinput").on("click",function(){
		check();
	});
});

$(function(){
	
	$.ui.autocomplete.prototype._renderItem = function (ul, item) {
	    item.label = item.label.replace(new RegExp("(?![^&;]+;)(?!<[^<>]*)(" + $.ui.autocomplete.escapeRegex(this.term) + ")(?![^<>]*>)(?![^&;]+;)", "gi"), "<strong>$1</strong>");
	    return $("<li></li>")
	            .data("item.autocomplete", item)
	            .append("<a>" + item.label + "</a>")
	            .appendTo(ul);
	};
	
	
			
	//input 태그 id가 name
    $( "#keyword" ).autocomplete({
        
    	source : function( request, response ) {
    		var token = $("meta[name='_csrf']").attr("content");
    		var header = $("meta[name='_csrf_header']").attr("content"); 
    		$.ajax({
                    type: 'post',
                    url: "product/getauto.do",
//                    beforeSend :function(xhr) {
//                    	xhr.setRequestHeader(header,token);
//                    },
                    dataType: "json",
                    //request.term = $("#autocomplete").val()
                    data: { "keyword" : $("#keyword").val()},
                    //select * from BOARD where writer like %?%;
                    beforeSend :function(xhr) {
                        xhr.setRequestHeader(header,token);
                     },
                    success: function(data) {
                        //서버에서 json 데이터 response 후 목록에 뿌려주기 위함
                        response(
                            $.map(data, function(item) {
                            	console.log(item);
										 return {
												label: item.b_title,
												value: item.b_title
										 }		                               
                            })
                        );
                    },
                    error: function(a,b,c){
        				alert("XMLHttpRequest: "+ a.responseText);
        				alert("예외 원인: "+ c);
        			}
               });
            },
        //조회를 위한 최소글자수
        minLength: 2,
    });
})