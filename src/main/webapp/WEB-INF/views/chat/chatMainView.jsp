<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- 제이쿼리 cdn -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<!-- sockjs 라이브러리 -->
<script type="text/javascript" src="resources/js/sockjs-0.3.4.js"></script>

<!-- 제이쿼리 이벤트 라이브러리 cdn -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<!-- 커스텀 스크롤바 라이브러리 cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.css">

<!-- 시맨틱 사이드바 -->
<link href="resources/chat/css/sidebar.min.css" rel="stylesheet">
<script src="resources/chat/js/sidebar.min.js"></script>

<!-- 폰트 관련 링크 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">



<style>
body{
	font-family: 'Noto Serif KR', serif;
	margin: 0px;
	overflow: hidden;
}
.main-section small{
	font-size: 12px;
}
.main-section h3, .main-section h5{
	margin: 0px;
}
.main-section{
	width: 100%;
	background-color: #fff;
	margin: auto;
}
.head-section{
	border-bottom:1px solid #E6E6E6;
	clear: both;
	overflow: hidden;
	width: 100%;
}
.headLeft-section{
	width: 100%;
	float: left;
	border-right:1px solid #E6E6E6;
}
.headLeft-sub{
	padding: 15px;
}
.headLeft-sub input{
	width: 80%;
	border:1px solid #E6E6E6;
	padding: 7px;
	background:#E6E6E6;
}

.searchArea{
	display:inline-block;
	width:60%;
	border-radius: 20px;
	padding-left: 7px;
	background:#E6E6E6;
}
.searchArea i{
	color:#cdcdcd;
	font-size: 14px;
}
#menu{
}
.body-section{
	clear: both;
	overflow: hidden;
	width: 100%;
}


.left-section{
	width: 98%;
	float: left;
	height: 500px;
	border-right:1px solid #E6E6E6;
	background-color: #FFF;
	z-index: 1;
	position: relative;
	overflow:auto;
}

ul{
	padding: 0px;
	margin: 0px;
	list-style: none;
}
ul li{
	padding: 15px 0px;
	cursor: pointer;
}
ul li:hover{
	background: #e1e1e1;
	position: relative;
}


.chatList{
	overflow: hidden;
}
.chatList .img{
	width: 60px;
	float: left;
	text-align: center;
	position: relative;
}
.chatList .img img{
	width: 30px;
	border-radius: 50%;
}
.chatList .img i{
	position: absolute;
	font-size: 10px;
	color: #52E2A7;
	border:1px solid #fff;
	border-radius: 50%;
	left: 10px;
}

.chatList .desc{
	width: calc(100% - 60px);
	float: left;
	position: relative;
}
.chatList .desc h5{
	margin-top: 6px;
	line-height: 5px;
}
.chatList .desc .time{
	position: absolute;
	right: 15px;
	color: #c1c1c1;
}

</style>

<script type="text/javascript">

    $(document).ready(function() {
		
        $("#sendBtn").on("click", function() {	// 전송 버튼을 누를때

            sendMessage();	// 메소드 실행

        });
        $("#message").keydown(function (key) {	// 메세지 input태그에 키가 눌렸을때
            if (key.keyCode == 13) { // 엔터키면
                sendMessage();	// 메소드 실행
            }
        });
    	
    	fn_scroll_plugin();		// 스크롤 생성 함수 실행
		
    	$(".searchArea").on("focus", "#search", function(){
	    	$(".searchArea").css("border","1px solid #cdcdcd");
	    	$(".searchArea i").css("color","#b4b4b4");
	    	$("#search").css("outline", "0px");
	    	$("#search").attr("placeholder", "");
    	});
    	
    	$(".searchArea").on("blur", "#search", function(){
	    	$(".searchArea").css("border","1px solid #e4e4e4");
	    	$(".searchArea i").css("color","#cdcdcd");
	    	$("#search").attr("placeholder", "이름검색");
    	});
		

        
        $("#menu").on("click", function(){
        	$('.ui.labeled.icon.sidebar').sidebar('toggle');
        });



    });


	// jQuery Scroll Plugin 적용
	function fn_scroll_plugin() {
		$(".left-section").mCustomScrollbar({
			theme : "minimal-dark", // 테마 적용
			mouseWheelPixels : 300, // 마우스휠 속도
			scrollInertia : 400 // 부드러운 스크롤 효과 적용
		});
	}
    var sock;

    //웸소켓을 지정한 url로 연결한다.
   	sock = new SockJS("<c:url value="/echo"/>");



    //자바스크립트 안에 function을 집어넣을 수 있음.

    //데이터가 나한테 전달되읐을 때 자동으로 실행되는 function

    sock.onmessage = onMessage;

    
    //데이터를 끊고싶을때 실행하는 메소드

    sock.onclose = onClose;




    /* sock.onopen = function(){

        sock.send($("#message").val());

    }; */

    function sendMessage() {
	
		if($("#message").val() == ""){	// 메세지 내용이 없으면 실행되는 부분
			
		}else{							// 메세지 내용이 있으면
        	/*소켓으로 보내겠다.  */
	        sock.send($("#message").val());	// 메세지를 소켓에 보내고
	        $("#message").val("");			// 메세지 내용을 비운다.
			
		}
        

    }

    //evt 파라미터는 웹소켓을 보내준 데이터다.(자동으로 들어옴)

    function onMessage(evt) {

        var data = evt.data;
		
        $("#data").append(data + "<br/>");
        document.body.scrollIntoView(false);	// 스크롤을 제일 아래로
        //sock.close();

    }


    function onClose(evt) {
		
        $("#data").append("연결 끊김");

    }
</script>

</head>
<body>
	<div class="ui left demo vertical inverted very thin sidebar labeled icon menu">
		<div class="item">
	    	<i class="fa fa-user"></i>
	    </div>
	    <div class="item">
	  		<i class="fa fa-comment"></i>
	  	</div>
	  	<div class="item">
	    	<i class="fa fa-ellipsis-h"></i>
	  	</div>
	</div>
	<div class="pusher">
		<div class="main-section">
			<div class="head-section">
				<div class="headLeft-section">
					<div class="headLeft-sub">
						<div style="box-sizing:border-box;padding-bottom:5px;">
							<i class="fa fa-align-justify" id="menu"></i>
							<div class="searchArea">
								<i class="fa fa-search"></i>
								<input type="text" id="search" name="search" placeholder="이름검색">
							</div>
						</div>
						<ul>
							<li>
								<div class="chatList">
									<div class="img">
										<i class="fa fa-circle"></i>
										<img src="/demo/man01.png">
									</div>
									<div class="desc">
										<h5>유현규 사원</h5>
										<small>오늘 하루도 화이팅!!</small>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
	
			</div>
			<div class="body-section">
				<div class="left-section" data-mcs-theme="minimal-dark">
					<ul>
						<li>
							<div class="chatList">
								<div class="img">
									<i class="fa fa-circle"></i>
									<img src="/demo/man01.png">
								</div>
								<div class="desc">
									<small class="time">05:30 am</small>
									<h5>Luis Yankee</h5>
									<small>Lorem ipsum dolor sit amet...</small>
								</div>
							</div>
						</li>
						<li>
							<div class="chatList">
								<div class="img">
									<i class="fa fa-circle"></i>
									<img src="/demo/man01.png">
								</div>
								<div class="desc">
									<h5>유현규 사원</h5>
									<small>오늘 하루도 화이팅!!</small>
								</div>
							</div>
						</li>
						<li>
							<div class="chatList">
								<div class="img">
									<img src="/demo/man03.png">
								</div>
								<div class="desc">
									<small class="time">4 day</small>
									<h5>Lajy Ion</h5>
									<small>Lorem ipsum dolor sit amet...</small>
								</div>
							</div>
						</li>
						<li>
							<div class="chatList">
								<div class="img">
									<img src="/demo/man04.png">
								</div>
								<div class="desc">
									<small class="time">18 day</small>
									<h5>Lod Kine</h5>
									<small>Lorem ipsum dolor sit amet...</small>
								</div>
							</div>
						</li>
						<li>
							<div class="chatList">
								<div class="img">
									<i class="fa fa-circle"></i>
									<img src="/demo/man01.png">
								</div>
								<div class="desc">
									<small class="time">11:50 am</small>
									<h5>Nik Minaj</h5>
									<small>Lorem ipsum dolor sit amet...</small>
								</div>
							</div>
						</li>
						<li>
							<div class="chatList">
								<div class="img">
									<img src="/demo/man02.png">
								</div>
								<div class="desc">
									<small class="time">20 day</small>
									<h5>Win Sina</h5>
									<small>Lorem ipsum dolor sit amet...</small>
								</div>
							</div>
						</li>
						<li>
							<div class="chatList">
								<div class="img">
									<img src="/demo/man03.png">
								</div>
								<div class="desc">
									<small class="time">18 day</small>
									<h5>Jack Clerk</h5>
									<small>Lorem ipsum dolor sit amet...</small>
								</div>
							</div>
						</li>
						<li>
							<div class="chatList">
								<div class="img">
									<img src="/demo/man02.png">
								</div>
								<div class="desc">
									<small class="time">20 day</small>
									<h5>Win Sina</h5>
									<small>Lorem ipsum dolor sit amet...</small>
								</div>
							</div>
						</li>
						<li>
							<div class="chatList">
								<div class="img">
									<img src="/demo/man03.png">
								</div>
								<div class="desc">
									<small class="time">18 day</small>
									<h5>Jack Clerk</h5>
									<small>Lorem ipsum dolor sit amet...</small>
								</div>
							</div>
						</li>
					</ul>
				</div>
	
			</div>
		</div>
	</div>

</body>
</html>