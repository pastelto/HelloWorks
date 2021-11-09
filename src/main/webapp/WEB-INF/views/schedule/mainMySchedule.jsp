<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="./resources/plugins/fullcalendar/main.css"> -->
<!-- <script src="./resources/plugins/jquery/jquery.min.js"></script> -->
<link rel="stylesheet" href="./resources/plugins/datepicker/jquery-ui.css">
<script src="./resources/plugins/datepicker/jquery-ui.min.js"></script> 
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
<script src="https://unpkg.com/tippy.js@6"></script>
<style>
	.ui-datepicker-header{
		background-color : #27496D !important;
	}
	
	.ui-datepicker-inline{
		width: 100% !important;
	}
	
/* 	.card-title, .card-header, .form-check-label{
		text-align: center !important;
	     align-items: center !important;
	}
	
 	.fixedMenu{
		position: relative;
  		top: 20px;
  		left: 30px; 
  	} 	
 */
 
 	#mySchedule{
 	 background: lightblue;
 	 height: 80%;
 	}
 	
 	#datepicker{
 		padding-bottom: 100px;
 	}
 	
</style>
</head>
<body>

	<!-- 캘린더 좌측메뉴 부분 -->
	
	<div style="margin-top: 1%; margin-left: 5%; position: fixed;">
		<!-- 사이드바 캘린더 -->
		<div class="calendar col-12" style="padding: 0;">
			<div id="datepicker"></div>
		</div>
		<div>
			
		</div>
	</div>



<script src="./resources/plugins/moment/moment.min.js"></script>
<script>
	$(function(){
	//$.datepicker.setDefaults($.datepicker.regional["ko"]);
    $( "#datepicker" ).datepicker();
		 
    $.datepicker.regional["ko"] = {
        closeText: "닫기",
        prevText: "이전달",
        nextText: "다음달",
        currentText: "오늘",
        monthNames: ["1월(JAN)","2월(FEB)","3월(MAR)","4월(APR)","5월(MAY)","6월(JUN)", "7월(JUL)","8월(AUG)","9월(SEP)","10월(OCT)","11월(NOV)","12월(DEC)"],
        monthNamesShort: ["1월","2월","3월","4월","5월","6월", "7월","8월","9월","10월","11월","12월"],
        dayNames: ["일","월","화","수","목","금","토"],
        dayNamesShort: ["일","월","화","수","목","금","토"],
        dayNamesMin: ["일","월","화","수","목","금","토"],
		changeMonth: true, // month 셀렉트박스 사용
		changeYear: true, // year 셀렉트박스 사용
        weekHeader: "Wk",
        dateFormat: "yyyy/mm/dd",
        firstDay: 0,
        isRTL: false,
        showMonthAfterYear: true,
        yearSuffix: ""
        }
        
	
	
	// Today 버튼 코드 추가
	$.datepicker._gotoToday = function(id) { 
		$(id).datepicker('setDate', new Date());
		$(".ui-datepicker").hide().blur();
	};
});
</script>


</body>
</html>