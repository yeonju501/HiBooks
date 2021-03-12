var index=1;

		$(document).on("click","button", function (){
			       var j = $("button").index(this);  
				   $.ajax({
					   url: "../admin/showbook.do", 
					   type: "GET",
					   data: { b_seq: $("#select"+j).val()},
					   success: function(responseData){
						  //var jsObj = JSON.parse(responseData); //jQuery 버젼을 올려서 필요 없음
                          if(!responseData){
							  //alert("존재하지 않는 seq 임");
							  return false;
						  }
						  var html= "";
							html += '<div class="col-lg-3 col-md-6 col-12">';
							html += '<div class="product-wrapper mb-60">';
							html += '<div class="product-img">';
							html += '<input type="hidden" name="re_seq'+index+'" value="'+responseData.b_seq+'">';
							html += '<img alt="" src="'+responseData.b_img+'">';
							html += '</a>';
							html += '<div class="product-action-2">';
							html += '<a href="#" title="Add to Compare" class="action-plus-2 tooltip">';
							html += '<i class="zmdi zmdi-refresh"></i>';
							html += '</a>';
							html += ' <a href="#" title="Add to Wishlist" class="action-plus-2 tooltip">';
							html += '<i class="zmdi zmdi-favorite-outline"></i>';
							html += '</a>';
							html += '<a href="#" title="Quick View" data-target="#exampleModal" data-toggle="modal" class="action-plus-2 tooltip">';
							html += '<i class="zmdi zmdi-search"></i>';
							html += '</a>';
							html += ' <a href="#" title="Add To Cart" class="action-plus-2 tooltip">';
							html += ' <i class="zmdi zmdi-shopping-cart-plus"></i>';
							html += '</a>';
							html += '</div>';
							html += '<div class="rating-box">';
							html += '<a href="#" class="rated" title="1 star">';
							html += '<i class="far fa-star"> </i>';
							html += '</a>';
							html += '<a href="#" class="rated" title="2 star">';
							html += '<i class="far fa-star"> </i>';
							html += '</a>';
							html += '<a href="#" title="3 star">';
							html += '<i class="far fa-star"> </i>';
							html += '</a>';
							html += '<a href="#" title="4 star">';
							html += '<i class="far fa-star"> </i>';
							html += '</a>';
							html += '<a href="#" title="5 star">';
							html += '<i class="far fa-star"> </i>';
							html += '</a>';
							html += '</div>';
							html += '</div>';
							html += '<div class="product-content text-center">';
							html += '<h4>';
							html += '<a href="product-details.html">'+responseData.b_title+'</a>';
							html += '</h4>';
							html += '<div class="product-price-2">';
							html += '<div class="price-box">';
							html += '<ins>';
							html += '<span class="amount">';
							html += ' <span class="Price-currencySymbol"></span>'+responseData.b_price+'</span>';
							html += '</ins>';
							html += '</div>';
							html += '</div>';
							html += '</div>';
							html +=	'</div>';
							html +=	'</div>';
							html +=	'</div>';

						  if(index<9){
							  $("#Recommend-ajax").after(html);
							  index++;
						  }else{
							  alert("8권을 초과할 수 없습니다.");
							  
						  }
							  
			
					   }
				   });
			   });