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

</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
		
	<div class="content-wrapper">
	
	<div class="row">
	
	<jsp:include page="./scheduleSideMenu.jsp" />
	
	<!-- 캘린더 내용 -->	
	<!-- <div><button type="button" id="testBtn" onclick="allSave();">테스트</button></div> -->
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
          eventClick: function(info) { // 일정 클릭시 수정모달
        	  var modal = $("#schedule-edit");
        	  console.log(info);

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
        	  		//if()
        		  { // 전체 캘린더
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
           		        		
           		        		events.push({
           		        			 id: obj.shc_no,
           		        			 title: obj.sch_title,
           		        			 start: startDate,
           		        			 end: endDate,
           		        			 allDay: obj.sch_allday,
           		        			 color: obj.sch_color,   // a non-ajax option
           	         		         textColor: 'white',
           	         		         cid: "01"
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
         		        		
         		        		events.push({
         		        			 id: obj.shc_no,
         		        			 title: obj.sch_title,
         		        			 start: startDate,
         		        			 end: endDate,
         		        			 allDay: obj.sch_allday,
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
     		        		
     		        		events.push({
     		        			 id: obj.shc_no,
     		        			 title: obj.sch_title,
     		        			 start: startDate,
     		        			 end: endDate,
     		        			 allDay: obj.sch_allday,
     		        			 color: obj.sch_color,   // a non-ajax option
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
 		        		
 		        		events.push({
 		        			 id: obj.shc_no,
 		        			 title: obj.sch_title,
 		        			 start: startDate,
 		        			 end: endDate,
 		        			 allDay: obj.sch_allday,
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


<!-- 캘린더 관련 함수 메소드 -->
<script>
	
/*	function allSave(){
		
		var allEvent = calendar.getEvents();
		console.log(allEvent);
		
		var events = new Array();
		for(var i = 0; i < allEvent.length; i++){
			// 캘린더 속의 이벤트만큼 for문을 돌리면서, 그 이벤트의 정보 가져오기
			// _def.title = 일정의 이름
			// _def.allDay = 종일 일정인지 알려주는 boolean 값 (true / false)
			// _instance.range.start = 일정의 시작 날짜 및 시간
			// _instance.range.end = 일정의 끝 날짜 및 시간
			
			var obj = new Object(); // json 객체로 전달하기 위해 선언
			
			obj.title = allEvent[i]._def.title;
			obj.allDay = allEvent[i]._def.allDay;
			obj.start = allEvent[i]._instance.range.start;
			obj.end = allEvent[i]._instance.range.end;
			
			events.push(obj); // 각 일정의 값을 다시 events의 배열에 저장
		}
		var jsondata = JSON.stringify(events); // 위에서 생성하고 만든 배열을 JSON 형태로 형변환
		console.log("jsondata : " + jsondata);
		
		//savedata(jsondata); // 함수를 통해 jsondata를 넘겨서 저장하기
	}
	
	function savedata(jsondata){
		
		$.ajax({
			type: 'POST',
			url: "savedata.cal",
			data: {"alldata":jsondata},
			dataType: 'text',
			async: false // 동기 형식?
		})
		.done(function(result){
			
		})
		.fail(function(request, status, error){
			alert("에러 발생 : " + error);
		});
	} 
*/
</script>


</body>
</html>