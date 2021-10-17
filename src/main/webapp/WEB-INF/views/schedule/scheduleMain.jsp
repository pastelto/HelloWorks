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
	<div class="col-3">
	
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
          initialView: 'dayGridMonth'
        });
        calendar.render();
      });

</script>
</body>
</html>