
		$(document).on("click",".selectRecom", function (){
			       var j = $(".selectRecom").index(this) + 1;  
				   $.ajax({
					   url: "../admin/showbook.do", 
					   type: "GET",
					   data: { b_seq: $("#select"+j).attr("name")},
					   success: function(responseData){
						 // alert(typeof responseData+responseData);
                          if(responseData==""){
							  alert("8권을 초과할 수 없습니다");
							  return false;
						  }else if(responseData.b_itemId=="repetition"){
							  alert("이미 선택된 책입니다");
							  return false;
						  }
                          var index = 1;
                          if(sessionStorage.getItem("index")==null){
                        	 index = 1;
                        	 sessionStorage.setItem("index", index);
                          }else{
                        	 index = sessionStorage.getItem("index");
                          }
						  	var html= "";
							html += '<div class="col-lg-3 col-md-6 col-2" id="recom">';
							html += '<div class="product-wrapper mb-60">';
							html += '<div class="product-img">';
							html += '<input type="hidden" class="book" id="recombook" name="re_seq'+index+'" value="'+responseData.b_seq+'">';
							html += '<img alt="" src="'+responseData.b_img+'">';
							html += '<div class="product-content text-center">';
							html += '<h4>';
							html += '<a href="product-details.html">'+responseData.b_title+'</a>';
							html += '</h4>';
							html += '<div class="product-price-2">';
							html += '<div class="price-box">';
							html += '&ensp;<input type="button" id="'+responseData.b_seq+'" class="delete" value="삭제" style="width: 50px;height: 30px;padding-left: 5px;">'
							html += '</div>';
							html += '</div>';
							html += '</div>';
							html +=	'</div>';
							html +=	'</div>';
							html +=	'</div>';

						 
							$("#Recommend-ajax").append(html);
							index++;
							sessionStorage.setItem("index", index);
										  
			
					   }
				   });
			   });
		
		function recomSubmit(){
			var index = 0;
			sessionStorage.setItem("index", index);
			$("#formRecom").submit();
			
		}
		

/*		$(document).on("click",".delete", function (){
			 $(this).parents("#recom").remove();
			 index--;
			 var recom = ;
			 alert(recom);
		   });*/
		

		