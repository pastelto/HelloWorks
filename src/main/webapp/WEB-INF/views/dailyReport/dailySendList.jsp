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
	#dailyType{
		background: #A9E2F3;
		width: 100px;
	}
	#weeklyType{
		background: #00909E;
		color: white;
		width: 100px;
	}
	#monthlyType{
		background: #27496D;
		color: white;
		width: 100px;
	}
	#reportTypeTable>tbody>tr>td{
		text-align: center !important;
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
							<i class="nav-icon fas fa-edit"></i><b> 일일보고 발신함 </b>
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
					<div class="col-12">
						<button type="button" class="btn btn-info" style="width: 80%;" onclick="location.href='enrollReportForm.dr'">일일보고 작성하기</button>
					</div>
					</div>
					&nbsp;
					<div class="row">
					<div class="col-12">
					<div class="card card-outline card-info"  style="width: 80%;">
						<div class="card-header text-center">
							<h6 style="margin-bottom: 0px">
								<b>보고 유형</b>
							</h6>
						</div>
					
						<div class="card-body">
							<table id="reportTypeTable" class="table table-borderless table-sm">
								<tr><td>일일보고</td><th><span class="badge" id="dailyType">일일보고</span></th></tr>
								<tr><td>주간보고</td><th><span class="badge" id="weeklyType">주간보고</span></th></tr>
								<tr><td>월간보고</td><th><span class="badge" id="monthlyType">월간보고</span></th></tr>
							</table>
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
	        
        	var events = [];
	        var calendar = new FullCalendar.Calendar(calendarEl, {
	            initialView: 'dayGridMonth',
	            defaultDate: new Date(),
	            locale: 'ko', 
	            eventLimit: true,
	            contentHeight: 550,
	            editable: false,
	            droppable: false,
	            events:function(info, successCallback, failureCallback){
	                $.ajax({
	                       url: 'selectAllList.dr',
	                       dataType: 'json',
	                       type:'post',
	                       success: 
	                           function(list) {
	                               var events = [];
	                               
	                               if(list != null){
	                            	   $.each(list, function(i, obj) {
	                                       var startDate= moment(obj.drCreateDate).format('YYYY-MM-DD');
	                                       if(obj.drCategory == 'D'){
	                                    	   events.push({
		                                            title: obj.drTitle,
		                                            start: startDate,
		                                            url: 'detailSendDailyReport.dr?drNo='+obj.drNo,
		                                            //textColor: 'black',
		                                            color: '#A9E2F3'	                                           
		                                         });
	                                       }else if(obj.drCategory == 'W'){
	                                    	   events.push({
		                                            title: obj.drTitle,
		                                            start: startDate,
		                                            url: 'detailSendDailyReport.dr?drNo='+obj.drNo,
		                                            color: '#00909E'	                                           
		                                         });
	                                       }else if(obj.drCategory == 'M'){
	                                    	   events.push({
		                                            title: obj.drTitle,
		                                            start: startDate,
		                                            url: 'detailSendDailyReport.dr?drNo='+obj.drNo,
		                                            color: '#27496D'	                                           
		                                         });
	                                       }
	                                      
	                               		})
	                               }	 
                            	   successCallback(events); 
	                       }
	                });
	            }
	          
	        });
      		
	        calendar.render();
	      });
	
	</script>
	
</body>
</html>