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
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->


<!-- 풀캘린더 -->
<script src="resources/calendar/jquery.min.js"></script>

<script>
	var j = jQuery.noConflict();
</script>

<link rel="stylesheet" href="resources/calendar/main.css">
<link rel="stylesheet" href="resources/calendar/fullcalendar.css">
<link rel="stylesheet" href="resources/calendar/fullcalendar.min.css">
<script src="resources/calendar/moment.min.js"></script>  
<script src="resources/calendar/fullcalendar.min.js"></script>
<script src="resources/calendar/ko.js"></script>


<style>
	.contentWrap{
		float:left;
		width:75%;
		background: white;
		padding-top:30px;
		padding-bottom:30px;
		padding-left:50px;
		padding-right:50px;
		font-size:14px;
	}
	#calendar {
		max-width: 900px;
		margin: 0 auto;
		font-size: 0.8em;
	}
	.panel .panel-heading {
	    position: relative;
	}
	select.filter {
	    width: 500px !important;
	}
	.ui-widget.ui-widget-content {
		min-height:500px;
	}
	.ui-dialog-content ui-widget-content {
	    overflow: hidden;
	}
	#eventModal{
		overflow: hidden;
	}
	#ui-datepicker-div{
		min-height:100px;
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
			
			
				<!-- 풀캘린더 불러오기 -->	
				<div class="wrap">
					 <div id="loading"></div>
					<div id="calendar"></div>
				</div>
			
			
				<!-- 일정 추가 MODAL -->
		        <div class="" tabindex="-1" role="dialog" id="eventModal" class="show" style="display:none;">
		            <div class="" role="document">
		                <div class="">
		                
		                    <div class="">
								<br>
								
		                        <div class="row">
		                            <div class="col-xs-12" style="margin-bottom:10px;">
		                                <label class="col-xs-4" for="edit-allDay"><b>하루종일</b></label>
		                                <input class='allDayNewEvent' id="allDay" name="allDay" type="checkbox">
		                            </div>
		                        </div>
		
		                        <div class="row">
		                            <div class="col-xs-12">
		                                <label class="col-xs-4" for="edit-title"><b>일정명</b></label>
		                                <input class="inputModal" type="text" id="edit-title"
		                                    name="stitle" required="required">
		                            </div>
		                        </div>
		                        <div class="row">
		                            <div class="col-xs-12">
		                                <label class="col-xs-4" for="edit-start"><b>시작</b></label>
		                                <input class="inputModal datepicker" type="text" name="startDate" id="edit-start">
		                            </div>
		                        </div>
		                        
		                        <div class="after" style="padding-bottom:10px;">
									<label for="" style="margin-left:14px;"><b>시작 시간</b></label>
										<select id="start" class="select-box" name="startTime"
											style="width:367px; margin-left:110px;">
											<option>시간을 선택하세요</option>
											<option value="09:00">오전 09:00</option>
											<option value="09:30">오전 09:30</option>
											<option value="10:00">오전 10:00</option>
											<option value="10:30">오전 10:30</option>
											<option value="11:00">오전 11:00</option>
											<option value="11:30">오전 11:30</option>
											<option value="12:00">오후 12:00</option>
											<option value="12:30">오후 12:30</option>
											<option value="13:00">오후 01:00</option>
											<option value="13:30">오후 01:30</option>
											<option value="14:00">오후 02:00</option>
											<option value="14:30">오후 02:30</option>
											<option value="15:00">오후 03:00</option>
											<option value="15:30">오후 03:30</option>
											<option value="16:00">오후 04:00</option>
											<option value="16:30">오후 04:30</option>
											<option value="17:00">오후 05:00</option>
											<option value="17:30">오후 05:30</option>
										</select>
									</div>
		                        
		                        <div class="row">
		                            <div class="col-xs-12">
		                                <label class="col-xs-4" for="edit-end"><b>끝</b></label>
		                                <input class="inputModal datepicker" type="text" name="endDate" id="edit-end">
		                            </div>
		                        </div>
		                        
		                        <div class="after" style="padding-bottom:10px;">
									<label for="" style="margin-left:14px;"><b>끝 시간</b></label>
										
										<select id="end" class="select-box" name="endTime"
											style="width:367px; margin-left:124px;">
											<option>시간을 선택하세요</option>
											<option value="09:30">오전 09:30</option>
											<option value="10:00">오전 10:00</option>
											<option value="10:30">오전 10:30</option>
											<option value="11:00">오전 11:00</option>
											<option value="11:30">오전 11:30</option>
											<option value="12:00">오후 12:00</option>
											<option value="12:30">오후 12:30</option>
											<option value="13:00">오후 01:00</option>
											<option value="13:30">오후 01:30</option>
											<option value="14:00">오후 02:00</option>
											<option value="14:30">오후 02:30</option>
											<option value="15:00">오후 03:00</option>
											<option value="15:30">오후 03:30</option>
											<option value="16:00">오후 04:00</option>
											<option value="16:30">오후 04:30</option>
											<option value="17:00">오후 05:00</option>
											<option value="17:30">오후 05:30</option>
											<option value="18:00">오후 06:00</option>
										</select>
									</div>
		                        
		                        <script>
		                        	$(function(){
		                        		$('.datetimepicker').datetimepicker({
		                        	        lang:'ko',
		                        	        format:'Y-m-d H:i'
		                        	    });
		                        	});

		                        </script>
		                        
		                        <div class="row">
		                            <div class="col-xs-12">
		                                <label class="col-xs-4" for="edit-type"><b>구분</b></label>
		                                <select class="inputModal" type="text" name="stype" id="edit-type" style="width:367px;;">
		                                	<option>일정 종류를 선택하세요</option>
		                                    <option value="휴가">휴가</option>
		                                    <option value="회의">회의</option>
		                                    <option value="외근">외근</option>
		                                    <option value="출장">출장</option>
		                                </select>
		                            </div>
		                        </div>
		                        <div class="row">
		                            <div class="col-xs-12">
		                                <label class="col-xs-4" for="edit-color"><b>색상</b></label>
		                                <select class="inputModal" name="backColor" id="edit-color" style="width:367px;">
		                                	<option>색상을 선택하세요</option>
		                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
		                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
		                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
		                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
		                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
		                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
		                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
		                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
		                                    <option value="#495057" style="color:#495057;">검정색</option>
		                                </select>
		                            </div>
		                        </div>
		                        <div class="row">
		                            <div class="col-xs-12">
		                                <label class="col-xs-4" for="edit-desc"><b>설명</b></label>
		                                <textarea rows="4" cols="50" class="inputModal" name="scontent"
		                                    id="edit-desc" style="resize:none;"></textarea>
		                            </div>
		                        </div>
		                    </div>
		                    <hr>
		                    <div class="modalBtnContainer-modifyEvent" style="text-align:right; padding-right:10px;">
		                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
		                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
		                        <button type="button" id="btn-default" class="btn btn-default">닫기</button>
		                    </div>
		                </div><!-- /.modal-content -->
		            </div><!-- /.modal-dialog -->
		        </div><!-- /.modal -->
				<hr>	
			
				<div id="searchArea" align="right">
					<form action="search.do">
						<select id="searchCondition" name="condition" style="height:32px; border:1px solid lightgray" >
						    <option>------</option>
						    <option value="writer">작성자</option>
						    <option value="type">유형</option>
						    <option value="title">제목</option>
						    <option value="content">내용</option>
						</select>
						<div class="ui input">
							<input type="search" name="search" value="${ search }" placeholder="Search..." style="height:32px;">
							<i class="circular search link"></i>
						</div>	         
						<button type="submit" onclick="return validate();" style="color:#3287B2">검색하기</button>
					</form>
		       </div>
	       
		       <script>
			       function validate(){
			           if($("option:selected").val() == "------"){
			              alertify.alert("DEVELOFFICE", "검색 조건을 체크해주세요");
			           return false;
			           }
			        }
		       </script>
		       
		       <div align="left">
					<b style="color: #505363">팀 일정</b>
					<input type="radio" name="splan" value="team" style="margin-bottom:7px;">&nbsp;
					<b style="color: #505363">전체 일정</b>
					<input type="radio" name="splan" value="all" style="margin-bottom:7px;">
				</div>			
						
				<table class="ui selectable celled table">
				<colgroup>
					<col style="width:10%;">
					<col style="width:15%;">
					<col style="width:40%;">
					<col style="width:15%;">
					<col style="width:20%;">
				</colgroup>
					<thead>
						<tr>
							<th style="color: #676767;">번호</th>
							<th style="color: #676767;">작성자</th>
							<th style="color: #676767;">제목</th>
							<th style="color: #676767;">유형</th>
							<th class="aa" style="color: #676767;">작성일</th>
						</tr>
					</thead>
					<tbody class="select_subject">
					<c:forEach items="${ list }" var="s">
						<tr>
							<td class="sNo">${ s.sno }</td>
							<td class="sName">${ loginUser.empName }</td>
							<td class="sTitle">${ s.stitle }</td>
							<td class="sType">${ s.stype }</td>
							
							<td class="sDate aa">${ s.createDate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
	
			<div id="pagingArea" align="center">
	 			<!-- [이전] -->
				<c:if test="${ pi.currentPage == 1 }">
					이전&nbsp;
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:if test="${ !empty s }">
						<c:url var="mlistBack" value="search2.do">
							<c:param name="currentPage" value="${ pi.currentPage-1 }"/>
							<c:param name="condition" value="${ condition }"/>
							<c:param name="search" value="${ search }"/>
							<c:param name="mailFrom" value="${ m.mailFrom }"/>
							<c:param name="mailTo" value="${ m.mailTo }"/>
						</c:url>
					</c:if>
					<c:if test="${ empty s }">
						<c:url var="slistBack" value="teamScheduleList.do">
							<c:param name="currentPage" value="${ pi.currentPage-1 }"/>
						</c:url>
					</c:if>
					<a href="${ slistBack }">이전</a>
				 </c:if>
	         
		         <!-- [번호들] -->
		         <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
		            <c:if test="${ p eq pi.currentPage }">
		               <font color="#3287B2" size="3">${ p }</font>
		            </c:if>
		            <c:if test="${ p ne pi.currentPage }">
		               <c:if test="${ !empty m }"> <!-- 검색결과 있으면 -->
		                  <c:url var="slistPage" value="search2.do">
		                     <c:param name="currentPage" value="${ p }"/>
		                     <c:param name="condition" value="${ condition }"/>
		                     <c:param name="search" value="${ search }"/>
		                     <c:param name="mailFrom" value="${ m.mailFrom }"/>
							 <c:param name="mailTo" value="${ m.mailTo }"/>
		                  </c:url>
		               </c:if>
		               <c:if test="${ empty m }"> <!-- 검색 결과 없으면 -->
			               <c:url var="slistPage" value="teamScheduleList.do">
			                  <c:param name="currentPage" value="${ p }"/>
			               </c:url>                  
		               </c:if>
		               <a href="${ slistPage }">${ p }</a>
		            </c:if>
		         </c:forEach>
	         
	        	<!-- [다음] -->
				<c:if test="${ pi.currentPage == pi.maxPage }">
					&nbsp;다음
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:if test="${ !empty m }">
						<c:url var="slistNext" value="search2.do">
							<c:param name="currentPage" value="${ pi.currentPage+1 }"/>
							<c:param name="condition" value="${ condition }"/>
							<c:param name="search" value="${ search }"/>
							<c:param name="mailFrom" value="${ m.mailFrom }"/>
							<c:param name="mailTo" value="${ m.mailTo }"/>
						</c:url>
					</c:if>
					<c:if test="${ empty m }">
						<c:url var="slistNext" value="teamScheduleList.do">
							<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
						</c:url>
					</c:if>
					<a href="${ slistNext }">다음</a>
				</c:if>
			</div>
		</div>
					
					
					
					<!-- 이 위까지 내용작성 -->
					
					</div>
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
		
		<div class="clearfix"></div>
		

	<!--  -->
	<!-- END WRAPPER -->
	
	
	
	<!-- Javascript -->
	<script src="resources/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="resources/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="resources/assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="resources/assets/scripts/klorofil-common.js"></script>
	
	<!-- script 작성 -->
	<script>
	
	$(function(){

	/* 사이드바의 해당 메뉴 활성화 유지하기 */
	$("#menu4").addClass("in");
	$("#menu4").attr('aria-expanded',true);
	$("#menu4_1").addClass("active");
	$("#menu4_1").attr('aria-expanded',true);
	$("#m4_2").addClass("active");	
	
	});
		 
	</script>
	
	<script>
	
	j(function(){
		calendarStart();
	});
	
	function calendarStart(){
	 
		j("#calendar").html("");
			 
			 var date = new Date();
			 var d = date.getDate();
			 var m = date.getMonth();
			 var y = date.getFullYear();
			 
			 var calendar = j('#calendar').fullCalendar({
			  
			   header: {
				   left: "month,basicWeek,basicDay",
				   center: "title",
				   right: "today prev,next"
			   },
			   
			   defaultView: 'month',		// 처음 화면에 보여질 영역(월, 주, 일)
			   locale: 'ko',				// 언어
			   navLinks: true,				// 월/주별 달력에서 일자를 클릭하면 일별 보기로 전환하는 기능을 사용하는지에 대한 여부
			   allDaySlot: false,			// 캘린더 상단에 "하루 종일"슬롯이 표시되는지 여부
			   contentHeight: 450,
			   theme: true, 				// css 사용할 수 있게
			   allDay: true,
			   
			   titleFormat: {
				   month: "YYYY년 MMMM",
				   week: "YYYY년 MMM DD일 (ddd) ",
				   day: "YYYY년 MMM DD일 dddd"
			   },
			  
				editable: true,		// 실행된 달력에서 일정(event)을 표시한 바(bar)를 마우스로 이동할 수 있게 하는 것
				eventLimit: true, 	// 하루 기본일정 3개, 그 이상시, more로 처리
				
				events: [
				{
					title: '회사 쉬는날',
					start: '2019-10-28'
				},
				{
					title: '휴가',
					start: '2019-10-29',
					end: '2019-11-01'
				},
				{
					id: 999,
					title: '미팅 시간',
					start: '2019-11-04T16:00'
				},
				{
					title: '1팀 회의',
					start: '2019-11-11',
					end: '2019-11-14'
				},
				{
					title: '차량 대여',
					start: '2019-11-13T09:30:00',
					end: '2019-11-13T11:30:00'
				},
				{
					title: '점심시간',
					start: '2019-10-29T12:00:00'
				},
				{
					title: '1팀 회의',
					start: '2019-10-30T14:30:00'
				},
				{
					title: '클라이언트 연락',
					start: '2019-10-31T17:30:00'
				},
				{
					title: '학원 끝나는 날',
					start: '2019-11-05T07:00:00',
					color : '#FF0000',
		            textColor : '#FFFF00'
				},
			],
			// 모달창 생성
			eventRender: function (event, element) {
		        element.attr('href', 'javascript:void(0);');
		        element.click(function() {
		        	$('#eventModal').dialog({
		         		  title: '새로운 일정',
		        	      modal: true,
		        	      width: '600'
		        	});
		        	
		        });
		    }

		});
	};
	
	
	// 모달창 생성
	$(document).on('click','td',function(){
		$('#eventModal').dialog({
   		  title: '새로운 일정',
  	      modal: true,
  	      width: '600'
  		});
		
	});
	
	// 모달창 닫기
	$(function() {
	    $("#btn-default").on('click', function() {
	        $("#eventModal").dialog("close");
	    });
	});
	
	$(document).on('click', '#updateEvent', function(){
// 		 $("#eventModal").dialog("close");
		 
		 
		 var startDate = $("input[name=startDate]").val();
		 var startTime = $("select[name=startTime] option:selected").val();
		 var endDate = $("input[name=endDate]").val();
		 var endTime = $("select[name=endTime] option:selected").val();
		 var stitle = $("input[name=stitle]").val();
		 var scontent = $("#edit-desc").val();
		 var stype = $("select[name=stype] option:selected").val();
		 var backColor = $("select[name=backColor] option:selected").val();
		 
		 var allDay;
		 
		 if($("#allDay").prop('checked')){
			allDay ='Y'; 
		 }else{
			 allDay ='N';
		 }
		 
		 
// 		 console.log(startDate);
// 		 console.log(startTime);
// 		 console.log(endDate);
// 		 console.log(endTime);
// 		 console.log(stitle);
// 		 console.log(scontent);
// 		 console.log(stype);
// 		 console.log(backColor);
// 		 console.log(allDay);
		 
		 $.ajax({
		
			url:"insertSchedule.do",
			type:"POST",
			data:{startDate:startDate,
				  startTime:startTime,
				  endDate:endDate,
				  endTime:endTime,
				  stitle:stitle,
				  scontent:scontent,
				  stype:stype,
				  backColor:backColor,
				  empId:'${loginUser.empId}',
				  allDay:allDay
			},
			success:function(data){
				if(data == 'success'){
					$("input[name=startDate]").val("");
					$("select[name=startTime]").children().first().prop('selected', true);
					$("input[name=endDate]").val("");
					$("select[name=endTime]").find('option:eq(0)').prop('selected', true);
					$("input[name=stitle]").val("");
					$("#edit-desc").val("");
					$("select[name=stype]").find('option:eq(0)').prop('selected', true);
					$("select[name=backColor]").find('option:eq(0)').prop('selected', true);
					$("#allDay").prop('checked', false);

					$("#eventModal").dialog("close");
				
				}else{
					alert("실패");
				}
			},
			error:function(){
				alert("통신실패");
			}
		 });
	});
	
	
	</script>


</body>
</html>