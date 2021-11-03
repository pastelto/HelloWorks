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
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
<script src="https://unpkg.com/tippy.js@6"></script>
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
              <label class="card-title form-check-label" for="selectAllCB">
              &nbsp;&nbsp;&nbsp;
              <input type="checkbox" class="form-check-input filter" id="selectAllCB" name="selectAllCB" checked>
                	전체 캘린더</label>
       		  </div>
       		</div>
		 	
		 	<!-- 사내 -->
            <div class="card card-info card-outline">
              <div class="card-header pl-3">
               <label class="card-title form-check-label"> 
               &nbsp;&nbsp;&nbsp;&nbsp;
                <input type="checkbox" class="form-check-input filter" id="selectDept" name="selectDept" checked>
              	사내 캘린더</label>

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
                    <a class="nav-link">
                    <input type="checkbox" class="form-check-input filter" id="selectCompanyCal" name="selectCompanyCal" checked> 
                    <label class="form-check-label" for="selectCompanyCal">&nbsp;전체 일정</label></a>
                  </li>
                  <li class="nav-item pl-3">
                    <a class="nav-link">
                    <input type="checkbox" class="form-check-input filter" id="selectDeptUname" name="selectDeptUname" checked> 
                    <label class="form-check-label" for="selectDeptUname">&nbsp;${loginUser.deptUname }</label></a>
                  </li>
                  <li class="nav-item pl-3">
                    <a class="nav-link">
                    <input type="checkbox" class="form-check-input filter" id="selectDeptDname" name="selectDeptDname" checked> 
                    <label class="form-check-label" for="selectDeptDname">&nbsp;${loginUser.deptDname }</label></a>
                  </li>

                </ul>
              </div>
            </div>
            
            <!-- 내 캘린더 -->
		<div id="myCal">
            <div class="card card-info card-outline">
              <div class="card-header">
               <label class="card-title form-check-label" for="selectMine">
               &nbsp;&nbsp;&nbsp;
              <input type="checkbox" class="form-check-input filter" name="selectMine" checked>
               	내 캘린더</label>
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
        dateFormat: "yyyy/mm/dd",
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
	<!-- 메뉴바 : 체크박스 선택 -->
	$('input[name="selectAllCB"]').click(function(){
		
		if(($('input[name="selectAllCB"]')).prop("checked")){
			$('input[name="selectDept"]').prop("checked", true);
			$('input[name="selectCompanyCal"]').prop("checked", true);
			$('input[name="selectDeptUname"]').prop("checked", true);
			$('input[name="selectDeptDname"]').prop("checked", true);
			$('input[name="selectMine"]').prop("checked", true);
		} else{
			$('input[name="selectDept"]').prop("checked", false);
			$('input[name="selectCompanyCal"]').prop("checked", false);
			$('input[name="selectDeptUname"]').prop("checked", false);
			$('input[name="selectDeptDname"]').prop("checked", false);
			$('input[name="selectMine"]').prop("checked", false);
		}

	});
	
	$('input[name="selectDept"]').click(function(){
		
		if(($('input[name="selectDept"]')).prop("checked")){
			$('input[name="selectCompanyCal"]').prop("checked", true);
			$('input[name="selectDeptUname"]').prop("checked", true);
			$('input[name="selectDeptDname"]').prop("checked", true);
		} else{
			$('input[name="selectAllCB"]').prop("checked", false);
			$('input[name="selectCompanyCal"]').prop("checked", false);	
			$('input[name="selectDeptUname"]').prop("checked", false);	
			$('input[name="selectDeptDname"]').prop("checked", false);	
		}
	});
	
	$('#selectCompanyCal').click(function(){
		if(!($('input[name="selectCompanyCal"]')).prop("checked")){
			$('input[name="selectAllCB"]').prop("checked", false);
			$('input[name="selectDept"]').prop("checked", false);
		} 
	});
	
	$('#selectDeptUname').click(function(){
		if(!($('input[name="selectDeptUname"]')).prop("checked")){
			$('input[name="selectAllCB"]').prop("checked", false);
			$('input[name="selectDept"]').prop("checked", false);
		} 
	});
	
	$('#selectDeptDname').click(function(){
		if(!($('input[name="selectDeptDname"]')).prop("checked")){
			$('input[name="selectAllCB"]').prop("checked", false);
			$('input[name="selectDept"]').prop("checked", false);
		} 
	});
	
	// 사내 캘린더 하나 선택시 전체 캘린더 체크박스 false로 주기
	
	$('input[name="selectMine"]').click(function(){
		
		if(!($('input[name="selectMine"]')).prop("checked")){
			$('input[name="selectAllCB"]').prop("checked", false);
		}
	});
	
</script>


</body>
</html>