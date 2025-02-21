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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>



<style>
.contentWrap{
	float:left;
	width:55%;
	background: white;
	padding-top:30px;
	padding-bottom:30px;
	padding-left:50px;
	padding-right:50px;
	font-size:14px;
}
.main-header{
	width:100%;
	height:30%;
	float:left;
}
.header-right{
    width: 300px;
    float: right;
    margin-left: 40px;
}
.header-right tr{
	height: 30px;
}
.header-right td{
	font-size:16px;
}
.header-left{
	width: 197px;
	float: left;
	overflow: hidden;
	border-radius: 50%;
}
.header-left img{
	width: 100%;
	height: 100%;
}
.main-section{
	width: 100%;
	height: 70%;
}
td{
	border: 0px !important;
}
.userTr{
	padding-left:30px;
	width:50%;
}
.userTr input{
	width:60%;
}
#update{
	margin:0px;
	margin-left:-20px;
}
#statusMsg{
	margin-top:15px;
}
input[type=text]{
	height:30px;
}
.main-section input[type=text]{
	width:400px;
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
						<div class="main-header">
							<div class="header-left">
								<div id="imgInputArea"><input type="file" id="imgUpdate" name="profile" onchange='loadImg(this)'></div>
								<div id="profileImgArea">
									<img id="profileImg" class="imgUpdate" src="resources/upload/profile/${loginUser.profilePath}">
								</div>
							</div>
							
							<div class="header-right">
								<table>
									<tr>
										<th colspan="2" style="background:none;border:0;text-align:center;height:50px;">
											<h3 style="display:inline-block;">${loginUser.empName } ${loginUser.jobName }</h3>
											<span class="" style="font-size:16px;margin-left:10px;">${loginUser.deptName }</span>
										</th>
									</tr>
									<tr>
										<td colspan="2" style="text-align:center;padding-bottom:10px;"><span id="workDay" style="color:red"></span><span>일 째 근무 중</span></td>
									</tr>
									<tr>
										<td>입사일</td>
										<td style="text-align:right;">${loginUser.enrollDate}</td>
									</tr>
									<tr>
										<td>남은 연차 일수</td>
										<td style="text-align:right;">${loginUser.vacation}</td>
									</tr>
									<tr>
										<td>별 개수</td>
										<td style="text-align:right;">${loginUser.star}</td>
									</tr>
								</table>
							</div>
							
							<br clear="both">
							<div class="ui input">
								<input type="text" id="statusMsg" name="statusMsg" class="userAdvice" placeholder="상태메세지" value="${loginUser.statusMsg}" readonly>
							</div>
							<div class="ui toggle checkbox" style="float:right;" style="width:100px;">
								<input type="checkbox" name="update" id="update" style="opacity:0;">
								<label style="font-size: 15px;padding-top: 0;">정보 수정</label>
							</div>
						</div>
						<br clear=both>
						<br clear=both>
						<br clear=both>
						<div class="main-section">
							<table>
								<tr>
									<td>ID</td>
									<td class="userTr">
										<div class="ui input">
											<input type="text" value="${loginUser.empId }" placeholder="내용을 입력해주세요." readonly>
										</div>
									</td>
								</tr>
								<tr>
									<td>EMAIL</td>
									<td class="userTr">
										<div class="ui input">
											<input type="text" value="${loginUser.email }" placeholder="내용을 입력해주세요." readonly>
										</div>
									</td>
								</tr>
								<tr>
									<td>MOBILE</td>
									<td class="userTr">
										<div class="ui input">
											<input class="userAdvice" id="phone" name="phone" type="text" value="${loginUser.phone }" placeholder="내용을 입력해주세요." readonly>
										</div>
									</td>
								</tr>
								<tr>
									<td width="10%">ADDRESS</td>									
									<td class="userTr">
										<div class="ui input">
											<input class="userAdvice" id="address" name="address" type="text" value="${loginUser.address }" placeholder="내용을 입력해주세요." readonly>
										</div>
									</td>
								</tr>
							</table> 
						</div>
						<br>
						<div><button class="btn btn-primary" onclick="location.href='updatePwdForm.do';" type="button">비밀번호 변경</button></div>
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
	
	
	
	
	<!-- script 작성 -->
	<script>
		$(function(){
			$("#imgInputArea").hide();
			$("#update").on('click', function(){
				if($("#update").prop("checked")){
					$(".userAdvice").removeAttr("readonly");
					$("#profileImgArea").css("cursor", "pointer");
				}else{
					$("#profileImgArea").css("cursor", "default");
					var formData = new FormData();
					var statusMsg = $("#statusMsg").val();
					var phone = $("#phone").val();
					var address = $("#address").val();
					formData.append('statusMsg', statusMsg);
					formData.append('phone', phone);
					formData.append('address', address);
					if($("input[name=profile]").length > 0){
						formData.append('profile',$("input[name=profile]")[0].files[0]);
					}
					$.ajax({
						url:"myPageUpdate.do",
						type:"POST",
						processData:false,
						contentType:false,
						data:formData,
						success:function(data){
							console.log("ajax실행 후 세션 : ${loginUser}");
							if(data == 'fail'){
								alertify.alert('develolffice', '수정 실패');
							}else{
								$(".img-circle").attr("src", "resources/upload/profile/" + data);
								alertify.alert('develolffice', '수정 되었습니다.');
							}
						},
						error:function(){
							
						}
					});
					$(".userAdvice").attr("readonly", true);
					
				}
			});
			var today = new Date();
			var dateArray = ('${loginUser.enrollDate}').split('-');
			var enrollDate = new Date(dateArray[0], Number(dateArray[1])-1, dateArray[2]);

			var workDay = Math.floor((today.getTime() - enrollDate.getTime())/1000/60/60/24);
			console.log(workDay);
			$("#workDay").html(workDay);
			
			
			$(document).on("click", "#profileImgArea", function(e){
				if($("#update").prop("checked")){
					$("#"+e.target.className).click();
				}
			});
			
			
		});
			function loadImg(value){
				// value => input태그
				// num => 조건문으로 작업
				// file이 존재하는지
				 if(value.files && value.files[0]){
					
					// 파일을 읽어들일 FileReader객체 생성
					var reader = new FileReader();
					
					// 파일 읽기가 다 완료되었을 때 실행되는 메소드
					reader.onload = function(e){
						$("#profileImg").attr("src", e.target.result);// data:URL
						}
					
				
					// 파일 읽어주는 메소드
					reader.readAsDataURL(value.files[0]);
				}else{
					$("#profileImg").attr("src", "resources/upload/profile/${loginUser.profilePath}");// data:URL
					
				}
			}
	
	
	</script>
	
	
	
	<!-- Javascript -->
	<script src="resources/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="resources/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="resources/assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="resources/assets/scripts/klorofil-common.js"></script>
	
</body>
</html>