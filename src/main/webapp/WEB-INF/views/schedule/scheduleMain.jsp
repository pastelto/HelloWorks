<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HelloWorks - 일정관리</title>
<style>
	.content-wrapper{
		overflow:auto;
	}

	.fc-toolbar-chunk {
	  display: flex; /* 일렬로 나란히 */
	  align-items: center; /* 수직 가운데 정렬 */
	}

    .fc-day-number.fc-sat.fc-past { color:#0000FF; }     /* 토요일 */
    .fc-day-number.fc-sun.fc-past { color:#FF0000; }    /* 일요일 */
	
	.fc-event-time{
		
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
		
	<div class="content-wrapper">
	
	<div class="row">
	
	<jsp:include page="./scheduleSideMenu.jsp" />
	
	<!-- 캘린더 내용 -->	
	<div id="calendar-container" class="col-8" style="margin-left : 50px; margin-top: 20px;">
	<!-- 실제 캘린더 적용 부분 <필수!> -->
	<div id='calendar' style="width:100%;  margin-right: 0px;"></div>
	</div>

	</div>
	<!-- 모달들 -->
	<jsp:include page="./popupAddSchedule.jsp"/>
	</div>
	
<jsp:include page="../common/footer.jsp"/>
<!-- fullCalendar 2.2.5 -->
<script src="./resources/plugins/moment/moment.min.js"></script>
<script src="./resources/plugins/fullcalendar/main.js"></script>
<script src="./resources/plugins/fullcalendar/locales/ko.js"></script> <!-- 한국어 버전으로 변경 -->

<!-- 스크립트 모음 -->
<!-- 캘린더 첫 화면 생성 스크립트 -->
<script>
	   var calendar = null; // 캘린더를 지역변수로 선언
	  // 1. 캘린더 띄워주기 및 캘린더 환경설정
      $(document).ready(function(){
    	  
    	  $( "#datepicker" ).datepicker();
    	  
        var calendarEl = document.getElementById('calendar');
        calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth', // 월 캘린더를 처음에 띄워줌
          locale: 'ko', // 한국어로 변환
          headerToolbar: { left: 'today', // 캘린더 상단줄 맨 왼쪽
        	 			   center: 'prev title next', // 캘린더 상단줄 가운데
        	  			   right: 'listYear,dayGridMonth,timeGridWeek,timeGridDay' // 캘린더 상단 오른쪽 : 월별, 주별, 일별 
        	  			   },
          views: {
        	  dayGrid: { // name of view
  			      titleFormat: { time: '2-digit' }
  			      // other view-specific options here
  			    }
  		  },
          navLinks: true, // 날짜 눌러서 이동 가능
          selectable: true, // 선택가능
          selectMirror: true, // ?
          editable: false, // 수정가능 -> 만약 수정 X, 조회만 가능한 캘린더라면 false를 주면 된다. (그러면 수정이 안됨!)
          droppable: true, // 캘린더 위로 드롭 가능
          // 기능관련 설정
          drop: function(info){ // 일정 내에서 어떤 특정 기능을 수행시, 아래에서 정의한 특정 기능 수행
        	  
          },
          dateClick: function(info) { // 날짜 클릭시 스케쥴 추가 
        	  $('#schedule-add').modal('show');
          	  $('#startDate').val(info.dateStr);
          	  $('#endDate').val(info.dateStr);
          	 
          },
          eventClick: function(info) { // 일정 클릭시 수정모달 // 작업중인 부분!
        	  var modal = $("#schedule-check");
        	  console.log("eventClick : " + info.event.start);
        	  
        	  var startDate = moment(info.event.start).format('YYYY-MM-DD hh:mm:ss');
        	  var allD = info.event.allDay;
        	  var title = info.event.title;
        	  var contents = info.event.extendedProps.contents;
        	  var schType = info.event.extendedProps.schType;
        	  var schPlace = info.event.extendedProps.schPlace;
          	  var allDayBoolean = info.event.allDay == true ? 1 : 0; // true false는 1 / 0으로 구분
          	  var empNo = info.event.extendedProps.empNo; // 작성자 사번
        	  var id = info.event.id;
          	  
          	  console.log("스케쥴 타입 ? " + schType);
          	  console.log("작성자 사번 1 ? " + empNo);
        	  $('#detailAllday').text("종일");
        	  $('#dateEndCheck').text("");

        	  if(allDayBoolean == 0){
	          	var endDate = moment(info.event.end).format('YYYY-MM-DD hh:mm:ss');
        		$('#detailAllday').text("시간");
	          	$('#dateEndCheck').text("　 ~　  " + endDate);
        	  }
        	  $('#detailSchNo').val(id);
        	  $('#detailEmpNo').val(empNo);
        	  $('#detailContent').val(contents);
        	  $('#detailType').val(schType);
        	  $('#detailPlace').val(schPlace);
			  $('#detailTitle').val(title);
			  $('#dateStartCheck').text(startDate);
			  
			  showEditBtn();
			  
              modal.modal();
          },
          eventDidMount: function(arg) {
              var cs = document.querySelectorAll(".filter"); // filter 클래스를 갖고 있는 체크박스
              cs.forEach(function (v) {
            	 console.log(arg.event.extendedProps.cid)
                if (v.checked) {
                  // console.log("arg.event.extendedProps.cid : ? " + arg.event.extendedProps.cid)
               	  // console.log("v.value : ? " + v.value)
                  if (arg.event.extendedProps.cid === v.value) { // 체크박스의 값과 이벤트의 cid가 같으면, 
                    arg.el.style.display = "block";
                  }
                } else {
                  if (arg.event.extendedProps.cid === v.value) {
                    arg.el.style.display = "none";
                  }
                }
              });
          },
          eventSources: [ 
        		  { // 전체 사내 캘린더
          		    events:function(info, successCallBack, failureCallback) {
          		    	
          		    	$.ajax({
          		    	url: 'getAllCalender.cal',
           		        type: 'POST',
           		        data: {
           		        	cal_name: '전체'
           		        },
           		        dataType: "json",
           		        success: function(allCalList){
           		        	
           		        	var events = []; 
           		        	
           		        	 $.each(allCalList, function(i, obj){	
           		        		var startDate = moment(obj.sch_startdate).format('YYYY-MM-DD hh:mm:ss');
           		        		var endDate = moment(obj.sch_endate).format('YYYY-MM-DD hh:mm:ss');

           		        		console.log("내용 : " + obj.sch_content);
           		        		events.push({
           		        			 id: obj.shc_no,
           		        			 title: obj.sch_title,
           		        			 start: startDate,
           		        			 end: endDate,
           		        			 empNo: obj.sch_empno, 
           		        			 contents: obj.sch_content,
           		        			 schType: obj.sch_type,
           		        			 schPlace: obj.sch_place,
           		        			 displayEventTime : true,
           		        			 allDay: obj.sch_allday == "true" ? 1 : 0,	
           		        			 color: obj.sch_color,   // a non-ajax option
           	         		         textColor: 'white',
           	         		         cid: "021"
           		        		});
           		        	}); 
           		        successCallBack(events);
           		       } 
          		      });
          		    }
          		   },
        		  
        		  { // 내 캘린더
        		    events:function(info, successCallBack, failureCallback) {
        		    	
        		    	$.ajax({
        		    	url: 'getMyCalender.cal',
         		        type: 'POST',
         		        data: {
         		        	cal_type: 'PRIVATE'
         		        },
         		        dataType: "json",
         		        success: function(myCalList){
         		        	
         		        	var events = []; 
         		        	
         		        	 $.each(myCalList, function(i, obj){	
         		        		var startDate = moment(obj.sch_startdate).format('YYYY-MM-DD hh:mm:ss');
         		        		var endDate = moment(obj.sch_endate).format('YYYY-MM-DD hh:mm:ss');

         		        		console.log("내용 : " + obj.sch_content);
         		        		events.push({
         		        			 id: obj.shc_no,
         		        			 title: obj.sch_title,
         		        			 start: startDate,
         		        			 end: endDate,
         		        			 empNo: obj.sch_empno, 
         		        			 contents: obj.sch_content,
         		        			 schType: obj.sch_type,
         		        			 schPlace: obj.sch_place,
         		        			 displayEventTime : true,
         		        			 allDay: obj.sch_allday == "true" ? 1 : 0,	
         		        			 color: obj.sch_color,   // a non-ajax option
         	         		         textColor: 'white',
         	         		       	 cid: "03"
         		        		});
         		        	}); 
         		        successCallBack(events);
         		       } 
        		      });
        		    }
        		   },
        		   
       		    { // 본부 캘린더 조회
        	  		events:function(info, successCallBack, failureCallback) {

    		    	$.ajax({
    		    	url: 'getUDeptCal.cal',
     		        type: 'POST',
     		        data: {
     		        	cal_name: '${loginUser.deptUname}'
     		        },
     		        dataType: "json",
     		        success: function(uDeptList){
     		        	
     		        	var events = []; 
     		        	
     		        	 $.each(uDeptList, function(i, obj){	
     		        		var startDate = moment(obj.sch_startdate).format('YYYY-MM-DD hh:mm:ss');
     		        		var endDate = moment(obj.sch_endate).format('YYYY-MM-DD hh:mm:ss');

     		        		console.log("내용 : " + obj.sch_content);
     		        		events.push({
     		        			 id: obj.shc_no,
     		        			 title: obj.sch_title,
     		        			 start: startDate,
     		        			 end: endDate,
     		        			 empNo: obj.sch_empno, 
     		        			 contents: obj.sch_content,
     		        			 schType: obj.sch_type,
     		        			 schPlace: obj.sch_place,
     		        			 displayEventTime : true,
     		        			 allDay: obj.sch_allday == "true" ? 1 : 0,	
     		        			 color: obj.sch_color,
     	         		         textColor: 'white',
     	         		         cid: "022"
     		        		});
     		        	}); 
     		        successCallBack(events);
     		       } 
    		      });
    		    }
    		   },
    		   
   		    { // 부서별 캘린더 조회
    	  		events:function(info, successCallBack, failureCallback) {
		    	
		    	$.ajax({
		    	url: 'getDDeptCal.cal',
 		        type: 'POST',
 		        data: {
 		        	cal_name: '${loginUser.deptDname}'
 		        },
 		        dataType: "json",
 		        success: function(dDeptList){
 		        	
 		        	var events = []; 
 		        
 		        	 $.each(dDeptList, function(i, obj){	
 		        		var startDate = moment(obj.sch_startdate).format('YYYY-MM-DD hh:mm:ss');
 		        		var endDate = moment(obj.sch_endate).format('YYYY-MM-DD hh:mm:ss');

 		        		console.log("내용 : " + obj.sch_content);
 		        		events.push({
 		        			 id: obj.shc_no,
 		        			 title: obj.sch_title,
 		        			 start: startDate,
 		        			 end: endDate,
 		        			 empNo: obj.sch_empno, 
 		        			 contents: obj.sch_content,
 		        			 schType: obj.sch_type,
 		        			 schPlace: obj.sch_place,
 		        			 displayEventTime : true,
 		        			 allDay: obj.sch_allday == "true" ? 1 : 0,	
 		        			 color: obj.sch_color,   // a non-ajax option
 	         		         textColor: 'white',
 	         		         cid: "023"	
 		        		});
 		        	}); 
 		        successCallBack(events);
 		       } 
		      });
		    }
		   }]
		   
       	});
        		  
        calendar.render();
        var csx = document.querySelectorAll(".filter");
        csx.forEach(function (el) {
          el.addEventListener("change", function () {
            calendar.refetchEvents();
            console.log(el);
          });
        });
      });

</script>



</body>
</html>