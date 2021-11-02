<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>발신함</title>
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

	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-6">

						<h4>
							<i class="nav-icon fas fa-edit"></i><b> 일일보고 발신함</b>
						</h4>
					</div>
				</div>
			</div>
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="row">
	
			<!-- 캘린더 메뉴 -->
			<div class="col-3">
			
			</div>
			
			<div id="calendar-container" class="col-6" >
			<!-- 캘린더 -->
			<div id='calendar'></div>
			</div>
			
			
			</div>
			<br>
		</section>
	</div>
	
	<jsp:include page="../common/footer.jsp" />	
	
	
	<!-- fullCalendar 2.2.5 -->
	<script src="./resources/plugins/moment/moment.min.js"></script>
	<script src="./resources/plugins/fullcalendar/main.js"></script>
	
	<!-- 스크립트 모음 -->
	<script>
	
	      document.addEventListener('DOMContentLoaded', function() {
	        var calendarEl = document.getElementById('calendar');
	        var calendar = new FullCalendar.Calendar(calendarEl, {
	          initialView: 'dayGridMonth',
	          events: [
	        	  {
	        		  title:'이벤트',
	        		  start: '2021-11-02',
	        		  end: '2021-11-02'
	        	  }
	          ]
	        });
	        calendar.render();
	      });
	
	</script>
</body>
</html>