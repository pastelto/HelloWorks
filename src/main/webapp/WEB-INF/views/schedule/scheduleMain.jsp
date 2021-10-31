<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HelloWorks - 일정관리</title>
<!-- jQuery -->
<script src="../plugins/jquery/jquery.min.js"></script>
 <!-- fullCalendar -->
 <link rel="stylesheet" href="./resources/plugins/fullcalendar/main.css">
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
	
	<!-- 캘린더 메뉴 -->
	<div class="col-2" style="background-color: gray;">
		<div id="insertCal" style="border: solid 1px red; height:5%;"> 일정등록 </div>
		<div class="calendar" style="border: solid 1px red; height:30%;">달력 위치</div>
		<div id="calAll"style="border: solid 1px red; height:5%;"><button type="button">전체 일정</button></div>
		<div role="button" id="deptCal"style="border: solid 1px red; height:5%;"><button type="button">사내 캘린더</button></div>
		<div id="myCal"style="border: solid 1px red; height:5%;"><button type="button">내 캘린더</button></div>
	</div>
		
	<div id="calendar-container" class="col-8" style="margin-right : 10px; padding: 20px;">
	<!-- 캘린더 -->
	<div id='calendar'></div>	
	</div>
	
	
	</div>
	
	</div>
	
	<jsp:include page="../common/footer.jsp"/>
<!-- fullCalendar 2.2.5 -->
<script src="./resources/plugins/moment/moment.min.js"></script>
<script src="./resources/plugins/fullcalendar/main.js"></script>

<!-- 스크립트 모음 -->
<script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth',
        	  eventSources: [

        		    // your event source
        		    {
        		      events: [ // put the array in the `events` property
        		        {
        		          title  : 'event1',
        		          start  : '2021-10-10'
        		        },
        		        {
        		          title  : 'event2',
        		          start  : '2021-10-20',
        		          end    : '2021-10-30'
        		        },
        		        {
        		          title  : 'event3',
        		          start  : '2021-10-03',
        		        }
        		      ],
        		      color: 'black',     // an option!
        		      textColor: 'yellow' // an option!
        		    }

        		    // any other event sources...

        		  ]
        });
        calendar.render();
      });

</script>
</body>
</html>