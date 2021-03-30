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
	            .append("<a>" + '<div class="row"> <div class="col-5">'+ item.value +'</div> <div class="col-4" style="text-align:right;">'+ item.label+ '</div><div class="col-3" style="text-align:right;">'+ item.pub+"</div></div></a>")
	            .appendTo(ul);
	};
	
			
	//input 태그 id가 name
    $( "#keyword" ).autocomplete({
    	source : function( request, response ) {
    		var token = $("meta[name='_csrf']").attr("content");
    		var header = $("meta[name='_csrf_header']").attr("content"); 
    		$.ajax({
                    type: 'post',
                    url: "../product/getauto.do",
                    dataType: "json",
                    data: { "keyword" : $("#keyword").val()},
                    success: function(data) {
                        //서버에서 json 데이터 response 후 목록에 뿌려주기 위함
                        response(
                            $.map(data, function(item) {
                            	if(item.b_writer==null){
									item.b_writer="";
								}else if(item.b_publisher==null){
									item.b_publisher="";
								}
										 return {
												value: item.b_title,
												label: item.b_writer,
												pub: item.b_publisher
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
        autoFocus: true
    });
})