<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminLTE 3 | UI Sliders</title>

<!-- Ion Slider -->
<link rel="stylesheet" href="./resources/plugins/ion-rangeslider/css/ion.rangeSlider.min.css">
<!-- bootstrap slider -->
<link rel="stylesheet" href="./resources/plugins/bootstrap-slider/css/bootstrap-slider.min.css">
<style>


div[class*="workingBtn"] {
   display: inline-block;
}
.workingtime{
   width : 70px;
   text-align:center;
   margin-top: 5px;
   
   /*input 테두리 없애기*/
   	border:none;
	border-right:0px; 
	border-top:0px; 
	boder-left:0px; 
	boder-bottom:0px;
	border-color : white;
} 

input:focus {outline:none;}

#progressbar{
	height : 15px;
}

</style>
  
</head>
<body >


	<div id="cardAttendance">
      <div class="card card-info card-outline" style="width: 300px;">
             <div class="card-header" >            
               <div class="float-left">내 정보</div>
             </div>
			  
			  <!-- 개인정보 -->
              <div class="card-body box-profile">
                 <div class="text-center" style="margin-top:-5px; padding-bottom:15px;">
                    <i class="far fa-user-circle fa-2x"></i>
                 </div>
                 <h6  class="text-center">${loginUser.empName} 님 환영합니다</h6>
                 <p class="text-muted text-center">IT개발팀</p>
              </div>    
        	
        	  <!-- 탭 -->	
	  		  <div class="card  card-outline card-outline-tabs" style="margin-top: -15px;">
	              <div class="card-header p-0 border-bottom-0">
	                <ul class="nav nav-tabs" id="custom-tabs-four-tab" role="tablist">
	                  <li class="nav-item col-sm-6 text-center">
	                    <a class="nav-link active" id="custom-tabs-four-unchecked-tab" data-toggle="pill" href="#custom-tabs-four-unchecked" role="tab" aria-controls="custom-tabs-four-unchecked" aria-selected="true">근태정보</a>
	                  </li>
	                  <li class="nav-item col-sm-6 text-center">
	                    <a class="nav-link" id="custom-tabs-four-recv-tab" data-toggle="pill" href="#custom-tabs-four-recv" role="tab" aria-controls="custom-tabs-four-recv" aria-selected="false">휴가정보</a>
	                  </li>
	                </ul>
	              </div>
	           </div>	
	           <!--탭 -->
	           
              <!-- card body -->
              <div class="card-body">
	              <div class="tab-content" id="custom-tabs-four-tabContent">
		              <div class="tab-pane fade show active" id="custom-tabs-four-unchecked" role="tabpanel" aria-labelledby="custom-tabs-four-unchecked-tab">
		                  <!-- 근태정보 -->
	                      <div class="container-fluid text-center" style="margin-top:-7px;"> 
	                      	          
		                     <h5><span id="nowTimes"></span></h5>                     
		                  </div>
		                  <div class="container-fluid text-center">
			                  <button  class="btn btn-outline-secondary  btn-sm" onclick="insertTime(1);" >출근</button>
			                  <input type=text class="workingtime" id="inTime" value="${a.inTime}" readonly>
			                  <button  class="btn btn-outline-secondary  btn-sm "onclick="insertTime(2);" >퇴근</button>
			                  <input type=text class="workingtime" id="outTime" value="${a.outTime}" readonly>
		                  </div>
		                  <br>
		                  <div class="irs-wrapper complete">
	                        <input id="range_1" type="text" name="range_1" value="1" disabled>
	                      </div>
	                      <br>
	                      <!--
	                      <div class="col-sm-12">
	                        <input id="range_2" type="text" name="range_2" value="10000;100000">
	                      </div>
	                      
	                      
	                      <div class="profress border">
	                      		<div id="progressbar"class="progress-bar bg-info" style="width:60%">6시간</div>
	                      </div>
		                    -->
		                
                    </div>
		                  
		              </div>
		              <div class="tab-pane fade" id="custom-tabs-four-recv" role="tabpanel" aria-labelledby="custom-tabs-four-recv-tab">
		                  <!-- 휴가정보 -->
		                  	휴가정보 나와라 얍
		              </div>		         
	              </div>
             </div>
             <!-- card body -->
      		  
              				
                          
        </div>

  
  </div>
                 
  





<!-- Bootstrap slider -->
<script src="./resources/plugins/ion-rangeslider/js/ion.rangeSlider.min.js"></script>
<script src="./resources/plugins/bootstrap-slider/bootstrap-slider.min.js"></script>
   
 <script>
 
 var empNo = ${loginUser.empNo};

 window.onload = function(){
 
	 console.log(1)
		$.ajax({
			
			//url : 데이터를 전송할 url(필수)
			url:"attendance.ps",
			//data : 요청시 전달할 파라미터 설정
			data:{empNo:empNo},//key:value
			
			//type : 전송방식(get/post)
			type :"get",
			
			success: function(result){
				$('#inTime').value(result);
				$('#outTime').value(result);
			},
			
			error: function(){
				console.log("Ajax 통신 실패")								
			},
			
			complete:function(){//통신이 실패하던 성공하던 무조건 실행
				console.log("무조건 호출")
			}
			
			
			
		})	
		
		console.log(2)
 
 
 }

 
 </script>  
   
   
   

<script>
function insertTime(num){	
	var nowDate = new Date();
	var hour = nowDate.getHours();
	var min = nowDate.getMinutes();
    var sec = nowDate.getSeconds();
    
    if(min < 10) { min = "0" + min; }
    if(sec < 10) { sec = "0" + sec; }
    var inOutTime= hour + ":" + min + ":" + sec ;
	
	if(num == 1){
		alert("출근시간이 등록되었습니다")
		location.href="intime.ps?inOutTime=" + inOutTime;		
	}else{
		alert("퇴근시간이 등록되었습니다")
		location.href="outTime.ps?inOutTime=" + inOutTime;	
	}
	
}
</script>

<script>
  $(function () {
    $('#range_1').ionRangeSlider({
       min: 0,
       max: 10,
       postfix   : '시간'

    })

  })
    $(function () {
    $('#range_2').ionRangeSlider({
      type      : 'single',
      step      : 100,
      postfix   : '시간',
      from      : 55000,
      hideMinMax: true,
      hideFromTo: false
    })

  })
</script>
<script>
document.addEventListener("DOMContentLoaded", function() {
    // 시간을 딜레이 없이 나타내기위한 선 실행
    realTimer();
    // 이후 0.5초에 한번씩 시간을 갱신한다.
    setInterval(realTimer, 100);
});

// 시간을 출력
function realTimer() {

   const nowDate = new Date();
   const year = nowDate.getFullYear();
   const month= nowDate.getMonth() + 1;
   const date = nowDate.getDate();
   const hour = nowDate.getHours();
   const min = nowDate.getMinutes();
   const sec = nowDate.getSeconds();
   document.getElementById("nowTimes").innerHTML = 
              hour + "시 " + addzero(min) + "분 " + addzero(sec) + "초";
}

// 1자리수의 숫자인 경우 앞에 0을 붙여준다.
function addzero(num) {
   if(num < 10) { num = "0" + num; }
   return num;

}

</script>
</body>
</html>