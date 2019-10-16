<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<link rel="stylesheet" href="resources/css/semantic_dropdown.css">
<link rel="stylesheet" href="resources/css/semantic_icon.css">
<link rel="stylesheet" href="resources/css/semantic_button.css">


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
	
	.ui.link.cards{
		margin-left:15px;
		margin-right:15px;
	}
	
	#top-table{
		margin-top:5px;
		margin-bottom:5px;
	}
	#content-table{
		margin-top:5px;
		margin-bottom:5px;
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
					
					<table id="top-table">
						<tr id="content-table">
							<td>
								<!-- <div class="ui compact menu">
								  <div class="ui simple dropdown item">
								    Dropdown
								    <i class="dropdown icon"></i>
								    <div class="menu">
								      <div class="item">Choice 1</div>
								      <div class="item">Choice 2</div>
								      <div class="item">Choice 3</div>
								    </div>
								  </div>
								</div> -->
								
								<select class="form-control input-lg" style="width:300px">
									<option value="cheese">2019년 10월</option>
									<option value="tomatoes">2019년 9월</option>
									<option value="mozarella">2019년 8월</option>
									<option value="mushrooms">Mushrooms</option>
									<option value="pepperoni">Pepperoni</option>
									<option value="onions">Onions</option>
								</select>
							</td>
							<td>
								<div class="ui inverted segment">
								  <button type="button" style="background-color:#3287B2; color:white;" class="btn btn-lg" id="insertTdBoard" onclick="location.href='insertTodoBoard.do'">
								  	<i class="fas fa-plus-circle"></i> Board
								  </button>
								</div>
							</td>
						</tr>
					</table>
					
					<br><br>
					
					<div class="ui three cards">
					
						<div class="ui link cards" onclick="location.href='todoDetail.do'" >
						  <div class="card">
						    <div class="image">
						      <img src="resources/images/square-image.png">
						    </div>
						    <div class="content">
						      <div class="header">2019년 10월</div>
						      <div class="meta">
						        2019년 10월 서비스팀 업무 관리
						      </div>
						    </div>
						    <div class="extra content">
						      <span class="right floated">
						        2019-10-13
						      </span>
						    </div>
						  </div>
					  	</div>
					  	
					  	<div class="ui link cards" onclick="location.href='todoDetail.do'">
						  <div class="card">
						    <div class="image">
						      <img src="resources/images/default_profile.png">
						    </div>
						    <div class="content">
						      <div class="header">2019년 9월</div>
						      <div class="meta">
						        2019년 9월 업무 관리
						      </div>
						    </div>
						    <div class="extra content">
						      <span class="right floated">
						        2019-09-02
						      </span>
						    </div>
						  </div>
					  	</div>
					  	
					  	<div class="ui link cards" onclick="location.href='todoDetail.do'">
						  <div class="card">
						    <div class="image">
						      <img src="resources/images/confRoom.jpg">
						    </div>
						    <div class="content">
						      <div class="header">Matt Giampietro</div>
						      <div class="meta">
						        Matthew is an interior designer living in New York.
						      </div>
						    </div>
						    <div class="extra content">
						      <span class="right floated">
						        Joined in 2013
						      </span>
						    </div>
						  </div>
					  	</div>
					  	
					  	<div class="ui link cards" onclick="location.href='todoDetail.do'">
						  <div class="card">
						    <div class="image">
						      <img src="resources/images/default_profile.png">
						    </div>
						    <div class="content">
						      <div class="header">2019년 9월</div>
						      <div class="meta">
						        2019년 9월 업무 관리
						      </div>
						    </div>
						    <div class="extra content">
						      <span class="right floated">
						        2019-09-02
						      </span>
						    </div>
						  </div>
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
		
		$("#menu3").addClass("in");
		$("#menu3").attr('aria-expanded',true);
		$("#menu3_1").addClass("active");
		$("#menu3_1").attr('aria-expanded',true);
		$("#m3_2").addClass("active");	
		
	});
	
	
	
	</script>

</body>
</html>