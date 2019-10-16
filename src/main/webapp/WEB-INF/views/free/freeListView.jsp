<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>DEVELOFFICE</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" type="text/css" href="resources/assets/Semantic-UI-CSS-master/semantic.css"> 
<link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/> 
<script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
<script>
   jQuery(function($){
   	$("#myTable").DataTable({
   		responsive:true,
   		info: false,
   		 "language": {
	        "emptyTable": "글이 없습니다.",
	        "lengthMenu": "페이지당 _MENU_ 개씩 보기",
	        "info": "현재 _START_ - _END_ / _TOTAL_건",
	        "infoEmpty": "데이터 없음",
	        "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
	        "search": "검색: ",
	        "searchPlaceholder" :"키워드를 입력하세요.",
	        "zeroRecords": "일치하는 결과가 없습니다.",
	        "loadingRecords": "로딩중...",
	        "processing":     "잠시만 기다려 주세요...",
	        "paginate": {
	            "next": "다음",
	            "previous": "이전"
	        }
	    },
	    
	    
	  		/* columns: [
            {"data": "no"},
            {"data": "title"},
            {"data": "writer"}, 
            {"data": "count"}, 
            {"data": "date"}
            ],  */
	    
	    
   	});
   	
    $('#myTable_filter').prepend('<select id="select"></select>');
    $('#myTable > thead > tr').children().each(function (indexInArray, valueOfElement) { 
    	if(indexInArray == 1 || indexInArray == 2){
        $('#select').append('<option>'+valueOfElement.innerHTML+'</option>');
    	}
    });
    
    /* .dataTables_filter input */
    /* myInput */
    $('.dataTables_filter input').unbind().bind('keyup', function () {
    	var table = $('#myTable').DataTable();
        var colIndex = document.querySelector('#select').selectedIndex;
	    table.column(colIndex+1).search(this.value).draw();
    });  
 
  
   	
   	

   });
</script>


<script
  src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous">
</script>
<script src="resources/assets/Semantic-UI-CSS-master/semantic.js"></script>

<style>
	
	.contentWrap{
		float:left;
		width:100%;
		background: white;
		padding-top:30px;
		padding-bottom:30px;
		padding-left:50px;
		padding-right:50px;
		font-size:14px;
	}
	
	#myTable > tbody > tr{
		text-align:center;
	}
	
	.pagination {
    float: left;
	}
	

	
</style>


</head>
<body>
	<!-- WRAPPER -->
	<div id="wrapper">
	<!--  -->
	<jsp:include page="../common/navibar.jsp"/>
	<!--  -->
	
	<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<div class="contentWrap">
					
					<!-- 이 아래부터 내용 작성 -->
					
					
							<table id="myTable" class="table table-bordered">
					        <thead>
					           
					            <tr>
						      		<th style="text-align:center;"><i class="fas fa-list-ol"></i></th>
							  		<th id="title" style="text-align:center;">제목</th>
							  		<th data-orderable="false" id="writer" width="100" style="text-align:center;">작성자</th>
							  		<th data-orderable="false" style="text-align:center;" width="50">조회수</th>
							  		<th data-orderable="false" style="text-align:center;" width="100">작성일</th>
					    		</tr>
					        </thead>
					        <tbody>
					            <tr onclick="location.href='freeDetail.do';">
					            	<td>1</td>
					            	<td>청협 창립 54주년 기념 청소년지도자 및 청소년 표창후보자 추천</td>
					            	<td>관리자</td>
					            	<td>12</td>
					            	<td>2019-09-01</td>
					            </tr>
					             <tr>
					            	<td>2</td>
					            	<td>한국청소년단체협의회 회원단체 승격 신청 안내</td>
					            	<td>관리자</td>
					            	<td>34</td>
					            	<td>2019-09-01</td>
					            </tr>
					             <tr>
					            	<td>3</td>
					            	<td>2019 올림픽데이런 개최 안내(대한체육회)</td>
					            	<td>관리자</td>
					            	<td>51</td>
					            	<td>2019-09-01</td>
					            </tr>
					             <tr>
					            	<td>4</td>
					            	<td>[2019 전국청소년지도자대회] 청소년지도자! Vlog! 영상공모전</td>
					            	<td>관리자</td>
					            	<td>342</td>
					            	<td>2019-09-01</td>
					            </tr>
					             <tr>
					            	<td>5</td>
					            	<td>재)성남시청소년재단 직원 채용 공고</td>
					            	<td>관리자</td>
					            	<td>214</td>
					            	<td>2019-09-01</td>
					            </tr>
					             <tr>
					            	<td>6</td>
					            	<td>2019년 청소년푸른성장대상 수상 후보자 추천 공고 </td>
					            	<td>관리자</td>
					            	<td>24</td>
					            	<td>2019-09-01</td>
					            </tr>
					             <tr>
					            	<td>7</td>
					            	<td>2019년 올키즈스트라 상위관악단 단원 수시 모집</td>
					            	<td>관리자</td>
					            	<td>73</td>
					            	<td>2019-09-01</td>
					            </tr>
					             <tr>
					            	<td>8</td>
					            	<td>2019년 청소년 국제교류활동 UCC 공모전 안내</td>
					            	<td>관리자</td>
					            	<td>45</td>
					            	<td>2019-09-01</td>
					            </tr>
					             <tr>
					            	<td>9</td>
					            	<td>2019 올림픽데이런 개최 안내(대한체육회) </td>
					            	<td>관리자</td>
					            	<td>732</td>
					            	<td>2019-09-01</td>
					            </tr>
					             <tr>
					            	<td>10</td>
					            	<td>(미래학회) 청소년 미래캠프 청소년 참가 안내 </td>
					            	<td>관리자</td>
					            	<td></td>
					            	<td></td>
					            </tr>
					             <tr>
					            	<td>11</td>
					            	<td>제7회 대한민국 인성교육대상 수상 후보자 추천 공고</td>
					            	<td>관리자</td>
					            	<td></td>
					            	<td></td>
					            </tr>
					             <tr>
					            	<td>12</td>
					            	<td>서울</td>
					            	<td>관리자</td>
					            	<td></td>
					            	<td></td>
					            </tr>
					             <tr>
					            	<td>13</td>
					            	<td>서울</td>
					            	<td>관리자</td>
					            	<td></td>
					            	<td></td>
					            </tr>
					             <tr>
					            	<td>14</td>
					            	<td>서울</td>
					            	<td>관리자</td>
					            	<td></td>
					            	<td></td>
					            </tr>
					             <tr>
					            	<td>15</td>
					            	<td>서울</td>
					            	<td>관리자</td>
					            	<td></td>
					            	<td></td>
					            </tr>
					            
					        </tbody>
					       
					    </table>

					    <button onclick="location.href='insertFree.do';" class="btn btn-primary" style="float:right;">글쓰기</button>
					
					
					
					
					
					
					
					
					
					
					
					
					
					<!-- 이 위까지 내용작성 -->
					
					</div>
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
		
		<div class="clearfix"></div>
		

	<!--  -->
	</div>
	<!-- END WRAPPER -->
	
	
	<!-- Javascript -->
	<script src="resources/assets/vendor/jquery/jquery.min.js"></script>
	<script src="resources/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="resources/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="resources/assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="resources/assets/scripts/klorofil-common.js"></script>
	
	<!-- script 작성 -->
	<script>
	
	$(function(){
		
		$("#myTable td").mouseenter(function(){
			$(this).parent().css({"background" : "rgb(243, 230, 181)", "cursor" : "pointer"});
		}).mouseout(function(){
			$(this).parent().css("background", "white");
			
		}).click(function(){
			var num = $(this).parent().children().eq(0).text();
			
		/* 	<c:url value="bdetail.do" var="bdetail">
			<c:param name="bId" value="${b.bId}"/>
			</c:url> 
			<a href="${bdetail}">${b.bTitle}</a>
			 */
			
			 
			<%-- <% if(loginUser != null){ %> // 로그인한 회원만 이용가능하게
				location.href="<%= request.getContextPath() %>/detail.fr?fId=" + num;
			<%}else{ %>
				alert("로그인해야만 상세보기가 가능합니다!");
			<%}%> --%>
			
			
			
			
		});
		
	});
	
	
	</script>

</body>
</html>