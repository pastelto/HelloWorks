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
.workingtext{
	margin-left: 15px;
	margin-right: 10px;
}
</style>
  
</head>
<body >



      <div class="card card-info card-outline" style="width: 300px;">
           <div class="card-header" >            
             <div class="float-left">내 정보</div>
           </div>

              <div class="card-body box-profile">
                 <div class="text-center" style="margin-top:-10px; padding-bottom:10px;">
                    <i class="far fa-user-circle fa-3x"></i>
                 </div>
                 <h6  class="text-center">${loginUser.empName} 님 환영합니다</h6>
                 <p class="text-muted text-center">IT개발팀</p>
                  
                 <div class="row">
                 <nav class="card-info card-outline" style="width: 300px;">
                   <div class="nav nav-tabs" id="product-tab" role="tablist">
                      <a style="width: 135px;" class="nav-item nav-link active text-center" id="product-desc-tab" data-toggle="tab" href="#product-desc" role="tab" aria-controls="product-desc" aria-selected="true">근태정보</a>
                      <a style="width: 135px;" class="nav-item nav-link text-center" id="product-comments-tab" data-toggle="tab" href="#product-comments" role="tab" aria-controls="product-comments" aria-selected="false">휴가정보</a>
                   </div>
                 </nav>
                 <div class="tab-content " id="nav-tabContent">
                    <!--근태정보 -->
                   <div class="tab-pane fade show active" id="product-desc" role="tabpanel" aria-labelledby="product-desc-tab">         
                       
                        <div class="container-fluid text-center" style="margin-top:10px;">					
							<h4>
								<span id="nowTimes"></span>
							</h4>							
						</div>
					
                        
                        
                        
                        <br>
                        <div class="col-sm-12">
                           <button  class="btn  btn-outline-secondary workingBtn" id="timeBtn" >출근</button>
                           <div class="workingBtn"><p class="workingtext ">09:00</p></div>
                           <button  class="btn  btn-outline-secondary workingBtn"id="timeBtn" >퇴근</button>
                           <div class="workingBtn"><p class="workingtext">18:00</p></div>
                        </div>
                        
                        
                        <div class="col-sm-12">
		                  <input id="range_1" type="text" name="range_1" value="10000;100000">
		                </div>
		                <br>
		                <div class="col-sm-12">
		                  <input id="range_2" type="text" name="range_2" value="10000;100000">
		                </div>

                        
                        
                        
                   </div>
                   <div class="tab-pane fade" id="product-comments" role="tabpanel" aria-labelledby="product-comments-tab">
                        휴가정보 나와라 얍
                   </div>
                 </div>
              </div>   
              </div>
             
        </div>

  
  
   				  
  





<!-- Bootstrap slider -->
<script src="./resources/plugins/ion-rangeslider/js/ion.rangeSlider.min.js"></script>
<script src="./resources/plugins/bootstrap-slider/bootstrap-slider.min.js"></script>


<script>
  $(function () {
    $('#range_1').ionRangeSlider({
      type      : 'single',
      step      : 100,
      postfix   : '시간',
      from      : 55000,
      hideMinMax: true,
      hideFromTo: false
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