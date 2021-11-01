<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- fullCalendar -->
<link rel="stylesheet" href="./resources/plugins/fullcalendar/main.css">
<script src="../plugins/jquery/jquery.min.js"></script>
<link rel="stylesheet" href="./resources/plugins/datepicker/jquery-ui.css">
<script src="./resources/plugins/datepicker/jquery-ui.min.js"></script>
<style>
	.ui-datepicker-header{
		background-color : #27496D !important;
	}
	
	.ui-datepicker-inline{
		width: 100% !important;
	}
	
	.card-title, .card-header, .form-check-label{
		text-align: center !important;
		/* align-items: center !important; */
	}
	
 	.fixedMenu{
		position: relative;
  		top: 20px;
  		left: 30px;
  		
	} 
</style>
</head>
<body>
	<div class="col-2 fixedMenu">
	<!-- 캘린더 좌측메뉴 부분 -->
	<div style="margin-top: 3%; margin-left: 20px; position: fixed;">
		<!-- 일정 등록하기 버튼 -->
		<div id="insertCal col-12">
			<button type="button" class="btn btn-info" style="width: 100%;" onclick="location.href='addEventsPage.sc'">일정 등록하기</button>
		</div>
		<!-- 사이드바 캘린더 -->
		<div class="calendar col-12" style="padding: 0;">
			<div id="datepicker"></div>
		</div>
		&nbsp;
       	<!-- 전체 / 사내 / 캘린더 메뉴 -->
		<div role="button" id="deptCal" >
		    <!-- 전체 -->
		    <div class="card card-info card-outline">
              <div class="card-header">
              <h3 class="card-title form-check-label" for="selectAllCB">
              &nbsp;&nbsp;&nbsp;
              <input type="checkbox" class="form-check-input" id="selectAllCB"  onclick="selectAll();" checked>
                	전체 캘린더</h3>
       		  </div>
       		</div>
		 	
		 	<!-- 사내 -->
            <div class="card card-info card-outline">
              <div class="card-header pl-3">
               <h3 class="card-title"> 
               &nbsp;&nbsp;&nbsp;&nbsp;
                <input type="checkbox" class="form-check-input" id="selectDept"  onclick="selectDept();" checked>
              	사내 캘린더</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body p-0">
                <ul class="nav nav-pills flex-column">
                  <li class="nav-item pl-3">
                    <a class="nav-link" href="vacationForm.ps">
                    <input type="checkbox" class="form-check-input" id="selectAllCB" onclick="selectAll();" checked> 
                    <label class="form-check-label" for="selectAllCB">&nbsp;${loginUser.deptUname }</label></a>
                  </li>
                  <li class="nav-item pl-3">
                    <a class="nav-link" href="vacationForm.ps">
                    <input type="checkbox" class="form-check-input" id="selectAllCB" onclick="selectAll();" checked> 
                    <label class="form-check-label" for="selectAllCB">&nbsp;${loginUser.deptDname }</label></a>
                  </li>

                </ul>
              </div>
            </div>
            
            <!-- 내 캘린더 -->
		<div id="myCal">
            <div class="card card-info card-outline">
              <div class="card-header">
               <h3 class="card-title form-check-label" for="selectMine">
               &nbsp;&nbsp;&nbsp;
              <input type="checkbox" class="form-check-input" id="selectMine"  onclick="selectMine();" checked>
               	내 캘린더</h3>
       		  </div>
       		</div>
        </div>
      </div>
		
	</div>
</div>
<script>
	$(function(){
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
        dateFormat: "yymmdd",
        firstDay: 0,
        isRTL: false,
        showMonthAfterYear: true,
        yearSuffix: ""
    };
	$.datepicker.setDefaults($.datepicker.regional["ko"]);
	
	// Today 버튼 코드 추가
	$.datepicker._gotoToday = function(id) { 
		$(id).datepicker('setDate', new Date());
		$(".ui-datepicker").hide().blur();
	};
});
</script>

<!-- 메뉴바 스크립트 -->
<script>
	function selectAll(){
		
		alert("전체 일정 선택");
	}
	
	function selectMine(){
		
		alert("내 캘린더 선택");
	}
	
	function selectDept(){
		
		alert("부서 캘린더 선택");
	}
	

</script>
</body>
</html>