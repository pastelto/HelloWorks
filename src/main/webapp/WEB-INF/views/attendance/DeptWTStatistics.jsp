 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- css attendance  -->
<link href="resources/css/attendance/CheckDeptEmp.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div class="content-wrapper">

		
			<div class="container-fluid">
				<div class="row">
				<jsp:include page="../attendance/AttendanceSidebar.jsp" />
					
				<!--메인 -->
				<div class="col-9" id="statisticsContent">
				<br><br>
				    <div class="card card-outline card-info">
						<div class="card-header text-center">
							<h6 style="margin-bottom: 0px">
								<b>소속 근로시간 통계</b>
							</h6>
						</div>
						<!-- 카드바디 -->
						<div class="card-body">
							<div class="card">
								<!-- 검색부분 -->
								<div class="card-body">
									<div class="card" style="margin-bottom: 0px;">
										<table id="searchEmpTable">
										<form action="statisticsSearch.ps" id="tableForm">
											<tr>
												<th>검색일</th>
												<td>												
												<div class="row" style="margin-left: 0px;">	&nbsp;&nbsp;												
													<select id="yearselect" name="yearselect" class="custom-select custom-select-sm" style="width: 10%;" >
														<option value="2021">2021</option>
														<option value="2020" >2020</option>
														<option value="2019">2019</option>
														<option value="2018">2018</option>
														<option value="2017">2017</option>
													</select>&nbsp;&nbsp;
													<select id="monthselect" name="monthselect" class="custom-select custom-select-sm" style="width: 10%;">
														<option value="01">1월</option>
														<option value="02">2월</option>
														<option value="03">3월</option>
														<option value="04">4월</option>
														<option value="05">5월</option>
														<option value="06">6월</option>
														<option value="07">7월</option>
														<option value="08">8월</option>
														<option value="09">9월</option>
														<option value="10">10월</option>
														<option value="11">11월</option>
														<option value="12">12월</option>
													</select>&nbsp;&nbsp;
													<select id="weekselect" name="weekselect" class="custom-select custom-select-sm" style="width: 10%;">
														
													</select>					
												</div>													
												</td>
											</tr>
											<tr>
												<th>검색 조건</th>
												<td>												
												<div class="row" style="margin-left: 0px;">
													&nbsp;&nbsp;
													<button id="allEmployeeSearchBtn" type="button" class="btn btn-default btn-sm" onclick="selectAllEmployee();">전체검색</button>
													&nbsp;&nbsp;
														
													<select id="optionType" name="optionType" class="custom-select custom-select-sm" style="width: 10%;" onchange="deptSelect(this.value);">
														<option value="전체">전체</option>														
														<option value="사번">사번</option>
														<option value="이름">이름</option>
													</select>
													&nbsp;&nbsp;
													<div class="input-group" style="width: 30%;">
														<input type="search" id="searchInput"
															class="form-control form-control-sm"
															placeholder="검색어를 입력하세요." name="searchtext" value="${ search }">
														<div class="input-group-append">
															<button type="submit" class="btn btn-sm btn-default">
																<i class="fa fa-search"></i>
															</button>
														</div>
													</div>
												</div>	
												</td>
											</tr>
										</form>
										</table>
									</div>
								</div>
							</div>
							<!-- 검색부분 -->
							
							<br>
							<div class="text-center">
								<h4>2021년 11월</h4>
							</div>
					
							<!-- 조회테이블 -->
							<div class="card-body">
				                <table class="table table-bordered" id="employeeStatistics">
				                  <thead align="center">
				                    <tr >				                    	
										<th  rowspan="2" width="14%" >성명 (사번)</th>
										<th rowspan="2" width="13%" class="rowspan">직급</th>
										<th colspan="3">누적근로시간</th>											
										<th colspan="2">잔여근로시간</th>							
									</tr>
									<tr>																					
										<th  width="14%">소정근로시간</th>
										<th  width="14%">소정외근로시간</th>
										<th  width="14%">총 근로시간</th>
										<th  width="14%">소정근로시간</th>
										<th  width="14%">소정외근로시간</th>
									</tr>
				                  </thead>
				                  <tbody align="center">
				                  
				                  	<c:if test="${ !empty statistics }">	
				                    <c:forEach items="${ statistics }" var="st">
										<tr align="center">
																																	
												<td>${ st.name }&nbsp;&nbsp;(${ st.empNo })</td>                     
                                   			    <td>${ st.jobName }</td>  
                                   			    
                                   			    <td>${ st.workingS }</td>     
												<td>${ st.overS }</td>  
												<td>${ st.totalTS }</td>  
												<td>${ st.leaveWTS }</td>  
												<td>${ st.leaveOTS }</td>  							
										</tr>
									</c:forEach>
									</c:if>
									<c:if test="${ empty statistics }">
		                              <tr>
		                                 <td colspan="7">통계가  없습니다</td>      
		                              </tr>
		                           </c:if> 
									
				                  </tbody>
				                </table>
				            </div>
		            		<!-- 조회테이블 -->
		            		
		            		<ber><br>
		            		
		            		<!-- 참고 -->
		            		<div class="col-12">
                                <div class="alert alert-light" id="divCF" role="alert">
                                   <label> 
                                   [참조]
                                 	 <br>- 52시간(주당 최대 근로시간) 기준, 해당 주 월요일부터 일요일까지의 근로시간이 표시됩니다.
									 <br>- 소정근로시간: ‘(1일 출퇴근시간-점심시간) x 출근일수’를 나타냅니다(1일 평균 8시간, 1주 기준 최대 40시간)
									 <br>- 소정외근로시간: ‘소정근로시간 외의 근로시간’을 나타냅니다.(1주 기준 최대 12시간)
									 <br>- 총근로시간: ‘소정근로시간 + 소정외근로시간’을 나타냅니다.
									 <br>- 잔여근로시간: 근로기준법 기준 최대 소정근로시간(40시간)/소정외근로시간(12시간)에서 남은 근로시간이 표시됩니다.
                                   </label>
                                </div>
                            </div>
		            		<!-- 참고 -->
		            		
		            		
		            		
		                </div>
		            	<!-- /.card -->
						
						</div>
						<!-- /.row -->
					</div>
					<br> <br> 
				</div>
			</div>
			
			<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
			
			
	
			 
		
	</div>
	<jsp:include page="../common/footer.jsp" />
	
	<script>
	

		
	</script>	   
	<script>
      $(function() {             
         $("#weekselect").attr("style", "display:none");
      
         $("select[name=monthselect]").change(function() {
          
           var monthselect =  $("select[name=monthselect] option:selected").val(); //text값 가져오기  
           
           console.log("~~" + monthselect);
    		
    		var params = $("#tableForm").serialize();
    		$.ajax(
    		{
    			url : 'monthselect.ps',
    			type: 'POST',
    			data : params,
    			dataType: 'json',
    			success : function(weeklist)
    					{			
		    				var value="";
		    				$.each(weeklist, function(i, obj){
	    					
		    					value += "<option value="+ obj.start_date + obj.end_date +">" + obj.start_date+ " ~ " + obj.end_date + "</option>"  
	    					
		    				});
		    				$("#weekselect").html(value);
		    				$("#weekselect").css("display" ,"");
		    				$("#weekselect").css("width" ,"20%");    						
    					},
    			error: function(e){
    				console.log("에러다" + e)
    			}
    		});

    		
      });
   })
	</script>
</body>
</html>