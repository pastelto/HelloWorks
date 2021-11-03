<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
				
					<div class="col-sm-8">

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
				<div style="margin-top: 3%; margin-left: 20px;">
					<!-- 일정 등록하기 버튼 -->
					<div class="row">
					<div id="insertCal" class="col-12">
						<button type="button" class="btn btn-info" style="width: 80%;" onclick="location.href='enrollReportForm.dr'">일일보고 작성하기</button>
					</div>
					&nbsp;
					<div class="col-12">
					<div role="button" id="deptCal" style="width: 80%;">
					 	<!-- 사내 -->
			            <div class="card card-info card-outline">
			              <div class="card-header pl-3">
			               <h3 class="card-title"> 
			               &nbsp;&nbsp;&nbsp;&nbsp;
			                <input type="checkbox" class="form-check-input" name="selectDept" checked>
			              	전체</h3>
			
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
			                    <a class="nav-link" href="#">
			                    <input type="checkbox" class="form-check-input" name="selectReportType" checked> 
			                    <label class="form-check-label" for="selectDeptUname">&nbsp;일일보고</label></a>
			                  </li>
			                  <li class="nav-item pl-3">
			                    <a class="nav-link" href="#">
			                    <input type="checkbox" class="form-check-input" name="selectReportType" checked> 
			                    <label class="form-check-label" for="selectDeptDname">&nbsp;주간보고</label></a>
			                  </li>
			                  <li class="nav-item pl-3">
			                    <a class="nav-link" href="#">
			                    <input type="checkbox" class="form-check-input" name="selectReportType" checked> 
			                    <label class="form-check-label" for="selectDeptDname">&nbsp;월간보고</label></a>
			                  </li>
			
			                </ul>
			              </div>
           				 </div>
            			</div>
            			</div>
					</div>
				</div>
			</div>
			<div id="calendar-container" class="col-7" >
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