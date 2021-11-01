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

</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
		
	<div class="content-wrapper">
	
	<div class="row">
	
	<jsp:include page="./scheduleSideMenu.jsp" />
	
	<!-- 캘린더 내용 -->	
	<!-- <div><button type="button" id="testBtn" onclick="allSave();">테스트</button></div> -->
	<div id="calendar-container" class="col-8" style="margin-left : 50px; margin-right : 50px; padding: 20px;">
	<!-- 실제 캘린더 적용 부분 <필수!> -->
	<div id='calendar'></div>
	</div>
	
	
	</div>
	
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
          editable: true, // 수정가능 -> 만약 수정 X, 조회만 가능한 캘린더라면 false를 주면 된다. (그러면 수정이 안됨!)
          droppable: true, // 캘린더 위로 드롭 가능
          // 기능관련 설정
          drop: function(info){ // 일정 내에서 어떤 특정 기능을 수행시, 아래에서 정의한 특정 기능 수행
        	  
          },
          dateClick: function(info) { // 날짜 클릭시 
        	    alert('날짜 클릭!');
          		// addSchedule();
          },
          eventClick: function(info) { // 일정 클릭시 
      	    alert('일정 클릭!' + info);
          },
        	  eventSources: [

        		    // your event source
        		   /* {
        		      events: all_events, //
        		      color: 'black',     // an option!
        		      textColor: 'yellow' // an option!
        		    }
        		    */

        		    // any other event sources...

        		  ],
        	
        });
        
        calendar.render();
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