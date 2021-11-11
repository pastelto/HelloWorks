<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정관리</title>
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

 
 	#mySchedule{
 	 background: lightblue;
 	 height: 80%;
 	} */
	
	.scheduleBackGround{
	  background-color:white;
	  height: 726px;
	  margin-top:30px; 
	  position: absolute;
	}
	
	.mainCalendar{
	  margin-top: -11px;
	}
 	
</style>
</head>
<body>
	
	<!-- 캘린더 좌측메뉴 부분 -->
	<div class="scheduleBackGround">
	<div class="mainCalendar" style="">
		<!-- 사이드바 캘린더 -->
		<div class="calendar col-12" style="padding: 0;">
			<div id="datepicker"></div>
		</div>
	    <div class="table-responsive p-0"
			style="height: 250px;">
			<table class="table table-head-fixed text-nowrap"
				id="getMainScheduleTable">
				<tbody>

				</tbody>
			</table>
		</div>
			
		</div>
	</div>



<script src="./resources/plugins/moment/moment.min.js"></script>
<script>
	$(function(){
	//$.datepicker.setDefaults($.datepicker.regional["ko"]);
    $( "#datepicker" ).datepicker({
    	 dateFormat: "yy-mm-dd",
         onSelect : function(date) {
			callMainCalendar(date); 
		}
    })

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
        dateFormat: "yyyy-mm-dd",
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

	
<script>
	// 날짜 선택해서, 그 해당날짜에 있는 이벤트 가져오기
	
	$(function(){

		var getDate = $.datepicker.formatDate("yy-mm-dd", $("#datepicker").datepicker("getDate"));
		callMainCalendar(getDate);

	});


	function callMainCalendar(date){
		$("#getMainScheduleTable tbody").html("");

		// 예약된 시간표 가져오기
		$.ajax({
			url : "getEventList.sch",
			data : {
				getDate : date
			},
			dataType : "json",
			success : function(getEventList) {
				console.log("getEventList 성공!" + getEventList);
				
				var scheduleValue = "";
				$.each(getEventList, function(i, obj) {
					if(obj.sch_type != "PRIVATE"){
					scheduleValue += "<tr onclick='clickSchedule("+obj.sch_no+")'>" +
					 "<td><strong><span style='color:" + obj.sch_color + ";'>● "+obj.sch_type+"</span></strong>&nbsp;&nbsp;" 
					  + obj.sch_title + "</td>" + 
				      "</tr>";
					} else if (obj.sch_type == "PRIVATE") {
						scheduleValue += "<tr onclick='clickSchedule("+obj.sch_no+")'>" +
						 "<td><strong><span style='color:" + obj.sch_color + ";'>● 내 캘린더</span></strong>&nbsp;&nbsp;" 
						  + obj.sch_title + "</td>" + 
					      "</tr>";
					}
				});
				$("#getMainScheduleTable tbody").html(scheduleValue); // 메일 inbox
				
			},
			error : function() {
				console.log("timeCar ajax 통신 실패");
			}
		});

	}
</script>

<script>
 		// 발송업무 & 미확인 상세 조회 페이지 
    	function clickSchedule(num){
    		location.href = "schMain.sc";
    	}
    	
</script>

</body>
</html>