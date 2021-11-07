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
/*일~월 타이틀 색 바꾸기  */
.fc .fc-col-header-cell-cushion, .fc .fc-daygrid-day-number{
	color:black !important;
}
/*노란색배경*/
.fc .fc-daygrid-day.fc-day-today {
      background-color: rgb(244,246,249) !important;
}

.fc-col-header-cell fc-day fc-day-sat{
	color: blue !important;
}

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
			
				<!-- 	<div class="card" style="margin-bottom: 0px;">
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
												<button id="atSearchBtn" type="button" class="btn btn-default btn-sm" onclick="annulSearch();">전체검색</button>
												&nbsp;&nbsp;
												
										
												</div>
											</form>
										</td>
									</tr>
								</table>
							</div> -->
						
					
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
		var nowDate = new Date();
		var month= nowDate.getMonth() + 1;
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
       	  header:{
       		right: 'today,customPrevButton,customNextButton',
       		left:'title'
       	  },
       	  customButtons:{
       		customPrevButton:{
       			text:'prev',
       			click:function(){
       				
       				month=month-1;
       				console.log("달"+ month)
       				
       			 	$.ajax(
       			    		{
       			    			url : 'prevnextBtn.ps',
       			    			type: 'POST',
       			    			data : month,
       			    			contentType: 'application/json; charset=utf-8',
       			    			success:function(list){
       			    		            
       			    		            var value="";
       			    		            
       			    		            $.each(list, function(i, obj){               
       			    		               value +=
       			    		               "<td>" +  obj.empNo + "</td>" + 
       			    		               "<td>" +  obj.working + "</td>" + 
       			    		               "<td>" +  obj.over + "</td>" + 
       			    		               "<td>" +  obj.totalT + "</td>" + 
       			    		               "<td>" +  obj.leaveWT + "</td>" + 
       			    		               "<td>" +  obj.leaveOT + "</td>" ;
       			    		            });
       			    		            
       			    		            $("#attendanceList>tbody>tr").html(value);
       			    						
       			    			}
       			    		}); 
       			}
       		}  
       	  },
          initialView: 'dayGridMonth',
          defaultDate: new Date(),
          locale: 'ko', 
          eventLimit: true,
          contentHeight: 550,
          editable: false,
          droppable: false,
          events:function(info, successCallback, failureCallback){
              $.ajax({
                     url: '${pageContext.request.contextPath}/selectAttendanceList.ps',
                     dataType: 'json',
                     type:'post',
                     success: 
                         function(result) {
                             var events = [];
                         
                             if(result!=null){
                            	
                                     $.each(result, function(index, element) {
                                     var enddate=element.psCreateDate;
                                    
                                     
                                      var startdate=moment(element.psCreateDate).format('YYYY-MM-DD');
                                      var psStatus = element.psStatus;
                                     
                                    
                                      if (psStatus == "A"){
	                                    	  events.push({
	                                              title: "정상출근",
	                                              start: startdate,
	                                              textColor: 'black',
	                                              color:'rgb(244,246,249)'
	                                           }); 
                                              events.push({
                                                  title: " "+element.inTime+" - "+element.outTime,
                                                  start: startdate,
                                                  textColor: 'black',
                                                  color:'rgb(244,246,249)'
                                               }); 
                                              
                                      } else if (psStatus == "B"){
                                    	  events.push({
                                              title: "지각",
                                              start: startdate,
                                              textColor: 'red',
                                              color:'rgb(244,246,249)'
                                           }); 
                                          events.push({
                                              title: " "+element.inTime+" - "+element.outTime,
                                              start: startdate,
                                              textColor: 'black',
                                              color:'rgb(244,246,249)'
                                           }); 
                                          
                                      }else if (psStatus == "C"){
                                    	  events.push({
                                              title: "결근",
                                              start: startdate,
                                              textColor: 'red',
                                              color:'rgb(244,246,249)'
                                           }); 
                                          events.push({
                                              title: " "+element.inTime+" - "+element.outTime,
                                              start: startdate,
                                              textColor: 'black',
                                              color:'rgb(244,246,249)'
                                           }); 
                                          
                                      }else if (psStatus == "D"){
                                    	  events.push({
                                              title: "반차",
                                              start: startdate,
                                              textColor: 'blue',
                                              color:'rgb(244,246,249)'
                                           }); 
                                          events.push({
                                              title: " "+element.inTime+" - "+element.outTime,
                                              start: startdate,
                                              textColor: 'black',
                                              color:'rgb(244,246,249)'
                                           }); 
                                          
                                      }else if (psStatus == "E"){
                                    	  events.push({
                                              title: "연차",
                                              start: startdate,
                                              textColor: 'blue',
                                              color:'rgb(244,246,249)'
                                           }); 
                                          events.push({
                                              title: " "+element.inTime+" - "+element.outTime,
                                              start: startdate,
                                              textColor: 'black',
                                              color:'rgb(244,246,249)'
                                           }); 
                                          
                                      }else if (psStatus == "F"){
                                    	  events.push({
                                              title: "휴가",
                                              start: startdate,
                                              textColor: 'blue',
                                              color:'rgb(244,246,249)'
                                           }); 
                                          events.push({
                                              title: " "+element.inTime+" - "+element.outTime,
                                              start: startdate,
                                              textColor: 'black',
                                              color:'rgb(244,246,249)'
                                           }); 
                                          
                                      }else if (psStatus == "G"){
                                    	  events.push({
                                    		  id:1,
                                              title: "출근전",
                                              start: startdate,
                                              textColor: 'blue',
                                              color:'rgb(244,246,249)'
                                           }); 
                                          events.push({
                                        	  id:2,
                                              title: " "+element.inTime+" - "+element.outTime,
                                              start: startdate,
                                              textColor: 'black',
                                              color:'rgb(244,246,249)'
                                           }); 
                                          
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
     
   
       /*  $('.fc-prev-button').click(function(){
         	  changeMonth(1);
        	   
        });
     
     
        $('.fc-next-button').click(function(){
        	 changeMonth(-1);
        	}); */
     
     
      });    

</script>
<!-- <script>
var nowDate = new Date();
var month= nowDate.getMonth() + 1;

function changeMonth(num){
			
	month=month-num;
	console.log("달"+ month)
	
 	$.ajax(
    		{
    			url : 'attendanceApiView.ps',
    			type: 'POST',
    			data : month,
    			contentType: 'application/json; charset=utf-8',
    			success:function(list){
    		            
    		            var value="";
    		            
    		            $.each(list, function(i, obj){               
    		               value +=
    		               "<td>" +  obj.empNo + "</td>" + 
    		               "<td>" +  obj.working + "</td>" + 
    		               "<td>" +  obj.over + "</td>" + 
    		               "<td>" +  obj.totalT + "</td>" + 
    		               "<td>" +  obj.leaveWT + "</td>" + 
    		               "<td>" +  obj.leaveOT + "</td>" ;
    		            });
    		            
    		            $("#attendanceList>tbody>tr").html(value);
    						
    			}
    		}); 
}
</script> -->

</body>
</html>