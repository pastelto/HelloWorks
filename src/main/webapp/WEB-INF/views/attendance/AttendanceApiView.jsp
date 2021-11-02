<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<script src="../plugins/jquery/jquery.min.js"></script>
 <!-- fullCalendar -->
 <link rel="stylesheet" href="./resources/plugins/fullcalendar/main.css">
 <!-- css attendance  -->
<link href="resources/css/attendance/AttendanceApiView.css" rel="stylesheet" type="text/css">
<style>


</style>
</head>
<body >
   <jsp:include page="../common/menubar.jsp" />
   
   
   <div class="content-wrapper" style="overflow-x: hidden !important">
	
	<div class="row" >
	<!-- 사이드메뉴 -->
	<jsp:include page="../attendance/AttendanceSidebar.jsp" />
	
	<!--메인 -->
		<div class="col-7" id="mainApi">
					<br><br>
			
					<div class="card" style="margin-bottom: 0px;">
								<table id="searchEmpTable">
									<tr>
										<th height="45px;">검색 조건</th>
										<td>
										<form action="searchEmployee.or">
										<div class="row" style="margin-left: 0px;">
											
													<select id="attendanceYear" name="attendanceYear" class="custom-select custom-select-sm" style="width: 15%;" onchange="">
														<option value="2021">2021</option>
														<option value="2020" >2020</option>
														<option value="2019">2019</option>
														<option value="2018">2018</option>
														<option value="2017">2017</option>	
													</select>
													&nbsp;
													<select id="attendanceMonth" name="attendanceMonth" class="custom-select custom-select-sm" style="width: 15%;" onchange="">
														<option value="1">1월</option>
														<option value="2">2월</option>
														<option value="3">3월</option>
														<option value="4">4월</option>
														<option value="5">5월</option>
														<option value="6">6월</option>
														<option value="7">7월</option>
														<option value="8">8월</option>
														<option value="9">9월</option>
														<option value="10">10월</option>
														<option value="11">11월</option>
														<option value="12">12월</option>	
													</select>
													
														&nbsp;&nbsp;
												<button id="atSearchBtn" type="button" class="btn btn-default btn-sm" onclick="#">전체검색</button>
												&nbsp;&nbsp;
												
										
												</div>
											</form>
										</td>
									</tr>
								</table>
							</div>
						
					
					<br>
		
		
					<div class="card" style ="height:60px;  font-size : small;" >
						<table  class="table  text-nowrap" id="attendanceList" >
							<thead align="center" id="attendancethead">
								<tr >
									<th width="16%">정상출근</th>
									<th width="16%">지각</th>
									<th width="16%">결근</th>
									<th width="16%">반차</th>
									<th width="16%">연차</th>
									<th width="16%">휴가</th>
								</tr>
							</thead>
							<tbody>
								<tr align="center" >
									<td>${count.empNo }</td>
									<td>${count.working }</td>
									<td>${count.over }</td>
									<td>${count.totalT }</td>
									<td>${count.leaveWT }</td>
									<td>${count.leaveOT }</td>
								</tr>
							</tbody>
						</table>
					</div>
	
	
					<!-- 캘린더 -->
					<div id="calendar-container" class="col-13" >	
					 <div id='calendar'></div>
					</div>
					
					<br><br>
		
	     </div>	
	     
	     <!-- 메인 -->
	</div>
	
	
	
	
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
          defaultDate: new Date(),
          eventLimit: true,
          editable: false,
          droppable: false,
          dayPopoverFormat: { year: 'numeric', month: 'long', day: 'numeric' },
          events:function(info, successCallback, failureCallback){
              $.ajax({
                     url: '${pageContext.request.contextPath}/selectAttendanceList.ps',
                     dataType: 'json',
                     success: 
                         function(result) {
   
                             var events = [];
                            
                             if(result!=null){
                                 
                                     $.each(result, function(index, element) {
                                     var enddate=element.enddate;
                                      if(enddate==null){
                                          enddate=element.startdate;
                                      }
                                      
                                      var startdate=moment(element.startdate).format('YY/MM/DD');
                                      var enddate=moment(enddate).format('YY/MM/DD');
                                      var psStatus = element.psStatus;
                                      
                                      // realmname (분야) 분야별로 color 설정
                                      if (psStatus == "정상출근"){
                                          events.push({
                                                 title: element.title,
                                                 start: startdate,
                                                 end: enddate,
                                                    color:"#6937a1"                                                   
                                              }); //.push()
                                      }
                                                                          
                                      else if (psStatus == "지각"){
                                          events.push({
                                                 title: element.title,
                                                 start: startdate,
                                                 end: enddate,
                                                    url: "${pageContext.request.contextPath }/detail.do?seq="+element.seq,
                                                    color:"#f7e600"                                                   
                                              }); //.push()
                                      }
                                      
                                      else if (psStatus == "반차"){
                                          events.push({
                                                 title: element.title,
                                                 start: startdate,
                                                 end: enddate,
                                                    url: "${pageContext.request.contextPath }/detail.do?seq="+element.seq,
                                                    color:"#2a67b7"                                                   
                                              }); //.push()
                                      }
                                      
                                      else if (psStatus == "조퇴"){
                                          events.push({
                                                 title: element.title,
                                                 start: startdate,
                                                 end: enddate,
                                                    url: "${pageContext.request.contextPath }/detail.do?seq="+element.seq,
                                                    color:"#008d62"                                                   
                                              }); 
                                      }
                                      
                                      else if (psStatus == "출근전"){
                                          events.push({
                                                 title: element.title,
                                                 start: startdate,
                                                 end: enddate,
                                                    url: "${pageContext.request.contextPath }/detail.do?seq="+element.seq,
                                                    color:"#6937a1"                                                   
                                              }); //.push()
                                      }
                                      
                                      else if (psStatus == "휴가"){
                                          events.push({
                                                 title: element.title,
                                                 start: startdate,
                                                 end: enddate,
                                                    url: "${pageContext.request.contextPath }/detail.do?seq="+element.seq,
                                                    color:"#ff3399"                                                   
                                              }); //.push()
                                      }else{//결근
                                          events.push({
                                              title: element.title,
                                              start: startdate,
                                              end: enddate,
                                                 url: "${pageContext.request.contextPath }/detail.do?seq="+element.seq,
                                                 color:"#ff3399"                                                   
                                           }); //.push()
                                   }
                                      
                                 }); //.each()
                                 
                                 console.log(events);
                                 
                             }//if end                           
                             successCallback(events);                               
                         }//success: function end                          
              }); //ajax end
          }, //events:function end
     });//new FullCalendar end
   
        calendar.render();
      });

</script>
</body>
</html>