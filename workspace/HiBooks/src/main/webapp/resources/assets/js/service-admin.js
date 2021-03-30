
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
							html += '&ensp;<input type="button" name="recomm" id="'+responseData.b_seq+'" class="delete" value="삭제" style="width: 50px;height: 30px;padding-left: 5px;">'
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
			if (document.getElementById("re_loc").value=="0"){
				alert("옵션을 선택해주세요");
				return false;
			}else if(document.getElementById("re_title").value==""){
				alert("제목을 입력해주세요");
				return false;
			}else if(document.getElementsByName("recomm").length < 8){
				alert("8권을 선택해주세요");
				return false;
			}else{
			var index = 0;
			sessionStorage.setItem("index", index);
			$("#formRecom").submit();
			}
		}
		

/*		$(document).on("click",".delete", function (){
			 $(this).parents("#recom").remove();
			 index--;
			 var recom = ;
			 alert(recom);
		   });*/
		

		function ajaxData() {
			$.ajax({
				url: 'chart.do',
				dataType: "json",
				type: 'post',
				success: function(list) {
					google.charts.load('current', {'packages':['corechart']});
					google.charts.setOnLoadCallback(drawChart);
					function drawChart() {
						var dataChart = [
							 ['카테고리', '권 수', { role: 'style' }],
				                ['소설', list[0].b_count,'Red'],
				                ['경영/경제', list[1].b_count,'Orange'],
				                ['자기계발', list[2].b_count,'Yellow'],
				                ['인문/사회/역사', list[3].b_count,'Green'],
				                ['에세이/시', list[4].b_count,'Blue']
				             
						];
						var data = google.visualization.arrayToDataTable(dataChart);
						var view = new google.visualization.DataView(data);
						 var options = {
								   title : '카테고리 별 도서 현황',
					               height :270,
					               width :700,
					               legend: { position: "top" },
					               isStacked: false,
					               tooltip:{textStyle : {fontSize:12}, showColorCode : true},
					               animation: { //차트가 뿌려질때 실행될 애니메이션 효과
					                 startup: true,
					                 duration: 1000,
					                 easing: 'linear' },
					                 vAxis: {
					                     viewWindow: {
					                         max: 2500,
					                         min: 1000
					                     }
					                 },
					               annotations: {
					                   textStyle: {
					                     fontSize: 15,
					                     bold: true,
					                     italic: true,
					                     color: '#871b47',
					                     auraColor: '#d799ae',
					                     opacity: 0.8
					                   }
					              }
					        };

						var chart4 = new google.visualization.PieChart(
								document.getElementById('columnchart'));
						chart4.draw(view, options);
					}
				}
			});
		}
		function ajaxDataCate2() {
			$.ajax({
				url: 'cate2Chart.do',
				dataType: "json",
				type: 'post',
				success: function(list) {
					var novelList = list[0];
					var economyList = list[1];
					var humanList = list[2];
					var adviceList = list[3];
					var poemList = list[4];
					google.charts.load('current', {'packages':['corechart']});
					
					google.charts.setOnLoadCallback(drawChart0);
					google.charts.setOnLoadCallback(drawChart1);
					google.charts.setOnLoadCallback(drawChart2);
					google.charts.setOnLoadCallback(drawChart3);
					google.charts.setOnLoadCallback(drawChart4);
					
					function drawChart0() {
						var dataChart = [
							 ['카테고리', '권 수', { role: 'style' }],
							 	[novelList[0].b_cate2, novelList[0].cnt,'Red'],
				                [novelList[1].b_cate2, novelList[1].cnt,'Orange'],
				                [novelList[2].b_cate2, novelList[2].cnt,'Yellow'],
				                [novelList[3].b_cate2, novelList[3].cnt,'Green'],
				                [novelList[4].b_cate2, novelList[4].cnt,'Blue'],
								[novelList[5].b_cate2, novelList[5].cnt,'Black']
						];
						var data = google.visualization.arrayToDataTable(dataChart);
						var view = new google.visualization.DataView(data);
						var options = {
								   title : '소설 하위 카테고리',
					               height :270,
					               width :355,
					               legend: { position: "top" },
					               isStacked: false,
					               tooltip:{textStyle : {fontSize:12}, showColorCode : true},
					               animation: { //차트가 뿌려질때 실행될 애니메이션 효과
					                 startup: true,
					                 duration: 1000,
					                 easing: 'linear' },
					                 vAxis: {
					                     viewWindow: {
					                         max: 1500,
					                         min: 10
					                     }
					                 },
					               annotations: {
					                   textStyle: {
					                     fontSize: 15,
					                     bold: true,
					                     italic: true,
					                     color: '#871b47',
					                     auraColor: '#d799ae',
					                     opacity: 0.8
					                   }
					              }
					        };

						var chart4 = new google.visualization.ColumnChart(
								document.getElementById('cate2-0'));
						chart4.draw(view, options);
					}
					function drawChart1() {
						var dataChart = [
							 ['카테고리', '권 수', { role: 'style' }],
							 	[economyList[0].b_cate2, economyList[0].cnt,'Red'],
				                [economyList[1].b_cate2, economyList[1].cnt,'Orange'],
				                [economyList[2].b_cate2, economyList[2].cnt,'Yellow'],
				                [economyList[3].b_cate2, economyList[3].cnt,'Green'],
				                [economyList[4].b_cate2, economyList[4].cnt,'Blue'],
								[economyList[5].b_cate2, economyList[5].cnt,'Black']
						];
						var data = google.visualization.arrayToDataTable(dataChart);
						var view = new google.visualization.DataView(data);
						var options = {
								   title : '경제/경영 하위 카테고리',
					               height :270,
					               width :355,
					               legend: { position: "top" },
					               isStacked: false,
					               tooltip:{textStyle : {fontSize:12}, showColorCode : true},
					               animation: { //차트가 뿌려질때 실행될 애니메이션 효과
					                 startup: true,
					                 duration: 1000,
					                 easing: 'linear' },
					                 vAxis: {
					                     viewWindow: {
					                         max: 1500,
					                         min: 10
					                     }
					                 },
					               annotations: {
					                   textStyle: {
					                     fontSize: 15,
					                     bold: true,
					                     italic: true,
					                     color: '#871b47',
					                     auraColor: '#d799ae',
					                     opacity: 0.8
					                   }
					              }
					        };

						var chart4 = new google.visualization.ColumnChart(
								document.getElementById('cate2-1'));
						chart4.draw(view, options);
					}
					function drawChart2() {
						var dataChart = [
							 ['카테고리', '권 수', { role: 'style' }],
							 	[humanList[0].b_cate2, humanList[0].cnt,'Red'],
				                [humanList[1].b_cate2, humanList[1].cnt,'Orange'],
				                [humanList[2].b_cate2, humanList[2].cnt,'Yellow'],
				                [humanList[3].b_cate2, humanList[3].cnt,'Green'],
				                [humanList[4].b_cate2, humanList[4].cnt,'Blue'],
								[humanList[5].b_cate2, humanList[5].cnt,'Black']
						];
						var data = google.visualization.arrayToDataTable(dataChart);
						var view = new google.visualization.DataView(data);
						var options = {
								   title : '인문/사회 하위 카테고리',
					               height :270,
					               width :355,
					               legend: { position: "top" },
					               isStacked: false,
					               tooltip:{textStyle : {fontSize:12}, showColorCode : true},
					               animation: { //차트가 뿌려질때 실행될 애니메이션 효과
					                 startup: true,
					                 duration: 1000,
					                 easing: 'linear' },
					                 vAxis: {
					                     viewWindow: {
					                         max: 1500,
					                         min: 10
					                     }
					                 },
					               annotations: {
					                   textStyle: {
					                     fontSize: 15,
					                     bold: true,
					                     italic: true,
					                     color: '#871b47',
					                     auraColor: '#d799ae',
					                     opacity: 0.8
					                   }
					              }
					        };

						var chart4 = new google.visualization.ColumnChart(
								document.getElementById('cate2-2'));
						chart4.draw(view, options);
					}
					function drawChart3() {
						var dataChart = [
							 ['카테고리', '권 수', { role: 'style' }],
							 	[adviceList[0].b_cate2, adviceList[0].cnt,'Red'],
				                [adviceList[1].b_cate2, adviceList[1].cnt,'Orange'],
				                [adviceList[2].b_cate2, adviceList[2].cnt,'Yellow'],
				                [adviceList[3].b_cate2, adviceList[3].cnt,'Green'],
				                [adviceList[4].b_cate2, adviceList[4].cnt,'Blue'],
								[adviceList[5].b_cate2, adviceList[5].cnt,'Black']
						];
						var data = google.visualization.arrayToDataTable(dataChart);
						var view = new google.visualization.DataView(data);
						var options = {
								   title : '자기계발 하위 카테고리',
					               height :270,
					               width :355,
					               legend: { position: "top" },
					               isStacked: false,
					               tooltip:{textStyle : {fontSize:12}, showColorCode : true},
					               animation: { //차트가 뿌려질때 실행될 애니메이션 효과
					                 startup: true,
					                 duration: 1000,
					                 easing: 'linear' },
					                 vAxis: {
					                     viewWindow: {
					                         max: 1500,
					                         min: 10
					                     }
					                 },
					               annotations: {
					                   textStyle: {
					                     fontSize: 15,
					                     bold: true,
					                     italic: true,
					                     color: '#871b47',
					                     auraColor: '#d799ae',
					                     opacity: 0.8
					                   }
					              }
					        };

						var chart4 = new google.visualization.ColumnChart(
								document.getElementById('cate2-3'));
						chart4.draw(view, options);
					}
					function drawChart4() {
						var dataChart = [
							 ['카테고리', '권 수', { role: 'style' }],
							 	[poemList[0].b_cate2, poemList[0].cnt,'Red'],
				                [poemList[1].b_cate2, poemList[1].cnt,'Orange'],
				                [poemList[2].b_cate2, poemList[2].cnt,'Yellow'],
				                [poemList[3].b_cate2, poemList[3].cnt,'Green'],
				                [poemList[4].b_cate2, poemList[4].cnt,'Blue'],
								[poemList[5].b_cate2, poemList[5].cnt,'Black']
						];
						var data = google.visualization.arrayToDataTable(dataChart);
						var view = new google.visualization.DataView(data);
						var options = {
								   title : '에세이/시 하위 카테고리',
					               height :270,
					               width :355,
					               legend: { position: "top" },
					               isStacked: false,
					               tooltip:{textStyle : {fontSize:12}, showColorCode : true},
					               animation: { //차트가 뿌려질때 실행될 애니메이션 효과
					                 startup: true,
					                 duration: 1000,
					                 easing: 'linear' },
					                 vAxis: {
					                     viewWindow: {
					                         max: 1500,
					                         min: 10
					                     }
					                 },
					               annotations: {
					                   textStyle: {
					                     fontSize: 15,
					                     bold: true,
					                     italic: true,
					                     color: '#871b47',
					                     auraColor: '#d799ae',
					                     opacity: 0.8
					                   }
					              }
					        };

						var chart4 = new google.visualization.ColumnChart(
								document.getElementById('cate2-4'));
						chart4.draw(view, options);
					}
				}
			});
		}